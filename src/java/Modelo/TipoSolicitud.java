/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author huama
 */
public class TipoSolicitud {
    private int idTipoSolicitud;
    private String descripcion;
    private boolean estado;

    public TipoSolicitud(int id, String descripcion) {
        this.idTipoSolicitud = id;
        this.descripcion = descripcion;
        this.estado = true;
    }
    // Getters y Setters...
}
