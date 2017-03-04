<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="estilos/estilo.css"/>
    </head>
    <body>  
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>

        <%@include file="WEB-INF/jspf/mensagem.jspf" %>

        <c:if test="${not empty login}">  
            <c:if test="${login.tipo_usuario=='Administrador'}">
                <ul>
                    <li>
                        <a href="ListaParametrosServlet">Gerenciar atendentes</a>
                    </li>         
                </ul>
                <ul>
                    <li>
                        <a href="ListaParametrosServlet">Gerar Relatórios</a>
                    </li>         
                </ul>
                <ul>
                    <li>
                        <a href="ListaParametrosServlet">Parametros do Sistemas</a>
                    </li>         
                </ul>
                </form> 
            </c:if>        
            <c:if test="${login.tipo_usuario=='Atendente'}">
                <ul>
                    <li>
                        <a href="">Abrir Fila</a>
                    </li>         
                </ul>
                </form> 
            </c:if>   
            <c:if test="${login.tipo_usuario=='Cliente'}">
                <ul>
                    <li>
                        <a href="ListaSenhaServlet">Gerar Senha</a>
                    </li>         
                </ul>
                </form> 
            </c:if>     
</c:if>                
                
    </body>
</html>