<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="edu.vo.Parametro" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <title>Parametro</title>
    </head>
    <body>    
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>

        <c:if test="${empty login}">

            <jsp:forward page="index.jsp"/>  

        </c:if>

        <c:choose>
            <c:when test="${empty parametros}">
                <p>Nenhum parametro cadastrado!</p>
            </c:when>
            <c:otherwise>
                
                <table border="1">
                    <tr>
                        <th>Descrição</th>
                        <th>Valor</th>
                        <th>Ação</th>
                    </tr>

                    <c:forEach var="parametro" items="${parametros}">    
                        <tr>
                            <td>      
                                ${parametro.desc_parametro}
                            </td>
                            <td>      
                                <input type="text" name="valor_parametro2" value="${parametro.valor_parametro}"/>
                            </td>
                            <!--document.getElementById('valor_parametro2').value-->
                            <td>  
                                <a href="ParametroServlet?id_parametro=+${parametro.id_parametro}&valor_parametro=+${parametro.valor_parametro}">Editar</a>   
                            </td>
                        </tr>
                    </c:forEach>
                </table>  
            </c:otherwise>
        </c:choose>
    </body>
</html>