/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Modelo.Cliente;
import Util.conexionBD;
import java.sql.*;
import java.util.*;

public class ClienteDAO {

    public List<Cliente> getClientesPorTipo(int tipoCliente) {
        List<Cliente> lista = new ArrayList<>();

        String sql = "{call DigitalSuport.pa_SoporteDigital(?)}";

        try (Connection con = conexionBD.getConnection();
             CallableStatement stmt = con.prepareCall(sql)) {

            stmt.setInt(1, tipoCliente);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Cliente cli = new Cliente();
                cli.setIdCliente(rs.getInt("nIdCliente"));
                cli.setNombre(
                    tipoCliente == 1 ? rs.getString("sNombreClienteEmpresa") :
                    rs.getString("sNombreClienteNatural")
                );
                cli.setEmail(rs.getString("sEmail"));
                cli.setContrasena(rs.getString("sContrasena"));
                cli.setEstado(rs.getBoolean("bEstado"));

                lista.add(cli);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }
}