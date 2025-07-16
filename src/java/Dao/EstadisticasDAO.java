/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Util.conexionBD;
import java.sql.*;
import java.util.*;

public class EstadisticasDAO {

    public Map<String, Object> getResumen() {
        Map<String, Object> resumen = new HashMap<>();
        // Ejemplo: total solicitudes, solicitudes finalizadas, pendientes, etc.
        String sqlTotal = "SELECT COUNT(*) AS total FROM Solicitudes";
        String sqlFinalizadas = "SELECT COUNT(*) AS finalizadas FROM Solicitudes WHERE estado='Finalizado'";
        String sqlPendientes = "SELECT COUNT(*) AS pendientes FROM Solicitudes WHERE estado='Pendiente'";

        try (Connection con = conexionBD.getConnection();
             Statement stmt = con.createStatement()) {

            ResultSet rs = stmt.executeQuery(sqlTotal);
            if (rs.next()) resumen.put("total", rs.getInt("total"));

            rs = stmt.executeQuery(sqlFinalizadas);
            if (rs.next()) resumen.put("finalizadas", rs.getInt("finalizadas"));

            rs = stmt.executeQuery(sqlPendientes);
            if (rs.next()) resumen.put("pendientes", rs.getInt("pendientes"));

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resumen;
    }
}