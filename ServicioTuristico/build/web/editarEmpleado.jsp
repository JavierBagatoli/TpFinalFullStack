<%@page import="logica.Empleado"%>
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
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
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
            <li><a href="pages/gallery.html">Paquetes Turisticos</a></li>
            <li><a href="pages/full-width.html">Servicios</a></li>
          </ul>
        </li>
        <li><a class="drop">Empleados</a>
          <ul>
            <li><a href="Empleados.jsp">Alta Empleado</a></li>
            <li><a href="verEmpleados.jsp">Ver Empleados</a></li>
            <li><a href="Clientes/verClientes.jsp">Ver Clientes</a></li>
          </ul>
        </li>
        <li><a href="#">Registrarse</a></li>
      </ul>
      <!-- ################################################################################################ -->
    </nav>
  </header>
</div>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <div class="bgded overlay" style="background-image:url('images/demo/backgrounds/01.png');">
            <div id="pageintro" class="hoc clear"> 
                <!-- ################################################################################################ -->
                
                    <h3 class="heading">Editar empleado</h3>
                
                <form action="SvModificarEmpleado" method="POST" class="centrar-contenido">
                    <% HttpSession misession = request.getSession();
                        Empleado emple = (Empleado) misession.getAttribute("persona");
                        {
                    %>
                    <p><label class="one_quarter first">Nombre: </label></th><th>   <input type="text" name="nombre" value="<%=emple.getNombre() %>"></p>
                    <p><label class="one_quarter first">Apellido </label></th><th>  <input type="text" name="apellido" value="<%=emple.getApellido() %>"></p>
                    <p><label class="one_quarter first">Direccion: </label></th><th> <input type="text" name="direccion" value="<%=emple.getDireccion()%>"></p>
                    <p><label class="one_quarter first">DNI: </label></th><th>      <input type="text" name="dni" value="<%=emple.getNombre() %>"></p>
                    <p><label class="one_quarter first">Nacionalidad </label></th><th> <input type="text" name="nacionalidad" value="<%=emple.getNacionalidad()%>"></p>
                    <p><label class="one_quarter first">Celular: </label></th><th>  <input type="text" name="numeroCelular" value="<%=emple.getCelular()%>"></p>
                    <p><label class="one_quarter first">Email: </label></th><th>    <input type="text" name="email" value="<%=emple.getEmail()%>"> </p>
                    <p><label class="one_quarter first">Cargo: </label></th><th>    <input type="text" name="cargo" value="<%=emple.getCargo()%>"></p>
                    <p><label class="one_quarter first">Salario: </label></th><th>  <input type="text" name="salario" value="<%=emple.getSalario()%>"></p>
                        
                        <input type="hidden" name="id" value="<%=emple.getId_Empleado() %>">
                        <button type="submit" class="btn">Modificar Empleado</button>
                        
                    <%}%>
                </form>
            
                <!-- ################################################################################################ -->
            </div>
        </div>
    </body>
</html>
