package servlets.SvServicio;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name = "SvServicioAlta", urlPatterns = {"/SvServicioAlta"})
public class SvServicioAlta extends HttpServlet {

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
                String tipo = request.getParameter("tipo_servicio");
                String nombre = request.getParameter("nombreServicio");
                String descripcion = request.getParameter("breveDescripcion");
                String destino = request.getParameter("destinoServicio");
                int coste = Integer.parseInt(request.getParameter("coste"));
                
                control.crearServicio(tipo, nombre, descripcion, destino, coste);
                response.sendRedirect("index.jsp");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
