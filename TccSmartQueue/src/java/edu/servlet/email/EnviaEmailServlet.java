package edu.servlet.email;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class AlunoServlet
 */
@WebServlet("/EnviaEmailServlet")
public class EnviaEmailServlet extends HttpServlet {
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnviaEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
        protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            String destinatario = request.getParameter("destinatario");
            String assunto = request.getParameter("assunto");
            String corpo = request.getParameter("corpo");
            String redirecionar = request.getParameter("redirecionar");
            String mensagem = request.getParameter("mensagem");
            System.out.println("destinatario" + destinatario + " assunto "+assunto+" corpo " + corpo + " redirecionar " + redirecionar);
            
            String to = request.getParameter("destinatario");
            String subject = request.getParameter("assunto");
            String message =  request.getParameter("corpo");
            String user = "equipesmartqueue@gmail.com";
            String pass = "Metrocamp@2017";
            SendMail.send(to,subject, message, user, pass);
            
            request.setAttribute("mensagemSucesso", mensagem);
            getServletContext().getRequestDispatcher(redirecionar).forward(request, response);
        }catch (Exception e) {
            System.out.println("Erro " + e);
            request.setAttribute("mensagemErro", "Informações inválidas.");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
        }
    }



