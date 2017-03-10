package edu.servlet.Parametro;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.dao.ParametroDao;

/**
 * Servlet implementation class DeletarAlunoServlet
 */
@WebServlet("/DeletarParametroServlet")
public class DeletarParametroServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletarParametroServlet() {
        super();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_parametro = -1;
        if (request.getParameter("parametro") != null) {
            try {
                id_parametro = Integer.parseInt(request.getParameter("parametro"));
            } catch (Exception ex) {
                //faz nada. idAluno ser� invalido
            }
        }

        //se id aluno for inv�lido, retorna usu�rio para a p�gina index para informar o erro
        if (id_parametro < 0) {
            request.setAttribute("mensagemErro", "id_parametro inv�lido.");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            ParametroDao parametroDao = new ParametroDao();
            parametroDao.deleteParametro(id_parametro);

            //requisi��o foi bem sucedida, vamos finaliza-la e redirecionar o usuario para outro servlet
            response.sendRedirect(getServletContext().getContextPath() + "/ListaParametrosServlet");
        }
    }

}
