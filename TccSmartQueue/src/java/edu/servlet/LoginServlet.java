/*
RA: 1510027287

CLASSE: LOGIN SERVLET

OBJETIVO: 
VALIDAR SE LOGIN E SENHA ESTÃO CORRETOS!
*/
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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //RECEBE PARAMETROS DA REQUEST
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        //VERIFICA SE É NULO OU VAZIO
        if (login == null || login.isEmpty() || senha == null || senha.isEmpty()) {
            //em caso de erro, grava mensagem de erro na requisi��o e retorna para p�gina inicial
            String mensagem = "Login ou senha nulos!";
            request.setAttribute("mensagemErro", mensagem);
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            UsuarioDao usuarioDao = new UsuarioDao();
            Usuario usuario = usuarioDao.getUsuario(login, senha);
            if (usuario != null) {
                request.getSession().setAttribute("login", usuario);
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            } else {
                String mensagem = "Login ou senha inválidos!";
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            }
        }
    }
}
