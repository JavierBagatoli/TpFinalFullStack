
package servlets.Venta;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name = "SvModificarVenta", urlPatterns = {"/SvModificarVenta"})
public class SvModificarVenta extends HttpServlet {
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
            String cliente  = request.getParameter("cliente");
            String empleado = request.getParameter("vendedor");
            String paquete  = request.getParameter("paquete");
            String servicio1 = request.getParameter("servicio1");
            String servicio2 = request.getParameter("servicio2");
            String servicio3 = request.getParameter("servicio3");
            
            try {
                control.modificarVenta(id, cliente, empleado, paquete, servicio1, servicio2 ,servicio3);
            } catch (Exception ex) {
                Logger.getLogger(SvModificarVenta.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            response.sendRedirect("Ventas/verVentas.jsp");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
