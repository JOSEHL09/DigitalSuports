/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author huama
 */
public class RolColaborador {
    
    private int idRolColaborador;
    private String descripcion;
    private boolean estado;

    public RolColaborador(int id, String descripcion) {
        this.idRolColaborador = id;
        this.descripcion = descripcion;
        this.estado = true;
    }
    // Getters y Setters...
}
