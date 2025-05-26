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
import java.util.Date;
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
@Table(name = "Solicitud")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Solicitud implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "nIdSolicitud")
    private int idSolicitud;

    @ManyToOne
    @JoinColumn(name = "nIdUsuarioCliente", nullable = false)
    private UsuarioCliente usuarioCliente;

    @ManyToOne
    @JoinColumn(name = "nIdAplicativo", nullable = false)
    private Aplicativo aplicativo;

    @ManyToOne
    @JoinColumn(name = "nIdTipoSolicitud", nullable = false)
    private TipoSolicitud tipoSolicitud;

    @Column(name = "sMotivo", nullable = false, columnDefinition = "VARCHAR(MAX)")
    private String motivo;

    @Column(name = "dFechaCreacion", nullable = false)
    private Date fechaCreacion;

    @Column(name = "dFechaFinalizacion")
    private Date fechaFinalizacion;

    @Column(name = "sEstado", length = 20)
    private String estado;

    @Column(name = "bEstado")
    private boolean activo;

    @OneToMany(mappedBy = "solicitud")
    private List<AsignacionSolicitud> asignaciones;

    @OneToMany(mappedBy = "solicitud")
    private List<Notificacion> notificaciones;

    @OneToMany(mappedBy = "solicitud")
    private List<RegistroActividad> registrosTrabajo;
}
