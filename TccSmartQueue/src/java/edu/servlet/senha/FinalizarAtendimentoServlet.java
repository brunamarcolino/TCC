package edu.servlet.senha;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import edu.dao.SenhaDao;
import edu.vo.Senha;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author casa
 */
@WebServlet(urlPatterns = {"/FinalizarAtendimentoServlet"})
public class FinalizarAtendimentoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    //recebe parametros    
    String senha_str = request.getParameter("id_senha");
    int senha_int = Integer.parseInt(senha_str);
    String id_sequencia_str = request.getParameter("id_sequencia");
    int id_sequencia = Integer.parseInt(id_sequencia_str);
    
    //Define variaveis
    String mensagem = "";
    Senha senha = new Senha();
    SenhaDao senhaDao = new SenhaDao();
    
    boolean sucesso = senhaDao.alteraStatusSenha(senha_int, "Atendido", 0);
    
    if (sucesso){
        senha = senhaDao.retornaSenha(id_sequencia);
        request.setAttribute("senha", senha);
        mensagem = "<span>Atendimento finalizado!</span>";
        request.setAttribute("mensagemSucesso", mensagem);
        getServletContext().getRequestDispatcher("/chamar_proximo.jsp?habilitado=1").forward(request, response);
    }else{
        mensagem = "<span>Erro ao Finalizar atendimento!</span>";
        request.setAttribute("mensagemErro", mensagem);
        getServletContext().getRequestDispatcher("/chamar_proximo.jsp?habilitado=3").forward(request, response);
    }
    }
}