<%-- 
    Document   : fechar_fila
    Created on : 20/03/2017, 15:12:24
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
            <div class="grid-35 mobile-grid-100 center">
                <div class="box">
                    <h1>Fechar fila</h1>
                </div>
                <form action="FecharFilaServlet?login_usuario=${login.id_usuario}" method="post">
                    <ul>
                        <li> 
                            <h3>Tem certeza que deseja fechar sua fila?</h3>              
                        </li>
                        <li class="btn-group">
                            <a href="" class="btn btn-outline vermelho">Não</a>
                            <input type="submit" value="Sim" class="btn btn-outline" />
                        </li>
                    </ul>
                </form>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>

