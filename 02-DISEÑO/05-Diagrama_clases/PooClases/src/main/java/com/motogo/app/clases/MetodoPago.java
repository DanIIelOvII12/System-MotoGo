package com.motogo.app.clases;

import java.util.HashSet;
import java.util.Set;

public class MetodoPago {
    private int idMetodoPago;
    private String nombre;


    //Conexiones
    private Set<Pago> pago = new HashSet<>();

    public int getIdMetodoPago() {
        return idMetodoPago;
    }

    public void setIdMetodoPago(int idMetodoPago) {
        this.idMetodoPago = idMetodoPago;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Set<Pago> getPago() {
        return pago;
    }

    public void setPago(Set<Pago> pago) {
        this.pago = pago;
    }
}
