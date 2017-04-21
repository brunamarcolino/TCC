/*
RA: 1510027287

CLASSE: LOGIN SERVLET

OBJETIVO: 
VALIDAR SE LOGIN E SENHA ESTÃO CORRETOS!
*/
package edu.servlet;

import edu.dao.FilaDao;
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
        String mensagem = "";
        
        //VERIFICA SE É NULO OU VAZIO
        if (login == null || login.isEmpty() || senha == null || senha.isEmpty()) {
            //em caso de erro, grava mensagem de erro na requisi��o e retorna para p�gina inicial
            mensagem = "<span>Login ou senha nulos!</span>";
            request.setAttribute("mensagemErro", mensagem);
            getServletContext().getRequestDispatcher("/login_adm.jsp").forward(request, response);
        } else {
            UsuarioDao usuarioDao = new UsuarioDao();
            Usuario usuario = usuarioDao.getUsuario(login, senha);
            if (usuario != null) {
                FilaDao filadao = new FilaDao();
                int id_fila = filadao.VerificaFilaAberta(usuario.getId_usuario());
                request.getSession().setAttribute("id_fila", id_fila);
                request.getSession().setAttribute("login", usuario);
                getServletContext().getRequestDispatcher("/login_adm.jsp").forward(request, response);
            } else {
                mensagem = "<span>Login ou senha inválidos!</span>";
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/login_adm.jsp").forward(request, response);
            }
        }
    }
}
