/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.vo;

import java.sql.Time;

/**
 *
 * @author brunacm
 */
public class painel_atu {
    
    private int senha_atual;
    private Time tempo_medio;
    private String status_atendimento;

    public String getStatus_atendimento() {
        return status_atendimento;
    }

    public void setStatus_atendimento(String status_atendimento) {
        this.status_atendimento = status_atendimento;
    }

    public int getSenha_atual() {
        return senha_atual;
    }

    public void setSenha_atual(int senha_atual) {
        this.senha_atual = senha_atual;
    }

    public Time getTempo_medio() {
        return tempo_medio;
    }

    public void setTempo_medio(Time tempo_medio) {
        this.tempo_medio = tempo_medio;
    }
    
}
