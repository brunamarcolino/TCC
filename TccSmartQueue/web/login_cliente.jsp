<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <title>Login</title>
        
        <%@include file="WEB-INF/jspf/chamadas.jspf"%>
    </head>
    <body>
        <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async='async'></script>
        <script type="text/javascript" src="script/notificacao.js"></script>
        
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>

        <%@include file="WEB-INF/jspf/mensagem.jspf" %>
        <div class="grid-25 mobile-grid-100 center">
            <div class="box">
                <h1>Login Cliente</h1>
                <p>Para que possamos garantir a segurança da sua senha, por favor preencha o formulário abaixo:</p>
            </div>
            <form name="gerasenha" action="GeraSenhaServlet?tipo_atendimento=${param.tipo_atendimento}" method="post">                
                <input type="hidden"  name="notifica">
                <ul>
                    <li>
                        <label for="nomecliente">Nome : </label>
                        <input type="text" name="cliente" value="${param.cliente}"/>
                    </li>
                    <li>
                        <label for="cpfcliente">CPF : </label>
                        <input type="number" name="cpf" id="cpf" value="${param.cpf}"/>
                    </li>
                    <li>
                        <label for="emailcliente">Email : </label>
                        <input type="text" name="email" id="email" value="${param.email}"/>
                    </li>
                    <li>
                        <label for="senha">Senha :</label>
                        <input type="password" name="senhacliente" value="${param.senhacliente}"/>
                    </li>
                    <li>
                        <a href="" class="btn-back"><img src="imagens/back.png" />Voltar</a>
                        <input type="submit" value="Entrar" class="btn btn-outline" />
                    </li>
                </ul>
            </form>
        </div>
                    
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>