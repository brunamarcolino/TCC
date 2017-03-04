<%-- 
    Document   : senha
    Created on : 03/03/2017, 19:20:03
    Author     : brunacm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <title>Senha</title>
    </head>
    <body>    
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>

        <c:if test="${empty login}">

            <jsp:forward page="index.jsp"/>  

        </c:if>

        <c:choose>  
            <c:when test="${empty senha}">
                <p>Nenhuma senha!</p>
            </c:when>
            <c:otherwise>
                <label>${senha.id_senha}</label>
                
            </c:otherwise>
        </c:choose>
    </body>
</html>
