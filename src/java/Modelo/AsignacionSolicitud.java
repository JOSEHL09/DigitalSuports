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
@Table(name = "AsignacionSolicitud")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AsignacionSolicitud implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "nIdAsignacionSolicitud")
    private int idAsignacionSolicitud;

    @ManyToOne
    @JoinColumn(name = "nIdSolicitud", nullable = false)
    private Solicitud solicitud;

    @ManyToOne
    @JoinColumn(name = "nIdColaborador", nullable = false)
    private Colaborador colaborador;

    @Column(name = "bEsCoordinador")
    private boolean esCoordinador;

    @Column(name = "bEstado")
    private boolean estado;
}
