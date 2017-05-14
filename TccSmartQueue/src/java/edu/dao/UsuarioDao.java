package edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import edu.vo.Usuario;
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UsuarioDao extends Dao {

    public Usuario getUsuario(String nm_usuario, String senha_usuario) {
        Connection conn = null;

        try {
            conn = getConnection();

            String sql = "SELECT id_usuario, nm_usuario, email_usuario, status_usuario, tipo_usuario FROM tab_usuarios " + "where nm_usuario=? AND senha_usuario=SHA1(?) and status_usuario='Ativo'";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, nm_usuario);
            stmt.setString(2, senha_usuario);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                Usuario usuario = new Usuario();
                usuario.setId_usuario(result.getInt("id_usuario"));
                usuario.setNm_usuario(result.getString("nm_usuario"));
                usuario.setEmail_usuario(result.getString("email_usuario"));
                usuario.setTipo_usuario(result.getString("tipo_usuario"));

                return usuario;
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

    public Usuario getEditarUsuario(int id_usuario) {
        Connection conn = null;

        try {
            conn = getConnection();

            String sql = "SELECT nm_usuario, email_usuario, cpf_usuario, status_usuario, tipo_usuario FROM tab_usuarios " + "where id_usuario=?";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id_usuario);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                Usuario usuario = new Usuario();
                usuario.setId_usuario(id_usuario);
                usuario.setNm_usuario(result.getString("nm_usuario"));
                usuario.setEmail_usuario(result.getString("email_usuario"));
                usuario.setCpf_usuario(result.getString("cpf_usuario"));
                usuario.setTipo_usuario(result.getString("tipo_usuario"));
                usuario.setStatus_usuario(result.getString("status_usuario"));

                return usuario;
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
    
        public String getUsuario(int id_usuario) {
        Connection conn = null;

        try {
            conn = getConnection();

            String sql = "SELECT nm_usuario FROM tab_usuarios " + "where id_usuario=?";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id_usuario);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                String usuario;
                usuario = result.getString("nm_usuario");
                return usuario;
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
    
    public Usuario getUsuarioToken(String token) {
        Connection conn = null;

        try {
            conn = getConnection();

            String sql = "SELECT id_usuario, nm_usuario, email_usuario, cpf_usuario, status_usuario, tipo_usuario FROM tab_usuarios " + "where token_senha=?";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, token);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                Usuario usuario = new Usuario();
                usuario.setId_usuario(result.getInt("id_usuario"));
                usuario.setNm_usuario(result.getString("nm_usuario"));
                usuario.setEmail_usuario(result.getString("email_usuario"));
                usuario.setCpf_usuario(result.getString("cpf_usuario"));
                usuario.setTipo_usuario(result.getString("tipo_usuario"));
                usuario.setStatus_usuario(result.getString("status_usuario"));

                return usuario;
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

    public List<Usuario> getUsuarios() {
        Connection conn = null;
        List<Usuario> usuarios = new ArrayList<Usuario>();

        try {
            conn = getConnection();

            String sql = "SELECT id_usuario, nm_usuario, email_usuario, cpf_usuario, tipo_usuario FROM tab_usuarios where status_usuario = 'Ativo'";

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet result = stmt.executeQuery();

            while (result.next()) {
                Usuario usuario = new Usuario();

                usuario.setId_usuario(result.getInt("id_usuario"));
                usuario.setNm_usuario(result.getString("nm_usuario"));
                usuario.setEmail_usuario(result.getString("email_usuario"));
                usuario.setCpf_usuario(result.getString("cpf_usuario"));
                usuario.setTipo_usuario(result.getString("tipo_usuario"));

                usuarios.add(usuario);
            }

            return usuarios;
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

    public boolean updateUsuario(Usuario usuario) {
        Connection conn = null;

        try {
            //obtem conexao com o banco de dados
            conn = getConnection();
            conn.setAutoCommit(false);

            //define SQL para atualiza��o
            String sql = "UPDATE tab_usuarios SET nm_usuario = ?, email_usuario = ?, cpf_usuario = ?, tipo_usuario = ?  WHERE id_usuario = ?";

            //instance Prepared statement especificando os par�metros do SQL
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario.getNm_usuario());
            stmt.setString(2, usuario.getEmail_usuario());
            stmt.setString(3, usuario.getCpf_usuario());
            stmt.setString(4, usuario.getTipo_usuario());
            stmt.setInt(5, usuario.getId_usuario());

            //executa a opera��o no banco de dados
            int affectedRows = stmt.executeUpdate();

            //verifica se deu certo. Se sim, atualiza a nota 
            if (affectedRows > 0) {
                //confirma as modifica��es no banco de dados
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
    
    public boolean updateSenhaUsuario(int id, String senha) {
        Connection conn = null;

        try {
            //obtem conexao com o banco de dados
            conn = getConnection();
            conn.setAutoCommit(false);

            //define SQL para atualiza��o
            String sql = "UPDATE tab_usuarios SET token_senha = null, senha_usuario = SHA1(?) WHERE id_usuario = ?";

            //instance Prepared statement especificando os par�metros do SQL
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, senha);
            stmt.setInt(2, id);

            //executa a opera��o no banco de dados
            int affectedRows = stmt.executeUpdate();

            //verifica se deu certo. Se sim, atualiza a nota 
            if (affectedRows > 0) {
                //confirma as modifica��es no banco de dados
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

    public int verificaCpfUsuario(String cpf_usuario) {
        Connection conn = null;
        boolean validaCpf = isCPF(cpf_usuario);
        
        try {
        if (validaCpf){
        
            
        
            conn = getConnection();

            String sql = "SELECT status_usuario FROM tab_usuarios " + "where cpf_usuario=?";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, cpf_usuario);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                String status_usuario = result.getString("status_usuario");
                if (status_usuario.equals("Inativo")){
                   return 1; //CPF já cadastrado porém inativo
                } 
                else {
                   return 2; //CPF já cadastrado e ativo
                }
            } else {
                return 3; //CPF OK - NÃO CADASTRADO 
            }
        }
        else {
            return 4; //CPF INVÁLIDO
        }
        } catch (Exception ex) {
            ex.printStackTrace();
            return 5;
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
    
    
    public String verificaCpfUsuarioEditar(String cpf_usuario, int id) {
        Connection conn = null;
        boolean validaCpf = isCPF(cpf_usuario);
        
        try {
        if (validaCpf){

            conn = getConnection();

            String sql = "SELECT nm_usuario FROM tab_usuarios " + "where cpf_usuario=? and id_usuario <> ?";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, cpf_usuario);
            stmt.setInt(2, id);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                String nm_usuario = result.getString("nm_usuario");
                return nm_usuario; //CPF já cadastrado para outro usuario
            } else {
                return "ok"; //CPF OK - NÃO CADASTRADO ou NÃO ALTERADO 
            }
        }
        else {
            return "invalido"; //CPF INVÁLIDO
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
    
     public boolean verificaLoginUsuario(String nome_usuario) {
        Connection conn = null;
        
        try {
            conn = getConnection();

            String sql = "SELECT 1 FROM tab_usuarios " + "where nm_usuario=?";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, nome_usuario);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                //USUARIO EXISTE
                return false;
            } else {
                //USUARIO OK - NÃO CADASTRADO 
                return true; 
            }
        }
        catch (Exception ex) {
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
     
    public boolean verificaLoginUsuarioEditar(String nome_usuario, int id) {
        Connection conn = null;
        
        try {
            conn = getConnection();

            String sql = "SELECT 1 FROM tab_usuarios " + "where nm_usuario=? and id_usuario <> ?";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, nome_usuario);
            stmt.setInt(2, id);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                //USUARIO EXISTE
                return false;
            } else {
                //USUARIO OK - NÃO CADASTRADO 
                return true; 
            }
        }
        catch (Exception ex) {
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
     
    public static boolean verificaEmailUsuario(String email)
    {
        boolean isEmailIdValid = false;
        if (email != null && email.length() > 0) {
            String expression = "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{2,4}$";
            Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE);
            Matcher matcher = pattern.matcher(email);
            if (matcher.matches()) {
                isEmailIdValid = true;
            }
        }
        return isEmailIdValid;
    }     

    public boolean insereUsuario(String nome, String email, String cpf, String tipo) {
        Connection conn = null;

        try {
            //gera token para alteração de senhas
            Random rand = new Random();
            String token = Long.toHexString(rand.nextLong()) + Long.toHexString(rand.nextLong());
            
            System.out.println(token);

            //obtem conexao com o banco de dados
            conn = getConnection();
            conn.setAutoCommit(false);
            
            //define SQL para atualiza��o
            String sql = "INSERT INTO tab_usuarios (nm_usuario, email_usuario, cpf_usuario, token_senha, tipo_usuario, status_usuario) VALUES (?, ?, ?, SHA1(?), ?, 'Ativo')";

            //instance Prepared statement especificando os par�metros do SQL
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, nome);
            stmt.setString(2, email);
            stmt.setString(3, cpf);            
            stmt.setString(4, token);
            stmt.setString(5, tipo);

            //executa a opera��o no banco de dados
            int affectedRows = stmt.executeUpdate();

            //verifica se deu certo. Se sim, atualiza a nota 
            if (affectedRows > 0) {
                //confirma as modifica��es no banco de dados
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
    
    public String updateEsqueciSenhaUsuario(String login, String email) {
        Connection conn = null;

        try {
            //gera token para alteração de senhas
            Random rand = new Random();
            String token = Long.toHexString(rand.nextLong()) + Long.toHexString(rand.nextLong());
            
            //obtem conexao com o banco de dados
            conn = getConnection();
            conn.setAutoCommit(false);

            //define SQL para atualiza��o
            String sql = "UPDATE tab_usuarios SET token_senha = ? WHERE nm_usuario = ? and email_usuario = ?";

            //instance Prepared statement especificando os par�metros do SQL
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, token);
            stmt.setString(2, login);
            stmt.setString(3, email);
            
            //executa a opera��o no banco de dados
            int affectedRows = stmt.executeUpdate();

            //verifica se deu certo. Se sim, atualiza a nota 
            if (affectedRows > 0) {
                System.out.println("if");
                //confirma as modifica��es no banco de dados
                conn.commit();
                System.out.println("token " + token);
                return token;
            } else {
                System.out.println("else");
                //cancela as modifica��es no banco de dados
                conn.rollback();
                return "Erro";
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            return "Erro";
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


    public boolean deleteUsuario(int id_usuario) {
        Connection conn = null;

        try {
            //obtem conexao com o banco de dados
            conn = getConnection();
            conn.setAutoCommit(false);

            //define SQL para atualiza��o
            String sql = "UPDATE tab_usuarios SET status_usuario = 'Inativo' WHERE id_usuario = ?";

            //instance Prepared statement especificando os par�metros do SQL
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id_usuario);

            //executa a opera��o no banco de dados
            int affectedRows = stmt.executeUpdate();

            //verifica se deu certo. Se sim, atualiza a nota 
            if (affectedRows > 0) {
                //confirma as modifica��es no banco de dados
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
    
    public List<Usuario> getAtendentes() {
        Connection conn = null;
        List<Usuario> atendentes = new ArrayList<Usuario>();
        
         try{
            conn = getConnection();
            String sql = "SELECT id_usuario, nm_usuario from tab_usuarios where tipo_usuario = 'Atendente' and status_usuario = 'Ativo'";
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet result = stmt.executeQuery();
            
            while (result.next()) {
                Usuario atendente = new Usuario();  
                atendente.setId_usuario(result.getInt("id_usuario"));
                atendente.setNm_usuario(result.getString("nm_usuario"));
                atendentes.add(atendente);
            }
            return atendentes;
         
         }catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }finally {
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
