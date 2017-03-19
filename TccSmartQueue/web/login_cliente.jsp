<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="estilos/estilo.css"/>
    </head>
    <body>  
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>

        <%@include file="WEB-INF/jspf/mensagem.jspf" %>
        <h1>Login Cliente!</h1>
        <div class="grid-100 mobile-grid-100">
                <form action="GeraSenhaServlet" method="post">
                    <ul>
                        <li>
                            <label for="nomecliente">Nome : </label>
                            <input type="text" name="cliente" value="${param.cliente}"/>
                        </li>
                        <li>
                            <label for="cpfcliente">CPF : </label>
                            <input type="text" name="cpf" value="${param.cpf}"/>
                        </li>
                        <li>
                            <label for="senha">Senha :</label>
                            <input type="password" name="senhacliente" value="${param.senhacliente}"/>
                        </li>
                        
                        <input type="submit" value="Login" class="btn-outline" />
                    </ul>
                </form>
            </div>                       
    </body>
</html>