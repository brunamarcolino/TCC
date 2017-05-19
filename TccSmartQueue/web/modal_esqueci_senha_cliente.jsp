<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<?xml version='1.0' encoding='UTF-8' ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
      xmlns:f="http://xmlns.jcp.org/jsf/core">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Gerenciador de filas">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>Smartqueue - Esqueci minha senha</title>
        <%@include file="WEB-INF/jspf/chamadas.jspf"%>
    </head>
    <body>   
        <%@include file="WEB-INF/jspf/mensagem.jspf" %>
        <div class="main">
            <div class="grid-25 mobile-grid-90">
                <h1>Esqueci minha senha</h1>
                <h3>Informe os dados abaixo</h3>
            </div>
            <div class="grid-25 mobile-grid-90">
                <form id="usuarios" action="EsqueciSenhaClienteServlet" method="post">
                    <ul>
                        <li>
                            <label for="cpf">CPF</label>
                            <input type="text" name="cpf" id="cpf"/>
                        </li>
                        <li>
                            <label for="Email">E-mail cadastrado</label>
                            <input type="text" name="email"/>
                        </li>                                   
                        <li>
                            <a href="login_cliente.jsp" class="btn-back"><img src="imagens/back.png" />Voltar</a>
                            <input type="submit" class="btn btn-outline verde" value="Alterar"/>
                        </li>
                    </ul>
                </form>       
            </div>
        </div>
    </body>
</html>