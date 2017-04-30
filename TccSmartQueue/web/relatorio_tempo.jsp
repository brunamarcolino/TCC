<!-- 
    Document   : chart-example
    Created on : Apr 25, 2017, 8:34:51 AM
    Author     : thiago.quintanilha
-->


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
        <%@include file="WEB-INF/jspf/chamadas.jspf"%>
    </head>
    <body onload="generateChart()">
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>
        
        <%@include file="WEB-INF/jspf/mensagem.jspf"%>
        
        <div class="main">
            <div class="grid-75 mobile-grid-100 filtro section-center">
                <div class="grid-100">
                    <h1><span>Relatório /</span> Tempo de atendimento</h1>
                    <br/>
                </div>
                <form action="ChartTempoAtendimentoServlet" method="post">
                <ul>
                    <li class="grid-25">
                        <label>Data início</label>
                        <input type="date" name="data_inicio" />
                    </li>
                    <li class="grid-25">
                        <label>Data fim</label>
                        <input type="date" name="data_fim" />
                    </li>
                    <li class="grid-20">
                        <label>Atendente</label>
                        <select name="atendente">
                            <option>TODOS</option>
                            <c:forEach var="atendente" items="${atendentes}">
                                <option value="${atendente.id_usuario}">
                                    ${atendente.nm_usuario}
                                </option>
                                </c:forEach>
                            </select>
                        </select>
                    </li>
                    <li class="grid-30">
                        <input type="submit" class="btn btn-outline azul" value="Gerar"/>
                    </li>
                </ul>
            </form>
            </div>
        
            <!-- <canvas id="myChart" width="400" height="400"></canvas> -->
            <script type="text/javascript">
             var ctx = document.getElementById("myChart");

             function generateChart(){
                 var dataInicio = new Date(document.getElementById("dataInicio"));
                 var dataFim = new Date(document.getElementById("dataFim");


                 var myChart = new Chart(ctx, {
                     type: 'bar',
                     data: {
                         labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
                         datasets: [{
                             label: '# of Votes',
                             data: [dataInicio, dataFim, 3, 5, 2, 3]
                         }]
                     },
                     options: {
                         scales: {
                             yAxes: [{
                                 ticks: {
                                     beginAtZero:true
                                 }
                             }]
                         }
                     }
                 });
             }
             </script>
        </div>
        <%@include file="WEB-INF/jspf/rodape.jspf"%>
    </body>
</html>
