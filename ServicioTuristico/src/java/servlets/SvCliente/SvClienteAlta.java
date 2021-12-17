package servlets.SvCliente;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

/**
 *
 * @author JavW11trial
 */
@WebServlet(name = "SvClienteAlta", urlPatterns = {"/SvClienteAlta"})
public class SvClienteAlta extends HttpServlet {
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
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String direccion = request.getParameter("direccion");
                String dni = request.getParameter("dni");
                String nacionalidad = request.getParameter("nacionalidad");
                String celular = request.getParameter("celular");
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                control.crearCliente(nombre, apellido, direccion, dni, nacionalidad, celular, email, password);
                response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}