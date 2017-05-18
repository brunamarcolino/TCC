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
        
        <title>Smartqueue - Gerenciar parâmetros</title>
        <%@include file="WEB-INF/jspf/chamadas.jspf"%>
    </head>
    <body>    
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>
        <%@include file="WEB-INF/jspf/mensagem.jspf"%>
        <c:if test="${empty login}">
            <jsp:forward page="index.jsp"/>
        </c:if>
        <div class="main">
            <div class="grid-25 mobile-grid-90">
                <c:choose>
                    <c:when test="${empty parametro}">
                   
                    </c:when>
                    <c:otherwise>
                        <h1>EDITAR PARÂMETROS</h1>
                        <form id="parametros" action="EditarParametroServlet" method="get">
                            <ul>
                                <li>
                                    <input type="hidden" name="id" value="${parametro.id_parametro}" readonly="readonly"/>
                                </li>    
                                <li>
                                    <label for="Descricao">Descrição</label>
                                    <p>${parametro.desc_parametro}  <img src="imagens/icon.png" class="tooltip parametros" />
                                        <div class="tooltiptext">
                                            <c:choose>
                                                <c:when test="${parametro.id_parametro=='1'}">
                                                    <span>Esse parâmetro você define o horário do seu estabelecimento, se ele é 24 horas ou tem um horário determinado.</span>
                                                </c:when>
                                                <c:when test="${parametro.id_parametro=='5'}">
                                                    <span>Aqui você decide se os cliente terão uma segunda chance ou não. Marcando a opção "sim", caso o usuário perca sua vez, ele será direcionado ao final da fila, e chamado novamente quando chegar a sua vez.</span>
                                                </c:when>
                                                <c:when test="${parametro.id_parametro=='6'}">
                                                    <span>Quantidade de postos de atendimento existentes em seu estabelecimento.</span>
                                                </c:when>    
                                                <c:when test="${parametro.id_parametro=='7'}">
                                                    <span>Esse parâmetro servirá para você definir um raio (em quilômetros) no qual o usuário poderá solicitar uma senha de atendimento.</span>
                                                </c:when>
                                                <c:when test="${parametro.id_parametro=='8'}">
                                                    <span>Adicione o endereço do seu estabelecimento aqui para que possa ser calculado a distância do cliente em relação estabelecimento.</span>
                                                </c:when> 
                                                <c:when test="${parametro.id_parametro=='3'}">
                                                    <span>Horário em que o seu expediente se inicia, ou que o postos de atendimento são abertos.</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span>Horário em que o seu expediente se encerra, ou que o postos de atendimento são fechados.</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </p>
                                </li>
                                <li>
                                    <label for="Valor">Valor</label>
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
                                    <a href="javascript:void(0);" onclick="window.history.back();" class="btn-back"><img src="imagens/back.png" />Voltar</a>
                                    <input type="submit" class="btn btn-outline verde" />
                                </li>
                            </ul>
                        </form>   
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </body>
</html>