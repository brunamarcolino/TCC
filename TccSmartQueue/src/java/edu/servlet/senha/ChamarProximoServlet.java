/*
RA: 1510027287

CLASSE: LOGIN SERVLET

OBJETIVO: 
VALIDAR SE LOGIN E SENHA ESTÃO CORRETOS!
*/
package edu.servlet.senha;

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
@WebServlet("/ChamarProximoServlet")
public class ChamarProximoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //RECEBE PARAMETROS DA REQUEST
        String status_fila;
        status_fila = new String("Aberta");
        int mesa = Integer.parseInt(request.getParameter("mesa"));
        int id_usuario = 402;



        //VERIFICA SE É NULO OU VAZIO
        if (mesa == 0) {
            //em caso de erro, grava mensagem de erro na requisi��o e retorna para p�gina inicial
            String mensagem = "Numero da mesa nulo!";
            request.setAttribute("mensagemErro", mensagem);
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            FilaDao filaDao = new FilaDao();
            
            boolean fila = filaDao.setFila(id_usuario,mesa,status_fila);
            if (fila) {
                request.getSession().setAttribute("mesa", fila);
                getServletContext().getRequestDispatcher("/chamar_proximo.jsp").forward(request, response);
            } else {
                String mensagem = "deu ruim";
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            }
        }
    }
}
