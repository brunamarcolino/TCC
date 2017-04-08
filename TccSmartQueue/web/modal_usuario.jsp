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
    <body>    
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>
        <%@include file="WEB-INF/jspf/mensagem.jspf"%>
        <c:if test="${empty login}">

            <jsp:forward page="index.jsp"/>  

        </c:if>
        <div class="main">
            <div class="grid-100 mobile-grid-100">
                <h1>Manter Usuarios</h1>
            </div>
            <div class="grid-50 mobile-grid-100">
              <c:choose>
            <c:when test="${empty usuario}">
                <h1>INCLUIR USUÁRIO</h1>
                    <form id="iusuario" action="IncluirUsuarioServlet" method="get">
                    <p>
                        <label for="Nome">Nome : </label>
                        <input type="text" name="inome" value="${param.nm_usuario}"/>
                    </p>
                    <p>
                        <label for="Email">Email : </label>
                        <input type="text" name="iemail" value="${param.email_usuario}"/>
                    </p>
                    <p>
                        <label for="CPF">CPF : </label>
                        <input type="text" name="icpf" value="${param.cpf_usuario}"/>
                    </p>
                   
                    <p>
                        <label for="Tipo">Tipo : </label>
                        <select name="itipo">
                            <option value="Atendente">Atendente</option>
                            <option value="Administrador">Administrador</option>
                        </select>
                    </p>                
                    <p>
                        <input type="submit"/>
                    </p>
                    
                </form>   
            </c:when>
            <c:otherwise>
                <h1>EDITAR USUÁRIO</h1>
                    <form id="usuarios" action="EditarUsuarioServlet" method="get">
                    <p>
                        <input type="hidden" name="id" value="${usuario.id_usuario}" readonly="readonly"/>
                    </p>    
                    <p>
                        <label for="Nome">Nome : </label>
                        <input type="text" name="nome" value="${usuario.nm_usuario}"/>
                    </p>
                    <p>
                        <label for="Email">Email : </label>
                        <input type="text" name="email" value="${usuario.email_usuario}"/>
                    </p>
                    <p>
                        <label for="CPF">CPF : </label>
                        <input type="number" name="cpf" value="${usuario.cpf_usuario}"/>
                    </p>
                   
                    <p>
                        <label for="Tipo">Tipo : </label>
                        <select name="tipo">
                            <option value="Atendente">Atendente</option>
                            <option value="Administrador">Administrador</option>
                        </select>
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