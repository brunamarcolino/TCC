package edu.vo;

public class Fila {
    
    private int id_fila,id_usuario,mesa_usuario;
    private String status_fila;

    public int getId_fila() {
        return id_fila;
    }

    public void setId_fila(int id_fila) {
        this.id_fila = id_fila;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getMesa_usuario() {
        return mesa_usuario;
    }

    public void setMesa_usuario(int mesa_usuario) {
        this.mesa_usuario = mesa_usuario;
    }

    public String getStatus_fila() {
        return status_fila;
    }

    public void setStatus_fila(String status_fila) {
        this.status_fila = status_fila;
    }
}