package com.motogo.app.clases;

import java.util.HashSet;
import java.util.Set;

public class MarcaMoto {
    private int idMarcaMoto;
    private String nombre;


    //conexiones
    private Set<ModeloMoto> modeloMoto = new HashSet<>();

    public int getIdMarcaMoto() {
        return idMarcaMoto;
    }

    public void setIdMarcaMoto(int idMarcaMoto) {
        this.idMarcaMoto = idMarcaMoto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Set<ModeloMoto> getModeloMoto() {
        return modeloMoto;
    }

    public void setModeloMoto(Set<ModeloMoto> modeloMoto) {
        this.modeloMoto = modeloMoto;
    }
}
