package edu.servlet.usuario;

import edu.dao.UsuarioDao;
import edu.vo.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author brunacm
 */
@WebServlet("/RecuperarDadosToken")
public class RecuperarDadosToken extends HttpServlet{
    
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Recuperar token Servlet");
        //RECEBE PARAMETROS DA REQUEST
        String token = request.getParameter("token");
        System.out.println(token);
        
        UsuarioDao usuarioDao = new UsuarioDao();
        Usuario usuario = new Usuario();
        usuario = usuarioDao.getUsuarioToken(token);
        request.setAttribute("usuario", usuario);
        getServletContext().getRequestDispatcher("/alterar_senha.jsp").forward(request, response);         
    }
}
