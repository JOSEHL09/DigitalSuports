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
import jakarta.persistence.Table;
import java.io.Serializable;
import java.util.Date;
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
@Table(name = "RegistroActividad")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RegistroActividad implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "nIdRegistroTrabajo")
    private int idRegistroTrabajo;

    @ManyToOne
    @JoinColumn(name = "nIdSolicitud", nullable = false)
    private Solicitud solicitud;

    @ManyToOne
    @JoinColumn(name = "nIdColaborador", nullable = false)
    private Colaborador colaborador;

    @Column(name = "sDescripcion", nullable = false, length = 150)
    private String descripcion;

    @Column(name = "dFechaRegistro", nullable = false)
    private Date fechaRegistro;

    @Column(name = "nHorasTrabajadas", nullable = false, precision = 4, scale = 2)
    private Double horasTrabajadas;

    @Column(name = "sObservacion", nullable = false, columnDefinition = "VARCHAR(MAX)")
    private String observacion;

    @Column(name = "bEstado")
    private boolean estado;
}
