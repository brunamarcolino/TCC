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
@WebServlet("/BuscarNomeESenhaServlet")
public class BuscarNomeESenhaServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    SenhaDao senhaDao = new SenhaDao();
    int senha = senhaDao.getClienteSenha();
    String nome_cliente = senhaDao.getNomeCliente(senha);
    String mensagem = "";
    
    if (senha > 0){
                request.setAttribute("senha",senha);
                request.setAttribute("nome_cliente",nome_cliente);
                request.setAttribute("mensagemSucesso", mensagem);
                getServletContext().getRequestDispatcher("/chamar_proximo.jsp").forward(request, response);
            }else{
                mensagem = "Não há clientes na fila";
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/chamar_proximo.jsp").forward(request, response);
    }
    }
}
