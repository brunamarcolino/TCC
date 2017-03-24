<%-- 
    Document   : fechar_fila
    Created on : 20/03/2017, 15:12:24
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
        <form action="FecharFilaServlet" method="post">
            <p>Informe a fila que deseja fechar</p>
        <input type="text" name="id_fila" value="${param.id_fila}"/>
        <input type="submit" value="Fechar Fila" class="btn-outline" />

        </form>
    </body>
</html>

