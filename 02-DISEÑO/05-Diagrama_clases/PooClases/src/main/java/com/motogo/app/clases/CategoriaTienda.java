package com.motogo.app.clases;

import java.util.HashSet;
import java.util.Set;

public class CategoriaTienda {

    private int idCategoriaTienda;
    private String nombre;
    private String descripcion;
    private String activo;


    //Conexiones
    private Set<Tienda> tiendaSet = new HashSet<>();

    public int getIdCategoriaTienda() {
        return idCategoriaTienda;
    }

    public void setIdCategoriaTienda(int idCategoriaTienda) {
        this.idCategoriaTienda = idCategoriaTienda;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getActivo() {
        return activo;
    }

    public void setActivo(String activo) {
        this.activo = activo;
    }

    public Set<Tienda> getTiendaSet() {
        return tiendaSet;
    }

    public void setTiendaSet(Set<Tienda> tiendaSet) {
        this.tiendaSet = tiendaSet;
    }
}
