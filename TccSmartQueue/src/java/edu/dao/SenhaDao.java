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
                return "tma";
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
