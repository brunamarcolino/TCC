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
    private int ultima_senha_atendida;
    private int ultima_senha_gerada;
    private Time previsao_atendimento;
    private int quantidade_pessoas;
    private boolean distancia;

    public boolean isDistancia() {
        return distancia;
    }

    public void setDistancia(boolean distancia) {
        this.distancia = distancia;
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

    public int getUltima_senha_atendida() {
        return ultima_senha_atendida;
    }

    public void setUltima_senha_atendida(int ultima_senha_atendida) {
        this.ultima_senha_atendida = ultima_senha_atendida;
    }

    public int getUltima_senha_gerada() {
        return ultima_senha_gerada;
    }

    public void setUltima_senha_gerada(int ultima_senha_gerada) {
        this.ultima_senha_gerada = ultima_senha_gerada;
    }

    public Time getPrevisao_atendimento() {
        return previsao_atendimento;
    }

    public void setPrevisao_atendimento(Time previsao_atendimento) {
        this.previsao_atendimento = previsao_atendimento;
    }
    
    
    
}
