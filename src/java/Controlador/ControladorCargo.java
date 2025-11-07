package Controlador;

import Modelo.ClsCargo;
import ModeloDAO.ClsCargoDAO;
import java.sql.SQLException;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Controlador Spring MVC encargado de exponer las operaciones CRUD del módulo
 * de cargos.
 */
@Controller
public class ControladorCargo {

    private final ClsCargoDAO cargoDAO = new ClsCargoDAO();

    @RequestMapping(value = "cargo.htm", method = RequestMethod.GET)
    public ModelAndView listar(@RequestParam(value = "success", required = false) String success,
            @RequestParam(value = "error", required = false) String error) {
        ModelAndView mv = new ModelAndView("cargo/cargo-list");
        try {
            List<ClsCargo> cargos = cargoDAO.listar();
            mv.addObject("cargos", cargos);
        } catch (SQLException ex) {
            mv.addObject("error", "No se pudo recuperar la lista de cargos: " + ex.getMessage());
        }
        if (success != null) {
            mv.addObject("success", obtenerMensajeExito(success));
        }
        if (error != null && !error.isEmpty()) {
            mv.addObject("error", error);
        }
        return mv;
    }

    @RequestMapping(value = "cargo-crear.htm", method = RequestMethod.GET)
    public ModelAndView mostrarFormularioCreacion() {
        ModelAndView mv = new ModelAndView("cargo/cargo-form");
        mv.addObject("titulo", "Registrar Cargo");
        mv.addObject("actionUrl", "cargo-crear.htm");
        mv.addObject("cargo", new ClsCargo());
        return mv;
    }

    @RequestMapping(value = "cargo-crear.htm", method = RequestMethod.POST)
    public ModelAndView crear(@ModelAttribute("cargo") ClsCargo cargo) {
        try {
            cargo.setNombre(cargo.getNombre() != null ? cargo.getNombre().trim() : "");
            if (cargo.getNombre().isEmpty()) {
                ModelAndView mv = new ModelAndView("cargo/cargo-form");
                mv.addObject("titulo", "Registrar Cargo");
                mv.addObject("actionUrl", "cargo-crear.htm");
                mv.addObject("cargo", cargo);
                mv.addObject("error", "El nombre del cargo es obligatorio.");
                return mv;
            }
            if (!cargoDAO.crear(cargo)) {
                ModelAndView mv = new ModelAndView("cargo/cargo-form");
                mv.addObject("titulo", "Registrar Cargo");
                mv.addObject("actionUrl", "cargo-crear.htm");
                mv.addObject("cargo", cargo);
                mv.addObject("error", "No se pudo registrar el cargo.");
                return mv;
            }
            return new ModelAndView("redirect:cargo.htm?success=creado");
        } catch (SQLException ex) {
            ModelAndView mv = new ModelAndView("cargo/cargo-form");
            mv.addObject("titulo", "Registrar Cargo");
            mv.addObject("actionUrl", "cargo-crear.htm");
            mv.addObject("cargo", cargo);
            mv.addObject("error", "No se pudo registrar el cargo: " + ex.getMessage());
            return mv;
        }
    }

    @RequestMapping(value = "cargo-editar.htm", method = RequestMethod.GET)
    public ModelAndView mostrarFormularioEdicion(@RequestParam("id") int id) {
        ModelAndView mv = new ModelAndView("cargo/cargo-form");
        try {
            ClsCargo cargo = cargoDAO.obtenerPorId(id);
            if (cargo == null) {
                return new ModelAndView("redirect:cargo.htm?error=El%20cargo%20solicitado%20no%20existe");
            }
            mv.addObject("cargo", cargo);
        } catch (SQLException ex) {
            return new ModelAndView("redirect:cargo.htm?error=" + formatearMensaje(ex.getMessage()));
        }
        mv.addObject("titulo", "Editar Cargo");
        mv.addObject("actionUrl", "cargo-editar.htm");
        return mv;
    }

    @RequestMapping(value = "cargo-editar.htm", method = RequestMethod.POST)
    public ModelAndView editar(@ModelAttribute("cargo") ClsCargo cargo) {
        try {
            cargo.setNombre(cargo.getNombre() != null ? cargo.getNombre().trim() : "");
            if (cargo.getNombre().isEmpty()) {
                ModelAndView mv = new ModelAndView("cargo/cargo-form");
                mv.addObject("titulo", "Editar Cargo");
                mv.addObject("actionUrl", "cargo-editar.htm");
                mv.addObject("cargo", cargo);
                mv.addObject("error", "El nombre del cargo es obligatorio.");
                return mv;
            }
            if (!cargoDAO.actualizar(cargo)) {
                return new ModelAndView("redirect:cargo.htm?error=No%20se%20encontr%C3%B3%20el%20cargo%20a%20actualizar");
            }
            return new ModelAndView("redirect:cargo.htm?success=actualizado");
        } catch (SQLException ex) {
            ModelAndView mv = new ModelAndView("cargo/cargo-form");
            mv.addObject("titulo", "Editar Cargo");
            mv.addObject("actionUrl", "cargo-editar.htm");
            mv.addObject("cargo", cargo);
            mv.addObject("error", "No se pudo actualizar el cargo: " + ex.getMessage());
            return mv;
        }
    }

    @RequestMapping(value = "cargo-eliminar.htm", method = RequestMethod.GET)
    public ModelAndView eliminar(@RequestParam("id") int id) {
        try {
            if (!cargoDAO.eliminar(id)) {
                return new ModelAndView("redirect:cargo.htm?error=No%20se%20pudo%20eliminar%20el%20cargo");
            }
            return new ModelAndView("redirect:cargo.htm?success=eliminado");
        } catch (SQLException ex) {
            return new ModelAndView("redirect:cargo.htm?error=" + formatearMensaje(ex.getMessage())) ;
        }
    }

    private String obtenerMensajeExito(String codigo) {
        switch (codigo) {
            case "creado":
                return "Cargo registrado correctamente.";
            case "actualizado":
                return "Cargo actualizado correctamente.";
            case "eliminado":
                return "Cargo eliminado correctamente.";
            default:
                return "Operación realizada con éxito.";
        }
    }

    private String formatearMensaje(String mensaje) {
        return mensaje == null ? "" : mensaje.replace(" ", "%20");
    }
}
