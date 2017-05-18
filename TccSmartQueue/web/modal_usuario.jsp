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
        
        <title>Smartqueue - Gerenciar funcionários</title>
        <%@include file="WEB-INF/jspf/chamadas.jspf"%>
    </head>
    <body>    
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>
        <%@include file="WEB-INF/jspf/mensagem.jspf"%>
        <c:if test="${empty login}">
            <jsp:forward page="index.jsp"/>  
        </c:if>
        <div class="main">
            <div class="grid-30 mobile-grid-90">
                <c:choose>
                    <c:when test="${empty usuario}">
                        <h1>INCLUIR Funcionário</h1>
                        <form id="iusuario" action="IncluirUsuarioServlet" method="get">
                            <ul>
                                <li>
                                    <label for="Nome">Nome</label>
                                    <input type="text" name="inome" value="${param.nm_usuario}"/>
                                </li>
                                <li>
                                    <label for="Email">E-mail</label>
                                    <input type="text" name="iemail" value="${param.email_usuario}"/>
                                </li>
                                <li class="grid-parent grid-50">
                                    <label for="CPF">CPF</label>
                                    <input type="text" name="icpf" value="${param.cpf_usuario}"/>
                                </li>

                                <li class="grid-50">
                                    <label for="Tipo">Tipo</label>
                                    <select name="itipo">
                                        <option value="Atendente">Atendente</option>
                                        <option value="Administrador">Administrador</option>
                                    </select>
                                </li>                
                                <li>
                                    <a href="javascript:void(0);" onclick="window.history.back();" class="btn-back"><img src="imagens/back.png" />Voltar</a>
                                    <input type="submit" class="btn btn-outline verde"/>
                                </li>
                            </ul>
                        </form>   
                    </c:when>
                    <c:otherwise>
                    <h1>EDITAR Funcionário</h1>
                        <form id="usuarios" action="EditarUsuarioServlet" method="get">
                            <ul>
                                <li>
                                    <input type="hidden" name="id" value="${usuario.id_usuario}" readonly="readonly"/>
                                </li>                
                                <li>
                                    <label for="Nome">Nome</label>
                                    <input type="text" name="nome" value="${usuario.nm_usuario}"/>
                                </li>                
                                <li>
                                    <label for="Email">E-mail</label>
                                    <input type="text" name="email" value="${usuario.email_usuario}"/>
                                </li>                
                                <li class="grid-parent grid-50">
                                    <label for="CPF">CPF</label>
                                    <input type="number" name="cpf" id="cpf" value="${usuario.cpf_usuario}"/>
                                </li>                
                                <li class="grid-50">
                                    <label for="Tipo">Tipo</label>
                                    <select name="tipo">
                                        <option value="Atendente">Atendente</option>
                                        <option value="Administrador">Administrador</option>
                                    </select>
                                </li>                
                                <li>
                                    <a href="javascript:void(0);" onclick="window.history.back();" class="btn-back"><img src="imagens/back.png" />Voltar</a>
                                    <input type="submit" class="btn btn-outline verde"/>
                                </li>
                            </ul>
                        </form>   
                    </c:otherwise>
                </c:choose>  
            </div>
        </div>
    </body>
</html>