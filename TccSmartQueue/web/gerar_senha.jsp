<%-- 
    Document   : gerar_senha
    Created on : 17/03/2017, 17:44:23
    Author     : Thiago Quintanilha
--%>

<?xml version='1.0' encoding='UTF-8' ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
      xmlns:f="http://xmlns.jcp.org/jsf/core">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Gerenciador de filas">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>Smartqueue</title>
        <link rel="stylesheet" type="text/css" href="estilos/estilo.css" />
        <link rel="stylesheet" type="text/css" href="estilos/unsemantic-responsive.css" />
    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>
        
        <div class="main">
            <div class="grid-25 gera-senha">
            <c:choose>  
                <c:when test="${empty senha}">
                    <p>Nenhuma senha!</p>
                </c:when>
                <c:otherwise>
                    <label>Sua Senha é: </label>
                    <h1>${senha.id_senha}</h1>
                                      
                </c:otherwise>
            </c:choose>
            <div class="grid-100">
                <input type="button" value="Cancelar Senha" onClick="window.location.href='CancelarSenhaServlet?id_senha=${senha.id_senha}'">
            </div>
            </div>
        </div>
       <%@include file="WEB-INF/jspf/rodape.jspf"%>
    </body>
</html>

