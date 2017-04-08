<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="edu.vo.Parametro" %>
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
        
        <title>Smartqueue</title>
        <link rel="stylesheet" type="text/css" href="estilos/estilo.css" />
        <link rel="stylesheet" type="text/css" href="estilos/unsemantic-responsive.css" />
        <script type="text/javascript" src="script/jquery-3.2.0.min.js"></script>
        <script type="text/javascript" src="script/general.js"></script>
    </head>
    <body>    
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>

        <c:if test="${empty login}">

            <jsp:forward page="index.jsp"/>  

        </c:if>
        <div class="main">
            <div class="grid-100 mobile-grid-100">
                <h1>Parâmetros do sistema</h1>
            </div>
            <div class="grid-50 mobile-grid-100">
        <c:choose>
            <c:when test="${empty parametros}">
                <p>Nenhum parametro cadastrado!</p>
            </c:when>
            <c:otherwise>
                
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <th>Descrição</th>
                        <th>Valor</th>
                        <th>Ação</th>
                    </tr>

                    <c:forEach var="parametro" items="${parametros}">    
                        <tr>
                            <td>      
                                ${parametro.desc_parametro}
                            </td>
                            <td> 
                                <c:choose>
                                    <c:when test="${parametro.parametro_habilitado=='0'}">
                                        Desabilitado
                                    </c:when>
                                    <c:otherwise>                                    
                                        ${parametro.valor_parametro}    
                                    </c:otherwise>
                                </c:choose>
                                
                            </td>
                            <td>  
                                <a href="ModalEditarParametroServlet?id_parametro=${parametro.id_parametro}">Editar</a> 
                                <a href="HabilitaParametroServlet?id_parametro=${parametro.id_parametro}&parametro_habilitado=${parametro.parametro_habilitado}">${parametro.parametro_habilitado=='0' ? "Habilitar"  : "Desabilitar"}</a> 
                            </td>
                        </tr>
                    </c:forEach>
                </table>  
            </c:otherwise>
        </c:choose>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/rodape.jspf"%>
    </body>
</html>