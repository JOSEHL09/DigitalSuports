package Controlador;

import com.google.gson.Gson;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.*;

@WebServlet("/api/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException {

        // Simular datos para dashboard
        Map<String, Object> data = new HashMap<>();

        data.put("porEstado", Map.of(
            "Pendiente", 12,
            "En Proceso", 8,
            "Finalizado", 30,
            "Cancelado", 4
        ));

        data.put("porCategoria", Map.of(
            "Hardware", 15,
            "Software", 20,
            "Redes", 10,
            "Soporte Técnico", 9
        ));

        data.put("porMes", Map.of(
            "Enero", 5,
            "Febrero", 7,
            "Marzo", 10,
            "Abril", 8,
            "Mayo", 12,
            "Junio", 9
        ));

        data.put("porColaborador", Map.of(
            "Ana Torres", 14,
            "Carlos Ríos", 18,
            "Lucía Pérez", 10
        ));

        data.put("porcentajeCumplimiento", 75.6); // %

        data.put("tiempoPromedioAtencionHoras", 4.3); // horas

        // Configurar response
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Convertir a JSON
        String json = new Gson().toJson(data);
        response.getWriter().write(json);
    }
}