<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="estilos/estilo.css"/>
        <link rel="stylesheet" type="text/css" href="estilos/unsemantic-responsive.css" />
        <script type="text/javascript" src="script/jquery-3.2.0.min.js"></script>
        <script type="text/javascript" src="script/general.js"></script>
        <script type="text/javascript" src="script/jquery.mask.js"></script>
    </head>
    <body>  
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>

        <%@include file="WEB-INF/jspf/mensagem.jspf" %>
        <div class="grid-25 mobile-grid-100 center">
            <div class="box">
                <h1>Login Cliente</h1>
                <p>Para que possamos garantir a seguran�a da sua senha, por favor preencha o formul�rio abaixo:</p>
            </div>
            <form action="GeraSenhaServlet" method="post">
                <ul>
                    <li>
                        <label for="nomecliente">Nome : </label>
                        <input type="text" name="cliente" value="${param.cliente}"/>
                    </li>
                    <li>
                        <label for="cpfcliente">CPF : </label>
                        <input type="number" name="cpf" id="cpf" value="${param.cpf}"/>
                    </li>
                    <li>
                        <label for="senha">Senha :</label>
                        <input type="password" name="senhacliente" value="${param.senhacliente}"/>
                    </li>

                    <input type="submit" value="Entrar" class="btn-outline" />
                </ul>
            </form>
        </div>
                    
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>