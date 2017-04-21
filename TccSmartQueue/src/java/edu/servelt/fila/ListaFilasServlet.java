/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.servelt.fila;

import edu.dao.FilaDao;
import edu.vo.Fila;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ListaAlunosServlet
 */
@WebServlet("/ListaFilasServlet")
public class ListaFilasServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListaFilasServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        FilaDao filaDao = new FilaDao();
        List<Fila> filas = filaDao.getMesas();

        System.out.println("Obtidos " + filas.size() + " filas.");
        
        if (filas.size() > 0){
            request.setAttribute("filas", filas);
        }
        getServletContext().getRequestDispatcher("/abrir_fila.jsp").forward(request, response);
        
    }

}

