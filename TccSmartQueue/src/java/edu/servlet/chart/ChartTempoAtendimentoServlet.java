/**
 *
 * @author thiago.quintanilha
 */
package edu.servlet.chart;


import edu.dao.ChartDao;
import edu.dao.UsuarioDao;
import edu.vo.Chart;
import edu.vo.Usuario;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ChartTempoAtendimentoServlet")
public class ChartTempoAtendimentoServlet extends HttpServlet{
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        ChartDao dadosChartDao = new ChartDao();
        String data_inicio = request.getParameter("data_inicio");
        String data_fim = request.getParameter("data_fim");
        String atendente = request.getParameter("atendente");
        
        String mensagem = "";
        String[] valor_x = null, 
                 valor_y = null, 
                 valor_tooltip = null;
        
        if(data_inicio.isEmpty() || data_fim.isEmpty()){
            if(data_inicio.isEmpty()){
                mensagem = mensagem + "<span>Preencha a data início! </span>";
            }
            if(data_fim.isEmpty()){
                mensagem = mensagem + "<span>Preencha a data final! </span>";
            }
            request.setAttribute("mensagemErro", mensagem);
        } else {
            List<Chart> charts = dadosChartDao.relatorio_tempoMedio(data_inicio, data_fim, atendente); 
            
            request.setAttribute("charts", charts);
            
            Chart chart = new Chart();
            
            for (int i=0;i<charts.size()-1;i++){
                chart = charts.get(i);
                System.out.println(chart);
                valor_x[i] = chart.getValor_x();
                valor_y[i] = chart.getValor_y();
                valor_tooltip[i] = chart.getValor_tooltip();
            }            
            System.out.println(chart.getValor_x());
            System.out.println(chart.getValor_y());
            System.out.println(chart.getValor_tooltip());
        }
        
        request.setAttribute("valor_x", valor_x);
        request.setAttribute("valor_y", valor_y);
        request.setAttribute("valor_tooltip", valor_tooltip);
        getServletContext().getRequestDispatcher("/relatorio_tempo.jsp").forward(request, response);
    }

}