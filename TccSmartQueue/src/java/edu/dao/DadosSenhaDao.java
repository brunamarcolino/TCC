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

    public DadosSenha getDados() {
        Connection conn = null;

        try {
            conn = getConnection();

            String sql = "SELECT (SELECT TIME_FORMAT(AVG(TIMEDIFF(data_atendimento_fim,data_atendimento_ini)),'%T') FROM `tab_senhas` WHERE `data_senha` = CURDATE() and data_atendimento_fim is not null) TEMPO_MEDIO, (SELECT IFNULL(max(id_senha),0) id_senha FROM tab_senhas WHERE data_senha = CURDATE()) ULTIMA_SENHA_GERADA, (SELECT IFNULL(max(id_senha),0) id_senha FROM tab_senhas WHERE data_senha = CURDATE() and data_atendimento_ini is not null) ULTIMA_SENHA_CHAMADA FROM dual";

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                DadosSenha dadosSenha = new DadosSenha();
                
                Time tempo_medio = result.getTime(1);                
                int ultima_senha_gerada = result.getInt(2);
                int ultima_senha_atendida = result.getInt(3);
                int quantidade_pessoas = ultima_senha_gerada - ultima_senha_atendida;
                        
                //Double previsao_atendimento = (quantidade_pessoas * tm);
                
                dadosSenha.setTempo_medio(tempo_medio);
                dadosSenha.setUltima_senha_gerada(ultima_senha_gerada);
                dadosSenha.setUltima_senha_atendida(ultima_senha_atendida);
                
                //dadosSenha.setPrevisao_atendimento(previsao_atendimento);
                //System.out.println(previsao_atendimento);
                dadosSenha.setQuantidade_pessoas(quantidade_pessoas);
                
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
