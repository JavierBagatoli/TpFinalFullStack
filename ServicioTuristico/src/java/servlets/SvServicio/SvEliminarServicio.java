
package servlets.SvServicio;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Servicio;


@WebServlet(name = "SvEliminarServicio", urlPatterns = {"/SvEliminarServicio"})
public class SvEliminarServicio extends HttpServlet {

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
        Servicio servicio = control.buscarServicio(Integer.parseInt(request.getParameter("id")));
        //HttpSession misession = request.getSession();
        //misession.setAttribute("servicio", servicio);
        
       // String nombre = servicio.getNombre();
        //String descripcion = servicio.getDescripcion_breve();
        //String destino = servicio.getDestino_servicio();
        //int coste = servicio.getCosto_servicio();
        
        //servicio.setNombre(nombre);
        //servicio.setDescripcion_breve(descripcion);
        //servicio.setDestino_servicio(destino);
        //servicio.setCosto_servicio(coste);
        servicio.setEstado(false);
        
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
