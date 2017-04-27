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
        <%@include file="WEB-INF/jspf/chamadas.jspf"%>
       
    </head>
    <body onload="getLocation()">    
        
        <%@include file="WEB-INF/jspf/mensagem.jspf"%>

        <div class="main">
            <div class="grid-25 grid-parent mobile-grid-85 center">
                <div class="grid-100 mobile-grid-100">
                    <h1>COMO QUER SER ATENDIDO?</h1>
                    <h3>Escolha o seu tipo de atendimento:</h3>
                </div>
                <form id="local" action="MapsServlet" method="get">
                    <ul>
                        <li>
                            <input type="hidden" name="localizacao" id="field1" value=""/>
                            <select name="tipo_atendimento">
                                <option value="Normal">Normal</option>
                                <option value="Preferencial">Preferencial</option>
                            </select>
                        </li>
                        <li>
                            <a href="index.jsp" class="btn-back"><img src="imagens/back.png" />Voltar</a>
                            <input type="submit" value="Continuar" class="btn btn-outline azul"/>
                        </li>
                    </ul>
                </form>
            </div>
        </div>
        <script type="text/javascript" src="script/localizacao.js"></script>
        <%@include file="WEB-INF/jspf/rodape.jspf"%>
    </body>
    
</html>