/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
@Table(name = "TBL_APLICATIVO")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Aplicativo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "nIdAplicativo")
    private int idAplicativo;

    @Column(name = "sNombreAplicativo", nullable = false, length = 50)
    private String nombre;

    @Column(name = "sDescripcion", nullable = false, length = 100)
    private String descripcion;

    @Column(name = "dFechaLanzamiento", nullable = false)
    private Date fechaLanzamiento;

    @Column(name = "dFechaModificacion", nullable = false)
    private Date fechaModificacion;

    @Column(name = "sVersion", nullable = false, length = 50)
    private String version;

    @Column(name = "nIdCliente", nullable = false)
    private int idCliente;

    @Column(name = "bEstado")
    private boolean estado;
}