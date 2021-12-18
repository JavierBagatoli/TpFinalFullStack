<%@page import="logica.Venta"%>
<%@page import="logica.Empleado"%>
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

        <style>
            .boton,.formulario ,h3 ,.contenedor{
                display:flex;
                justify-content: center;
                align-items: center;
            }
            .formulario{
                border-color: black;
                border-top-style: solid;
                background-color: #EEEEEE;
                border-radius: 50px;
                border-bottom-style: outset;
                width: 600px;
            }
            label{
                width: 250px;
                padding-right: 150px;
                color: black;
            }
            .btn:hover{
                background-color: black;
            }
        </style>
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
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <div class="bgded overlay" style="background-image:url('../images/demo/backgrounds/mosaico.jpg');">
            <div id="pageintro" class="hoc clear"> 
                <!-- ################################################################################################ -->

                <h3 class="heading">Editar Cliente</h3>
                <div class="contenedor">    
                    <div class="formulario">
                        <form action="../SvModificarVenta" method="POST" class="centrar-contenido">
                            <% HttpSession misession = request.getSession();
                                Venta venta = (Venta) misession.getAttribute("venta");
                                {
                                    Controladora control = new Controladora();
                                    List<Empleado> listaEmpleados = control.traerEmpleado();
                                    List<Cliente> listaClientes = control.traerClientes();
                                    List<Paquete> listaPaquete = control.traerPaquetes();
                                    List<Servicio> listaServicios = control.traerServicios();
                                    int id = venta.getNum_vante();

                                    String servicio1 = "";
                                    String servicio2 = "";
                                    String servicio3 = "";
                                    String paquete = "";
                                    if (venta.getPaquete() != null) {
                                        paquete = venta.getPaquete().getCodigo_paquete();
                                    }
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
                            <form name="EditarVenta" action="../SvModificarVenta" method="POST">
                                <p>
                                    <label>Cliente: </label>
                                    <select name="cliente">
                                        <option><%=venta.getCliente().getNombre() + " " + venta.getCliente().getApellido()%></option>
                                        <%for (Cliente cliente : listaClientes) {
                                        %>
                                        <option><%=cliente.getNombre() + " " + cliente.getApellido()%></option>
                                        <%}%>
                                    </select>
                                </p>

                                <p><label>Vendedor: </label>
                                    <select name="vendedor">
                                        <option><%=venta.getEmpleado().getNombre() + " " + venta.getEmpleado().getApellido()%> </option>
                                        <%
                                            for (Empleado empleado : listaEmpleados) {
                                        %>
                                        <option><%=empleado.getNombre() + " " + empleado.getApellido()%></option>
                                        <%}%>
                                    </select>
                                </p>

                                <p><label>Paquete: </label>
                                    <select name="paquete">
                                        <option><%=paquete%></option>
                                        <%
                                            for (Paquete paqueteB : listaPaquete) {
                                        %>
                                        <option><%=paqueteB.getCodigo_paquete()%></option>
                                        <%}%>
                                    </select>
                                </p>

                                <p><label>Servicio Nº1: </label>
                                    <select name="servicio1">
                                        <option><%=servicio1%></option>
                                        <%
                                            for (Servicio servicio : listaServicios) {
                                        %>
                                        <option><%=servicio.getNombre()%></option>
                                        <%}%>
                                    </select>
                                </p>

                                <p><label>Servicio Nº2: </label>
                                    <select name="servicio2">
                                        <option><%=servicio2%></option>
                                        <%
                                            for (Servicio servicio : listaServicios) {
                                        %>
                                        <option><%=servicio.getNombre()%></option>
                                        <%}%>
                                    </select>
                                </p>

                                <p><label>Servicio Nº3: </label>
                                    <select name="servicio3">
                                        <option><%=servicio3%></option>
                                        <%
                                            for (Servicio servicio : listaServicios) {
                                        %>
                                        <option><%=servicio.getNombre()%></option>
                                        <%}%>
                                    </select>
                                </p>
                                <input type="hidden" name="id" value="<%=id%>">
                                <%}%>
                                <button type="submit" class="btn">Modificar Ventas</button>
                            </form>
                    </div>
                </div>
                <!-- ################################################################################################ -->
            </div>
        </div>
    </body>
</html>
