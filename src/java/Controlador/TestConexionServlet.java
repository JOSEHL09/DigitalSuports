package Controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@WebServlet("/testConexion")
public class TestConexionServlet extends HttpServlet {

    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=BD_SOPORTE_DIGITAL;encrypt=false";
    private static final String USUARIO = "sa";
    private static final String CLAVE = "peruRM#9"; // cambia esto si usaste otra contraseña

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                Connection conn = DriverManager.getConnection(URL, USUARIO, CLAVE);
                out.println("<h2 style='color:green;'>✅ Conexión exitosa a la base de datos BD_SOPORTE_DIGITAL</h2>");
                conn.close();
            } catch (ClassNotFoundException e) {
                out.println("<h2 style='color:red;'>❌ No se encontró el driver JDBC: " + e.getMessage() + "</h2>");
            } catch (SQLException e) {
                out.println("<h2 style='color:red;'>❌ No se pudo conectar a la base de datos: " + e.getMessage() + "</h2>");
            }
        }
    }
}

