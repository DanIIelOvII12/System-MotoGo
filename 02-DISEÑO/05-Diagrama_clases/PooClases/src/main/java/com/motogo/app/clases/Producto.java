package com.motogo.app.clases;

import java.util.HashSet;
import java.util.Set;

public class Producto {
    private int idProducto;
    private String nombre;
    private String referencia;
    private String marca;
    private String descripcion;


    //conexiones
    private Set<TiendaProducto> tiendaProducto = new HashSet<>();
    private Set<CompatibilidadProducto> compatibilidadProducto = new HashSet<>();
    private CategoriaProducto categoriaProducto;

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Set<TiendaProducto> getTiendaProducto() {
        return tiendaProducto;
    }

    public void setTiendaProducto(Set<TiendaProducto> tiendaProducto) {
        this.tiendaProducto = tiendaProducto;
    }

    public Set<CompatibilidadProducto> getCompatibilidadProducto() {
        return compatibilidadProducto;
    }

    public void setCompatibilidadProducto(Set<CompatibilidadProducto> compatibilidadProducto) {
        this.compatibilidadProducto = compatibilidadProducto;
    }

    public CategoriaProducto getCategoriaProducto() {
        return categoriaProducto;
    }

    public void setCategoriaProducto(CategoriaProducto categoriaProducto) {
        this.categoriaProducto = categoriaProducto;
    }
}
