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
public class Usuario {
    
    private int idUsuario;
    private String nombre;
    private String apellido;
    private String genero;
    private int edad;
    private Date fechaNacimiento;
    private String email;
    private String contrasena;
    private TipoUsuario tipoUsuario;
    private boolean estado;

    public Usuario(int idUsuario, String nombre, String apellido, String email) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.apellido = apellido;
        setEmail(email);
        this.estado = true;
    }

    public void setEmail(String email) {
        if (!email.contains("@")) {
            throw new IllegalArgumentException("Correo no válido");
        }
        this.email = email;
    }

    public String getNombreCompleto() {
        return nombre + " " + apellido;
    }

    @Override
    public String toString() {
        return getNombreCompleto() + " - " + email;
    }
    // Getters y Setters...
}