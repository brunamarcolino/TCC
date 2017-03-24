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
 * @author brunacm
 */
@WebServlet("/GeraSenhaServlet")
public class GeraSenhaServlet extends HttpServlet{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    //protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
    //RECEBE PARAMETROS DA REQUEST
        String logincliente = request.getParameter("cliente");
        String senhacliente = request.getParameter("senhacliente");
        String cpfcliente = request.getParameter("cpf");       
        
        SenhaDao senhaDao = new SenhaDao();        
        int id_sequencia = senhaDao.geraSenha(logincliente,cpfcliente,senhacliente);
        
        if (id_sequencia > 0){        
        Senha senha = senhaDao.retornaSenha(id_sequencia);
        request.setAttribute("senha", senha);
        getServletContext().getRequestDispatcher("/gerar_senha.jsp").forward(request, response);
        } 
        else{
        String mensagem = "senha inválida!";
        request.setAttribute("mensagemErro", mensagem);
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

}
