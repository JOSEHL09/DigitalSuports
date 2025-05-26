/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Util.conexionBD;
import Modelo.Cliente;
import Modelo.Rol;
import Modelo.UsuarioCliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author huama
 */
public class UsuarioClienteDAO {

    private Connection conn;

    public UsuarioClienteDAO() {
        conn = conexionBD.getConnection();
        if (conn == null) {
        throw new RuntimeException("No se pudo establecer conexión con la base de datos");
    }
    }

    public UsuarioCliente findByEmail(String email) {
    UsuarioCliente user = null;
    String sql = """
        SELECT u.*, r.nIdRol, r.sNombreRol
        FROM DigitalSuport.TBL_USUARIO_CLIENTE u
        JOIN DigitalSuport.TBL_ROL r ON u.nIdRol = r.nIdRol
        WHERE u.sEmail = ? AND u.bEstado = 1
    """;

    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, email);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            Rol rol = Rol.builder()
                .idRol(rs.getInt("nIdRol"))
                .nombreRol(rs.getString("sNombreRol"))
                .build();

            Cliente cliente = Cliente.builder()
                .idCliente(rs.getInt("nIdCliente"))
                .build();

            user = UsuarioCliente.builder()
                .idUsuarioCliente(rs.getInt("nIdUsuarioCliente"))
                .nombre(rs.getString("sNombre"))
                .apellido(rs.getString("sApellido"))
                .email(rs.getString("sEmail"))
                .contrasena(rs.getString("sContrasena"))
                .cliente(cliente)
                .rol(rol)
                .estado(rs.getBoolean("bEstado"))
                .build();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return user;
  }
}
