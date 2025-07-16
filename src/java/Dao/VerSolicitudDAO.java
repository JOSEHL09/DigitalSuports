/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Modelo.Solicitud;
import Util.conexionBD;
import java.sql.*;

public class VerSolicitudDAO {

    public Solicitud getById(int idSolicitud) {
        Solicitud sol = null;
        String sql = "SELECT * FROM Solicitudes WHERE idSolicitud = ?";

        try (Connection con = conexionBD.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, idSolicitud);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                sol = new Solicitud();
                sol.setIdSolicitud(rs.getInt("idSolicitud"));
                sol.setEstado(rs.getString("estado"));
                // Otros campos
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sol;
    }
}