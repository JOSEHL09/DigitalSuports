/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import dao.MostrarSolicitudesDAO;
import Modelo.Solicitud;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;


public class MostrarSolicitudesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String estado = request.getParameter("estado");
        if (estado == null) estado = "Pendiente";

        MostrarSolicitudesDAO dao = new MostrarSolicitudesDAO();
        List<Solicitud> lista = dao.getSolicitudesPorEstado(estado);

        request.setAttribute("solicitudes", lista);
        RequestDispatcher dispatcher = request.getRequestDispatcher("mostrarSolicitudes.jsp");
        dispatcher.forward(request, response);
    }
}