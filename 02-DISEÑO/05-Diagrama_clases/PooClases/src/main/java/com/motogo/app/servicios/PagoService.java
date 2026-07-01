package com.motogo.app.servicios;

import com.motogo.app.clases.Pago;

public class PagoService {

    public void registrarIntentoPago(){}
    public void confirmarPagoExitoso(int idPago, String pagoExitoso){}
    public void rechazarPago(int idPago, String motivo){}
    public void procesarReembolso(int idPago){}
    public Pago consultarPorId(int idPago){
        return null;
    }

    public Pago consultarPagoReferencia(String referenciaPago){
        return null;
    }

}
