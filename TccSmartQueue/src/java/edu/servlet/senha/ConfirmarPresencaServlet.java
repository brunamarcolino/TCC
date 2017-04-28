/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.servlet.senha;

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
@WebServlet("/ConfirmarPresencaServlet")
public class ConfirmarPresencaServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    //recebe parametros    
    String senha_str = request.getParameter("senha");
    int senha_int = Integer.parseInt(senha_str);
    String id_sequencia_str = request.getParameter("id_sequencia");
    int id_sequencia = Integer.parseInt(id_sequencia_str);
    
    //Define variaveis
    String mensagem = "";
    Senha senha = new Senha();
    SenhaDao senhaDao = new SenhaDao();
    
    boolean sucesso = senhaDao.alteraStatusSenha(senha_int, "Em Atendimento", 0);
    
    if (sucesso){
        senha = senhaDao.retornaSenha(id_sequencia);
        request.setAttribute("senha", senha);
        mensagem = "<span>Atendimento iniciado!</span>";
        request.setAttribute("mensagemSucesso", mensagem);
        getServletContext().getRequestDispatcher("/chamar_proximo.jsp?habilitado=3").forward(request, response);
    }else{
        mensagem = "<span>Nenhum cliente foi chamado 2 !</span>";
        request.setAttribute("mensagemErro", mensagem);
        getServletContext().getRequestDispatcher("/chamar_proximo.jsp?habilitado=2").forward(request, response);
    }
    }
}
