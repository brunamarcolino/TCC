/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.dao;

import edu.vo.Senha;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.InputMismatchException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import sun.misc.BASE64Encoder;

/**
 *
 * @author brunacm
 */
public class SenhaDao extends Dao {
  
     public int geraSenha(String cliente, String cpf, String senha, String tipo_atendimento) {
        
        Connection conn = null;
        int id_sequencia = 0;
        
        try {
            //obtem conexao com o banco de dados
            conn = getConnection();
            conn.setAutoCommit(false);
            
            //VERIFICA SE ESSE CLIENTE JÁ POSSUI SENHA ATIVA PARA A DATA ATUAL
            String select_sql = "SELECT id_sequencia, senha_cliente senha FROM tab_senhas WHERE data_senha = curdate() and status_atendimento = 'Ativo' and cpf_cliente = ?";
            PreparedStatement stmt = conn.prepareStatement(select_sql);
            stmt.setString(1, cpf);
            ResultSet result = stmt.executeQuery();
            
            //SE SIM
            if (result.next()) {
                //RECUPERA AS INFORMAÇÕES DO CLIENTE
                id_sequencia = result.getInt(1);
                String senha_banco = result.getString(2);   
                senha = criptoSenha(senha);
                System.out.println(senha);
                System.out.println(senha_banco);
                //VERIFICA SE SENHA ESTÁ CORRETA
                if (senha.equals(senha_banco)){
                   return id_sequencia;
                }else {
                    return -1; //CLIENTE ATIVO, MAS ERRO A SENHA
                }                                
            }
            //SE NÃO
            else {  
                //INSERE NOVA SENHA
                String sql = "INSERT INTO tab_senhas(id_senha, data_senha, cpf_cliente, nm_cliente, senha_cliente, status_atendimento, tipo_atendimento) VALUES (? , curdate(), ?, ?, ?, 'Ativo', ?); ";                    
                stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);            
                stmt.setInt(1, getProximaSenha());
                stmt.setString(2, cpf); //informar CPF digitado pelo usuário
                stmt.setString(3, cliente); //informar nome digitado pelo usuário
                stmt.setString(4, criptoSenha(senha)); //informar senha digitado pelo usuário                                      
                stmt.setString(5, tipo_atendimento); //informar tipo atendimento informado pelo usuário
                int affectedRows = stmt.executeUpdate();
                
                //verifica se deu certo. Se sim, obtem a chave id_sequancia gerada 
                 if (affectedRows > 0) {
                    ResultSet rs = stmt.getGeneratedKeys();
                    if (rs.next()){
                        id_sequencia = rs.getInt(1);                       
                    }else {
                        System.out.println("erro"); 
                    }
                } else {
                //cancela as modifica��es no banco de dados
                    conn.rollback();
                    return 0;
                }
                //confirma as modifica��es no banco de dados
                conn.commit();
                return id_sequencia;
            }                    
        } catch (Exception ex) {
            ex.printStackTrace();
            return 0;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception closeEx) {
                    //do nothing
                }
            }
        }
    }
     public int geraSenhaLocal(String cliente,String tipo_atendimento) {
        
        Connection conn = null;
        int id_sequencia = 0;
        
            
            
                //INSERE NOVA SENHA
                String sql = "INSERT INTO tab_senhas(id_senha, data_senha,  nm_cliente, status_atendimento, tipo_atendimento) VALUES (? , curdate(), ?,'Ativo',?); ";                    
                try{
                    //obtem conexao com o banco de dados
                         conn = getConnection();
                         conn.setAutoCommit(false);
                PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);            
                stmt.setInt(1, getProximaSenha());
                stmt.setString(2, cliente); //informar nome digitado pelo usuário                      
                stmt.setString(3, tipo_atendimento); //informar tipo atendimento informado 
                int affectedRows = stmt.executeUpdate();
                
                //verifica se deu certo. Se sim, obtem a chave id_sequancia gerada 
                 if (affectedRows > 0) {
                    ResultSet rs = stmt.getGeneratedKeys();
                    if (rs.next()){
                        id_sequencia = rs.getInt(1);                       
                    }else {
                        System.out.println("erro"); 
                    }
                } else {
                //cancela as modifica��es no banco de dados
                    conn.rollback();
                    return 0;
                }
                //confirma as modifica��es no banco de dados
                conn.commit();
                return id_sequencia;
            }                    
         catch (Exception ex) {
            ex.printStackTrace();
            return 0;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception closeEx) {
                    //do nothing
                }
            }
        }
    }
    public static boolean verificaSenhaForte(String senha)
    {
        boolean isSenhaIdValid = false;
        if (senha != null && senha.length() > 0) {
            String expression = "(?=.{6}).*([A-Za-z][0-9]|[0-9][A-Za-z]).*";
            Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE);
            Matcher matcher = pattern.matcher(senha);
            if (matcher.matches()) {
                isSenhaIdValid = true;
            }
        }
        return isSenhaIdValid;
        
    }      
     
     
    public static boolean isCPF(String CPF) {
        // remover formatações
        CPF = CPF.replace( " " , ""); //tira espaço em branco
        CPF = CPF.replace( "." , ""); //tira ponto
        CPF = CPF.replace( "/" , ""); //tira barra
        CPF = CPF.replace( "-" , ""); //tira hífen
        
        System.out.println(CPF);
        
        // considera-se erro CPF's formados por uma sequencia de numeros iguais
        if (CPF.equals("00000000000") || CPF.equals("11111111111")
                || CPF.equals("22222222222") || CPF.equals("33333333333")
                || CPF.equals("44444444444") || CPF.equals("55555555555")
                || CPF.equals("66666666666") || CPF.equals("77777777777")
                || CPF.equals("88888888888") || CPF.equals("99999999999")
                || (CPF.length() != 11)) {
            return (false);
        }

        char dig10, dig11;
        int sm, i, r, num, peso;

        try {
            sm = 0;
            peso = 10;
            for (i = 0; i < 9; i++) {
                num = (int) (CPF.charAt(i) - 48);
                sm = sm + (num * peso);
                peso = peso - 1;
            }

            r = 11 - (sm % 11);
            if ((r == 10) || (r == 11)) {
                dig10 = '0';
            } else {
                dig10 = (char) (r + 48); // converte no respectivo caractere numerico
            }
            sm = 0;
            peso = 11;
            for (i = 0; i < 10; i++) {
                num = (int) (CPF.charAt(i) - 48);
                sm = sm + (num * peso);
                peso = peso - 1;
            }

            r = 11 - (sm % 11);
            if ((r == 10) || (r == 11)) {
                dig11 = '0';
            } else {
                dig11 = (char) (r + 48);
            }

            if ((dig10 == CPF.charAt(9)) && (dig11 == CPF.charAt(10))) {
                return (true);
            } else {
                return (false);
            }
        } catch (InputMismatchException erro) {
            return (false);
        }
    }
     
