<%@page import="logica.Paquete"%>
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
            td {
                color: #000000;
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
                            <li><a href="../PaquetesServicios/verPaquetes.jsp">Paquetes Turisticos</a></li>
                            <li><a href="../Servicios/verServicios.jsp">Servicios</a></li>
                        </ul>
                    </li>
                    <li><a class="drop">Empleados</a>
                        <ul>
                            <li><a href="../Empleados.jsp">Alta Empleado</a></li>
                            <li><a href="../verEmpleados.jsp">Ver Empleados</a></li>
                            <li><a href="../Clientes/verClientes.jsp">Ver Clientes</a></li>
                            <li><a href="../Servicios/altaServicio.jsp">Alta Servicio</a></li>
                            <li><a href="../Servicios/verServicios.jsp">Ver Servicio</a></li>
                            <li><a href="altaPaquete.jsp">Alta Paquete</a></li>
                            <li><a href="verPaquetes.jsp">Ver Paquetes</a></li>
                            <li><a href="../Ventas/altaVenta.jsp">Crear Venta</a></li>
                            <li><a href="../Ventas/verVentas.jsp">Ver ventas</a></li>
                        </ul>
                    </li>
                    <li><a href="../Clientes/AltaCliente.jsp">Registrarse</a></li>
                </ul>
                <!-- ################################################################################################ -->
            </nav>
        </header>
    </div>        
    <article>
        <h1>Paquetes</h1>
    </article>
    <table class="agileits-pricing-grid">
        <thead class="pricing_grid wthree-pricing-info pricing-top">
            <tr>
                <th>Codigo Servicio:</th>
                <th>Nombre:</th>
                <th>Coste:</th>
                <th>Estado:</th>
            </tr>
        </thead>
        <tbody>
            <% Controladora control = new Controladora();
                List<Paquete> listaPaquetes = control.traerPaquetes();
                for (Paquete paquete : listaPaquetes) {
            %>
            <tr>
                <%
                    int id = paquete.getId_paquete();
                    String nombre = paquete.getCodigo_paquete();
                    List<Servicio> descripcion = paquete.getLista_servicios_incluidos();
                    int coste = paquete.getCosto_paquete();
                    boolean estado = paquete.isEstado_paquete();
                    String estado2;
                    if (estado == true) {
                        estado2 = "Activo";
                    } else {
                        estado2 = "Deshabilido";
                    }
                %>

                <td><%=id%></td>
                <td><%=nombre%></td>
                <td><%=coste%></td>
                <td><%=estado2%></td>
                <th>
                    <form name="EditarServicio" action="../SvBuscarPaquete" method="POST">
                        <input type="hidden" name="id" value="<%=id%>">
                        <button class="btn">Modificar</button>
                    </form>
                </th>
                <%if (estado == true) {//Codigo para ocultar el boton eliminar si ya esta dado de baja el servicio%>
                <th>
                    <form name="borrarPaquete" action="../SvBajaPaquete" method="POST">
                        <input type="hidden" name="id" value="<%=id%>">
                        <button class="btn">Eliminar</button>
                    </form>
                </th>
                <%} %>

            </tr>
        </tbody>
        <%}%>
    </table>
</body>
</html>
