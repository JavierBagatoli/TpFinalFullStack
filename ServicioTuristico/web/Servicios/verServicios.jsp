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
            <h1>Servicios</h1>
        </article>
        <table class="agileits-pricing-grid">
            <thead class="pricing_grid wthree-pricing-info pricing-top">
                <tr>
                    <th>Codigo Servicio:</th>
                    <th>Nombre:</th>
                    <th>Descripcion:</th>
                    <th>Destino:</th>
                    <th>Coste:</th>
                    <th>Estado:</th>
                </tr>
            </thead>
            <tbody>
                <% Controladora control = new Controladora();
                List <Servicio> listaServicios = control.traerServicios();
                for(Servicio servicio : listaServicios) {
                %>
                <tr>
                    <%
                    int id = servicio.getCodigo_servicio();
                    String nombre = servicio.getNombre();
                    String descripcion = servicio.getDescripcion_breve();
                    String destino = servicio.getDestino_servicio();
                    int coste = servicio.getCosto_servicio();
                    boolean estado = servicio.isEstado();
                    String estado2;
                    if (estado == true){
                        estado2 = "Vigente";
                        }else{
                        estado2 = "No activo";
                        }
                    %>
                    
                    <td><%=id%></td>
                    <td><%=nombre%></td>
                    <td><%=descripcion %></td>
                    <td><%=destino %></td>
                    <td><%=coste %></td>
                    <td><%=estado2 %></td>
                    <%if (estado == true){//Codigo para ocultar el boton eliminar si ya esta dado de baja el servicio%>
                    <th>
                        <form name="borrarServicio" action="../SvEliminarServicio" method="POST">
                            <input type="hidden" name="id" value="<%=id %>">
                            <button class="btn">Eliminar</button>
                        </form>
                    </th>
                    <%} %>
                    <th>
                        <form name="EditarServicio" action="../SvBuscarServicio" method="POST">
                            <input type="hidden" name="id" value="<%=id %>">
                            <button class="btn">Modificar</button>
                        </form>
                    </th>
                </tr>
            </tbody>
            <%}%>
        </table>
    </body>
</html>
