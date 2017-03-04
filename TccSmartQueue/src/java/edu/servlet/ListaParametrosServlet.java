package edu.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.dao.ParametroDao;
import edu.vo.Parametro;

/**
 * Servlet implementation class ListaAlunosServlet
 */
@WebServlet("/ListaParametrosServlet")
public class ListaParametrosServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListaParametrosServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ParametroDao parametroDao = new ParametroDao();
        List<Parametro> parametros = parametroDao.getParametros();

        System.out.println("Obtidos " + parametros.size() + " parametros.");
        request.setAttribute("parametros", parametros);
        getServletContext().getRequestDispatcher("/parametros.jsp").forward(request, response);
    }

}
