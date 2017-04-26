/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.dao;

import edu.vo.Chart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 *
 * @author thiago.quintanilha
 */
public class ChartDao extends Dao{
    
    public Chart relatorio_tempoMedio(String parametro_data_ini, String parametro_data_fim, String parametro_atendente) {
        Connection conn = null;
        
        try {
            conn = getConnection();

            String sql = "SELECT  u.nm_usuario, s.data_senha, TIME_FORMAT(AVG(TIMEDIFF(s.data_atendimento_fim,s.data_atendimento_ini)),'%T') tempo_medio FROM tab_senhas S inner join tab_usuarios u on u.id_usuario = s.id_usuario WHERE s.data_senha between STR_TO_DATE("+parametro_data_ini+", '%Y-%m-%d') and STR_TO_DATE("+parametro_data_fim+", '%Y-%m-%d') and ("+parametro_atendente+" = 'TODOS' or s.id_usuario = "+parametro_atendente+") and s.data_atendimento_fim is not null GROUP by  u.nm_usuario, s.data_senha";
            
            System.out.println(sql);
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            //stmt.setString(1, nm_usuario);
            //stmt.setString(2, senha_usuario);
            ResultSet result = stmt.executeQuery();
            
            Chart chart = new Chart();
            chart.setValor_labels("");
            chart.setValor_dados("");
            
            return chart;
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
    
    public Chart relatorio_produtividade(String parametro_data_ini, String parametro_data_fim, String parametro_atendente) {
        Connection conn = null;
        
        try {
            conn = getConnection();

            String sql = "SELECT  u.nm_usuario, s.data_senha, COUNT(1) qtde_atendimento FROM tab_senhas S inner join tab_usuarios u on u.id_usuario = s.id_usuario WHERE s.data_senha between STR_TO_DATE("+parametro_data_ini+", '%Y-%m-%d') and STR_TO_DATE("+parametro_data_fim+", '%Y-%m-%d') and ("+parametro_atendente+"= 'TODOS' or s.id_usuario = "+parametro_atendente+")";
            
            System.out.println(sql);
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            //stmt.setString(1, nm_usuario);
            //stmt.setString(2, senha_usuario);
            ResultSet result = stmt.executeQuery();
            
            Chart chart = new Chart();
            chart.setValor_labels("");
            chart.setValor_dados("");
            
            return chart;
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
