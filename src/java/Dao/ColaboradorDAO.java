/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Modelo.Colaborador;
import Util.conexionBD;
import java.sql.*;
import java.util.*;

public class ColaboradorDAO {

    public List<Colaborador> getAll() {
        List<Colaborador> lista = new ArrayList<>();
        String sql = "SELECT * FROM Colaboradores"; // Ajusta tabla

        try (Connection con = conexionBD.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Colaborador col = new Colaborador();
                col.setIdColaborador(rs.getInt("idColaborador"));
                col.setNombre(rs.getString("nombre"));
                col.setEmail(rs.getString("email"));
                lista.add(col);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
}