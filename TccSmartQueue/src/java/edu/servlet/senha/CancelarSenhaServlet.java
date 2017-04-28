/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.servlet.senha;

import edu.dao.SenhaDao;
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
@WebServlet("/CancelarSenhaServlet")
public class CancelarSenhaServlet extends HttpServlet{
    
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String id_senha_str = request.getParameter("id_senha");
        int id_senha = Integer.parseInt(id_senha_str);
        
        SenhaDao senhaDao = new SenhaDao();
        boolean senha = senhaDao.alteraStatusSenha(id_senha,"Cancelado", 0);
        
        if (senha) {
            request.setAttribute("mensagem", "<span>Senha Cancelada com sucesso!</span>");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
        else
        {
            request.setAttribute("mensagemErro", "<span>Ocorreu um erro ao Cancelar a senha.</span>");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
        
    }

}