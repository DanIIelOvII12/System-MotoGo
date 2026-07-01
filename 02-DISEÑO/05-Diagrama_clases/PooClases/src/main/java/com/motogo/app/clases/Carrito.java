package com.motogo.app.clases;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

public class Carrito {

    private int idCarrito;
    private LocalDateTime fechaActualizacion;


    //conexiones
    private Cliente cliente;
    private Set<CarritoDetalle> carritoDetalle = new HashSet<>();

    public int getIdCarrito() {
        return idCarrito;
    }

    public void setIdCarrito(int idCarrito) {
        this.idCarrito = idCarrito;
    }

    public LocalDateTime getFechaActualizacion() {
        return fechaActualizacion;
    }

    public void setFechaActualizacion(LocalDateTime fechaActualizacion) {
        this.fechaActualizacion = fechaActualizacion;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Set<CarritoDetalle> getCarritoDetalle() {
        return carritoDetalle;
    }

    public void setCarritoDetalle(Set<CarritoDetalle> carritoDetalle) {
        this.carritoDetalle = carritoDetalle;
    }
}

