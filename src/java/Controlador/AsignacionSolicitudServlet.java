package Controlador;

import Modelo.AsignacionSolicitud;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.time.LocalDate;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;

@WebServlet("/api/asignaciones")
public class AsignacionSolicitudServlet extends HttpServlet {

    private static final List<AsignacionSolicitud> asignaciones = new ArrayList<>();
    private static final AtomicInteger idGenerator = new AtomicInteger(1);
    private final Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        String idParam = request.getParameter("id");

        if (idParam != null) {
            int id = Integer.parseInt(idParam);
            AsignacionSolicitud found = asignaciones.stream()
                    .findFirst()
                    .orElse(null);
            if (found != null) {
                out.print(gson.toJson(found));
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                out.print("{\"error\":\"No encontrado\"}");
            }
        } else {
            out.print(gson.toJson(asignaciones));
        }
        out.flush();
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BufferedReader reader = request.getReader();
        AsignacionSolicitud actualizada = gson.fromJson(reader, AsignacionSolicitud.class);

        Optional<AsignacionSolicitud> existente = asignaciones.stream()
                .findFirst();

        response.setContentType("application/json");
        if (existente.isPresent()) {
            asignaciones.remove(existente.get());
            asignaciones.add(actualizada);
            response.getWriter().print("{\"message\":\"Asignación actualizada\"}");
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            response.getWriter().print("{\"error\":\"No se encontró la asignación\"}");
        }
    }
}