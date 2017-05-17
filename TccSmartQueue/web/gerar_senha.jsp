<%-- 
    Document   : gerar_senha
    Created on : 17/03/2017, 17:44:23
    Author     : Thiago Quintanilha
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<?xml version='1.0' encoding='UTF-8' ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
      xmlns:f="http://xmlns.jcp.org/jsf/core">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Gerenciador de filas">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>Smartqueue - Gerar senha</title>
        <%@include file="WEB-INF/jspf/chamadas.jspf"%>
        
    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>
        <%@include file="WEB-INF/jspf/mensagem.jspf"%>
        
        
        <div class="main">
            <div class="grid-75 gera-senha">
            <c:choose>  
                <c:when test="${empty senha}">
                    <META HTTP-EQUIV="Refresh" CONTENT="5;URL=index.jsp">
                </c:when>
                <c:otherwise>
                    <div class="grid-parent grid-50 mobile-grid-100 info">
                        <div class="grid-100 mobile-grid-100">
                            <p>Tempo médio de atendimento</p>
                            <h2>
                                <c:choose>
                                    <c:when test="${empty dadossenha.tempo_medio}">
                                        --
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:formatDate value="${dadossenha.tempo_medio}" type="time" pattern="HH:mm" dateStyle="full"/>
                                    </c:otherwise>
                                </c:choose>
                            </h2>
                        </div>                        
                        <div class="grid-100 mobile-grid-50">
                            <p>Quantidade de pessoas <br/>na sua frente</p>
                            <h2>
                                <c:choose>
                                    <c:when test="${empty dadossenha.quantidade_pessoas}">
                                        --
                                    </c:when>
                                    <c:otherwise>
                                        ${dadossenha.quantidade_pessoas}
                                    </c:otherwise>
                                </c:choose>
                            </h2>
                        </div>
                        <div class="grid-100 mobile-grid-50">
                            <p>Quantidade de Atendentes</p>
                            <h2>
                                <c:choose>
                                    <c:when test="${empty dadossenha.atendentes_ativos}">
                                        --
                                    </c:when>
                                    <c:otherwise>
                                        ${dadossenha.atendentes_ativos}
                                    </c:otherwise>
                                </c:choose>
                            </h2>
                        </div>                        
                        <div class="grid-100 mobile-grid-70">
                            <p>Previsão Atendimento <img src="imagens/icon.png" class="tooltip" />
                                <div class="tooltiptext">
                                    <span>É apenas uma previsão, não significa que você será atendido nesse horário.</span>
                                </div>
                            </p>
                            <h2>
                                <c:choose>
                                    <c:when test="${empty dadossenha.previsao_atendimento}">
                                        --
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:formatDate value="${dadossenha.previsao_atendimento}" type="time" pattern="HH:mm" dateStyle="full"/>
                                    </c:otherwise>
                                </c:choose>
                            </h2>
                        </div>
                    </div>
                    <div class="grid-parent grid-50">
                        <p>Sua Senha é </p>
                        <h1>${senha.id_senha}</h1>
                        <input type="button" value="Cancelar Senha" class="btn btn-outline vermelho" onClick="window.location.href='CancelarSenhaServlet?id_senha=${senha.id_senha}'">
                    </div>                                    
                </c:otherwise>
            </c:choose>
            </div>
        </div>
    </body>
</html>

