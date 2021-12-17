package servlets.SvCliente;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import persistencia.exceptions.NonexistentEntityException;

@WebServlet(name = "SvClienteBaja", urlPatterns = {"/SvClienteBaja"})
public class SvClienteBaja extends HttpServlet {
    Controladora control = new Controladora();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            control.eliminarCliente(Integer.parseInt(request.getParameter("id")));
        } catch (logica.exceptions.NonexistentEntityException ex) {
            Logger.getLogger(SvClienteBaja.class.getName()).log(Level.SEVERE, null, ex);
        }
            response.sendRedirect("Clientes/verClientes.jsp");
            request.getSession().setAttribute("ListaPersonas", control.traerEmpleado());
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
