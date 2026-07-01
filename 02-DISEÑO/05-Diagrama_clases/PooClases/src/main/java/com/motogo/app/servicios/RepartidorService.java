package com.motogo.app.servicios;

import com.motogo.app.clases.Pedido;
import com.motogo.app.clases.Repartidor;
import com.motogo.app.clases.Vehiculo;

import java.util.Set;

public class RepartidorService {

    public void registrarSolicitudRepartidor(){}
    public void actualizarDatosLicencia(){}
    public void aprobarRepartidor(int idRepartidor){}
    public void cambiarEstadoDisponible(int idRepartidor, boolean disponible){}
    public Repartidor consultarPorId(int idRepartidor){
        return null;
    }

    public Set<Vehiculo> consultarVehiculoRepartidor(int idRepartidor){
        return null;
    }

    public Set<Pedido> consultarHistorialEntregas(int idRepartidor){
        return null;
    }

}
