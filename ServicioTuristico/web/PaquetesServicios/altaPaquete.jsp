<%@page import="logica.Servicio"%>
<%@page import="java.util.List"%>
<%@page import="logica.Cliente"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Servicios</title>
	<link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
        <!--El css me gusta, pero no termino poder cambiarlo a mi gusto -->
        <style>
            td {color: #000000;
                background-color:#DDDDDD;
            }
        </style>
	
</head>
        
    </head>
    <body>
        <div class="wrapper row1">
  <header id="header" class="hoc clear">
    <div id="logo" class="fl_left"> 
      <!-- ################################################################################################ -->
      <h1 class="logoname"><a href="../index.jsp">Turismo<span>a</span>rgentina</a></h1>
      <!-- ################################################################################################ -->
    </div>
    <nav id="mainav" class="fl_right"> 
      <!-- ################################################################################################ -->
      <ul class="clear">
        <li class="active"><a href="../index.jsp">Home</a></li>
        <li><a class="drop">Servicios</a>
          <ul>
            <li><a href="pages/gallery.html">Paquetes Turisticos</a></li>
            <li><a href="pages/full-width.html">Servicios</a></li>
          </ul>
        </li>
        <li><a class="drop">Empleados</a>
          <ul>
            <li><a href="Empleados.jsp">Alta Empleado</a></li>
            <li><a href="verEmpleados.jsp">Ver Empleados</a></li>
            <li><a href="verClientes.jsp">Ver Clientes</a></li>
            <li><a href="verClientes.jsp">Crear Servicio</a></li>
            <li><a href="verClientes.jsp">Ver Servicio</a></li>
          </ul>
        </li>
        <li><a href="#">Registrarse</a></li>
      </ul>
      <!-- ################################################################################################ -->
    </nav>
  </header>
</div>        
        <article>
            <h1>Crear paquete</h1>
        </article>
            <form name="AltaPaquete" action="../SvAltaPaquete" method="POST">
                <p><label>Nombre Paquete: </label> <input type="text" name="nombre_paquete"></p>
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
            
                <button type="submit" class="btn">Crear Paquete</button>
            </form>
    </body>
</html>
