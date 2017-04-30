/*
RA: 1510027287

CLASSE: LOGIN SERVLET

OBJETIVO: 
VALIDAR SE LOGIN E SENHA ESTÃO CORRETOS!
*/
package edu.servelt.fila;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import edu.dao.FilaDao;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/AbrirFilaServlet")
public class AbrirFilaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
//RECEBE PARAMETROS DA REQUEST
        String login_usuario_str = request.getParameter("login_usuario");
        int login_usuario = Integer.parseInt(login_usuario_str); 
        String id_fila_str = request.getParameter("fila");
        int id_fila = Integer.parseInt(id_fila_str); 
        
        String mensagem = "";
        
        //Abre a fila
        FilaDao filaDao = new FilaDao();
        
        boolean fila = filaDao.setFila(login_usuario,id_fila);
        if (fila){
            mensagem = "<span>Fila aberta com sucesso</span>";
            request.setAttribute("mensagemSucesso", mensagem);
            request.getSession().setAttribute("id_fila", id_fila);
            getServletContext().getRequestDispatcher("/chamar_proximo.jsp?habilitado=1").forward(request, response);
        }else{
            mensagem = "<span>Ops! Ocorreu algum erro, tente novamente! </span>";
            request.setAttribute("mensagemErro", mensagem);
            getServletContext().getRequestDispatcher("/abrir_fila.jsp").forward(request, response);
        }
    }
}
