/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.dao;

import edu.vo.painel_ant;
import edu.vo.painel_atu;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thiago.quintanilha
 */
public class PainelDao extends Dao{
    
    public List<painel_ant> lista_senhas_chamadas() {
        Connection conn = null;

        try {
            conn = getConnection();
            List<painel_ant> ants = new ArrayList<painel_ant>();
            
            String sql = "SELECT max(s.id_senha) senha, f.id_fila fila FROM tab_senhas s inner join tab_fila f on f.id_usuario = s.id_usuario WHERE s.id_usuario is not null and s.data_senha = curdate() group by f.id_fila order by senha desc";

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet result = stmt.executeQuery();
            
            
            
            while (result.next()){
               painel_ant ant = new painel_ant();
                
               ant.setFila(result.getInt("fila"));
               ant.setSenha(result.getInt("senha"));
               
               System.out.println("fila " + ant.getFila() + " senha " + ant.getSenha());
               
               ants.add(ant);
            }
            return ants;
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
          
   public painel_atu lista_senhas_anteriores() {
        Connection conn = null;

        try {
            conn = getConnection();
            painel_atu atu = new painel_atu();
            
            String sql = "SELECT TIME_FORMAT(sec_to_time(AVG(TIMESTAMPDIFF(SECOND, data_atendimento_ini, data_atendimento_fim))),'%T') as tempo_medio FROM tab_senhas WHERE data_senha = CURDATE() and data_atendimento_fim is not null";

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet result = stmt.executeQuery();
            
            while (result.next()){
               atu.setTempo_medio(result.getTime("tempo_medio"));
            }            

            sql = "SELECT max(id_senha) senha, tipo_atendimento from tab_senhas WHERE status_atendimento in (\"Chamando\", \"Em Atendimento\", \"Atendido\") and data_senha = curdate()" ;

            stmt = conn.prepareStatement(sql);
            result = stmt.executeQuery();
            
            while (result.next()){
               atu.setSenha_atual(result.getInt("senha"));
               atu.setTipo_atendimento(result.getString("tipo_atendimento"));
            }
            return atu;
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
