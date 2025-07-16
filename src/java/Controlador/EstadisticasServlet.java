package Controlador;

import com.google.gson.Gson;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.*;

@WebServlet("/api/estadisticas")
public class EstadisticasServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException {

        // Datos simulados
        Map<String, Object> resumen = new HashMap<>();

        resumen.put("porDiaSemana", Map.of(
            "Lunes", 8,
            "Martes", 10,
            "Miércoles", 12,
            "Jueves", 9,
            "Viernes", 7
        ));

        resumen.put("tiempoPromedioPorCategoria", Map.of(
            "Hardware", 3.5,
            "Software", 2.8,
            "Redes", 4.2
        ));

        resumen.put("porcentajeExitoPorTipo", Map.of(
            "Remoto", 88.5,
            "Presencial", 92.3
        ));

        resumen.put("usuariosActivos", List.of(
            Map.of("usuario", "jose.gomez", "acciones", 25),
            Map.of("usuario", "ana.luna", "acciones", 19),
            Map.of("usuario", "carlos.perez", "acciones", 17)
        ));

        resumen.put("resueltos7dias", 21);

        resumen.put("estadoTickets", Map.of(
            "Abiertos", 11,
            "Cerrados", 45
        ));

        // Configurar respuesta
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String json = new Gson().toJson(resumen);
        response.getWriter().write(json);
    }
}