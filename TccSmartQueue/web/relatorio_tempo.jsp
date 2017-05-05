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
    <body>
        <%@include file="WEB-INF/jspf/cabecalho.jspf"%>
        
        <%@include file="WEB-INF/jspf/mensagem.jspf"%>
        
        <div class="main">
            <div class="grid-75 mobile-grid-100 filtro section-center">
                <div class="grid-100">
                    <h1><span>Relatório /</span> Produtividade </h1>
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
                        <input type="hidden" name="valor_x" id="valor_x" value="${valor_x}" />
                        <input type="hidden" name="valor_y" id="valor_y" value="${valor_y}" />
                        <input type="hidden" name="valor_tooltip" id="valor_tooltip" value="${valor_tooltip}" />
                    </li>
                </ul>
            </form>
                    
                  
            <canvas id="myChart"></canvas>
            <script type="text/javascript">
            $(document).ready(function(){
                var valor_x = $('input#valor_x').val();
                var valor_y = $('input#valor_y').val();
                var valor_tooltip = $('input#valor_tooltip').val();
                console.log(valor_x)
                console.log(valor_y)
                console.log(valor_tooltip)
                if(valor_x != "" && valor_y != "" && valor_tooltip != ""){
                    $("myChart").show();
                    var ctx = $("#myChart");
                    var myChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: ["LUCIANA","PEDRO","CAMILA","ANTONIO"],
                            datasets: [{
                                label: 'produtividade',
                                data: ["48","37","53","40"],
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
