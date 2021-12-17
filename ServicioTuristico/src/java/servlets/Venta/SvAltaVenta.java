package servlets.Venta;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name = "SvAltaVenta", urlPatterns = {"/SvAltaVenta"})
public class SvAltaVenta extends HttpServlet {
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
            String vendedor = request.getParameter("vendedor");
            String cliente = request.getParameter("cliente");
            String paquete = request.getParameter("paquete");
            String servicio1 = request.getParameter("servicio1");
            String servicio2 = request.getParameter("servicio2");
            String servicio3 = request.getParameter("servicio3");
            
            control.crearVenta(vendedor, cliente, paquete, servicio1, servicio2 , servicio3);
            response.sendRedirect("index.jsp");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
