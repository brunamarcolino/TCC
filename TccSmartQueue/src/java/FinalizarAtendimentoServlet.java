/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
@WebServlet(urlPatterns = {"/FinalizarAtendimentoServlet"})
public class FinalizarAtendimentoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
            SenhaDao senhaDao = new SenhaDao();
            int senha = senhaDao.getClienteSenhaEmAtendimento();
            String nome_cliente = senhaDao.getNomeCliente(senha);
            if (senha>0) {
                request.setAttribute("senha",senha);
                request.setAttribute("nome_cliente",nome_cliente);
                senhaDao.finalizaAtendimento(senha);
                String mensagem = "";
                mensagem = "<span>Atendimento Finalizado!</span>";
                request.setAttribute("mensagemSucesso", mensagem); 
                getServletContext().getRequestDispatcher("/chamar_proximo.jsp").forward(request, response);
            } else {
                String mensagem = "Não Existe Nenhum Cliente em Atendimento";
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/chamar_proximo.jsp").forward(request, response);
            }
    }
}