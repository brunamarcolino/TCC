<%-- 
    Document   : senha
    Created on : 03/03/2017, 19:20:03
    Author     : brunacm
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<?xml version='1.0' encoding='UTF-8' ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
      xmlns:f="http://xmlns.jcp.org/jsf/core">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Gerenciador de filas">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>Smartqueue - Gerenciar parâmetros</title>
        <%@include file="WEB-INF/jspf/chamadas.jspf"%>
    </head>
    <body>
        <div class="main painel">
            <div class="grid-100 mobile-grid-100">
                <a href="index.jsp" class="btn-back"><img src="imagens/back.png" />Voltar</a>
            </div>
            <div class="grid-75 mobile-grid-100 gera-senha">
                <c:if test="${(empty atu) or (empty ants)}">
                    <h1>Nenhum dado!</h1>
                </c:if>
                <c:if test="${not empty atu}">
                    <div class="grid-parent grid-40 mobile-grid-100 info">
                        <div class="grid-100 mobile-grid-50">
                            <!--<p id="demo"></p> -->
                            <p>Tempo médio de atendimento</p>
                            <h2>
                                <c:choose>
                                    <c:when test="${empty atu.tempo_medio}">
                                        --
                                    </c:when>
                                    <c:otherwise>
                                        ${atu.tempo_medio}
                                    </c:otherwise>
                                </c:choose>
                            </h2>
                        </div>                    
                        <div class="grid-100 mobile-grid-50">
                            <p>Senha Atual</p>
                            <h2 class="senha">
                                <c:choose>
                                    <c:when test="${empty atu.senha_atual}">
                                        --
                                    </c:when>
                                    <c:otherwise>
                                        ${atu.senha_atual}
                                    </c:otherwise>
                                </c:choose>
                            </h2>
                        </div>
                        <div class="grid-100 mobile-grid-50">
                            <p>Tipo da Senha Atual</p>
                            <h2>
                                <c:choose>
                                    <c:when test="${empty atu.tipo_atendimento}">
                                        --
                                    </c:when>
                                    <c:otherwise>
                                        ${atu.tipo_atendimento}
                                    </c:otherwise>
                                </c:choose>
                            </h2>
                        </div>
                    </div>
                </c:if>
            
                <c:if test="${not empty ants}">      
                    <div class="grid-parent grid-60 mobile-grid-100">
                        <div class="grid-100 mobile-grid-100">
                            <table border="0" cellpadding="0" cellspacing="0" width="80%">
                                <tr>
                                    <th>Mesa</th>
                                    <th>Senha sendo atendida</th>
                                </tr>
                                <c:forEach var="ant" items="${ants}">    
                                <tr>
                                    <td width="50%">      
                                        ${ant.fila}
                                    </td>
                                    <td>      
                                        ${ant.senha}
                                    </td>
                                </tr>      
                                </c:forEach>
                            </table>                                                           
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </body>
</html>
