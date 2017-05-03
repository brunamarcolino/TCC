package edu.servlet.painel;

import edu.dao.PainelDao;
import edu.vo.painel_ant;
import edu.vo.painel_atu;
import java.io.IOException;
import java.sql.Time;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class AlunoServlet
 */
@WebServlet("/PainelServlet")
public class PainelServlet extends HttpServlet {
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PainelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
        protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            try {
                
                PainelDao painelDao = new PainelDao();
                
                //Retorna mesas e senhas em atendimento
                List<painel_ant> ants = painelDao.lista_senhas_chamadas();
                System.out.println("Obtidos " + ants.size() + " mesas.");
                request.setAttribute("ants", ants);
                
                
                //pega senha atual e tempo medio
                painel_atu atu = painelDao.lista_senhas_anteriores();
                request.setAttribute("atu", atu);
                //System.out.println("tempo : " + tempo_medio + " senha " + senha);
                
                getServletContext().getRequestDispatcher("/painel.jsp").forward(request, response);
            
    } catch(Throwable t) {
        t.printStackTrace();
    }
      
    }
}



