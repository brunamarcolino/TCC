<%-- 
    Document   : abrir_fila
    Created on : 15/03/2017, 13:45:27
    Author     : Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="AbrirFilaServlet" method="post">
            <p>Insira o numero da sua mesa</p>
        <input type="text" name="mesa" value="${param.mesa}"/>
        <input type="submit" value="Abrir Fila" class="btn-outline" />
        
        
        
        
        </form>
    </body>
</html>

