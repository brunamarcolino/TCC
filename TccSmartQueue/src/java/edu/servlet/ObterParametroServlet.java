package edu.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.dao.ParametroDao;
import edu.vo.Parametro;

/**
 * Servlet implementation class ObterAlunoServlet
 */
@WebServlet("/ObterParametroServlet")
public class ObterParametroServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

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
            request.setAttribute("mensagemErro", "Id do parametro inválido.");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            ParametroDao parametroDao = new ParametroDao();

            Parametro parametro = parametroDao.getParametro(id_parametro);

            //grava o aluno no escopo de requisi��o para acessar no arquivo index.jsp
            request.setAttribute("parametro", parametro);
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
