/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import dao.SolicitudDAO;
import Modelo.Solicitud;
import com.google.gson.Gson;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/solicitudes")
public class SolicitudServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        SolicitudDAO dao = new SolicitudDAO();
        List<Solicitud> listaSolicitudes = dao.getAll();

        request.setAttribute("solicitudes", listaSolicitudes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("solicitudes.jsp");
        dispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException {
        response.getWriter().write("{\"mensaje\":\"Creado\"}");
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
        throws IOException {
        response.getWriter().write("{\"mensaje\":\"Actualizado\"}");
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
        throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        response.getWriter().write("{\"mensaje\":\"Eliminado\"}");
    }
}