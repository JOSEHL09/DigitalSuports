/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Util.conexionBD;
import java.sql.*;
import java.util.*;

public class DashboardDAO {

    public Map<String, Integer> getEstadisticas() {
        Map<String, Integer> stats = new HashMap<>();
        String sql = "SELECT estado, COUNT(*) as total FROM Solicitudes GROUP BY estado";

        try (Connection con = conexionBD.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                stats.put(rs.getString("estado"), rs.getInt("total"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stats;
    }
}