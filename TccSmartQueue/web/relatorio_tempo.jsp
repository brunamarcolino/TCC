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
                    <li>
                        <input type="text" name="valor_x" id="valor_x" value="${valor_x}" />
                        <input type="text" name="valor_y" id="valor_y" value="${valor_y}" />
                        <input type="text" name="valor_tooltip" id="valor_tooltip" value="${valor_tooltip}" />
                    </li>
                </ul>
            </form>
                    
                    
            <canvas id="myChart" style="display:none;" width="400" height="400"></canvas>
            <script type="text/javascript">
            $(document).ready(function(){
                var valor_x = $('input#input_x');
                var valor_y = $('input#input_y');
                var valor_tooltip = $('input#input_tooltip');
                
                if(valor_x != "" && valor_y != "" && valor_tooltip != ""){
                    $("myChart").show();
                    var ctx = document.getElementById("myChart");
                    var myChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: [valor_y],
                            datasets: [{
                                label: '# of Votes',
                                data: [valor_x],
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(255, 206, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)',
                                    'rgba(153, 102, 255, 0.2)',
                                    'rgba(255, 159, 64, 0.2)'
                                ],
                                borderColor: [
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)'
                                ],
                                borderWidth: 1
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
            
            });
            </script>
            </div>
        </div>
    </body>
</html>
