package com.motogo.app.servicios;

import com.motogo.app.clases.Carrito;
import com.motogo.app.clases.CarritoDetalle;

import java.util.Set;

public class CarritoService {

    public void crearCarritoParaCliente(int idCliente){}
    public void vaciarCarrito(int idCarrito){}
    public void actualizarFechaModificacion(int idCarrito){}
    public Carrito consultarPorId(int idCarrito){
        return null;
    }
    public Carrito consultarPorIdCliente(int idCliente){
        return null;
    }

    public Set<CarritoDetalle> consultarItemsCarrito(int idCarrito){
        return null;
    }

}
