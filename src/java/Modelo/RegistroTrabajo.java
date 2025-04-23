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
public class RegistroTrabajo {
    private int idRegistroTrabajo;
    private DetalleSolicitud detalleSolicitud;
    private Colaborador colaborador;
    private Date fecha;
    private String actividad;
    private double horasTrabajadas;
    private boolean estado;

    public RegistroTrabajo(DetalleSolicitud solicitud, Colaborador colaborador, String actividad, double horas) {
        this.detalleSolicitud = solicitud;
        this.colaborador = colaborador;
        this.fecha = new Date();
        this.actividad = actividad;
        this.horasTrabajadas = horas;
        this.estado = true;
    }
    // Getters y Setters...
}

