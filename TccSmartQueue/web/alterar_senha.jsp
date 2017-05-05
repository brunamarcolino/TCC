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
        
        <title>Smartqueue - Alterar senha</title>
        <%@include file="WEB-INF/jspf/chamadas.jspf"%>
    </head>
    <body>  
        <%@include file="WEB-INF/jspf/mensagem.jspf" %>
        <div class="main">
            <div class="grid-25 mobile-grid-100">
                <c:choose>
                    <c:when test="${empty usuario}">
                        <p>Usuário inválido!!</p>                
                    </c:when>
                    <c:otherwise>
                        <h1>Alterar Senha</h1>
                        <h3>
                            <strong>Olá ${usuario.nm_usuario}!</strong>
                            <br/>
                            Digite sua nova senha no campo abaixo, e depois clique em "Confirmar"
                        </h3>
                        <form id="usuarios" action="EditarSenhaUsuarioServlet" method="post">
                            <ul>
                                <li>
                                    <input type="hidden" name="id" value="${usuario.id_usuario}" readonly="readonly"/>
                                </li>    
                                <li>
                                    <label for="Senha">Senha<img src="imagens/icon.png" class="tooltip" />
                                        <div class="tooltiptext">
                                            <h4>Políticas de segurança:</h4>
                                            <span>A senha deve conter no mínimo 6 caractares sendo eles:</span>
                                            <ul>
                                                <li>Letras (a-z)</li>
                                                <li>Números (0-9)</li>
                                            </ul>
                                        </div>
                                    </label>
                                    <input type="password" name="senha" value="${usuario.senha_usuario}"/>
                                </li>
                                <li>
                                    <input type="submit" class="btn btn-outline verde" value="ATUALIZAR SENHA" style="width: 65%;"/>
                                </li>
                            </ul>
                        </form>   
                    </c:otherwise>
                </c:choose>  
            </div>
        </div>
    </body>
</html>