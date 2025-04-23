/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.Date;

/**
 *
 * @author huama
 */
public class DetalleSolicitud {
    private int idDetalleSolicitud;
    private Usuario usuario;
    private TipoSolicitud tipoSolicitud;
    private String motivo;
    private Date fechaCreacion;
    private Date fechaFinalizacion;
    private String estadoSolicitud;
    private boolean estado;

    public DetalleSolicitud(Usuario usuario, TipoSolicitud tipoSolicitud, String motivo) {
        this.usuario = usuario;
        this.tipoSolicitud = tipoSolicitud;
        this.motivo = motivo;
        this.fechaCreacion = new Date();
        this.estadoSolicitud = "Registrado";
        this.estado = true;
    }

    public void finalizarSolicitud() {
        this.fechaFinalizacion = new Date();
        this.estadoSolicitud = "Finalizada";
    }
    // Getters y Setters...
}
