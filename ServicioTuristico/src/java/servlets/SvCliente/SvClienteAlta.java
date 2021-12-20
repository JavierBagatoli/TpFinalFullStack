package servlets.SvCliente;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.console;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
                Date fechaNacimiento = new Date();
                try {
                    fechaNacimiento = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fechaNacimiento"));
                } catch (ParseException ex) {
                    Logger.getLogger(SvClienteAlta.class.getName()).log(Level.SEVERE, null, ex);
                }

                control.crearCliente(nombre, apellido, direccion, dni, nacionalidad, celular, email, password, fechaNacimiento);
                response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
