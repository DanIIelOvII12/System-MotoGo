package com.motogo.app.clases;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

public class TiendaProducto {

    private int idTiendaProducto;
    private double precio;
    private int stock;
    private int garantiasDias;
    private String estadoProducto;
    private String activo;
    private LocalDateTime fechaPublicacion;
    private LocalDateTime fechaActualizacion;

//Conexeciones
    private Tienda tienda;
    private Set<CarritoDetalle> carritoDetalle = new HashSet<>();
    private Producto producto;
    private Set<PedidoDetalle> pedidoDetalle = new HashSet<>();


    public int getIdTiendaProducto() {
        return idTiendaProducto;
    }

    public void setIdTiendaProducto(int idTiendaProducto) {
        this.idTiendaProducto = idTiendaProducto;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getGarantiasDias() {
        return garantiasDias;
    }

    public void setGarantiasDias(int garantiasDias) {
        this.garantiasDias = garantiasDias;
    }

    public String getEstadoProducto() {
        return estadoProducto;
    }

    public void setEstadoProducto(String estadoProducto) {
        this.estadoProducto = estadoProducto;
    }

    public String getActivo() {
        return activo;
    }

    public void setActivo(String activo) {
        this.activo = activo;
    }

    public LocalDateTime getFechaPublicacion() {
        return fechaPublicacion;
    }

    public void setFechaPublicacion(LocalDateTime fechaPublicacion) {
        this.fechaPublicacion = fechaPublicacion;
    }

    public LocalDateTime getFechaActualizacion() {
        return fechaActualizacion;
    }

    public void setFechaActualizacion(LocalDateTime fechaActualizacion) {
        this.fechaActualizacion = fechaActualizacion;
    }

    public Tienda getTienda() {
        return tienda;
    }

    public void setTienda(Tienda tienda) {
        this.tienda = tienda;
    }

    public Set<CarritoDetalle> getCarritoDetalle() {
        return carritoDetalle;
    }

    public void setCarritoDetalle(Set<CarritoDetalle> carritoDetalle) {
        this.carritoDetalle = carritoDetalle;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public Set<PedidoDetalle> getPedidoDetalle() {
        return pedidoDetalle;
    }

    public void setPedidoDetalle(Set<PedidoDetalle> pedidoDetalle) {
        this.pedidoDetalle = pedidoDetalle;
    }
}
