<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="edu.vo.Parametro" %>
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
        <%@include file="WEB-INF/jspf/chamadas.jspf"%>
    </head>
    <body>    
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>
        <%@include file="WEB-INF/jspf/mensagem.jspf"%>
        <c:if test="${empty login}">
            <jsp:forward page="index.jsp"/>
        </c:if>
        <div class="main">
            <div class="grid-25 mobile-grid-100">
                <c:choose>
                    <c:when test="${empty parametro}">
                   
                    </c:when>
                    <c:otherwise>
                        <h1>EDITAR PARAMETROS</h1>
                        <form id="parametros" action="EditarParametroServlet" method="get">
                            <ul>
                                <li>
                                    <input type="hidden" name="id" value="${parametro.id_parametro}" readonly="readonly"/>
                                </li>    
                                <li>
                                    <label for="Descricao">Descricao : </label>
                                    <input type="text" name="descricao" value="${parametro.desc_parametro}" readonly="readonly"/>
                                </li>
                                <li>
                                    <label for="Valor">Valor : </label>
                                    <c:choose>
                                        <c:when test="${parametro.id_parametro=='1'}">
                                            <select name="valor_1">
                                                <option value="24H">24H</option>
                                                <option value="DETERMINADO">DETERMINADO</option>
                                            </select>    
                                        </c:when>
                                        <c:when test="${parametro.id_parametro=='5'}">
                                            <select name="valor_5">
                                                <option value="SIM">SIM</option>
                                                <option value="NAO">NAO</option>
                                            </select>    
                                        </c:when>
                                        <c:when test="${parametro.id_parametro=='6'}">
                                            <input type="number" name="valor_6" value="${parametro.valor_parametro}"/>
                                        </c:when>    
                                        <c:when test="${parametro.id_parametro=='7'}">
                                            <input type="number" name="valor_7" value="${parametro.valor_parametro}"/>
                                        </c:when>
                                        <c:when test="${parametro.id_parametro=='8'}">
                                            <input type="text" name="valor_8" value="${parametro.valor_parametro}"/>
                                        </c:when>    
                                        <c:otherwise>
                                            <!--FORMATA HORA-->
                                            <select name="valor_2">
                                                <option value="00:00">00:00</option>
                                                <option value="01:00">01:00</option>
                                                <option value="02:00">02:00</option>
                                                <option value="03:00">03:00</option>
                                                <option value="04:00">04:00</option>
                                                <option value="05:00">05:00</option>
                                                <option value="06:00">06:00</option>
                                                <option value="07:00">07:00</option>
                                                <option value="08:00">08:00</option>
                                                <option value="09:00">09:00</option>
                                                <option value="10:00">10:00</option>
                                                <option value="11:00">11:00</option>
                                                <option value="12:00">12:00</option>
                                                <option value="13:00">13:00</option>
                                                <option value="14:00">14:00</option>
                                                <option value="15:00">15:00</option>
                                                <option value="16:00">16:00</option>
                                                <option value="17:00">17:00</option>
                                                <option value="18:00">18:00</option>
                                                <option value="19:00">19:00</option>
                                                <option value="20:00">20:00</option>
                                                <option value="21:00">21:00</option>
                                                <option value="22:00">22:00</option>
                                                <option value="23:00">23:00</option>
                                            </select>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                                <li>
                                    <a href="" class="btn-back"><img src="imagens/back.png" />Voltar</a>
                                    <input type="submit" class="btn btn-outline verde" />
                                </li>
                            </ul>
                        </form>   
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <%@include file="WEB-INF/jspf/rodape.jspf"%>
    </body>
</html>