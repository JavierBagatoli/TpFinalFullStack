<%@page import="logica.Venta"%>
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
                            <li><a href="../PaquetesServicios/altaPaquete.jsp">Alta Paquete</a></li>
                            <li><a href="../PaquetesServicios/verPaquetes.jsp">Ver Paquetes</a></li>
                            <li><a href="altaVenta.jsp">Crear Venta</a></li>
                            <li><a href="verVentas.jsp">Ver ventas</a></li>
                        </ul>
                    </li>
                    <li><a href="../Clientes/AltaCliente.jsp">Registrarse</a></li>
                </ul>
                <!-- ################################################################################################ -->
            </nav>
        </header>
    </div>        
    <article>
        <h1>Ventas</h1>
    </article>
    <table class="agileits-pricing-grid">
        <thead class="pricing_grid wthree-pricing-info pricing-top">
            <tr>
                <th>Codigo Venta:</th>
                <th>Nombre Cliente:</th>
                <th>Nombre Empleado</th>
                <th>Paquete:</th>
                <th>Servicio Nº1:</th>
                <th>Servicio Nº2:</th>
                <th>Servicio Nº3:</th>
            </tr>
        </thead>
        <tbody>
            <% Controladora control = new Controladora();
                List<Venta> listaVentas = control.traerVentas();
                for (Venta venta : listaVentas) {
            %>
            <tr>
                <%
                    int id = venta.getNum_vante();
                    //Comprobar que en la tabla los valores no sean null, de serlo tendran por nombre " "
                    String cliente = "";
                    if (venta.getCliente()!= null){
                        cliente = venta.getCliente().getNombre() + " " + venta.getCliente().getApellido();}
                     
                    String vendedor = "";
                    if (venta.getEmpleado() != null){
                    vendedor = venta.getEmpleado().getNombre() + " " + venta.getEmpleado().getApellido();}
                    
                    String paquete = "No adquirido";
                    if (venta.getPaquete() != null) {
                        paquete = venta.getPaquete().getCodigo_paquete();
                    }
                    ///
                    String servicio1 = "No adquirido";
                    String servicio2 = "No adquirido";
                    String servicio3 = "No adquirido";
                    for (int i = 0; i < venta.getServicios().size(); i++) {
                        if (i == 0) {
                            servicio1 = (venta.getServicios().get(0).getNombre());
                        } else if (i == 1) {
                            servicio2 = (venta.getServicios().get(1).getNombre());
                        } else if (i == 2) {
                            servicio3 = (venta.getServicios().get(2).getNombre());
                        }
                    }
                %>

                <td><%=id%></td>
                <td><%=cliente%></td>
                <td><%=vendedor%></td>
                <td><%=paquete%></td>
                <td><%=servicio1%></td>
                <td><%=servicio2%></td>
                <td><%=servicio3%></td>
                <th>
                    <form name="EditarVentas" action="../SvBuscarVenta" method="POST">
                        <input type="hidden" name="id" value="<%=id%>">
                        <button class="btn">Modificar</button>
                    </form>
                </th>
                <th>
                    <form name="ElminarVentas" action="../SvBajaVenta" method="POST">
                        <input type="hidden" name="id" value="<%=id%>">
                        <button class="btn">Eliminar</button>
                    </form>
                </th> 
            </tr>
        </tbody>
        <%}%>
    </table>
</body>
</html>
