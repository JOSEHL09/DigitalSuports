/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Modelo.Solicitud;
import Util.conexionBD;
import java.sql.*;
import java.util.*;

public class MostrarSolicitudesDAO {

    public List<Solicitud> getSolicitudesPorEstado(String estado) {
        List<Solicitud> lista = new ArrayList<>();
        String sql = "SELECT * FROM Solicitudes WHERE estado = ?";

        try (Connection con = conexionBD.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, estado);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Solicitud sol = new Solicitud();
                sol.setIdSolicitud(rs.getInt("idSolicitud"));
                sol.setEstado(rs.getString("estado"));
                lista.add(sol);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
}