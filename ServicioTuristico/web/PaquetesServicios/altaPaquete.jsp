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
                width: 350px;
                padding-right: 150px;
                color: black;
            }
            .btn:hover{
                background-color: black;
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
    <div class="bgded overlay" style="background-image:url('../images/demo/backgrounds/mosaico.jpg');">
        <div id="pageintro" class="hoc clear"> 

                <h3 class="heading">Crear paquete</h3>

            <div class="contenedor">    
                    <div class="formulario">
            <form name="AltaPaquete" action="../SvAltaPaquete" method="POST">
                <p><label>Codigo paquete: </label> <input type="text" name="nombre_paquete" required></p>
                <p>
                    <label>Servicio incluido nº1: </label>
                    <select name="servicio1" required>
                        <option></option>
                        <% Controladora control = new Controladora();
                            List<Servicio> listaServicios = control.traerServicios();
                            for (Servicio servicio : listaServicios) {
                        %>
                        <option><%=servicio.getNombre()%></option>
                        <%}%>
                    </select>
                </p>

                <p><label>Servicio incluido nº2: </label>
                <th><select name="servicio2" required>
                        <option></option>
                        <%
                            for (Servicio servicio : listaServicios) {
                        %>
                        <option><%=servicio.getNombre()%></option>
                        <%}%>
                    </select></th>
                </p>

                <p><label>Servicio incluido nº3: </label>
                    <select name="servicio3">
                        <option></option>
                        <%
                            for (Servicio servicio : listaServicios) {
                        %>
                        <option><%=servicio.getNombre()%></option>
                        <%}%>
                    </select>
                </p>

                <p><label>Servicio incluido nº4: </label>
                    <select name="servicio4">
                        <option></option>
                        <%
                            for (Servicio servicio : listaServicios) {
                        %>
                        <option><%=servicio.getNombre()%></option>
                        <%}%>
                    </select>
                </p>

                <p><label>Servicio incluido nº5: </label>
                    <select name="servicio5">
                        <option></option>
                        <%
                            for (Servicio servicio : listaServicios) {
                        %>
                        <option><%=servicio.getNombre()%></option>
                        <%}%>
                    </select>
                </p>

                <p><label>Servicio incluido nº6: </label>
                    <select name="servicio6">
                        <option></option>
                        <%
                            for (Servicio servicio : listaServicios) {
                        %>
                        <option><%=servicio.getNombre()%></option>
                        <%}%>
                    </select>
                </p>

                <p><label>Servicio incluido nº7: </label>
                    <select name="servicio7">
                        <option></option>
                        <%
                            for (Servicio servicio : listaServicios) {
                        %>
                        <option><%=servicio.getNombre()%></option>
                        <%}%>
                    </select>
                </p>

                <p><label>Servicio incluido nº8: </label>
                    <select name="servicio8">
                        <option></option>
                        <%
                            for (Servicio servicio : listaServicios) {
                        %>
                        <option><%=servicio.getNombre()%></option>
                        <%}%>
                    </select>
                </p>          

                <button type="submit" class="btn boton">Crear Paquete</button>
            </form>
                        </div>
    </div>
        </div>
    </div>
</body>
</html>
