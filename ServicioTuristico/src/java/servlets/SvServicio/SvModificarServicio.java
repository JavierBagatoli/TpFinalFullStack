package servlets.SvServicio;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Servicio;

@WebServlet(name = "SvModificarServicio", urlPatterns = {"/SvModificarServicio"})
public class SvModificarServicio extends HttpServlet {

    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String tipo = request.getParameter("tipo_servicio");
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String destino = request.getParameter("destino");
        int coste = Integer.parseInt(request.getParameter("coste"));
        
        Servicio servicio = control.buscarServicio(id);
        servicio.setTipo_servicio(tipo);
        servicio.setNombre(nombre);
        servicio.setDescripcion_breve(descripcion);
        servicio.setDestino_servicio(destino);
        servicio.setCosto_servicio(coste);
        
        try {
            control.modificarServicio(servicio);
        } catch (Exception ex) {
            Logger.getLogger(SvModificarServicio.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("Servicios/verServicios.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
