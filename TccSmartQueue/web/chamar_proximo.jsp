    <%-- 
    Document   : chamar_proximo
    Created on : 20/03/2017, 14:38:26
    Author     : Felipe
--%>
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
        <%@include file="WEB-INF/jspf/chamadas.jspf"%>
    </head>
    <body>
       
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>

        <%@include file="WEB-INF/jspf/mensagem.jspf" %>
        <div class="main">
            <div class="grid-parent grid-50 mobile-grid-100 center">
                <div class="grid-parent grid-100 box-atendente">
                    <div class="grid-60 mobile-grid-100">
                         
                        <ul>
                            <li>
                                <label>Atendente:</label>
                                <h2>${login.nm_usuario}</h2>
                            </li>
                            <li>
                                <label>Mesa:</label>
                                <h2>${id_fila}</h2>
                            </li>
                        </ul>
                    </div>
                    <div class="grid-40 mobile-grid-100">
                        <c:choose>
                            <c:when test="${param.habilitado==1}">
                                <a href="BuscarNomeESenhaServlet?id_usuario=${login.id_usuario}" class="btn btn-outline azul">Chamar próximo cliente</a>
                            </c:when>
                            <c:otherwise>
                                <input type="button" class="btn btn-outline" value="Chamar próximo" readonly="readonly"/>
                            </c:otherwise>   
                        </c:choose>        
                    </div>
                </div>
                <div class="grid-parent grid-100 box-cliente">
                    <div class="grid-60 mobile-grid-100">
                        <c:choose>
                            <c:when test="${empty senha}">
                                <ul>
                                    <li>
                                        <label>Senha :</label>
                                            --
                                    </li>
                                    <li>
                                        <label>Nome :</label>
                                            --
                                    </li>
                                    <li>
                                        <label>Tipo :</label>
                                            --
                                    </li>           
                                    <li>
                                        <label>Status :</label>
                                            --
                                    </li>                                    
                                </ul>                                
                            </c:when>
                            <c:otherwise>
                                <ul>
                                    <li>
                                        <label>Senha :</label>
                                        <h2>${senha.id_senha}</h2>
                                    </li>
                                    <li>
                                        <label>Nome :</label>
                                        <h2>${senha.nome_cliente}</h2>
                                    </li>
                                    <li>
                                        <label>Tipo :</label>
                                        <h2>${senha.tipo_atendimento}</h2>
                                    </li>           
                                    <li>
                                        <label>Status :</label>
                                        <h2>${senha.status_atendimento}</h2>
                                    </li> 
                                </ul>                                   
                            </c:otherwise>
                        </c:choose>
  
                    </div>
                    <div class="grid-40 mobile-grid-100 btn-group">
                        
                        <p>O cliente está presente?</p>
                        <c:choose>
                            <c:when test="${param.habilitado==2}">
                                <a href="ConfirmarPresencaServlet?senha=${senha.id_senha}&id_sequencia=${senha.id_sequencia}" class="btn btn-outline verde">Sim</a>
                                <a href="NaoConfirmarPresencaServlet?senha=${senha.id_senha}&status=${senha.status_atendimento}&id_sequencia=${senha.id_sequencia}" class="btn btn-outline vermelho">Não</a>                   
                            </c:when>
                            <c:otherwise>
                                <input type="button" class="btn btn-outline" value="Sim" readonly="readonly"/>
                                <input type="button" class="btn btn-outline" value="Não" readonly="readonly"/>
                            </c:otherwise>
                        </c:choose>        
                    </div>                    
                </div>
                <div class="grid-100 mobile-grid-100">
                    <c:choose>
                        <c:when test="${param.habilitado==3}">
                            <a href="FinalizarAtendimentoServlet?id_senha=${senha.id_senha}&id_sequencia=${senha.id_sequencia}" class="btn btn-outline azul" >Finalizar Atendimento</a>
                        </c:when>
                        <c:otherwise>
                            <input type="button" value="Finalizar Atendimento" class="btn btn-outline" readonly="readonly"/>
                        </c:otherwise>    
                    </c:choose>        
                </div>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
