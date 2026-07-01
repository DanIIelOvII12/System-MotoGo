package com.motogo.app.clases;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

public class Repartidor {

      private int idRepartidor;
      private String numLicencia;
      private LocalDateTime fechaExpedicionLicencia;
      private LocalDateTime fechaVencimientoLicencia;
      private String licenciaUrl;
      private LocalDateTime fechaSolicitud;
      private LocalDateTime fechaAprobacion;
      private String estado;
      private String activo;
      private String observacion;


      //conexiones
        private Cliente cliente;
        private Set<Vehiculo> vehiculo = new HashSet<>();

      public int getIdRepartidor() {
            return idRepartidor;
      }

      public void setIdRepartidor(int idRepartidor) {
            this.idRepartidor = idRepartidor;
      }

      public String getNumLicencia() {
            return numLicencia;
      }

      public void setNumLicencia(String numLicencia) {
            this.numLicencia = numLicencia;
      }

      public LocalDateTime getFechaExpedicionLicencia() {
            return fechaExpedicionLicencia;
      }

      public void setFechaExpedicionLicencia(LocalDateTime fechaExpedicionLicencia) {
            this.fechaExpedicionLicencia = fechaExpedicionLicencia;
      }

      public LocalDateTime getFechaVencimientoLicencia() {
            return fechaVencimientoLicencia;
      }

      public void setFechaVencimientoLicencia(LocalDateTime fechaVencimientoLicencia) {
            this.fechaVencimientoLicencia = fechaVencimientoLicencia;
      }

      public String getLicenciaUrl() {
            return licenciaUrl;
      }

      public void setLicenciaUrl(String licenciaUrl) {
            this.licenciaUrl = licenciaUrl;
      }

      public LocalDateTime getFechaSolicitud() {
            return fechaSolicitud;
      }

      public void setFechaSolicitud(LocalDateTime fechaSolicitud) {
            this.fechaSolicitud = fechaSolicitud;
      }

      public LocalDateTime getFechaAprobacion() {
            return fechaAprobacion;
      }

      public void setFechaAprobacion(LocalDateTime fechaAprobacion) {
            this.fechaAprobacion = fechaAprobacion;
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

      public String getObservacion() {
            return observacion;
      }

      public void setObservacion(String observacion) {
            this.observacion = observacion;
      }

      public Cliente getCliente() {
            return cliente;
      }

      public void setCliente(Cliente cliente) {
            this.cliente = cliente;
      }

      public Set<Vehiculo> getVehiculo() {
            return vehiculo;
      }

      public void setVehiculo(Set<Vehiculo> vehiculo) {
            this.vehiculo = vehiculo;
      }
}
