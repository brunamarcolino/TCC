package edu.servlet.Parametro;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.dao.ParametroDao;
import edu.vo.Parametro;

/**
 * Servlet implementation class AlunoServlet
 */
@WebServlet("/ModalEditarParametroServlet")
public class ModalEditarParametroServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModalEditarParametroServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
            protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                System.out.println("Erro 1" );
            try {
            String id_parametro_str = request.getParameter("id_parametro");
            int id_parametro = Integer.parseInt(id_parametro_str);
            
            //SE USUÁRIO = 0 ENTÃO INCLUIR, SE > 0 ENTÃO EDITAR
            if (id_parametro > 0) {
            ParametroDao parametroDao = new ParametroDao();  
            Parametro parametro = parametroDao.getParametro(id_parametro);
            request.setAttribute("parametro", parametro);
            }
            getServletContext().getRequestDispatcher("/modal_parametro.jsp").forward(request, response);
            

          
        } catch (Exception e) {
            System.out.println("Erro " + e);
            request.setAttribute("mensagemErro", "Informações inválidas.");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
    }

