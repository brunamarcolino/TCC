<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="edu.dao.FilaDao" %>
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

        <title>Smartqueue - Login Adminstrador/ Atendente</title>
        
        <%@include file="WEB-INF/jspf/chamadas.jspf"%>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/mensagem.jspf" %>

        <c:choose>
            <c:when test="${empty login}">
                <section class="grid-25 mobile-grid-100 login">
                    <div class="grid-100 mobile-grid-100">
                        <h1>LOGIN</h1>
                        <h3>Entre com suas credenciais</h3>
                    </div>
                    <div class="grid-100 mobile-grid-100">
                        <form action="LoginServlet" method="post">
                            <ul>
                                <li>
                                    <label for="login">Login</label>
                                    <input type="text" name="login" value="${param.login}"/>
                                </li>
                                <li>
                                    <label for="senha">Senha</label>
                                    <input type="password" name="senha" value="${param.senha}"/>
                                </li>
                                <li>
                                    <a href="index.jsp" class="btn-back"><img src="imagens/back.png" />Voltar</a>
                                    <input type="submit" value="Login" class="btn btn-outline" />
                                </li>
                            </ul>
                        </form>
                        <a href="modal_esqueci_senha.jsp" class="forgot-pass">Esqueci minha senha</a>
                    </div>
                </section>
            </c:when>
            <c:otherwise>
                <header class="grid-100 mobile-grid-100">
                    <div class="grid-10 mobile-grid-50">
                         <h3>Smartqueue</h3>
                    </div>
                    <div class="grid-80 pull-left hide-on-mobile">
                        <c:if test="${not empty login}">  
                            <c:if test="${login.tipo_usuario=='Administrador'}">
                                <nav>
                                    <ul>
                                        <li>
                                            <a href="ListaUsuarioServlet">Gerenciar atendentes</a>
                                        </li>
                                        <li>
                                            <a href="NotificacaoServlet">Gerar Relatórios</a>
                                        </li>
                                        <li>
                                            <a href="ListaParametrosServlet">Parametros do Sistemas</a>
                                        </li>
                                    </ul>
                                </nav>
                            </c:if>        
                            <c:if test="${login.tipo_usuario=='Atendente'}">
                                <nav>
                                    <ul>
                                        <c:if test="${id_fila==0}">
                                            <li>
                                                <a href="ListaFilasServlet">Abrir Fila</a>
                                            </li>  
                                        </c:if>
                                        <c:if test="${id_fila>0}">
                                            <li>
                                                <a href="fechar_fila.jsp">Fechar Fila</a>
                                            </li>
                                            <li>
                                                <a href="chamar_proximo.jsp?habilitado=1">Atendimento</a>
                                            </li>                                            
                                        </c:if>
                                        <li>
                                            <a href="gerar_senha_local.jsp">Gerar Senha Local</a>
                                        </li>
                                    </ul>
                                </nav>
                            </c:if>   
                            <c:if test="${login.tipo_usuario=='Cliente'}">
                                <nav>
                                    <ul>
                                        <li>
                                            <a href="localizacao.jsp">Gerar Senha</a>                              
                                        </li>         
                                    </ul>
                                </nav>
                            </c:if>     
                        </c:if>        

                    </div>
                    <div class="grid-10 pull-right perfil">
                        <span>Olá, <strong>${login.nm_usuario}</strong></span>
                        <a href="LogoutServlet"><strong>(sair)</strong></a>                       
                    </div>   

                </header>
            </c:otherwise>        
        </c:choose>
    </body>
</html>