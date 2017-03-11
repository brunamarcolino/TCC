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
@WebServlet("/ListaSenhaServlet")
public class ListaSenhaServlet extends HttpServlet{
    
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        SenhaDao senhaDao = new SenhaDao();
        Senha senha = senhaDao.getUltimaSenha();
        
        String tma = senhaDao.getTempoAtendimento();
        
        request.setAttribute("senha", senha);
        request.setAttribute("tma", tma);
        
        getServletContext().getRequestDispatcher("/senha.jsp").forward(request, response);
    }

}
