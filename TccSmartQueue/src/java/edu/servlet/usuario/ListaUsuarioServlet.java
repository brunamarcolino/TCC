package edu.servlet.usuario;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.dao.UsuarioDao;
import edu.vo.Usuario;

/**
 * Servlet implementation class ListaAlunosServlet
 */
@WebServlet("/ListaUsuarioServlet")
public class ListaUsuarioServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListaUsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UsuarioDao usuarioDao = new UsuarioDao();
        List<Usuario> usuarios = usuarioDao.getUsuarios();

        System.out.println("Obtidos " + usuarios.size() + " usuario.");
        request.setAttribute("usuarios", usuarios);
        getServletContext().getRequestDispatcher("/usuario.jsp").forward(request, response);
    }

}
