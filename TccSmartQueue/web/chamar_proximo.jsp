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
        <link rel="stylesheet" type="text/css" href="estilos/estilo.css" />
        <link rel="stylesheet" type="text/css" href="estilos/unsemantic-responsive.css" />
        <script type="text/javascript" src="script/jquery-3.2.0.min.js"></script>
        <script type="text/javascript" src="script/general.js"></script>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>

        <%@include file="WEB-INF/jspf/mensagem.jspf" %>
        <div class="main">
            <div class="grid-25 mobile-grid-100 center">
                <form action="ChamarProximoServlet" method="post">
                    <h2>Carlos Henrique</h2>
                    <h3>1</h3>
                    
                    <input type="submit" value="Confirmar Presença" class="btn-outline" />
                    <input type="submit" value="Não Confirmar Presença" class="btn-outline" />
                </form>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
