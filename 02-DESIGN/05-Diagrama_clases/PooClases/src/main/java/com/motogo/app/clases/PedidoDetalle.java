package com.motogo.app.clases;

public class PedidoDetalle {
    private int idPedidoDetalle;
    private int cantidad;
    private double precioUnitario;
    private double totalParcial;

    //conexiones
    private TiendaProducto tiendaProducto;
    private Pedido pedido;


    public int getIdPedidoDetalle() {
        return idPedidoDetalle;
    }

    public void setIdPedidoDetalle(int idPedidoDetalle) {
        this.idPedidoDetalle = idPedidoDetalle;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(double precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public double getTotalParcial() {
        return totalParcial;
    }

    public void setTotalParcial(double totalParcial) {
        this.totalParcial = totalParcial;
    }

    public TiendaProducto getTiendaProducto() {
        return tiendaProducto;
    }

    public void setTiendaProducto(TiendaProducto tiendaProducto) {
        this.tiendaProducto = tiendaProducto;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }
}
