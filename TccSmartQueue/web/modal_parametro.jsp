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
        <%@include file="WEB-INF/jspf/mensagem.jspf"%>
        <c:if test="${empty login}">

            <jsp:forward page="index.jsp"/>  

        </c:if>
        <div class="main">
            <div class="grid-100 mobile-grid-100">
                <h1>Manter Parametros</h1>
            </div>
            <div class="grid-50 mobile-grid-100">
              <c:choose>
            <c:when test="${empty parametro}">
                   
            </c:when>
            <c:otherwise>
                <h1>EDITAR PARAMETROS</h1>
                    <form id="parametros" action="EditarParametroServlet" method="get">
                    <p>
                        <input name="id" value="${parametro.id_parametro}" readonly="readonly"/>
                    </p>    
                    <p>
                        <label for="Descricao">Descricao : </label>
                        <input type="text" name="descricao" value="${parametro.descricao_parametro}"/>
                    </p>
                    <p>
                        <label for="Valor">Valor : </label>
                        <input type="text" name="valor" value="${parametro.valor_parametro}"/>
                    </p>                
                    <p>
                        <input type="submit"/>
                    </p>
                    
                </form>   
            </c:otherwise>
        </c:choose>                               
        
               
            </div>
        </div>
        <%@include file="WEB-INF/jspf/rodape.jspf"%>
    </body>
</html>