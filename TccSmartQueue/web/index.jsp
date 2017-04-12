<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<?xml version='1.0' encoding='UTF-8' ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
      xmlns:f="http://xmlns.jcp.org/jsf/core">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv = "Content-Language" content = "en"/>
        <meta http-equiv = "Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv = "Content-Type" content="text/css; charset=utf-8">
        <meta name="description" content="Gerenciador de filas">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>Smartqueue</title>
        <link rel="stylesheet" type="text/css" href="estilos/estilo.css" />
        <link rel="stylesheet" type="text/css" href="estilos/unsemantic-responsive.css" />
        <script type="text/javascript" src="script/jquery-3.2.0.min.js"></script>
        <script type="text/javascript" src="script/general.js"></script>
        <script type="text/javascript" src="script/localizacao.js"></script>
    </head>
    <body class="<c:if test='${empty login}'>nao-logado</c:if>">        
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>

        <%@include file="WEB-INF/jspf/mensagem.jspf" %>
        <div class="main">
            <div class="grid-100 mobile-grid-100">
                <c:if test="${not empty login}">  
                    <c:if test="${login.tipo_usuario=='Administrador'}">
                        <h1>Perfil Admin</h1> 

                    </c:if>        
                    <c:if test="${login.tipo_usuario=='Atendente'}">
                        <h1>Perfil Atendente</h1>

                    </c:if>   
                    <c:if test="${login.tipo_usuario=='Cliente'}">
                        <h1>Perfil Cliente</h1>
                        <p id="demo">Clique no bot�o para receber as coordenadas:</p>
                        <button onclick="getLocation()">Clique Aqui</button>
                        <script>
var x=document.getElementById("demo");
function getLocation()
  {
      
  if (navigator.geolocation)
    {
    navigator.geolocation.getCurrentPosition(showPosition,showError);
    }
  else{x.innerHTML="Seu browser n�o suporta Geolocaliza��o.";}
  }
  
  function showPosition(position)
  {
  x.innerHTML="Latitude: " + position.coords.latitude +
  "<br>Longitude: " + position.coords.longitude; 
  }
  
function showError(error)
  {
  switch(error.code)
    {
    case error.PERMISSION_DENIED:
      x.innerHTML="Usu�rio rejeitou a solicita��o de Geolocaliza��o.";
      break;
    case error.POSITION_UNAVAILABLE:
      x.innerHTML="Localiza��o indispon�vel.";
      break;
    case error.TIMEOUT:
      x.innerHTML="A requisi��o expirou.";
      break;
    case error.UNKNOWN_ERROR:
      x.innerHTML="Algum erro desconhecido aconteceu.";
      break;
    }
  }
                        </script>
                    </c:if>
                    <!--<div class="grid-25">
                    <a href="ListaSenhaServlet" class="btn btn-outline">Chama Servlet</a>
                    </div>-->
                </c:if>          
            </div>
        </div>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>