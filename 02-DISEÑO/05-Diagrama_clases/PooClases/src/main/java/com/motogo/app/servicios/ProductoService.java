package com.motogo.app.servicios;

import com.motogo.app.clases.CompatibilidadProducto;
import com.motogo.app.clases.Producto;
import com.motogo.app.clases.TiendaProducto;

import java.util.Set;

public class ProductoService {

    public void insertarProductoBase(){}
    public void actualizarProductoBase(){}
    public void eliminarProductoBase(int idProducto){}
    public Producto consultarPorId(int idProducto){
        return null;
    }
    public Producto consultarPorReferencia(String referencia){
        return null;
    }

    public Set<TiendaProducto> consultarTiendasProducto(int idProducto){
        return null;
    }

    public Set<CompatibilidadProducto> consultarCompatibilidadesProducto(int idProducto){
        return null;
    }

}
