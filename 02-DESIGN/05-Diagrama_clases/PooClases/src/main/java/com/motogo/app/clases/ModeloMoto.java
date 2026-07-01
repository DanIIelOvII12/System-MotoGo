package com.motogo.app.clases;

import java.util.HashSet;
import java.util.Set;

public class ModeloMoto {
    private int idModeloMoto;
    private String nombreModelor;
    private int cilindraje;


    //conexiones
    private Set<CompatibilidadProducto> compatibilidadProducto = new HashSet<>();
    private MarcaMoto marcaMoto;


    public int getIdModeloMoto() {
        return idModeloMoto;
    }

    public void setIdModeloMoto(int idModeloMoto) {
        this.idModeloMoto = idModeloMoto;
    }

    public String getNombreModelor() {
        return nombreModelor;
    }

    public void setNombreModelor(String nombreModelor) {
        this.nombreModelor = nombreModelor;
    }

    public int getCilindraje() {
        return cilindraje;
    }

    public void setCilindraje(int cilindraje) {
        this.cilindraje = cilindraje;
    }

    public Set<CompatibilidadProducto> getCompatibilidadProducto() {
        return compatibilidadProducto;
    }

    public void setCompatibilidadProducto(Set<CompatibilidadProducto> compatibilidadProducto) {
        this.compatibilidadProducto = compatibilidadProducto;
    }

    public MarcaMoto getMarcaMoto() {
        return marcaMoto;
    }

    public void setMarcaMoto(MarcaMoto marcaMoto) {
        this.marcaMoto = marcaMoto;
    }
}