public String criptoSenha(String senha_cripto){
    String senha = "";
	try {
            MessageDigest criptografar = MessageDigest.getInstance("SHA-1");
            criptografar.digest(senha_cripto.getBytes());
            BASE64Encoder encoder = new BASE64Encoder ();  
            senha = encoder.encode(criptografar.digest());
            return senha;
            } catch (NoSuchAlgorithmException e1) {
		e1.printStackTrace();
                return "Erro";
            }             
}

    public int getProximaSenha() {
        Connection conn = null;

        try {
            conn = getConnection();

            String sql = "SELECT IFNULL(max(id_senha+1),1) id_senha FROM tab_senhas WHERE data_senha = CURDATE()";

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                int id_senha = result.getInt("id_senha");
                return id_senha;
            } else {
                return 0;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return 0;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception closeEx) {
                    //do nothing
                }
            }
        }
    }

    public Senha retornaSenha(int id_sequencia) {
        Connection conn = null;
        Senha senha = new Senha();

        try {
            conn = getConnection();

            String sql = "SELECT id_sequencia, id_senha, data_senha, cpf_cliente, nm_cliente, senha_cliente, status_atendimento, data_atendimento_ini, data_atendimento_fim, id_usuario FROM tab_senhas WHERE id_sequencia = ?";
            
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id_sequencia);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {                
                senha.setId_sequencia(result.getInt(1));
                senha.setId_senha(result.getInt(2));
                senha.setData_senha(result.getDate(3));
                senha.setCpf_cliente(result.getString(4));
                senha.setNome_cliente(result.getString(5));
                senha.setSenha_cliente(result.getString(6));
                senha.setStatus_atendimento(result.getString(7));
                senha.setData_atendimento_ini(result.getDate(8));
                senha.setData_atendimento_fim(result.getDate(9));
                senha.setId_usuario_atendente(result.getInt(10));
                return senha;
            } else {
                return null;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception closeEx) {
                    //do nothing
                }
            }
        }
    }
    
    public boolean cancelaSenha(int id_senha) {
        Connection conn = null;
        
        try {
            //obtem conexao com o banco de dados
            conn = getConnection();
            conn.setAutoCommit(false);
            //antes de gerar senha chama metodo cadastro cliente 
            //define SQL para inser��o
            String sql = "UPDATE tab_senhas set status_atendimento = 'Cancelado' WHERE id_senha = ? and data_senha = CURDATE();";    
            //instance Prepared statement especificando os par�metros do SQL
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);            
            stmt.setInt(1, id_senha);
            
            //executa a opera��o no banco de dados
            int affectedRows = stmt.executeUpdate();
            //verifica se deu certo. Se sim, obtem a chave id_senha gerada 
            if (affectedRows > 0) {
                conn.commit();
                return true;
            } else {
                //cancela as modifica��es no banco de dados
                conn.rollback();
                return false;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception closeEx) {
                    //do nothing
                }
            }
        }
    }
    public int chamaProximaSenha(int id_senha) {
        Connection conn = null;
                   

        try {
            //obtem conexao com o banco de dados
            conn = getConnection();
            conn.setAutoCommit(false);
            //antes de gerar senha chama metodo cadastro cliente 
            //define SQL para inser��o
            String sql = "UPDATE tab_senhas set status_atendimento = 'Em Atendimento',data_atendimento_ini=CURRENT_TIMESTAMP WHERE id_senha = ?";    
            //instance Prepared statement especificando os par�metros do SQL
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);            
            stmt.setInt(1, id_senha);

            //executa a opera��o no banco de dados
            int affectedRows = stmt.executeUpdate();
            //verifica se deu certo. Se sim, obtem a chave id_senha gerada 
            if (affectedRows > 0) {
                conn.commit();
                return id_senha;
            } else {
                //cancela as modifica��es no banco de dados
                
                conn.rollback();
                return 0;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            return 0;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception closeEx) {
                    //do nothing
                }
            }
        }
    }
    public int finalizaAtendimento(int id_senha) {
        Connection conn = null;
                   

        try {
            //obtem conexao com o banco de dados
            conn = getConnection();
            conn.setAutoCommit(false);
            //antes de gerar senha chama metodo cadastro cliente 
            //define SQL para inser��o
            String sql = "UPDATE tab_senhas set status_atendimento = 'Ausente',data_atendimento_fim=CURRENT_TIMESTAMP WHERE id_senha = ?";    
            //instance Prepared statement especificando os par�metros do SQL
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);            
            stmt.setInt(1, id_senha);

            //executa a opera��o no banco de dados
            int affectedRows = stmt.executeUpdate();
            //verifica se deu certo. Se sim, obtem a chave id_senha gerada 
            if (affectedRows > 0) {
                conn.commit();
                return id_senha;
            } else {
                //cancela as modifica��es no banco de dados
                
                conn.rollback();
                return 0;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            return 0;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception closeEx) {
                    //do nothing
                }
            }
        }
    }
        public int getClienteSenha() {
        Connection conn = null;

        try {
            conn = getConnection();

            String sql = "SELECT min(id_senha) FROM tab_senhas" + " WHERE status_atendimento ='Ativo' AND data_senha = CURRENT_DATE ";

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet result = stmt.executeQuery();
            if (result.next()) {
                 
                int id_senha = result.getInt("min(id_senha)");
               System.out.println(id_senha);

                return id_senha;
            } else {
                return 0;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return 0;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception closeEx) {
                    //do nothing
                }
            }
        }
    }
    public int getClienteSenhaEmAtendimento() {
        Connection conn = null;

        try {
            conn = getConnection();

            String sql = "SELECT min(id_senha) FROM tab_senhas" + " WHERE status_atendimento ='Em Atendimento' AND data_senha = CURRENT_DATE ";

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet result = stmt.executeQuery();
            if (result.next()) {
                 
                int id_senha = result.getInt("min(id_senha)");
               System.out.println(id_senha);

                return id_senha;
            } else {
                return 0;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return 0;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception closeEx) {
                    //do nothing
                }
            }
        }
    }
    
    
    public String getNomeCliente(int id_senha) {
        Connection conn = null;

        try {
            conn = getConnection();

            String sql = "SELECT nm_cliente FROM tab_senhas WHERE id_senha =? AND data_senha = CURRENT_DATE";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id_senha);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                String nm_cliente = result.getString("nm_cliente");
                return nm_cliente;
            } else {
                return null;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception closeEx) {
                    //do nothing
                }
            }
        }
    }
}
