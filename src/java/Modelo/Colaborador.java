/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author huama
 */
@Entity
@Table(name = "Colaborador")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Colaborador implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "nIdColaborador")
    private int idColaborador;

    @Column(name = "sNombre", nullable = false, length = 50)
    private String nombre;

    @Column(name = "sApellido", nullable = false, length = 50)
    private String apellido;

    @Column(name = "sEmail", nullable = false, unique = true, length = 100)
    private String email;

    @Column(name = "sContrasena", nullable = false, length = 100)
    private String contrasena;

    @ManyToOne
    @JoinColumn(name = "nIdRolColaborador", nullable = false)
    private RolColaborador rol;

    @Column(name = "bEstado")
    private boolean estado;

    @OneToMany(mappedBy = "colaborador")
    private List<AsignacionSolicitud> asignaciones;

    @OneToMany(mappedBy = "colaborador")
    private List<RegistroActividad> registrosTrabajo;
}
