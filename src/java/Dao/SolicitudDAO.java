package dao;

import Modelo.Solicitud;
import java.util.*;

public class SolicitudDAO {

    private static List<Solicitud> solicitudes = new ArrayList<>();
    private static int secuencia = 1;

    public List<Solicitud> getSolicitudesPorEstado(String estado) {
        List<Solicitud> result = new ArrayList<>();
        for (Solicitud s : solicitudes) {
            if (s.getEstado().equalsIgnoreCase(estado)) {
                result.add(s);
            }
        }
        return result;
    }

    public List<Solicitud> getAll() {
        return solicitudes;
    }

    public void agregar(Solicitud s) {
        s.setIdSolicitud(secuencia++);
        solicitudes.add(s);
    }

    public void actualizar(Solicitud s) {
        for (Solicitud solicitud : solicitudes) {
            if (solicitud.getIdSolicitud() == s.getIdSolicitud()) {
                solicitud.setEstado(s.getEstado());
                break;
            }
        }
    }

    public void eliminar(int id) {
        solicitudes.removeIf(s -> s.getIdSolicitud() == id);
    }
}