package com.motogo.app.clases;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

public class Usuario {

    private int id;
    private int login;
    private String correo;
    private String contrasenia;
    private LocalDateTime fechaRegistro;
    private int tokenRecuperacionContrasenia;
    private int tokenActiva;

    //Conexiones
    private Set<RolUsuario> rolUsuarios = new HashSet<>();
    private Cliente cliente;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLogin() {
        return login;
    }

    public void setLogin(int login) {
        this.login = login;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public LocalDateTime getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(LocalDateTime fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public int getTokenRecuperacionContrasenia() {
        return tokenRecuperacionContrasenia;
    }

    public void setTokenRecuperacionContrasenia(int tokenRecuperacionContrasenia) {
        this.tokenRecuperacionContrasenia = tokenRecuperacionContrasenia;
    }

    public int getTokenActiva() {
        return tokenActiva;
    }

    public void setTokenActiva(int tokenActiva) {
        this.tokenActiva = tokenActiva;
    }

    public Set<RolUsuario> getRolUsuarios() {
        return rolUsuarios;
    }

    public void setRolUsuarios(Set<RolUsuario> rolUsuarios) {
        this.rolUsuarios = rolUsuarios;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
}
