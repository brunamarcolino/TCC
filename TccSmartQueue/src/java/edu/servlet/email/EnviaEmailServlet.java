package edu.servlet.email;

import java.io.IOException;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.HtmlEmail;



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
            System.out.println("destinatario" + destinatario + " assunto "+assunto+" corpo " + corpo);
            
            // Cria o e-mail
            HtmlEmail email = new HtmlEmail();
            String authuser = "equipesmartqueue@gmail.com";
            String authpwd = "Metrocamp@2017";
            
            email.setDebug(true);
            email.setHostName("smtp.gmail.com");
            email.setSmtpPort(587);
            
            //email.setSSL(false);
            //email.setTLS(false);
            email.setStartTLSEnabled(true);            
            
            email.setAuthenticator(new DefaultAuthenticator(authuser, authpwd));

            email.setFrom("equipesmartqueue@gmail.com", "Equipe SmartQueue");
            email.addTo(destinatario, destinatario);
            email.setSubject(assunto);
 
            // adiciona uma imagem ao corpo da mensagem e retorna seu id
            URL url = new URL("http://www.dextraining.com.br/wp-content/uploads/2017/03/logo.jpg");
            String cid = email.embed(url, "SmartQueue logo");
 
            // configura a mensagem para o formato HTML
            email.setHtmlMsg("<html>"
                    + "<img src=\"cid:"+cid+"\">"
                    + corpo        
                    + "<p>Esta é uma mensagem automática. Por favor, não responda a esta mensagem. </p>"
                    + "<p>Muito obrigado.</p>"
                    + "<p>Equipe SmartQueue</p>"        
                    + "</html>");
 
            // configure uma mensagem alternativa caso o servidor não suporte HTML
            email.setTextMsg("Seu servidor de e-mail não suporta mensagem HTML");
 
            // envia o e-mail
            email.send();
            
            request.setAttribute("mensagem", "<span>Você receberá um email com as instruções para alteração de senha</span>");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }catch (Exception e) {
            System.out.println("Erro " + e);
            request.setAttribute("mensagemErro", "Informações inválidas.");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
        }
    }



