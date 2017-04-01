package edu.servlet;

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
@WebServlet("/EditarUsuarioServlet")
public class EditarUsuarioServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarUsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
        protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
        String id_str = request.getParameter("id");
        int id = Integer.parseInt(id_str);
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String cpf_str = request.getParameter("cpf");
        int cpf = Integer.parseInt(cpf_str);
        String tipo = request.getParameter("tipo");
        
        Usuario usuario = new Usuario();
        usuario.setId_usuario(id);
        usuario.setNm_usuario(nome);
        usuario.setCpf_usuario(cpf);
        usuario.setEmail_usuario(email);
        usuario.setTipo_usuario(tipo);
        
        UsuarioDao usuarioDao = new UsuarioDao();
        
        boolean sucesso = usuarioDao.updateUsuario(usuario);
        if (sucesso) {
            //requisi��o foi bem sucedida, vamos finaliza-la e redirecionar o usuario para outro servlet
            response.sendRedirect(getServletContext().getContextPath() + "/ListaUsuarioServlet");
        } else {
            request.setAttribute("mensagemErro", "Não foi possível salvar dados do usuário.");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }        
        
        
         } catch (Exception e) {
           // System.out.println("Erro " + e);
            request.setAttribute("mensagemErro", "Informações inválidas.");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
        }
    }
