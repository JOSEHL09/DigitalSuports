/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
@Table(name = "RolColaborador")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RolColaborador implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "nIdRolColaborador")
    private int idRolColaborador;

    @Column(name = "sDescripcion", length = 50, nullable = false)
    private String descripcion;

    @Column(name = "bEstado")
    private boolean estado;

    @OneToMany(mappedBy = "rol")
    private List<Colaborador> colaboradores;
}
