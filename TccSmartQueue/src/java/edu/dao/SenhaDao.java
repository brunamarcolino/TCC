/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.dao;

import edu.vo.Senha;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author brunacm
 */
public class SenhaDao extends Dao {
    
    public Senha getUltimaSenha() {
        Connection conn = null;

        try {
            conn = getConnection();

            String sql = "SELECT IFNULL(max(id_senha),0) id_senha FROM tab_senhas WHERE data_senha = CURDATE()";

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                Senha senha = new Senha();
                senha.setId_senha(result.getInt("id_senha"));
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
    
    public String getTempoAtendimento() {
        Connection conn = null;

        try {
            conn = getConnection();

            String sql = "SELECT AVG(data_atendimento_fim-data_atendimento_ini) tempo_atendimento FROM `tab_senhas` WHERE `data_senha` = CURDATE() ";

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                String tma = result.getString("tempo_atendimento");
                return tma;
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

    public Senha geraSenha() {
        Connection conn = null;
        Senha senha = new Senha();
        
        try {
            //obtem conexao com o banco de dados
            conn = getConnection();
            conn.setAutoCommit(false);
            //antes de gerar senha chama metodo cadastro cliente 
            //define SQL para inser��o
            String sql = "INSERT INTO tab_senhas(id_senha, data_senha, cpf_cliente, nm_cliente, senha_cliente, status_atendimento) VALUES (? , curdate(), ?, ?, ?, 'Ativo'); ";    
            //instance Prepared statement especificando os par�metros do SQL
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);            
            stmt.setInt(1, getProximaSenha());
            stmt.setInt(2, 122); //informar CPF digitado pelo usuário
            stmt.setString(3, "nome"); //informar nome digitado pelo usuário
            stmt.setString(4, "senha"); //informar senha digitado pelo usuário                      

            //executa a opera��o no banco de dados
            int affectedRows = stmt.executeUpdate();
            System.out.println("affectedRows: " + affectedRows);
            //verifica se deu certo. Se sim, obtem a chave id_senha gerada 
            if (affectedRows > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()){
                    senha.setId_sequencia(rs.getInt(1));
                    System.out.println("if senha: " + senha.getId_senha());
                }else {
                    System.out.println("erro"); 
                }
            } else {
                //cancela as modifica��es no banco de dados
                conn.rollback();
                return null;
            }
                //confirma as modifica��es no banco de dados
                conn.commit();
                return senha;

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
    
   
}
