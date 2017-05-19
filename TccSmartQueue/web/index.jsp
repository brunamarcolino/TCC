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

        <title>Smartqueue - Bem-vindo</title>
        
        <%@include file="WEB-INF/jspf/chamadas.jspf"%>
    </head>
    <body>
        <c:choose>
            <c:when test="${empty login}">
                <div class="image"></div> 
                <section class="grid-75 grid-parent mobile-grid-90 section-center">
                    <div class="grid-100 mobile-grid-100">
                        <h1 class="title-home">SMARTQUEUE</h1>
                        <h2 class="subtitle-home">Seja bem-vindo!</h2>
                    </div>
                </section>
                <section class="grid-75 grid-parent mobile-grid-90 section-center">
                    <div class="grid-50 mobile-grid-100 border">
                        <img src="imagens/cliente.png" />
                        <h2>Sou cliente</h2>
                        <p>Clique abaixo para escolher a sua senha e entrar na fila o quanto antes!</p>
                        <a href="localizacao.jsp" class="btn btn-outline branco">Quero tirar minha senha</a>
                        <hr class="hide-on-desktop"/>
                    </div>
                    <div class="grid-50 mobile-grid-100">
                        <img src="imagens/admin.png" />
                        <h2>Sou administrador ou atendente</h2>
                        <p>Gerenciamento de filas, parâmetros, atendimentos, entre outros, clique abaixo!</p>
                        <a href="login_adm.jsp" class="btn btn-outline branco">Entrar no painel</a>
                    </div>
                </section>
            </c:when>
            <c:otherwise>
                <header class="grid-100 mobile-grid-100">
                    <div class="grid-70 mobile-grid-85">
                        <a href="index.jsp" title="Smartqueue"><h3 class="title-home">Smartqueue</h3></a>
                    </div>
                    <div class="grid-30 mobile-grid-15 pull-right perfil">
                        <div class="grid-90 hide-on-mobile">
                            <c:choose>
                                <c:when test="${empty login.nm_usuario}">
                                    <span>Olá, <strong>Cliente</strong></span>
                                 </c:when>
                                <c:otherwise>
                                    <span>Olá, <strong>${login.nm_usuario}</strong></span>
                                </c:otherwise>        
                            </c:choose>
                        </div>
                        <div class="grid-10">
                            <a href="LogoutServlet" title="Sair"><strong><img src="imagens/logout.png" /></strong></a> 
                        </div>
                    </div>
                </header>
                
                <%@include file="WEB-INF/jspf/mensagem.jspf" %>
                
                <div class="main">
                    <%@include file="WEB-INF/jspf/menu_home.jspf" %>
                </div>
            </c:otherwise>        
        </c:choose>
    </body>
</html>