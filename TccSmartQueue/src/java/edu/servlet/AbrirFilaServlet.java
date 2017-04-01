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


import edu.dao.FilaDao;
import edu.vo.Fila;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/AbrirFilaServlet")
public class AbrirFilaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //RECEBE PARAMETROS DA REQUEST
        String status_fila;
        status_fila = new String("Aberta");
        String login_usuario_str = request.getParameter("login_usuario");
        int login_usuario = Integer.parseInt(login_usuario_str);
        int mesa = Integer.parseInt(request.getParameter("mesa"));
    



        //VERIFICA SE É NULO OU VAZIO
        if (mesa == 0) {
            //em caso de erro, grava mensagem de erro na requisi��o e retorna para p�gina inicial
            String mensagem = "<span>O número da mesa está nulo!</span>";
            request.setAttribute("mensagemErro", mensagem);
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            FilaDao filaDao = new FilaDao();
            
            boolean fila = filaDao.setFila(login_usuario,mesa,status_fila);
            String mensagem = "";
            if (fila) {
                mensagem = "<span>Fila aberta com sucesso</span>";
                request.setAttribute("mensagemSucesso", mensagem);
                request.getSession().setAttribute("mesa", fila);
                getServletContext().getRequestDispatcher("/chamar_proximo.jsp").forward(request, response);
            } else {
                mensagem = "<span>Ops! Ocorreu algum erro, tente novamente ;(</span>";
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/abrir_fila.jsp").forward(request, response);
            }
        }
    }
}
