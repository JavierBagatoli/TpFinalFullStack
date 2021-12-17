<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@page import="logica.Paquete"%>
<%@page import="logica.Servicio"%>
<%@page import="logica.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Template Name: Chillaid
Author: <a href="https://www.os-templates.com/">OS Templates</a>
Author URI: https://www.os-templates.com/
Copyright: OS-Templates.com
Licence: Free to use under our free template licence terms
Licence URI: https://www.os-templates.com/template-terms
-->
<html lang="">
    <!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
    <head>
        <title>Servio Turistico</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
    </head>
    <body id="top">
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
<div class="wrapper row1">
  <header id="header" class="hoc clear">
    <div id="logo" class="fl_left"> 
      <!-- ################################################################################################ -->
      <h1 class="logoname"><a href="index.jsp">Turismo<span>a</span>rgentina</a></h1>
      <!-- ################################################################################################ -->
    </div>
    <nav id="mainav" class="fl_right"> 
      <!-- ################################################################################################ -->
      <ul class="clear">
        <li class="active"><a href="index.jsp">Home</a></li>
        <li><a class="drop">Servicios</a>
          <ul>
            <li><a href="">Paquetes Turisticos</a></li>
            <li><a href="">Servicios</a></li>
          </ul>
        </li>
        <li><a class="drop">Empleados</a>
          <ul>
            <li><a href="../Empleados.jsp">Alta Empleado</a></li>
            <li><a href="../verEmpleados.jsp">Ver Empleados</a></li>
            <li><a href="verClientes.jsp">Ver Clientes</a></li>
          </ul>
        </li>
        <li><a href="AltaCliente.jsp">Registrarse</a></li>
      </ul>
      <!-- ################################################################################################ -->
    </nav>
  </header>
</div>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <div class="bgded overlay" style="background-image:url('../images/demo/backgrounds/01.png');">
            <div id="pageintro" class="hoc clear"> 
                <!-- ################################################################################################ -->
                
                    <h3 class="heading">Editar Cliente</h3>
                
                <form action="../SvModificarPaquete" method="POST" class="centrar-contenido">
                    <% HttpSession misession = request.getSession();
                        Paquete paquete = (Paquete) misession.getAttribute("paquete");
                        {
                            int id = paquete.getId_paquete();
                    %>
                <form name="EditarPaquete" action="../SvAltaPaquete" method="POST">
                    <p><label>Nombre Paquete: </label> <input type="text" name="nombre_paquete" value="<%=paquete.getCodigo_paquete() %>"></p>
                <p>
                    <label>Servicio incluido nº1: </label>
                <select name="servicio1">
                    <option></option>
                    <% Controladora control = new Controladora();
                    List <Servicio> listaServicios = control.traerServicios();
                    for(Servicio servicio : listaServicios) {
                    %>
                    <option><%=servicio.getNombre() %></option>
                    <%}%>
                </select>
                </p>
                
                <p><label>Servicio incluido nº2: </label>
                <select name="servicio2">
                    <option></option>
                    <% 
                    for(Servicio servicio : listaServicios) {
                    %>
                    <option><%=servicio.getNombre() %></option>
                    <%}%>
                </select>
                </p>
                
                <p><label>Servicio incluido nº3: </label>
                <select name="servicio3">
                    <option></option>
                    <% 
                    for(Servicio servicio : listaServicios) {
                    %>
                    <option><%=servicio.getNombre() %></option>
                    <%}%>
                </select>
                </p>
                
                <p><label>Servicio incluido nº4: </label>
                <select name="servicio4">
                    <option></option>
                    <% 
                    for(Servicio servicio : listaServicios) {
                    %>
                    <option><%=servicio.getNombre() %></option>
                    <%}%>
                </select>
                </p>
                
                <p><label>Servicio incluido nº5: </label>
                <select name="servicio5">
                    <option></option>
                    <% 
                    for(Servicio servicio : listaServicios) {
                    %>
                    <option><%=servicio.getNombre() %></option>
                    <%}%>
                </select>
                </p>
                
                <p><label>Servicio incluido nº6: </label>
                <select name="servicio6">
                    <option></option>
                    <% 
                    for(Servicio servicio : listaServicios) {
                    %>
                    <option><%=servicio.getNombre() %></option>
                    <%}%>
                </select>
                </p>
                
                <p><label>Servicio incluido nº7: </label>
                <select name="servicio7">
                    <option></option>
                    <% 
                    for(Servicio servicio : listaServicios) {
                    %>
                    <option><%=servicio.getNombre() %></option>
                    <%}%>
                </select>
                </p>
                
                <p><label>Servicio incluido nº8: </label>
                <select name="servicio8">
                    <option></option>
                    <% 
                    for(Servicio servicio : listaServicios) {
                    %>
                    <option><%=servicio.getNombre() %></option>
                    <%}%>
                </select>
                </p>
                <input type="hidden" name="id" value="<%=id %>">
            <%} %>
                <button type="submit" class="btn">Crear Paquete</button>
            </form>
            
                <!-- ################################################################################################ -->
            </div>
        </div>
    </body>
</html>
