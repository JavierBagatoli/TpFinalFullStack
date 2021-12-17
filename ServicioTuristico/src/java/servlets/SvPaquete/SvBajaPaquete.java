package servlets.SvPaquete;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Paquete;

@WebServlet(name = "SvBajaPaquete", urlPatterns = {"/SvBajaPaquete"})
public class SvBajaPaquete extends HttpServlet {
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
            Paquete paquete = control.buscarPaquete(Integer.parseInt(request.getParameter("id")));
            
            paquete.setEstado_paquete(false);
            
        try {
            control.bajaPaquete(paquete);
        } catch (Exception ex) {
            Logger.getLogger(SvBajaPaquete.class.getName()).log(Level.SEVERE, null, ex);
        }
            response.sendRedirect("PaquetesServicios/verPaquetes.jsp");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
