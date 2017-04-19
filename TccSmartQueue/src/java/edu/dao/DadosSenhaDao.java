/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.dao;

import edu.vo.DadosSenha;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;

/**
 *
 * @author Thiago Quintanilha
 */
public class DadosSenhaDao extends Dao{

    public DadosSenha getDados(String tipo_atendimento, int id_sequencia) {
        Connection conn = null;

        try {
            conn = getConnection();
            String sql;
            if (tipo_atendimento.equals("Preferencial")){
                sql = "select TIME_FORMAT(sec_to_time(a.tempo_medio),'%T'), a.qtde_pessoas, TIME_FORMAT(sec_to_time(a.hora_atual + a.previ_sec), '%T') as previsao from ( select tm.tempo_medio, p.qtde_pessoas, (tm.tempo_medio * p.qtde_pessoas) as previ_sec, time_to_sec(curtime()) as hora_atual from ( SELECT AVG(TIMESTAMPDIFF(SECOND, data_atendimento_ini, data_atendimento_fim)) as tempo_medio FROM tab_senhas WHERE data_senha = CURDATE() and data_atendimento_fim is not null) tm, (SELECT count(1) as qtde_pessoas FROM tab_senhas WHERE data_senha = curdate() and data_atendimento_fim is null and status_atendimento = 'Ativo' and tipo_atendimento = 'Preferencial' and (0 = ? or id_sequencia < ?)) p ) a";
            } else {
                sql = "select TIME_FORMAT(sec_to_time(a.tempo_medio),'%T'), a.qtde_pessoas, TIME_FORMAT(sec_to_time(a.hora_atual + a.previ_sec), '%T') as previsao from ( select tm.tempo_medio, p.qtde_pessoas, (tm.tempo_medio * p.qtde_pessoas) as previ_sec, time_to_sec(curtime()) as hora_atual from ( SELECT AVG(TIMESTAMPDIFF(SECOND, data_atendimento_ini, data_atendimento_fim)) as tempo_medio FROM tab_senhas WHERE data_senha = CURDATE() and data_atendimento_fim is not null) tm, (SELECT count(1) as qtde_pessoas FROM tab_senhas WHERE data_senha = curdate() and data_atendimento_fim is null and status_atendimento = 'Ativo' and (0 = ? or id_sequencia < ?)) p ) a";
            }
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id_sequencia);
            stmt.setInt(2, id_sequencia);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                DadosSenha dadosSenha = new DadosSenha();
                
                Time tempo_medio = result.getTime(1);         
                int quantidade_pessoas = result.getInt(2);
                Time previsao_atendimento = result.getTime(3);               
                            
                dadosSenha.setTempo_medio(tempo_medio);
                System.out.println("tempo_medio " + tempo_medio);
                
                dadosSenha.setPrevisao_atendimento(previsao_atendimento);                
                System.out.println("previsao_atendimento " + previsao_atendimento);               
                
                
                dadosSenha.setQuantidade_pessoas(quantidade_pessoas);
                System.out.println("quantidade_pessoas " + quantidade_pessoas);
                
                return dadosSenha;
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
