<!-- 
    Document   : chart-example
    Created on : Apr 25, 2017, 8:34:51 AM
    Author     : thiago.quintanilha
-->


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>SmartQueue - Relatório/ Produtividade</title>
        <%@include file="WEB-INF/jspf/chamadas.jspf"%>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>
        
        <%@include file="WEB-INF/jspf/mensagem.jspf"%>
        
        <div class="main">
            <div class="grid-90 mobile-grid-100 relatorio filtro section-center">
                <div class="grid-100">
                    <h1><span>Relatório /</span> Produtividade</h1>
                    <br/>
                </div>
                <form action="ChartProdutividadeServlet" method="post" class="grid-parent grid-100">
                    <ul>
                    <li class="grid-20">
                        <label>Data início</label>
                        <input type="date" name="data_inicio" value="${data_inicio}"/>
                    </li>
                    <li class="grid-20">
                        <label>Data fim</label>
                        <input type="date" name="data_fim" value="${data_fim}"/>
                    </li>
                    <li class="grid-20">
                        <label>Atendente</label>
                        <select name="atendente">                           
                           <option>TODOS</option>
                            <c:forEach var="atendente" items="${atendentes}">
                                <c:if test="${atendente.nm_usuario}='TODOS'"><option>passou</option></c:if>
                                <option value="${atendente.id_usuario}"  ${atendente.nm_usuario == ate ? 'selected' : ''}>
                                    ${atendente.nm_usuario}
                                </option>
                            </c:forEach>
                        </select>
                    </li>
                    <li class="grid-20">
                        <label>Tipo de gráfico</label>
                        <select id="tipo_grafico" name="tipo_grafico">
                            <option ${tipo_grafico == 'Linhas' ? 'selected' : ''}>Linhas</option>
                            <option ${tipo_grafico == 'Barras' ? 'selected' : ''}>Barras</option>
                            <option ${tipo_grafico == 'Pizza' ? 'selected' : ''}>Pizza</option>
                           <option ${tipo_grafico == 'Polar' ? 'selected' : ''}>Polar</option>
                        </select>
                    </li>
                    <li class="grid-20">
                        <input type="submit" class="btn btn-outline azul" value="Gerar"/>
                    </li>
                    <li>
                        <input type="hidden" name="valor_x" id="valor_x" value="${valor_x}" />
                        <input type="hidden" name="valor_y" id="valor_y" value="${valor_y}" />
                    </li>
                </ul>
                </form>
                <div class="grid-75 grafico">
                    <canvas id="myChart"></canvas>
                </div>
                <div class="grid-50 grafico_circular">
                    <canvas id="myCircleChart"></canvas>
                </div>
                <script type="text/javascript">
                $(document).ready(function(){
                    var valor_x = $('input#valor_x').val();
                    var array_x = $('input#valor_x').val().split(',');

                    var valor_y = $('input#valor_y').val();
                    var array_y = $('input#valor_y').val().split(',');

                    var tipo_grafico = $('select#tipo_grafico option:selected').text();

                    if(valor_x != "" && valor_y != "" && tipo_grafico != ""){
                        $("myChart").show();
                        var ctx = $('#myChart');
                        var ctx_2 = $('#myCircleChart');

                        if(tipo_grafico == 'Barras'){
                            $('#myCircleChart').hide();
                            var myChart = new Chart(ctx, {
                                type: 'bar',
                                data: {
                                    labels: array_y,
                                    datasets: [{
                                        label: 'Quantidade de atendimentos',
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
                                    responsive: true,
                                    scales: {
                                        yAxes: [{
                                            ticks: {
                                                beginAtZero:true
                                            }
                                        }]
                                    },
                                }
                            });
                        }else if(tipo_grafico == 'Polar'){
                            $('#myChart').hide();
                            var myChart = new Chart(ctx_2, {
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
                                        label: 'Quantidade de atendimentos' // for legend
                                    }],
                                    labels: array_y
                                },
                                options: {
                                    responsive: true
                                }
                            })
                        }else if(tipo_grafico == 'Pizza'){
                            $('#myChart').hide();
                            var myChart = new Chart(ctx_2, {
                                type: 'pie',
                                data: {
                                    labels: array_y,
                                    datasets: [{
                                        label: 'Quantidade de atendimentos',
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
                                    responsive: true
                                }
                            });
                        }else if(tipo_grafico == 'Linhas'){
                            $('#myCircleChart').hide();
                            var myChart = new Chart(ctx, {
                                type: 'line',
                                data: {
                                    labels: array_y,
                                    datasets: [{
                                        label: 'Quantidade de atendimentos',
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
                                    responsive: true,
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
