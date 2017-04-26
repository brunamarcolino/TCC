<!-- 
    Document   : chart-example
    Created on : Apr 25, 2017, 8:34:51 AM
    Author     : thiago.quintanilha
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
        <%@include file="WEB-INF/jspf/chamadas.jspf"%>
    </head>
    <body>
        <form>
            <ul>
                <li>
                    <label>Data início</label>
                    <input type="date" id="dataInicio" />
                </li>
                <li>
                    <label>Data fim</label>
                    <input type="date" id="dataFim" />
                </li>
                <li>
                    <input type="button" onclick="generateChart();"/>
                </li>
                <li></li>
            </ul>
        </form>
       <canvas id="myChart" width="400" height="400"></canvas>
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
    </body>
</html>
