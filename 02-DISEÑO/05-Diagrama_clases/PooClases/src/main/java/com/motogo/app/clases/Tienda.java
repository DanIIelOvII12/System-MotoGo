package com.motogo.app.clases;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

public class Tienda {

    private int idTienda;
    private String nomTienda;
    private String nit;
    private String descripcion;
    private String logoUrl;
    private String telTienda;
    private String correoTienda;
    private String direccionTienda;
    private String ciudadTienda;
    private String departamentoTienda;
    private LocalDateTime fechaSolicitud;
    private String estado;
    private String activo;

    //Conexiones
    private Cliente cliente;
    private Set<TiendaProducto> tiendaProducto = new HashSet<>();
    private CategoriaTienda categoriaTienda;

    public int getIdTienda() {
        return idTienda;
    }

    public void setIdTienda(int idTienda) {
        this.idTienda = idTienda;
    }

    public String getNomTienda() {
        return nomTienda;
    }

    public void setNomTienda(String nomTienda) {
        this.nomTienda = nomTienda;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public String getTelTienda() {
        return telTienda;
    }

    public void setTelTienda(String telTienda) {
        this.telTienda = telTienda;
    }

    public String getCorreoTienda() {
        return correoTienda;
    }

    public void setCorreoTienda(String correoTienda) {
        this.correoTienda = correoTienda;
    }

    public String getDireccionTienda() {
        return direccionTienda;
    }

    public void setDireccionTienda(String direccionTienda) {
        this.direccionTienda = direccionTienda;
    }

    public String getCiudadTienda() {
        return ciudadTienda;
    }

    public void setCiudadTienda(String ciudadTienda) {
        this.ciudadTienda = ciudadTienda;
    }

    public String getDepartamentoTienda() {
        return departamentoTienda;
    }

    public void setDepartamentoTienda(String departamentoTienda) {
        this.departamentoTienda = departamentoTienda;
    }

    public LocalDateTime getFechaSolicitud() {
        return fechaSolicitud;
    }

    public void setFechaSolicitud(LocalDateTime fechaSolicitud) {
        this.fechaSolicitud = fechaSolicitud;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getActivo() {
        return activo;
    }

    public void setActivo(String activo) {
        this.activo = activo;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Set<TiendaProducto> getTiendaProducto() {
        return tiendaProducto;
    }

    public void setTiendaProducto(Set<TiendaProducto> tiendaProducto) {
        this.tiendaProducto = tiendaProducto;
    }

    public CategoriaTienda getCategoriaTienda() {
        return categoriaTienda;
    }

    public void setCategoriaTienda(CategoriaTienda categoriaTienda) {
        this.categoriaTienda = categoriaTienda;
    }
}
