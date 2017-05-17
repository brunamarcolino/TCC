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
import edu.dao.SenhaDao;


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

       try{
           FilaDao filaDao = new FilaDao();
           
           boolean permitir_fechamento = filaDao.VerificaFecharFila();
           
            if (permitir_fechamento) {
                //pode fechar a fila
                
                boolean fila = filaDao.setFilaOff(login_usuario);
                
                if(fila){
                    mensagem = "<span>Fila fechada com sucesso</span>";
                    request.setAttribute("mensagemSucesso", mensagem);
                }
                else{
                    mensagem = "<span>FOcorreu um erro durante o fechamento da Fila! Tente novamente mais tarde!</span>";
                    request.setAttribute("mensagemErro", mensagem);
                }
                               
                request.getSession().setAttribute("id_fila", 0); 
                
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            } else {
                mensagem = "<span>Ainda existem pessoas na fila e você é o último atendente ativo!</span>";
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/fechar_fila.jsp").forward(request, response);
            }
            
        }catch(Exception closeEx){
           
                    //do nothing
        }
    }
}
