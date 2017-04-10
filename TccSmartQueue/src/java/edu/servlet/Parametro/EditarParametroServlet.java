package edu.servlet.Parametro;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.dao.ParametroDao;

/**
 * Servlet implementation class AlunoServlet
 */
@WebServlet("/EditarParametroServlet")
public class EditarParametroServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarParametroServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
        protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            String id_str = request.getParameter("id");
            int id = Integer.parseInt(id_str);
            String valor;
            ParametroDao parametroDao = new ParametroDao();
            int v = 1;
            
            switch(id)
            {
                case 1: valor = request.getParameter("valor_1");
                        break;
                case 5: valor = request.getParameter("valor_5");
                        break;
                case 6: valor = request.getParameter("valor_6");
                        v = parametroDao.verificaFila(Integer.parseInt(valor));                        
                        break;
                case 7: valor = request.getParameter("valor_7");
                        break;
                case 8: valor = request.getParameter("valor_8");
                        break;              
                default: valor = request.getParameter("valor_2");        
                        break;
            }
            String mensagem;
                 
            
            if (v==1){
                //editar usuario
                boolean sucesso = parametroDao.updateParametro(id, valor);  
                mensagem = "<span>Parametro alterado com sucesso</span>";
            
                if (sucesso) {
                    request.setAttribute("mensagemSucesso", mensagem);
                    response.sendRedirect(getServletContext().getContextPath() + "/ListaParametrosServlet");
                } else {
                    request.setAttribute("mensagemErro", "Não foi possível salvar parametro.");
                    getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                }
            }
            else {
                if (v==3){
                    mensagem = "Parametro Filas não pode ser alterado, pois há filas modificadas abertas!.";
                } else{
                    mensagem = "Não foi possível salvar parametro.";
                }
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response); 
            }            
        } catch (Exception e) {
           // System.out.println("Erro " + e);
            request.setAttribute("mensagemErro", "Informações inválidas.");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
        }
    }
