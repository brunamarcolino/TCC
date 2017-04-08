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
@WebServlet("/HabilitaParametroServlet")
public class HabilitaParametroServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public HabilitaParametroServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
        protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            //RECUPERA PARAMETROS
            String id_str = request.getParameter("id_parametro");
            int id = Integer.parseInt(id_str);
            String habilitado_str = request.getParameter("parametro_habilitado");
            int habilitado = Integer.parseInt(habilitado_str);
            String mensagem;
            
            ParametroDao parametroDao = new ParametroDao();
            boolean sucesso; 
            
            if (id != 4 && id != 5){
                if(habilitado == 0){
                    sucesso = parametroDao.habilitaParametro(id, 1);  
                    mensagem = "<span>Parametro habilitado com sucesso</span>"; 
                }
                else
                {
                    sucesso = parametroDao.habilitaParametro(id, 0);  
                    mensagem = "<span>Parametro desabilitado com sucesso</span>";  
                }
            } else {
                sucesso = true;
                mensagem = "<span>Esse parametro não pode ser dasabilitado</span>"; 
            }
            
            //editar usuario
            
            if (sucesso) {
                request.setAttribute("mensagemSucesso", mensagem);
                response.sendRedirect(getServletContext().getContextPath() + "/ListaParametrosServlet");
            } else {
                request.setAttribute("mensagemErro", "Não foi possível salvar parametro.");
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            }
        
        } catch (Exception e) {
           // System.out.println("Erro " + e);
            request.setAttribute("mensagemErro", "Informações inválidas.");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
        }
    }

