package com.motogo.app.clases;

import java.util.HashSet;
import java.util.Set;

public class TipoVehiculo {
    private int idTipoVehiculo;
    private String numVehiculo;
    private String activo;

    //conexiones
    private Set<Vehiculo> vehiculo = new HashSet();

    public int getIdTipoVehiculo() {
        return idTipoVehiculo;
    }

    public void setIdTipoVehiculo(int idTipoVehiculo) {
        this.idTipoVehiculo = idTipoVehiculo;
    }

    public String getNumVehiculo() {
        return numVehiculo;
    }

    public void setNumVehiculo(String numVehiculo) {
        this.numVehiculo = numVehiculo;
    }

    public String getActivo() {
        return activo;
    }

    public void setActivo(String activo) {
        this.activo = activo;
    }

    public Set<Vehiculo> getVehiculo() {
        return vehiculo;
    }

    public void setVehiculo(Set<Vehiculo> vehiculo) {
        this.vehiculo = vehiculo;
    }
}
