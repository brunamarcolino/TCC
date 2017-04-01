package edu.servlet.usuario;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.dao.UsuarioDao;

/**
 * Servlet implementation class AlunoServlet
 */
@WebServlet("/ExcluirUsuarioServlet")
public class ExcluirUsuarioServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExcluirUsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
            protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            try {
            String id_usuario_str = request.getParameter("id_usuario");
            int id_usuario = Integer.parseInt(id_usuario_str);
            String id_login_str = request.getParameter("login_usuario");
            int login_usuario = Integer.parseInt(id_login_str);
            
            if (login_usuario == id_usuario){
            request.setAttribute("mensagemErro", "Não é possível excluir o próprio usuário.");
            getServletContext().getRequestDispatcher("/usuario.jsp").forward(request, response);
            }
            else{
                    
            UsuarioDao usuarioDao = new UsuarioDao();  
            boolean sucesso = usuarioDao.deleteUsuario(id_usuario);
            
            if (sucesso) {
            //requisi��o foi bem sucedida, vamos finaliza-la e redirecionar o usuario para outro servlet
            String mensagem = "<span>Usuário excluido com sucesso</span>";
            request.setAttribute("mensagemSucesso", mensagem);
            response.sendRedirect(getServletContext().getContextPath() + "/ListaUsuarioServlet");
            //getServletContext().getRequestDispatcher("/usuario.jsp").forward(request, response);
            } else {
            request.setAttribute("mensagemErro", "Não foi possível excluir dados do usuário.");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            
            }
            }
            
        } catch (Exception e) {
           // System.out.println("Erro " + e);
            request.setAttribute("mensagemErro", "Informações inválidas.");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
    }
