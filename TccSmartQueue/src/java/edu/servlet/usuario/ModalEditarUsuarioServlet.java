package edu.servlet.usuario;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.dao.UsuarioDao;
import edu.vo.Usuario;

/**
 * Servlet implementation class AlunoServlet
 */
@WebServlet("/ModalEditarUsuarioServlet")
public class ModalEditarUsuarioServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModalEditarUsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
            protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            System.out.println("Passou Service");
            String id_usuario = request.getParameter("id_usuario");
            
            UsuarioDao usuarioDao = new UsuarioDao();  
            Usuario usuario = usuarioDao.getEditarUsuario(id_usuario);
            
            request.setAttribute("usuario", usuario);
            getServletContext().getRequestDispatcher("/modal_usuario.jsp").forward(request, response);
            
            

          
        } catch (Exception e) {
           // System.out.println("Erro " + e);
            request.setAttribute("mensagemErro", "Informações inválidas.");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
    }
