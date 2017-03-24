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
@WebServlet("/FecharFilaServlet")
public class FecharFilaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //RECEBE PARAMETROS DA REQUEST
        int id_fila = Integer.parseInt(request.getParameter("id_fila"));

        //VERIFICA SE É NULO OU VAZIO
        if (id_fila == 0) {
            //em caso de erro, grava mensagem de erro na requisi��o e retorna para p�gina inicial
            String mensagem = "Número da Fila Inexistente!";
            request.setAttribute("mensagemErro", mensagem);
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            FilaDao filaDao = new FilaDao();
            
            boolean fila = filaDao.setFilaOff(id_fila);
            if (fila) {
                request.getSession().setAttribute("id_fila", fila);
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            } else {
                String mensagem = "deu ruim";
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            }
        }
    }
}
