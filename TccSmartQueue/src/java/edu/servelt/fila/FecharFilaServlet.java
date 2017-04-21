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
@WebServlet("/FecharFilaServlet")
public class FecharFilaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //RECEBE PARAMETROS DA REQUEST
        
        String mensagem = "";
        String login_usuario_str = request.getParameter("login_usuario");
        int login_usuario = Integer.parseInt(login_usuario_str);
        //VERIFICA SE É NULO OU VAZIO
       try{
           
            FilaDao filaDao = new FilaDao();
            
            boolean fila = filaDao.setFilaOff(login_usuario);
            if (fila) {
                mensagem = "<span>Fila fechada com sucesso</span>";
                request.setAttribute("mensagemSucesso", mensagem);
                //request.getSession().setAttribute("login_usuario", fila);
                int id_fila = filaDao.VerificaFilaAberta(login_usuario);
                request.getSession().setAttribute("id_fila", id_fila); 
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            } else {
                mensagem = "<span>Ops! Ocorreu algum erro, tente novamente ;(</span>";
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/fechar_fila.jsp").forward(request, response);
            }
        }catch(Exception closeEx){
           
                    //do nothing
        }
    }
}
