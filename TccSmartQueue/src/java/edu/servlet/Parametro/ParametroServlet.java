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
@WebServlet("/ParametroServlet")
public class ParametroServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParametroServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {                 
            
            String id_parametro = request.getParameter("id_parametro");
            System.out.println("Passou 1" + id_parametro);
            String valor_parametro = request.getParameter("valor_parametro");
            System.out.println("Passou 2" + valor_parametro);

            
        } catch (Exception e) {
            System.out.println("Erro " + e);
            request.setAttribute("mensagemErro", "Informações estão inválidas.");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {                 
            
            String id_parametro = request.getParameter("id_parametro");
            String desc_parametro = request.getParameter("desc_parametro");
            String valor_parametro = request.getParameter("valor_parametro");
            System.out.println("Passou 1" + id_parametro);

            if (valor_parametro != null && !valor_parametro.isEmpty()) {
                Parametro novoParametro = new Parametro();
                System.out.println("Passou 1" + id_parametro);
                novoParametro.setId_parametro(Integer.parseInt(id_parametro));   
                System.out.println("Passou 2");
                novoParametro.setDesc_parametro(desc_parametro);
                novoParametro.setValor_parametro(valor_parametro);
                ParametroDao parametroDao = new ParametroDao();

                boolean sucesso = false;
                if (novoParametro.getId_parametro() > 0) {
                    sucesso = parametroDao.updateParametro(novoParametro);
                }
                
                if (sucesso) {
                    //requisi��o foi bem sucedida, vamos finaliza-la e redirecionar o usuario para outro servlet
                    response.sendRedirect(getServletContext().getContextPath() + "/ListaParametrosServlet");
                } else {
                    request.setAttribute("mensagemErro", "Não foi possível salvar dados do parametro.");
                    getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                }
                }
        } catch (Exception e) {
            System.out.println("Erro " + e);
            request.setAttribute("mensagemErro", "Informações estão inválidas.");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
