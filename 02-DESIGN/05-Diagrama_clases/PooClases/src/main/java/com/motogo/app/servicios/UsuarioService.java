package com.motogo.app.servicios;

import com.motogo.app.clases.Usuario;

public class UsuarioService {

    public void crearUsuario(){}
    public void actualizarUsuario(){}
    public void eliminarUsuario(){}
    public Usuario consultarPorId(int id){
        return null;
    }

    public void login(String correo, String contrasena){}
    public void generarTokenRecuperacion(String correo){}
    public void cambiarContrasenia(String token, String nuevaContrasenia){}
    public void cambiarEstadoActivo(int idUsuario, boolean estado){}

}
