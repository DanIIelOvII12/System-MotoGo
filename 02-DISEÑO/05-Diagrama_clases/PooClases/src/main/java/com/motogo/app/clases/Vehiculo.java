package com.motogo.app.clases;

import java.time.LocalDateTime;
import java.time.Year;
import java.time.LocalDate;

public class Vehiculo {

    private int idVehiculo;
    private String placa;
    private String marca;
    private String modelo;
    private String color;
    private Year anio;
    private String tarjetaPropiedadUrl;
    private LocalDate soatVencimiento;
    private LocalDate tecnoVencimiento;
    private String activo;
    private LocalDateTime fechaRegistro;


    //conexiones
    private Repartidor repartidor;
    private TipoVehiculo tipoVehiculo;

    public int getIdVehiculo() {
        return idVehiculo;
    }

    public void setIdVehiculo(int idVehiculo) {
        this.idVehiculo = idVehiculo;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Year getAnio() {
        return anio;
    }

    public void setAnio(Year anio) {
        this.anio = anio;
    }

    public String getTarjetaPropiedadUrl() {
        return tarjetaPropiedadUrl;
    }

    public void setTarjetaPropiedadUrl(String tarjetaPropiedadUrl) {
        this.tarjetaPropiedadUrl = tarjetaPropiedadUrl;
    }

    public LocalDate getSoatVencimiento() {
        return soatVencimiento;
    }

    public void setSoatVencimiento(LocalDate soatVencimiento) {
        this.soatVencimiento = soatVencimiento;
    }

    public LocalDate getTecnoVencimiento() {
        return tecnoVencimiento;
    }

    public void setTecnoVencimiento(LocalDate tecnoVencimiento) {
        this.tecnoVencimiento = tecnoVencimiento;
    }

    public String getActivo() {
        return activo;
    }

    public void setActivo(String activo) {
        this.activo = activo;
    }

    public LocalDateTime getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(LocalDateTime fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public Repartidor getRepartidor() {
        return repartidor;
    }

    public void setRepartidor(Repartidor repartidor) {
        this.repartidor = repartidor;
    }

    public TipoVehiculo getTipoVehiculo() {
        return tipoVehiculo;
    }

    public void setTipoVehiculo(TipoVehiculo tipoVehiculo) {
        this.tipoVehiculo = tipoVehiculo;
    }
}
