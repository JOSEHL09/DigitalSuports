/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import jakarta.persistence.Column;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.util.Date;
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
@Table(name = "Cliente")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Cliente implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "nIdCliente")
    private int idCliente;

    @Column(name = "sNombre", nullable = false, length = 100)
    private String nombre;

    @Column(name = "sApellido", length = 100)
    private String apellido;

    @Column(name = "nEdad")
    private Integer edad;

    @Column(name = "dFechaNacimiento")
    private Date fechaNacimiento;

    @Column(name = "sEmail", nullable = false, length = 100, unique = true)
    private String email;

    @Column(name = "sContrasena", nullable = false, length = 100)
    private String contrasena;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "nIdTipoCliente", nullable = false)
    private TipoCliente tipoCliente;

    @Column(name = "bEstado")
    private boolean estado;

    @OneToMany(mappedBy = "cliente")
    private List<UsuarioCliente> usuarios;

    @OneToMany(mappedBy = "cliente")
    private List<Aplicativo> aplicativos;
}
