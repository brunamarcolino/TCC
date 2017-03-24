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


import edu.dao.SenhaDao;
import edu.vo.Senha;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/ChamarProximoServlet")
public class ChamarProximoServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //RECEBE PARAMETROS DA REQUEST
       int ultimaSenha = 0;
       int proximaSenha = ultimaSenha +1;
       ultimaSenha = proximaSenha;
       String nm_cliente;
       nm_cliente = new String("felipe");

        //VERIFICA SE É NULO OU VAZIO
        /*if (false) {
            //em caso de erro, grava mensagem de erro na requisi��o e retorna para p�gina inicial
            String mensagem = "Numero da mesa nulo!";
            request.setAttribute("mensagemErro", mensagem);
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        } else {*/
            SenhaDao senhaDao = new SenhaDao();
            
            int senha = senhaDao.chamaProximaSenha(proximaSenha);
            if (senha>0) {
                request.getSession().setAttribute("nome_cliente", nm_cliente);
                request.getSession().setAttribute("senha", senha);
                getServletContext().getRequestDispatcher("/chamar_proximo.jsp").forward(request, response);
            } else {
                String mensagem = "deu ruim";
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            }
        }
    }

