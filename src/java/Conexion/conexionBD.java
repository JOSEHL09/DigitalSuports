package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexionBD {
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=BD_SOPORTE_DIGITAL";
    private static final String USUARIO = "sa"; // o el usuario que uses
    private static final String CLAVE = "peruRM#9"; // reemplaza por tu clave

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(URL, USUARIO, CLAVE);
            System.out.println("✅ Conexión exitosa a SQL Server");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("❌ Error al conectar a la BD");
        }
        return conn;
    }
}
