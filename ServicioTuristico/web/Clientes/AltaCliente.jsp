<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                    <h1 class="logoname"><a href="../index.jsp">Turismo<span>a</span>rgentina</a></h1>
                    <!-- ################################################################################################ -->
                </div>
                <nav id="mainav" class="fl_right"> 
                    <!-- ################################################################################################ -->
                    <ul class="clear">
                        <li class="active"><a href="../index.jsp">Home</a></li>
                    
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
                <h3 class="heading">Registrarse</h3>
                <div class="contenedor">    
                    <div class="formulario">
                        <form action="../SvClienteAlta" method="POST">
                            <p><label class="one_quarter first">Nombre: </label></th><th> <input type="text" name="nombre"></p>
                                <p><label class="one_quarter first">Apellido </label></th><th> <input type="text" name="apellido"></p>
                                <p><label class="one_quarter first">Direccion: </label></th><th> <input type="text" name="direccion"></p>
                                <p><label class="one_quarter first">DNI: </label></th><th> <input type="text" name="dni"></p>
                                <p><label class="one_quarter first">Nacionalidad </label></th><th> <input type="text" name="nacionalidad"></p>
                                <p><label class="one_quarter first">Celular: </label></th><th> <input type="text" name="celular"></p>
                                <p><label class="one_quarter first">Email: </label></th><th> <input type="text" name="email"></p>
                                <p><label class="one_quarter first">Fecha Nacimiento: </label></th><th> <input type="date" name="fechaNacimiento"></p>
                                <p><label class="one_quarter first">Contraseña: </label></th><th> <input type="password" name="password" class=""></p>
                                <div class="boton">
                                    <button type="submit" class="btn">Registrarse</button>
                                </div>
                        </form>
                    </div>
                </div>
                <!-- ################################################################################################ -->
            </div>
        </div>
    </body>
</html>
