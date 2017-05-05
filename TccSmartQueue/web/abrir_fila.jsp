<%-- 
    Document   : abrir_fila
    Created on : 15/03/2017, 13:45:27
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
        
        <title>Smartqueue - Abrir fila</title>
        <%@include file="WEB-INF/jspf/chamadas.jspf"%>
    </head>
    <body>
        <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async='async'></script>
        <script type="text/javascript" src="script/notificacao.js"></script>
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>

        <%@include file="WEB-INF/jspf/mensagem.jspf" %>
        <div class="main">
            <div class="grid-25 mobile-grid-100 section-center">
                <div class="box">
                    <h1>Abrir fila</h1>
                    <h3>Inicie suas atividades abrindo a fila</h3>
                </div>
                <form action="AbrirFilaServlet?login_usuario=${login.id_usuario}" method="post">
                    <c:choose>
                        <c:when test="${empty filas}">
                            <ul>
                                <li>
                                    Todas as mesas est�o ocupadas!
                                </li>
                                <li>
                                     <a href="javascript:void(0);" onclick="window.history.back();" class="btn-back"><img src="imagens/back.png" />Voltar</a>
                                </li>
                            </ul>    
                        </c:when>    
                        <c:otherwise>
                     <ul>
                        <li>
                            <select name="fila">
                                <c:forEach var="fila" items="${filas}">
                                <option value="${fila.id_fila}">
                                    Mesa ${fila.id_fila}
                                </option>
                                </c:forEach>
                            </select>
                            
                        </li>
                        <li>
                            <a href="javascript:void(0);" onclick="window.history.back();" class="btn-back"><img src="imagens/back.png" />Voltar</a>
                            <input type="submit" value="Abrir Fila" class="btn btn-outline" />
                        </li>
                                 
                    </ul>
                     </c:otherwise>
                      </c:choose>       
                </form>    
            </div>
        </div>
    </body>
</html>

