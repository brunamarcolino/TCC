/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.vo;

import java.sql.Time;

/**
 *
 * @author Thiago Quintanilha
 */
public class DadosSenha {
    private String tipo_atendimento;
    private Time tempo_medio;
    private Time previsao_atendimento;
    private int quantidade_pessoas;
    private int distancia;
    private boolean horario_comercial;
    private int atendentes_ativos;

    public int getAtendentes_ativos() {
        return atendentes_ativos;
    }

    public void setAtendentes_ativos(int atendentes_ativos) {
        this.atendentes_ativos = atendentes_ativos;
    }
    
    

    public int getDistancia() {
        return distancia;
    }

    public void setDistancia(int distancia) {
        this.distancia = distancia;
    }

    public boolean isHorario_comercial() {
        return horario_comercial;
    }

    public void setHorario_comercial(boolean horario_comercial) {
        this.horario_comercial = horario_comercial;
    }

    public int getQuantidade_pessoas() {
        return quantidade_pessoas;
    }

    public void setQuantidade_pessoas(int quantidade_pessoas) {
        this.quantidade_pessoas = quantidade_pessoas;
    }

    public String getTipo_atendimento() {
        return tipo_atendimento;
    }

    public void setTipo_atendimento(String tipo_atendimento) {
        this.tipo_atendimento = tipo_atendimento;
    }

    public Time getTempo_medio() {
        return tempo_medio;
    }

    public void setTempo_medio(Time tempo_medio) {
        this.tempo_medio = tempo_medio;
    }

    public Time getPrevisao_atendimento() {
        return previsao_atendimento;
    }

    public void setPrevisao_atendimento(Time previsao_atendimento) {
        this.previsao_atendimento = previsao_atendimento;
    }
    
    
    
}
