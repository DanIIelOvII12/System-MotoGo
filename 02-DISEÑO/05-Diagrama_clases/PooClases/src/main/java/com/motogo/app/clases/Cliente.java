package com.motogo.app.clases;

import java.util.HashSet;
import java.util.Set;

public class Cliente {

    private int idCliente;
    private String numeroDocumento;
    private String nombres;
    private String apellidos;
    private String telefono;
    private String fotoPerfil;
    private String activo;


    //Conexiones
    private Usuario usuario;
    private Set<Tienda> tienda = new HashSet<>();
    private Repartidor repartidor;
    private Carrito carrito;
    private Set<Direccion> direccion = new HashSet<>();
    private Set<Pedido> pedido = new HashSet<>();
    private TipoDocumento tipoDocumento;

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNumeroDocumento() {
        return numeroDocumento;
    }

    public void setNumeroDocumento(String numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getFotoPerfil() {
        return fotoPerfil;
    }

    public void setFotoPerfil(String fotoPerfil) {
        this.fotoPerfil = fotoPerfil;
    }

    public String getActivo() {
        return activo;
    }

    public void setActivo(String activo) {
        this.activo = activo;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Set<Tienda> getTienda() {
        return tienda;
    }

    public void setTienda(Set<Tienda> tienda) {
        this.tienda = tienda;
    }

    public Repartidor getRepartidor() {
        return repartidor;
    }

    public void setRepartidor(Repartidor repartidor) {
        this.repartidor = repartidor;
    }

    public Carrito getCarrito() {
        return carrito;
    }

    public void setCarrito(Carrito carrito) {
        this.carrito = carrito;
    }

    public Set<Direccion> getDireccion() {
        return direccion;
    }

    public void setDireccion(Set<Direccion> direccion) {
        this.direccion = direccion;
    }

    public Set<Pedido> getPedido() {
        return pedido;
    }

    public void setPedido(Set<Pedido> pedido) {
        this.pedido = pedido;
    }

    public TipoDocumento getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(TipoDocumento tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }
}
