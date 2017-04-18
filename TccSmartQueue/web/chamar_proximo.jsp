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
                    <div class="grid-30 mobile-grid-100">
                         
                        <ul>
                            <li>
                                <label>Atendente:</label>
                                <h2>${login.nm_usuario}</h2>
                            </li>
                            <li>
                                <label>Mesa:</label>
                                <h2>03</h2>
                            </li>
                        </ul>
                    </div>
                    <div class="grid-70 mobile-grid-100">
                        <a href="BuscarNomeESenhaServlet" class="btn btn-outline">Chamar próximo cliente</a>
                    </div>
                </div>
                <div class="grid-parent grid-100 box-cliente">
                    <div class="grid-60 mobile-grid-100">
                       
                        
                            <ul>
                                <li>
                                    <label>Cliente:</label>
                                    <h2>${nome_cliente}</h2>
                                </li>
                                <li>
                                    <label>Senha:</label>
                                    <h2>${senha}</h2>
                                </li>
                            </ul>
                        
                    </div>
                    <div class="grid-40 mobile-grid-100 btn-group">
                        <p>O cliente está presente?</p>
                        <a href="ConfirmarPresencaServlet" class="btn btn-outline verde">Sim</a>
                        <a href="NaoConfirmarPresencaServlet" class="btn btn-outline vermelho">Não</a>                   
                    </div>
                    
                </div>
                <div class="grid-100 mobile-grid-100">
                    <a href="FinalizarAtendimentoServlet" class="btn btn-outline" >Finalizar Atendimento</a>
                </div>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
