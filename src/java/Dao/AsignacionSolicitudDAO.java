package dao;

import Modelo.AsignacionSolicitud;
import Util.conexionBD;

import java.sql.*;
import java.util.*;

public class AsignacionSolicitudDAO {

    // Obtener todos
    public List<AsignacionSolicitud> getAll() {
        List<AsignacionSolicitud> lista = new ArrayList<>();
        String sql = "SELECT * FROM AsignacionSolicitudes";

        try (Connection con = conexionBD.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                AsignacionSolicitud asign = new AsignacionSolicitud();
                lista.add(asign);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    // Obtener por ID
    public AsignacionSolicitud getById(int id) {
        String sql = "SELECT * FROM AsignacionSolicitudes WHERE id = ?";
        AsignacionSolicitud asign = null;

        try (Connection con = conexionBD.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                asign = new AsignacionSolicitud();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return asign;
    }

    // Insertar nueva asignación
    public boolean insert(AsignacionSolicitud asign) {
        String sql = "INSERT INTO AsignacionSolicitudes (idSolicitud, idUsuario, fechaAsignacion) VALUES (?, ?, ?)";

        try (Connection con = conexionBD.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Actualizar asignación existente
    public boolean update(AsignacionSolicitud asign) {
        String sql = "UPDATE AsignacionSolicitudes SET idSolicitud = ?, idUsuario = ?, fechaAsignacion = ? WHERE id = ?";

        try (Connection con = conexionBD.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Eliminar por ID
    public boolean delete(int id) {
        String sql = "DELETE FROM AsignacionSolicitudes WHERE id = ?";

        try (Connection con = conexionBD.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}