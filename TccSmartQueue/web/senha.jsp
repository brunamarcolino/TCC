<%-- 
    Document   : senha
    Created on : 03/03/2017, 19:20:03
    Author     : brunacm
--%>

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
    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>
        
        <div class="main">
            <div class="grid-75 gera-senha">
            <c:choose>  
                <c:when test="${empty dadossenha}">
                    <p>Nenhum dado!</p>
                </c:when>
                <c:otherwise>
                    <div class="grid-parent grid-50 info">
                        <div class="grid-100">
                            <p>Tempo médio de atendimento</p>
                            <h2>
                                <c:choose>
                                    <c:when test="${empty dadossenha.tempo_medio}">
                                        --
                                    </c:when>
                                    <c:otherwise>
                                        ${dadossenha.tempo_medio}
                                    </c:otherwise>
                                </c:choose>
                            </h2>
                        </div>
                        <!--<label>Ultima Senha Chamada</label>
                        <h2>{dadossenha.ultima_senha_atendida}</h2>

                        <label>Ultima Senha Gerada</label>
                        <h2>{dadossenha.ultima_senha_gerada}</h2>                
                        -->
                        <div class="grid-100">
                            <p>Quantidade de pessoas na Fila</p>
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
                    </div>
                </c:otherwise>
            </c:choose>
            <div class="grid-parent grid-50">
                <div class="grid-100">
                    <p>Clique abaixo para gerar a sua senha:</p>
                    <input type="button" value="Gerar Senha" onClick="window.location.href='login_cliente.jsp'">
                </div>
            </div>
            </div>
        </div>
       <%@include file="WEB-INF/jspf/rodape.jspf"%>
    </body>
</html>
