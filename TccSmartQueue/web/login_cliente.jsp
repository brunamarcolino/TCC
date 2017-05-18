<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Gerenciador de filas">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Smartqueue - Cadastro</title>
        
        <%@include file="WEB-INF/jspf/chamadas.jspf"%>
    </head>
    <body>
        <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async='async'></script>
        <script type="text/javascript" src="script/notificacao.js"></script>
        
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>

        <%@include file="WEB-INF/jspf/mensagem.jspf" %>
        <div class="main">
            <div class="grid-25 mobile-grid-90 section-center">
                <div class="box">
                    <h1>Cadastro Cliente  <img src="imagens/icon.png" class="tooltip_title" />
                        <div class="tooltiptext_title">
                            <span>Você já possui senha gerada? Não se preocupe! Se você digitar os mesmos dados recupera a senha gerada na primeira vez.</span>
                        </div>
                   </h1>
                    <p>Para recuperar sua senha gerada ou gerar uma nova senha, por favor preencha o formulário abaixo:</p>
                </div>
                <form name="gerasenha" action="GeraSenhaServlet?tipo_atendimento=${param.tipo_atendimento}" method="post">                
                    <input type="hidden"  name="notifica">
                    <ul>
                        <li>
                            <label for="nomecliente">Nome</label>
                            <input type="text" name="cliente" value="${param.cliente}"/>
                        </li>
                        <li>
                            <label for="cpfcliente">CPF</label>
                            <input type="text" name="cpf" id="cpf" value="${param.cpf}"/>
                        </li>
                        <li>
                            <label for="emailcliente">E-mail </label>
                            <input type="text" name="email" id="email" value="${param.email}"/>
                        </li>
                        <li>
                            <label for="senha">Senha <img src="imagens/icon.png" class="tooltip" />
                                <div class="tooltiptext">
                                    <h4>Políticas de segurança:</h4>
                                    <span>A senha deve conter no mínimo 6 caractares sendo eles:</span>
                                    <ul>
                                        <li>Letras (a-z)</li>
                                        <li>Números (0-9)</li>
                                    </ul>
                                </div>
                           </label>
                            <input type="password" name="senhacliente" value="${param.senhacliente}"/>
                        </li>
                        <li>
                            <a href="" class="btn-back"><img src="imagens/back.png" />Voltar</a>
                            <input type="submit" value="Entrar" class="btn btn-outline verde" />
                        </li>
                    </ul>
                    <a href="modal_esqueci_senha_cliente.jsp" class="forgot-pass">Esqueci minha senha</a>
                </form>
            </div>
        </div>
    </body>
</html>