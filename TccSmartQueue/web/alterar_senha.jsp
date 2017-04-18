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
        
        <title>Smartqueue</title>
        <%@include file="WEB-INF/jspf/chamadas.jspf"%>
    </head>
    <body>    
        <div class="main">
            <div class="grid-100 mobile-grid-100">
                <h1>Altarar senha</h1>
            </div>
            <div class="grid-50 mobile-grid-100">
              <c:choose>
            <c:when test="${empty usuario}">
                <p>Usuário inválido!!</p>                
            </c:when>
            <c:otherwise>
                <h1>Alterar Senha</h1>
                <p>Olá ${usuario.nm_usuario}!</p>
                </br>
                <p>ATUALIZAR SENHA</p>
                </br>
                <p>Digite a nova senha</p>
                </br>
                    <form id="usuarios" action="EditarSenhaUsuarioServlet" method="post">
                    <p>
                        <input type="hidden" name="id" value="${usuario.id_usuario}" readonly="readonly"/>
                    </p>    
                    <p>
                        <label for="Senha">Senha : </label>
                        <input type="password" name="senha" value="${usuario.senha_usuario}"/>
                    </p>
                                   
                    <p>
                        <input type="submit"/>
                    </p>
                    
                </form>   
            </c:otherwise>
        </c:choose>                               
        
               
            </div>
        </div>
    </body>
</html>