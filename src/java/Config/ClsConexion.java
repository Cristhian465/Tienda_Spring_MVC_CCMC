package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Gestiona la creación de conexiones JDBC hacia la base de datos MySQL que
 * utiliza la aplicación.
 */
public class ClsConexion {

    private static final String DEFAULT_URL = "jdbc:mysql://localhost:3306/hypecore_db?useSSL=false&serverTimezone=UTC";
    private static final String DEFAULT_USER = "root";
    private static final String DEFAULT_PASSWORD = "";
    private static final String DRIVER_CLASS = "com.mysql.cj.jdbc.Driver";

    private final String jdbcUrl;
    private final String jdbcUser;
    private final String jdbcPassword;

    static {
        try {
            Class.forName(DRIVER_CLASS);
        } catch (ClassNotFoundException ex) {
            throw new IllegalStateException("No se pudo cargar el driver JDBC de MySQL", ex);
        }
    }

    public ClsConexion() {
        this.jdbcUrl = System.getProperty("JDBC_URL", System.getenv().getOrDefault("JDBC_URL", DEFAULT_URL));
        this.jdbcUser = System.getProperty("JDBC_USER", System.getenv().getOrDefault("JDBC_USER", DEFAULT_USER));
        this.jdbcPassword = System.getProperty("JDBC_PASSWORD", System.getenv().getOrDefault("JDBC_PASSWORD", DEFAULT_PASSWORD));
    }

    public Connection obtenerConexion() throws SQLException {
        return DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);
    }
}
