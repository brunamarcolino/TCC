package edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.Statement;

public class FilaDao extends Dao {

    public boolean setFila( int id_usuario, int mesa_usuario, String status_fila) {
        Connection conn = null;

        try {
            conn = getConnection();
            conn.setAutoCommit(false);

            String sql = "INSERT INTO tab_fila (id_usuario,mesa_usuario,status_fila) VALUES (?,?,?);";

            
           // PreparedStatement stmt = conn.prepareStatement(sql);
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);            
            stmt.setInt(1, id_usuario);
            System.out.println(id_usuario);
            stmt.setInt(2, mesa_usuario);
            System.out.println(mesa_usuario);
            stmt.setString(3, status_fila);
            System.out.println(status_fila);
            
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
    public boolean setFilaOff(int id_fila) {
        Connection conn = null;

        try {
            conn = getConnection();
            conn.setAutoCommit(false);

            String sql = "UPDATE tab_fila SET status_fila= 'Fechada' WHERE id_fila = ?;";

            
           // PreparedStatement stmt = conn.prepareStatement(sql);
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);            
            stmt.setInt(1, id_fila);

            
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
}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

