package Modelo;

import java.sql.Timestamp;

/**
 * Representa un cargo dentro del sistema, incluyendo su estado y metadatos
 * básicos de auditoría.
 */
public class ClsCargo {

    private int idCargo;
    private String nombre;
    private boolean estado;
    private Timestamp fechaCreacion;
    private Timestamp fechaActualizacion;

    public ClsCargo() {
        this.estado = true;
    }

    public ClsCargo(int idCargo, String nombre, boolean estado, Timestamp fechaCreacion, Timestamp fechaActualizacion) {
        this.idCargo = idCargo;
        this.nombre = nombre;
        this.estado = estado;
        this.fechaCreacion = fechaCreacion;
        this.fechaActualizacion = fechaActualizacion;
    }

    public int getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(int idCargo) {
        this.idCargo = idCargo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public Timestamp getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Timestamp fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public Timestamp getFechaActualizacion() {
        return fechaActualizacion;
    }

    public void setFechaActualizacion(Timestamp fechaActualizacion) {
        this.fechaActualizacion = fechaActualizacion;
    }
}
