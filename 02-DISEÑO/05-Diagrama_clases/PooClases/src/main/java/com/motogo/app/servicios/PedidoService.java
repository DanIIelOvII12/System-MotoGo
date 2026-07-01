package com.motogo.app.servicios;

import com.motogo.app.clases.Pago;
import com.motogo.app.clases.Pedido;
import com.motogo.app.clases.PedidoDetalle;

import java.util.Set;

public class PedidoService {

    public void crearPedidoDesdeCarrito(int idCliente, int idDireccion){}
    public void cambiarEstadoPedido(int idPedido, String nuevoEstado){}
    public void asignarRepartidorPedido(int idPedido, int idRepartidor){}
    public Pedido consultarPorId(int idPedido){
        return null;
    }

    public Set<PedidoDetalle> consultarItemsPedido(int idPedido){
        return null;
    }

    public Set<Pago> consultarPagosPedido(int idPedido){
        return null;
    }

}
