<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Turismo</title>
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
    
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
    <body>
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
                        <li><a href="Clientes/AltaCliente.jsp">Registrarse</a></li>
                    </ul>
                    <!-- ################################################################################################ -->
                </nav>
            </header>
        </div>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        
        <div class="bgded overlay" style="background-image:url('images/demo/backgrounds/mosaico.jpg'); height: 1080px;">
            <div id="pageintro" class="hoc clear"> 
        <h3 class="heading">Login</h3>
        <div class="contenedor">    
                    <div class="formulario">

            <form method="POST" action="SvLogin" >
                <p><input type="email" placeholder="email" name="email"></p>
                <p><input type="password" placeholder="password" name="password"></p>
                <input class="btn" type="submit" value="Login">
            </form>
        </div>
                    </div>
            </div>
        </div>
    </body>
</html>
