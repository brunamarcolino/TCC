<%-- 
    Document   : chamar_proximo
    Created on : 20/03/2017, 14:38:26
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
        <form action="ChamarProximoServlet" method="post">
            <input type="text" name="nome_cliente" id="nome_cliente" value="${tab_senhas.nm_cliente}">
            <input type="text" name="senha" id="senha" value="${tab_senhas.id_senha}">
            <input type="submit" value="Confirmar Presença" class="btn-outline" />
            <input type="submit" value="Não Confirmar Presença" class="btn-outline" />

        
        
        
        
        </form>
    </body>
</html>
