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
        int pessoasNaFila;
        //VERIFICA SE É NULO OU VAZIO
       try{
           SenhaDao senhaDao = new SenhaDao();
           FilaDao filaDao = new FilaDao();
           pessoasNaFila = senhaDao.verificaClientesAtivos(login_usuario);
           int ultimoAtendenteAtivo = filaDao.VerificaTodasFilasAbertas();
           System.out.println(ultimoAtendenteAtivo);
            if (ultimoAtendenteAtivo>1) {
                boolean fila = filaDao.setFilaOff(login_usuario);
                mensagem = "<span>Fila fechada com sucesso</span>";
                request.setAttribute("mensagemSucesso", mensagem);
                //request.getSession().setAttribute("login_usuario", fila);
                int id_fila = filaDao.VerificaFilaAberta(login_usuario);
                request.getSession().setAttribute("id_fila", id_fila); 
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            } else if(ultimoAtendenteAtivo <= 1 && pessoasNaFila > 0) {
                mensagem = "<span>Ainda existem pessoas na fila e você é o último atendente ativo!</span>";
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/fechar_fila.jsp").forward(request, response);
            } else if(ultimoAtendenteAtivo <= 1) {
                mensagem = "<span>Você é o último atendente ativo!</span>";
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/fechar_fila.jsp").forward(request, response);
            }else {
                mensagem = "<span>Ops! Ocorreu algum erro, tente novamente</span>";
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/fechar_fila.jsp").forward(request, response);
            }
            
        }catch(Exception closeEx){
           
                    //do nothing
        }
    }
}
