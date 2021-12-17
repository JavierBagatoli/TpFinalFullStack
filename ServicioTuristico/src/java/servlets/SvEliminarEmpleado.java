/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.exceptions.NonexistentEntityException;

@WebServlet(name = "SvEliminarEmpleado", urlPatterns = {"/SvEliminarEmpleado"})
public class SvEliminarEmpleado extends HttpServlet {
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
            control.eliminarEmpleado(Integer.parseInt(request.getParameter("id")));
            response.sendRedirect("verEmpleados.jsp");
            request.getSession().setAttribute("ListaPersonas", control.traerEmpleado());
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(SvEliminarEmpleado.class.getName()).log(Level.SEVERE, null, ex);
        }
            
            

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
