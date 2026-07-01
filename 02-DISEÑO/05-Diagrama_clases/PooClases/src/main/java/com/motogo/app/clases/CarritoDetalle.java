package com.motogo.app.clases;
import java.time.LocalDateTime;



public class CarritoDetalle {
    private int idDetalleCarrito;
    private int cantidad;
    private double precioUnitario;
    private double subtotal;
    private LocalDateTime fechaAgregado;


    //conexiones
    private Carrito carrito;
    private TiendaProducto tiendaProducto;

    public int getIdDetalleCarrito() {
        return idDetalleCarrito;
    }

    public void setIdDetalleCarrito(int idDetalleCarrito) {
        this.idDetalleCarrito = idDetalleCarrito;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(double precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public LocalDateTime getFechaAgregado() {
        return fechaAgregado;
    }

    public void setFechaAgregado(LocalDateTime fechaAgregado) {
        this.fechaAgregado = fechaAgregado;
    }

    public Carrito getCarrito() {
        return carrito;
    }

    public void setCarrito(Carrito carrito) {
        this.carrito = carrito;
    }

    public TiendaProducto getTiendaProducto() {
        return tiendaProducto;
    }

    public void setTiendaProducto(TiendaProducto tiendaProducto) {
        this.tiendaProducto = tiendaProducto;
    }
}
