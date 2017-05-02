<%-- 
    Document   : gerar_senha_local
    Created on : 19/04/2017, 09:22:50
    Author     : casa
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
            <div class="grid-25 mobile-grid-100 section-center">
                <div class="box">
                    <h1>Gerar Próxima Senha</h1>
                    <h3>Caso precise, gere manualmente a próxima senha por aqui.</h3>
                </div>
                <form action="GerarSenhaLocalServlet" method="post">
                    <ul>
                        <li>
                            <label>Informe o nome do cliente</label>
                            <input type="text" name="nome_cliente" value="${param.nome_cliente}"/>
                        </li>
                        <li>
                            <label>Selecione o tipo de atendimento</label>
                            <select name="tipo_atendimento">
                                <option value="Normal">Normal</option>
                                <option value="Preferencial">Preferencial</option>
                            </select> <br>
                            <div class="senha-local">
                                <label>A senha do cliente é:</label>
                                <h2>${senha}</h2>
                            </div>
                        </li> 
                        <li>
                            <a href="" class="btn-back"><img src="imagens/back.png" />Voltar</a>
                            <input type="submit" value="Gerar Senha" class="btn btn-outline azul" />
                        </li>
                    </ul>
                </form>    
            </div>
        </div>
                        
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
