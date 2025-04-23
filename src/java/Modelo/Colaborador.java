/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author huama
 */
public class Colaborador {
    private int idColaborador;
    private String nombre;
    private String apellido;
    private String email;
    private String contrasena;
    private RolColaborador rol;
    private boolean estado;

    public Colaborador(int idColaborador, String nombre, String apellido, String email, RolColaborador rol) {
        this.idColaborador = idColaborador;
        this.nombre = nombre;
        this.apellido = apellido;
        setEmail(email);
        this.rol = rol;
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
