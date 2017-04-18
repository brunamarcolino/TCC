/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.servlet.senha;

import edu.dao.SenhaDao;
import java.io.IOException;
import java.io.PrintWriter;
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
        
    SenhaDao senhaDao = new SenhaDao();
    int senha = senhaDao.getClienteSenha();
    int confirma = senhaDao.chamaProximaSenha(senha);
    String nome_cliente = senhaDao.getNomeCliente(senha);
    String mensagem = "";
    if (confirma > 0){
                request.setAttribute("senha",senha);
                request.setAttribute("nome_cliente",nome_cliente);
                mensagem = "<span>Atendimento iniciado!</span>";
                request.setAttribute("mensagemSucesso", mensagem);
                getServletContext().getRequestDispatcher("/chamar_proximo.jsp").forward(request, response);
            }else{
                mensagem = "Nenhum cliente foi chamado!";
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/chamar_proximo.jsp").forward(request, response);
    }
    }
}
