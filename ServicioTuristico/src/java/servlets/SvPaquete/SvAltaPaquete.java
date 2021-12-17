package servlets.SvPaquete;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Servicio;

@WebServlet(name = "SvAltaPaquete", urlPatterns = {"/SvAltaPaquete"})
public class SvAltaPaquete extends HttpServlet {
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
            String codigo_paquete = request.getParameter("nombre_paquete");
            String servicio1 = request.getParameter("servicio1");
            String servicio2 = request.getParameter("servicio2");
            String servicio3 = request.getParameter("servicio3");
            String servicio4 = request.getParameter("servicio4");
            String servicio5 = request.getParameter("servicio5");
            String servicio6 = request.getParameter("servicio6");
            String servicio7 = request.getParameter("servicio7");
            String servicio8 = request.getParameter("servicio8");

            
            control.crearPaquete(codigo_paquete,servicio1,servicio2,servicio3,servicio4,servicio5,servicio6,servicio7,servicio8);
            response.sendRedirect("index.jsp");
    
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
