<%-- 
    Document   : chamar_proximo
    Created on : 20/03/2017, 14:38:26
    Author     : Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.dao.SenhaDao" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ChamarProximoServlet" method="post">
            <%SenhaDao senha = new SenhaDao();%> 
            <% int senha1  = senha.getClienteSenha();%>
            <input type="text" name="nome_cliente" id="nome_cliente" value="<%=senha.getNomeCliente(senha1)%>">
            <input type="text" name="senha" id="senha" value="1">
            <input type="submit" value="Confirmar Presença" class="btn-outline" />
            <input type="submit" value="Não Confirmar Presença" class="btn-outline" />

        
        
        
        
        </form>
    </body>
</html>
