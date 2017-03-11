<%-- 
    Document   : alterar_parametros
    Created on : 13/02/2017, 18:59:19
    Author     : brunacm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Parametro</title>
    </head>
    <body>
        <form id="parametro" action="ParametroServlet?id_parametro=+${param.id_parametro}" method="get">
            <p>
                <label>desc_parametro</label>
                <br/>
                <input type="text" name="desc_parametro" value="${param.desc_parametro}"/>
            </p>
            <p>
                <label>valor_parametro</label>
                <br/>
                <input type="text" name="valor_parametro" value="${param.valor_parametro}"/>
            </p>                 
            <p>
                <input type="submit"/>
            </p>
    </body>
</html>
