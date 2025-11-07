package ModeloDAO;

import Config.ClsConexion;
import Modelo.ClsCargo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Operaciones CRUD para la entidad Cargo utilizando JDBC puro.
 */
public class ClsCargoDAO {

    private static final String SQL_LISTAR = "SELECT id_cargo, nombre, estado, fecha_creacion, fecha_actualizacion FROM cargo ORDER BY id_cargo";
    private static final String SQL_OBTENER = "SELECT id_cargo, nombre, estado, fecha_creacion, fecha_actualizacion FROM cargo WHERE id_cargo = ?";
    private static final String SQL_INSERTAR = "INSERT INTO cargo (nombre, estado) VALUES (?, ?)";
    private static final String SQL_ACTUALIZAR = "UPDATE cargo SET nombre = ?, estado = ? WHERE id_cargo = ?";
    private static final String SQL_ELIMINAR = "DELETE FROM cargo WHERE id_cargo = ?";

    private final ClsConexion conexion;

    public ClsCargoDAO() {
        this.conexion = new ClsConexion();
    }

    public List<ClsCargo> listar() throws SQLException {
        List<ClsCargo> cargos = new ArrayList<>();
        try (Connection cn = conexion.obtenerConexion();
                PreparedStatement ps = cn.prepareStatement(SQL_LISTAR);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                cargos.add(mapearCargo(rs));
            }
        }
        return cargos;
    }

    public ClsCargo obtenerPorId(int id) throws SQLException {
        ClsCargo cargo = null;
        try (Connection cn = conexion.obtenerConexion();
                PreparedStatement ps = cn.prepareStatement(SQL_OBTENER)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    cargo = mapearCargo(rs);
                }
            }
        }
        return cargo;
    }

    public boolean crear(ClsCargo cargo) throws SQLException {
        try (Connection cn = conexion.obtenerConexion();
                PreparedStatement ps = cn.prepareStatement(SQL_INSERTAR)) {
            ps.setString(1, cargo.getNombre());
            ps.setBoolean(2, cargo.isEstado());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean actualizar(ClsCargo cargo) throws SQLException {
        try (Connection cn = conexion.obtenerConexion();
                PreparedStatement ps = cn.prepareStatement(SQL_ACTUALIZAR)) {
            ps.setString(1, cargo.getNombre());
            ps.setBoolean(2, cargo.isEstado());
            ps.setInt(3, cargo.getIdCargo());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean eliminar(int id) throws SQLException {
        try (Connection cn = conexion.obtenerConexion();
                PreparedStatement ps = cn.prepareStatement(SQL_ELIMINAR)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    private ClsCargo mapearCargo(ResultSet rs) throws SQLException {
        ClsCargo cargo = new ClsCargo();
        cargo.setIdCargo(rs.getInt("id_cargo"));
        cargo.setNombre(rs.getString("nombre"));
        cargo.setEstado(rs.getBoolean("estado"));
        cargo.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
        cargo.setFechaActualizacion(rs.getTimestamp("fecha_actualizacion"));
        return cargo;
    }
}
