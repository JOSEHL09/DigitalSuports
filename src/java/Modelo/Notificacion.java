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
@Table(name = "Notificacion")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Notificacion implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "nIdNotificacion")
    private int idNotificacion;

    @ManyToOne
    @JoinColumn(name = "nIdSolicitud", nullable = false)
    private Solicitud solicitud;

    @Column(name = "sDescripcion", length = 100)
    private String descripcion;

    @Column(name = "dFechaEnvio", nullable = false)
    private Date fechaEnvio;

    @Column(name = "bLeido")
    private boolean leido;

    @Column(name = "bEstado")
    private boolean estado;
}
