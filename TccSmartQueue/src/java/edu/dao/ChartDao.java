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
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author thiago.quintanilha
 */
public class ChartDao extends Dao{
    
    public List<Chart> relatorio_tempoMedio(String parametro_data_ini, String parametro_data_fim, String parametro_atendente) {
        Connection conn = null;

        try {
            conn = getConnection();
            List<Chart> charts = new ArrayList<Chart>();
            
            //String sql = "SELECT u.nm_usuario , s.data_senha, ifnull(TIME_FORMAT(AVG(TIMEDIFF(s.data_atendimento_fim,s.data_atendimento_ini)),'%T'),0) tm FROM tab_senhas s inner join tab_usuarios u on u.id_usuario = s.id_usuario WHERE s.data_atendimento_fim is not null group by u.nm_usuario, s.data_senha";
            String sql = "SELECT u.nm_usuario, TIME_FORMAT(AVG(TIMEDIFF(s.data_atendimento_fim,s.data_atendimento_ini)),'%i') tm FROM tab_senhas s inner join tab_usuarios u on u.id_usuario = s.id_usuario WHERE  s.data_senha between STR_TO_DATE(?, '%Y-%m-%d') and STR_TO_DATE(?, '%Y-%m-%d') and (? = 'TODOS' or s.id_usuario = ?) and s.data_atendimento_fim is not null group by u.nm_usuario";  
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, parametro_data_ini);
            stmt.setString(2, parametro_data_fim);
            stmt.setString(3, parametro_atendente);
            stmt.setString(4, parametro_atendente);

            ResultSet result = stmt.executeQuery();
            
            
            while (result.next()){
               Chart chart = new Chart(); 
               
               chart.setValor_x(result.getString("tm"));
               chart.setValor_y(result.getString("nm_usuario"));
               //chart.setValor_tooltip(result.getString("tm"));
               System.out.println("Retorno: " + chart.getValor_x() + chart.getValor_tooltip() + chart.getValor_y());
               
               charts.add(chart);
            }
            System.out.println("DAO " + charts);
            return charts;
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
