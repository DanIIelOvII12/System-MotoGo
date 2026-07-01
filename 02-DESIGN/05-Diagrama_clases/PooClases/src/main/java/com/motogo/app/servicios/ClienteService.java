package com.motogo.app.servicios;

import com.motogo.app.clases.Cliente;
import com.motogo.app.clases.Direccion;
import com.motogo.app.clases.Pedido;

import java.util.Set;

public class ClienteService {

    public void registrarCliente(){}
    public void actualizarDatosPersonales(){}
    public void cambiarEstadoActivo(int idCliente, boolean activo){}

    public Cliente consultarPorId(int idCliente){
        return null;
    }

    public Cliente consultarPorNumeroDocumento(String numeroDocumento) {
        return null;
    }

    public Set<Direccion> consultarDireccionesCliente(int idCliente){
        return null;
    }

    public Set<Pedido> consultarHistorialPedidos(int idCliente){
        return null;
    }

}
