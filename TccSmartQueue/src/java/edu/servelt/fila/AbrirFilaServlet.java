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
import edu.dao.ParametroDao;
import edu.vo.Fila;
import edu.vo.Parametro;
import java.util.List;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/AbrirFilaServlet")
public class AbrirFilaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //RECEBE PARAMETROS DA REQUEST
        FilaDao filaDao = new FilaDao();
        String status_fila;
        status_fila = new String("Aberta");
        String login_usuario_str = request.getParameter("login_usuario");
        int login_usuario = Integer.parseInt(login_usuario_str);
        int mesa = Integer.parseInt(request.getParameter("mesa"));
        List<Fila> qtdMesas = filaDao.getMesas();
        //System.out.println(qtdMesas);
        request.setAttribute("qtd_mesas",qtdMesas);
        //VERIFICA SE É NULO OU VAZIO
        if (qtdMesas == null) {
            //em caso de erro, grava mensagem de erro na requisi��o e retorna para p�gina inicial
            String mensagem = "<span>Não Existem Mesas Disponíveis!</span>";
            request.setAttribute("mensagemErro", mensagem);
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
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
