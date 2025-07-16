/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import dao.ColaboradorDAO;
import Modelo.Colaborador;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;


public class ColaboradorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        ColaboradorDAO dao = new ColaboradorDAO();
        List<Colaborador> listaColaboradores = dao.getAll();

        request.setAttribute("colaboradores", listaColaboradores);
        RequestDispatcher dispatcher = request.getRequestDispatcher("colaboradores.jsp");
        dispatcher.forward(request, response);
    }
}