/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import dao.VerSolicitudDAO;
import Modelo.Solicitud;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;


public class VerSolicitudServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null) {
            response.sendRedirect("solicitudes"); // o mensaje de error
            return;
        }

        int id = Integer.parseInt(idStr);
        VerSolicitudDAO dao = new VerSolicitudDAO();
        Solicitud solicitud = dao.getById(id);

        request.setAttribute("solicitud", solicitud);
        RequestDispatcher dispatcher = request.getRequestDispatcher("verSolicitud.jsp");
        dispatcher.forward(request, response);
    }
}