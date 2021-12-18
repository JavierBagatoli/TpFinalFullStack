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
                                <li><a href="verServicios.jsp">Servicios</a></li>
                            </ul>
                        </li>
                        <li><a class="drop">Empleados</a>
                            <ul>
                                <li><a href="../Empleados.jsp">Alta Empleado</a></li>
                                <li><a href="../verEmpleados.jsp">Ver Empleados</a></li>
                                <li><a href="../Clientes/verClientes.jsp">Ver Clientes</a></li>
                                <li><a href="altaServicio.jsp">Alta Servicio</a></li>
                                <li><a href="verServicios.jsp">Ver Servicio</a></li>
                                <li><a href="../PaquetesServicios/altaPaquete.jsp">Alta Paquete</a></li>
                                <li><a href="../PaquetesServicios/verPaquetes.jsp">Ver Paquetes</a></li>
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
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <div class="bgded overlay" style="background-image:url('../images/demo/backgrounds/mosaico.jpg'); height: 1080px">
            <div id="pageintro" class="hoc clear"> 
                <!-- ################################################################################################ -->

                <h3 class="heading">Editar Servicio</h3>
                <div class="contenedor">    
                    <div class="formulario">
                        <form action="../SvModificarServicio" method="POST" class="centrar-contenido">
                            <% HttpSession misession = request.getSession();
                                Servicio servicio = (Servicio) misession.getAttribute("servicio");
                                {
                            %>

                            <p><label class="one_quarter first">Tipo Servicio: </label></th><th> 
                                <select name="tipo_servicio" ="<%=servicio.getTipo_servicio()%>">
                                    <option><%=servicio.getTipo_servicio()%></option> 
                                    <% /*He resuelto la edicion del combobox, para que en lugar de 
                                        aparecer siempre la primera opcion a pararezca la  ya elejida,
                                        y asi evitar que el usuario tenga que acordarse de cambiarlo
                                         */%>
                                    <option value="Hotel por noche/s">Hotel por noche/s</option>
                                    <option value="Alquiler de auto">Alquiler de auto</option>
                                    <option value="Pasajes de colectivo">Pasajes de colectivo</option>
                                    <option value="Pasajes de Avión">Pasajes de Avión</option>
                                    <option value="Pasajes de tren">Pasajes de tren</option>
                                    <option value="Excursiones">Excursiones</option>
                                    <option value="Entradas a Eventos">Entradas a Eventos</option>
                                </select></th></p>
                            <p><label class="one_quarter first">Nombre: </label></th><th>   <input type="text" name="nombre" value="<%=servicio.getNombre()%>"></p>
                                <p><label class="one_quarter first">Descripcion: </label></th><th>  <input type="text" name="descripcion" value="<%=servicio.getDescripcion_breve()%>"></p>
                                <p><label class="one_quarter first">Destino: </label></th><th> <input type="text" name="destino" value="<%=servicio.getDestino_servicio()%>"></p>
                                <p><label class="one_quarter first">Coste: </label></th><th>      <input type="text" name="coste" value="<%=servicio.getCosto_servicio()%>"></p>

                                <input type="hidden" name="id" value="<%=servicio.getCodigo_servicio()%>">
                                <button type="submit" class="btn">Modificar Servicio</button>

                                <%}%>
                        </form>
                    </div>
                </div>
                <!-- ################################################################################################ -->
            </div>
        </div>
    </body>
</html>
