package com.motogo.app.clases;

import java.util.HashSet;
import java.util.Set;

public class Rol {

    private int id;
    private String nombreRol;

    private Set<RolUsuario> rolUsuarios = new HashSet<>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreRol() {
        return nombreRol;
    }

    public void setNombreRol(String nombreRol) {
        this.nombreRol = nombreRol;
    }

    public Set<RolUsuario> getRolUsuarios() {
        return rolUsuarios;
    }

    public void setRolUsuarios(Set<RolUsuario> rolUsuarios) {
        this.rolUsuarios = rolUsuarios;
    }
}
