/**
 *
 * @author thiago.quintanilha
 */
package edu.servlet.chart;


import edu.dao.ChartDao;
import java.io.IOException;

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
        
        if(data_inicio != "" && data_fim != ""){
            dadosChartDao.relatorio_tempoMedio(data_inicio, data_fim, atendente);
        }else if(data_inicio == "" || data_fim == ""){
            if(data_inicio == ""){
                mensagem = mensagem + "<span>Preencha a data início! </span>";
            }else if(data_fim == ""){
                mensagem = mensagem + "<span>Preencha a data final! </span>";
            }
        }
        request.setAttribute("mensagemErro", mensagem);
        getServletContext().getRequestDispatcher("/relatorio_tempo.jsp").forward(request, response);
    }

}