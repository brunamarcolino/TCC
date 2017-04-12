<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="edu.vo.Usuario" %>
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
    <body onload="getLocation()">    
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>
        <%@include file="WEB-INF/jspf/mensagem.jspf"%>
        <c:if test="${empty login}">

            <jsp:forward page="index.jsp"/>  

        </c:if>
        <div class="main">
            <div class="grid-100 mobile-grid-100">
            <form id="local" action="MapsServlet" method="get">
                <input type="hidden" name="localizacao" id="field1" value="teste"/>
                <select name="tipo_atendimento">
                    <option value="Preferencial">Preferencial</option>
                    <option value="Normal">Normal</option>
                </select>                        
            <input type="submit" value="Clique aqui para proceguir!"/>
            </form>
            </div>
        </div>
        <script type="text/javascript" src="script/localizacao.js"></script>
        <%@include file="WEB-INF/jspf/rodape.jspf"%>
    </body>
    
</html>