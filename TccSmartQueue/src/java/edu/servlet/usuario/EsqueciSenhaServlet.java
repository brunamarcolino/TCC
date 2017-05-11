package edu.servlet.usuario;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.dao.UsuarioDao;

/**
 * Servlet implementation class AlunoServlet
 */
@WebServlet("/EsqueciSenhaServlet")
public class EsqueciSenhaServlet extends HttpServlet {
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EsqueciSenhaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            String login = request.getParameter("login");
            String email = request.getParameter("email");
            String mensagem = "";
            
            //VERIFICA SE OS CAMPOS NÃO ESTÃO NULOS  
            if(email.isEmpty()){
                mensagem = mensagem + "<span>Você esqueceu de inserir o email! </span>";
            } 
            if(login.isEmpty()){
                mensagem = mensagem + "<span>Você esqueceu de inserir o login! </span>";
            }
            if (!mensagem.equals("")){    
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/modal_esqueci_senha.jsp").forward(request, response);
            }            
            else {            
                //CAMPOS PREENCHIDOS                 
                UsuarioDao usuarioDao = new UsuarioDao();  
            
                //VALIDA SENHA
                String token = usuarioDao.updateEsqueciSenhaUsuario(login, email);
                
                //SENHA INVÁLIDA
                if (token.equals("Erro")){
                    request.setAttribute("mensagemErro", "Login / Email não encontrado");
                    getServletContext().getRequestDispatcher("/model_esqueci_senha.jsp").forward(request, response);
                }
                else {
                    //Envio de email para recuperação de senha
                    String destinatario = email;
                    String assunto = "Redefinição da senha no SmartQueue";
                    String corpo = ("Olá,"+login+"  " +
                                    "Nós recebemos uma solicitação de mudança de senha da sua conta no Smrtqueue. " +
                                    "Você pode redefinir a sua senha em http://localhost:8080/TccSmartQueue/RecuperarDadosToken?token="+token+
                                    "Ignore este e-mail se você não quiser redefinir a sua senha.");                      
                    getServletContext().getRequestDispatcher("/EnviaEmailServlet?destinatario="+destinatario+"&assunto="+assunto+"&corpo="+corpo).forward(request, response);   
                }     
            }
      
        }catch (Exception e) {
            System.out.println("Erro " + e);
            request.setAttribute("mensagemErro", "Informações inválidas.");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
        }
    }

