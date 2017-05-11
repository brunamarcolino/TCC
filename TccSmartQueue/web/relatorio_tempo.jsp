<!-- 
    Document   : chart-example
    Created on : Apr 25, 2017, 8:34:51 AM
    Author     : thiago.quintanilha
-->


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>SmartQueue - Relatório/ Tempo de atendimento</title>
        <%@include file="WEB-INF/jspf/chamadas.jspf"%>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>
        
        <%@include file="WEB-INF/jspf/mensagem.jspf"%>
        
        <div class="main">
            <div class="grid-75 mobile-grid-100 relatorio filtro section-center">
                <div class="grid-100">
                    <h1><span>Relatório /</span> Tempo de atendimento </h1>
                    <br/>
                </div>
                <form action="ChartTempoAtendimentoServlet" method="post" class="grid-parent grid-100">
                <ul>
                    <li class="grid-20">
                        <label>Data início</label>
                        <input type="date" name="data_inicio" value="${data_inicio}"/>
                    </li>
                    <li class="grid-20">
                        <label>Data fim</label>
                        <input type="date" name="data_fim" value="${data_fim}"/>
                    </li>
                    <li class="grid-25">
                        <label>Atendente</label>
                        <select name="atendente">
                            <option selected="selected">${ate}</option>
                           <option>TODOS</option>
                            <c:forEach var="atendente" items="${atendentes}">
                                <option value="${atendente.id_usuario}">
                                    ${atendente.nm_usuario}
                                </option>
                            </c:forEach>
                        </select>
                    </li>
                    <li class="grid-15">
                        <label>Tipo de gráfico</label>
                        <select id="tipo_grafico" name="tipo_grafico">
                            <option selected="selected">${tipo_grafico}</option>
                            <option>Barras</option>
                            <option>Linhas</option>
                            <option>Pizza</option>
                           <option>Polar</option>
                        </select>
                    </li>
                    <li class="grid-15">
                        <input type="submit" class="btn btn-outline azul" value="Gerar"/>
                    </li>
                    <li>
                        <input type="hidden" name="valor_x" id="valor_x" value="${valor_x}" />
                        <input type="hidden" name="valor_y" id="valor_y" value="${valor_y}" />
                    </li>
                </ul>
            </form>
                    
                  
            <canvas id="myChart"></canvas>
            <script type="text/javascript">
            $(document).ready(function(){
                var valor_x = $('input#valor_x').val();
                var array_x = $('input#valor_x').val().split(',');
                
                var valor_y = $('input#valor_y').val();
                var array_y = $('input#valor_y').val().split(',');
                
                var tipo_grafico = $('select#tipo_grafico option:selected').text();
                
                if(valor_x != "" && valor_y != "" && tipo_grafico != ""){
                    $("myChart").show();
                    var ctx = $("#myChart");
                    
                    if(tipo_grafico == 'Barras'){
                        var myChart = new Chart(ctx, {
                            type: 'bar',
                            data: {
                                labels: array_y,
                                datasets: [{
                                    label: 'Tempo médio (em minutos)',
                                    data: array_x,
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
                    }else if(tipo_grafico == 'Polar'){
                        var myChart = new Chart(ctx, {
                            type: 'polarArea',
                            data: {
                                datasets: [{
                                    data: array_x,
                                    backgroundColor: [
                                        'rgba(255, 99, 132, 0.2)',
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(255, 206, 86, 0.2)',
                                        'rgba(75, 192, 192, 0.2)',
                                        'rgba(153, 102, 255, 0.2)',
                                        'rgba(255, 159, 64, 0.2)'
                                    ],
                                    label: 'Tempo médio (em minutos)' // for legend
                                }],
                                labels: array_y
                            }
                        })
                    }else if(tipo_grafico == 'Pizza'){
                        var myChart = new Chart(ctx, {
                            type: 'pie',
                            data: {
                                labels: array_y,
                                datasets: [{
                                    label: 'Tempo médio (em minutos)',
                                    data: array_x,
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
                    }else if(tipo_grafico == 'Linhas'){
                        var myChart = new Chart(ctx, {
                            type: 'line',
                            data: {
                                labels: array_y,
                                datasets: [{
                                    label: 'Tempo médio (em minutos)',
                                    data: array_x,
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
                }
            
            });
            </script>
            </div>
        </div>
    </body>
</html>
