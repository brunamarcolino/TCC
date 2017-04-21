package edu.dao;

import edu.vo.Fila;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FilaDao extends Dao {

    public boolean setFila(int login_usuario, int id_fila) {
        Connection conn = null;

        try {
            conn = getConnection();
            conn.setAutoCommit(false);
            
            String sql = "UPDATE tab_fila set id_usuario = ?, status_fila = 'Aberta' where id_fila = ?";

                         
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, login_usuario);
            stmt.setInt(2, id_fila);

            int affectedRows = stmt.executeUpdate();
           if (affectedRows > 0) {
                conn.commit();
                return true;
            } else {
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
    
    public boolean setFilaOff(int login_usuario) {
        Connection conn = null;

        try {
            conn = getConnection();
            conn.setAutoCommit(false);

            String sql = "UPDATE tab_fila SET status_fila= 'Fechada', id_usuario=null WHERE id_usuario = ?;";

            
           // PreparedStatement stmt = conn.prepareStatement(sql);
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);            
            stmt.setInt(1, login_usuario);

            
            int affectedRows = stmt.executeUpdate();
            
            if (affectedRows > 0) {
                 conn.commit(); 
                return true;
            } else {
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
    
    public List<Fila> getMesas() {
        Connection conn = null;
        List<Fila> mesas = new ArrayList<Fila>();
        
         try{
            conn = getConnection();
            String sql = "SELECT id_fila from tab_fila where status_fila = 'Fechada'";
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet result = stmt.executeQuery();
            
            while (result.next()) {
                Fila mesa = new Fila();
                
                mesa.setId_fila(result.getInt("id_fila"));
                mesas.add(mesa);
                }
            return mesas;
         
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
    
    public int VerificaFilaAberta(int id_usuario) {
        
        Connection conn = null;
        
        try {
            //obtem conexao com o banco de dados
            conn = getConnection();
            conn.setAutoCommit(false);
            
            //VERIFICA SE ESSE CLIENTE JÁ POSSUI SENHA ATIVA PARA A DATA ATUAL
            String select_sql = "SELECT id_fila FROM tab_fila WHERE id_usuario = ?";
            PreparedStatement stmt = conn.prepareStatement(select_sql);
            stmt.setInt(1, id_usuario);
            ResultSet result = stmt.executeQuery();
            
            //SE SIM
            if (result.next()) {
                //RECUPERA AS INFORMAÇÕES DO CLIENTE
                return result.getInt(1);                
            }                                
            
            //SE NÃO
            else {  
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
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

