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
        
        <title>Smartqueue</title>
        <link rel="stylesheet" type="text/css" href="estilos/estilo.css" />
        <link rel="stylesheet" type="text/css" href="estilos/unsemantic-responsive.css" />
        <script type="text/javascript" src="script/jquery-3.2.0.min.js"></script>
        <script type="text/javascript" src="script/general.js"></script>
    </head>
    <body>    
        <div class="main">
            <div class="grid-100 mobile-grid-100">
                <h1>Esqueci minha senha</h1>
            </div>
            <div class="grid-50 mobile-grid-100">
                <p>Informe os dados abaixo</p>
                </br>
                    <form id="usuarios" action="EsqueciSenhaServlet" method="post">                    
                    <p>
                        <label for="Login">Login : </label>
                        <input type="text" name="login" value="${usuario.nm_usuario}"/>
                    </p>
                    <p>
                        <label for="Email">Email cadastrado: </label>
                        <input type="text" name="email" value="${usuario.email_usuario}"/>
                    </p>                                   
                    <p>
                        <input type="submit"/>
                    </p>
                    
                </form>       
            </div>
        </div>
    </body>
</html>