package Controlador;

import Dao.UsuarioClienteDAO;
import Modelo.UsuarioCliente;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;

/**
 *
 * @author huama
 */
@WebServlet("/api/login")
public class LoginServerlet extends HttpServlet {

    private UsuarioClienteDAO usuarioClienteDAO = new UsuarioClienteDAO();
    private Gson gson = new Gson();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        StringBuilder sb = new StringBuilder();
        BufferedReader reader = req.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        LoginRequest loginRequest = gson.fromJson(sb.toString(), LoginRequest.class);

        resp.setContentType("application/json");

        UsuarioCliente user = usuarioClienteDAO.findByEmail(loginRequest.getEmail());

        if (user == null) {
            resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            resp.getWriter().write("{\"error\":\"Usuario no encontrado\"}");
            return;
        }

        if (!user.getContrasena().equals(loginRequest.getContrasena())) {
            resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            resp.getWriter().write("{\"error\":\"Contraseña incorrecta\"}");
            return;
        }

        HttpSession session = req.getSession(true);
        session.setAttribute("usuario", user);
        session.setAttribute("rolUsuario", user.getRol());

        user.setContrasena(null);

        String jsonResponse = gson.toJson(user);

        resp.setStatus(HttpServletResponse.SC_OK);
        resp.getWriter().write(jsonResponse);
    }

    private static class LoginRequest {
        private String email;
        private String contrasena;

        public String getEmail() { return email; }
        public String getContrasena() { return contrasena; }
    }
}
