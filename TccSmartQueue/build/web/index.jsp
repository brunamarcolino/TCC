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
        <%@include file="WEB-INF/jspf/mensagem.jspf" %>
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
                    <div class="grid-25 mobile-grid-100">
                        <a href="index.jsp" title="Smartqueue"><h3 class="title-home">Smartqueue</h3></a>
                    </div>
                    <div class="grid-25 pull-right perfil hide-on-mobile">
                        <c:choose>
                            <c:when test="${empty login.nm_usuario}">
                                <span>Olá, <strong>Cliente</strong></span>
                             </c:when>
                            <c:otherwise>
                                <span>Olá, <strong>${login.nm_usuario}</strong></span>
                            </c:otherwise>        
                        </c:choose>
                        <a href="LogoutServlet"><strong>(sair)</strong></a>                       
                    </div>
                </header>
                <div class="main">
                    <div class="grid-75 mobile-grid-100 section-center menu-home">
                        <div class="grid-100 mobile-grid-100">
                            <h1>Bem-vindo!</h1>
                            <h3>Navegue nas funcionalidades através do menu abaixo:</h3>
                            <br class="hide-on-mobile" />
                        </div>
                        <c:if test="${not empty login}">
                            <c:if test="${login.tipo_usuario=='Administrador'}">
                                <ul>
                                    <li class="grid-25 mobile-grid-50">
                                        <a href="ListaUsuarioServlet">
                                            <img src="imagens/admin.png" />
                                            <h3>Funcionários</h3>
                                        </a>
                                    </li>
                                    <li class="grid-25 mobile-grid-50">
                                        <a href="ListaParametrosServlet">
                                            <img src="imagens/parametros.png" />
                                            <h3>Parâmetros do sistemas</h3>
                                        </a>
                                    </li>
                                    <li class="grid-25 mobile-grid-50">
                                        <div>
                                        <img src="imagens/relatorios.png" />
                                        <h3>Relatórios</h3>
                                        <ul>
                                            <li>
                                                <a href="ListaChartServlet?tipo=1">
                                                    Tempo de atendimento
                                                </a>
                                            </li>
                                            <li>
                                                <a href="ListaChartServlet?tipo=2">
                                                    Produtividade
                                                </a>
                                            </li>
                                        </ul>
                                        </div>
                                    </li>    
                                    <li class="grid-25 mobile-grid-50">
                                        <a href="PainelServlet">
                                            <img src="imagens/painel.png" />
                                            <h3>Painel de senhas</h3>
                                        </a>
                                    </li>
                                </ul>
                            </c:if>        
                            <c:if test="${login.tipo_usuario=='Atendente'}">
                                <ul>
                                    <c:if test="${id_fila==0}">
                                        <li class="grid-25 mobile-grid-50">
                                            <a href="ListaFilasServlet">
                                                <img src="imagens/abrir.png" />
                                                <h3>Abrir fila</h3>
                                            </a>
                                        </li>  
                                    </c:if>
                                    <c:if test="${id_fila>0}">
                                        <li class="grid-25 mobile-grid-50">
                                            <a href="fechar_fila.jsp">
                                                <img src="imagens/fechar.png" />
                                                <h3>Fechar fila</h3>
                                            </a>
                                        </li>
                                        <li class="grid-25 mobile-grid-50">
                                            <a href="chamar_proximo.jsp?habilitado=1">
                                                <img src="imagens/atendimento.png" />
                                                <h3>Atendimento</h3>
                                            </a>
                                        </li>                                            
                                    </c:if>
                                    <li class="grid-25 mobile-grid-50">
                                        <a href="gerar_senha_local.jsp">
                                            <img src="imagens/gerar-senha.png" />
                                            <h3>Gerar senha local</h3>
                                        </a>
                                    </li>
                                    <li class="grid-25 mobile-grid-50">
                                        <a href="PainelServlet">
                                            <img src="imagens/painel.png" />
                                            <h3>Painel de senhas</h3>
                                        </a>
                                    </li>
                                </ul>
                            </c:if>    
                        </c:if>
                    </div>
                </div>
            </c:otherwise>        
        </c:choose>
    </body>
</html>