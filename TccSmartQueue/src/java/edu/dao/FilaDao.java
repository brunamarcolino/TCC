package edu.dao;

import edu.vo.Fila;
import edu.vo.Parametro;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FilaDao extends Dao {

    public boolean setFila( int login_usuario, int mesa_usuario, String status_fila) {
        Connection conn = null;

        try {
            conn = getConnection();
            conn.setAutoCommit(false);
            
            String sql = "UPDATE tab_fila set id_usuario = ? ,mesa_usuario = ?,status_fila = ?";

                         
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, login_usuario);
            stmt.setInt(2, mesa_usuario);
            stmt.setString(3, status_fila);

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

            String sql = "UPDATE tab_fila SET status_fila= 'Fechada' WHERE id_usuario = ?;";

            
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
    public List getMesas() {
        Connection conn = null;
        List mesas = new ArrayList();
        Fila mesa = new Fila();
         try{
            conn = getConnection();
            String sql = "SELECT id_fila from tab_fila where status_fila = 'Fechada'";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet result = stmt.executeQuery();
            if(result.next()){
                while (result.next()) {
                 mesas.add(result.getInt("id_fila"));
                 System.out.println(mesas);
                 return mesas;
                }
                
            }else{
                 return null;
             }
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
       }return mesas; 
    }
                
}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

