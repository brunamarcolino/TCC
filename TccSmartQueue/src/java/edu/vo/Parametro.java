/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.vo;

import java.sql.Date;

/**
 *
 * @author brunacm
 */
public class Parametro {
    private int id_parametro,usuario_alteracao;
    private String desc_parametro, valor_parametro;
    private Date data_alteracao;
    private int parametro_habilitado;

    public int getParametro_habilitado() {
        return parametro_habilitado;
    }

    public void setParametro_habilitado(int parametro_habilitado) {
        this.parametro_habilitado = parametro_habilitado;
    }

    public int getId_parametro() {
        return id_parametro;
    }

    public void setId_parametro(int id_parametro) {
        this.id_parametro = id_parametro;
    }

    public int getUsuario_alteracao() {
        return usuario_alteracao;
    }

    public void setUsuario_alteracao(int usuario_alteracao) {
        this.usuario_alteracao = usuario_alteracao;
    }

    public String getDesc_parametro() {
        return desc_parametro;
    }
    
    public void setDesc_parametro(String desc_parametro) {
        this.desc_parametro = desc_parametro;
    }

    public String getValor_parametro() {
        return valor_parametro;
    }

    public void setValor_parametro(String valor_parametro) {
        this.valor_parametro = valor_parametro;
    }

    public Date getData_alteracao() {
        return data_alteracao;
    }

    public void setData_alteracao(Date data_alteracao) {
        this.data_alteracao = data_alteracao;
    }
}
