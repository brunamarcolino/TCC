/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.servlet.senha;

import edu.dao.DadosSenhaDao;
import edu.vo.DadosSenha;
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
@WebServlet("/ListaSenhaServlet")
public class ListaSenhaServlet extends HttpServlet{
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DadosSenhaDao dadosSenhaDao = new DadosSenhaDao();
        DadosSenha dadosSenha = dadosSenhaDao.getDados();
        
        request.setAttribute("dadossenha", dadosSenha);
        
        getServletContext().getRequestDispatcher("/senha.jsp").forward(request, response);
    }

}