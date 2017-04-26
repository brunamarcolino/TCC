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
      
        /*
        ChartDao dadosChartDao = new ChartDao();
        String data_inicio = request.getParameter("data_inicio");
        String data_fim = request.getParameter("data_fim");
        String atendente = request.getParameter("atendentes");
        
        String mensagem = "";
        
        if(!data_inicio.isEmpty() && !data_fim.isEmpty()){
            dadosChartDao.relatorio_tempoMedio(data_inicio, data_fim, atendente);
        }else if(data_inicio.isEmpty() || data_fim.isEmpty()){
            if(data_inicio.isEmpty()){
                mensagem = mensagem + "<span>Preencha a data início! </span>";
            }
            if(data_fim.isEmpty()){
                mensagem = mensagem + "<span>Preencha a data final! </span>";
            }
        }*/
        
        UsuarioDao usuarioDao = new UsuarioDao();
        List<Usuario> atendentes = usuarioDao.getAtendentes();
        
        System.out.println("Obtidos " + atendentes.size() + " atendentes.");
        
        if (atendentes.size() > 0){
            request.setAttribute("atendentes", atendentes);
        }
        System.out.println(atendentes);
        //request.setAttribute("mensagemErro", "Erro");
        getServletContext().getRequestDispatcher("/relatorio_tempo.jsp").forward(request, response);
    }

}