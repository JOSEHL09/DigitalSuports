package Modelo;

import jakarta.persistence.Column;
import jakarta.persistence.FetchType;
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

@Entity
@Table(name = "UsuarioCliente")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UsuarioCliente implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "nIdUsuarioCliente")
    private int idUsuarioCliente;

    @Column(name = "sNombre", nullable = false, length = 100)
    private String nombre;

    @Column(name = "sApellido", nullable = false, length = 100)
    private String apellido;

    @Column(name = "sEmail", nullable = false, length = 100)
    private String email;

    @Column(name = "sContrasena", nullable = false, length = 100)
    private String contrasena;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "nIdCliente", nullable = false)
    private Cliente cliente;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "nIdRol", nullable = false)
    private Rol rol;

    @Column(name = "bEstado")
    private boolean estado;
}
