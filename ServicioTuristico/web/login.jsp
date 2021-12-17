<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Turismo</title>
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
    </head>
    <body>
        <h1>Login</h1>
        <div>
            <form method="POST" action="SvLogin" >
                <p><input type="email" placeholder="email" name="email"></p>
                <p><input type="password" placeholder="password" name="password"></p>
                <input class="btn" type="submit" value="Login">
            </form>
        </div>
    </body>
</html>
