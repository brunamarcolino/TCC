/**
 *
 * @author thiago.quintanilha
 */
package edu.servlet.chart;

import edu.dao.UsuarioDao;
import edu.vo.Usuario;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ListaChartServlet")
public class ListaChartServlet extends HttpServlet{
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        
        String tipo_str = request.getParameter("tipo");
        int tipo = Integer.parseInt(tipo_str);
                
        UsuarioDao usuarioDao = new UsuarioDao();
        List<Usuario> atendentes = usuarioDao.getAtendentes();
        
        System.out.println("Obtidos " + atendentes.size() + " atendentes.");
        
        if (atendentes.size() > 0){
            request.setAttribute("atendentes", atendentes);
            request.setAttribute("tipo_grafico", "Linhas");
            request.setAttribute("ate", "TODOS");
        }        
        System.out.println(atendentes);
        if (tipo==1){
            getServletContext().getRequestDispatcher("/relatorio_tempo.jsp").forward(request, response);
        }else {
            getServletContext().getRequestDispatcher("/relatorio_produtividade.jsp").forward(request, response);
        }
    }

}