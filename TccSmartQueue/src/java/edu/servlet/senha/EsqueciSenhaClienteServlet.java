package edu.servlet.senha;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.dao.SenhaDao;

/**
 * Servlet implementation class AlunoServlet
 */
@WebServlet("/EsqueciSenhaClienteServlet")
public class EsqueciSenhaClienteServlet extends HttpServlet {
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EsqueciSenhaClienteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            String cpf = request.getParameter("cpf");
            String email = request.getParameter("email");
            String mensagem = "";
            
            //VERIFICA SE OS CAMPOS NÃO ESTÃO NULOS  
            if(email.isEmpty()){
                mensagem = mensagem + "<span>Você esqueceu de inserir o email! </span>";
            } 
            if(cpf.isEmpty()){
                mensagem = mensagem + "<span>Você esqueceu de inserir o CPF! </span>";
            }
            if (!mensagem.equals("")){    
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/modal_esqueci_senha_cliente.jsp").forward(request, response);
            }            
            else {            
                System.out.println("CAMPOS PREENCHIDOS ");
                //CAMPOS PREENCHIDOS                 
                SenhaDao senhaDao = new SenhaDao();  
            
                //VALIDA SENHA
                String senha = senhaDao.updateEsqueciSenhaCliente(cpf,email);
                
                //SENHA INVÁLIDA
                if (senha.equals("Erro")){
                    System.out.println("Erro");    
                    request.setAttribute("mensagemErro", "CPF / Email não encontrado ou sua senha não está mais ativa");
                    getServletContext().getRequestDispatcher("/modal_esqueci_senha_cliente.jsp").forward(request, response);
                }
                else {
                    //Envio de email para recuperação de senha
                    String destinatario = email;
                    String assunto = "Nova da senha no SmartQueue";
                    String corpo = ("<p style='font-family: Arial, sans-serif'>Olá,  </p>" +
                                    "<p style='font-family: Arial, sans-serif'>Nós recebemos uma solicitação de mudança de senha da sua conta no Smrtqueue. </p>" +
                                    "<p style='font-family: Arial, sans-serif'>Sua nova senha é : " + senha +" </p>" +
                                    "Ignore este e-mail se você não quiser redefinir a sua senha.");
                    mensagem = "Uma nova senha foi enviada para o seu email!";                    
                    getServletContext().getRequestDispatcher("/EnviaEmailServlet?destinatario="+destinatario+"&assunto="+assunto+"&corpo="+corpo+"&mensagem="+mensagem+"&redirecionar=/modal_esqueci_senha_cliente.jsp").forward(request, response);   
                }     
            }
      
        }catch (Exception e) {
            System.out.println("Erro " + e);
            request.setAttribute("mensagemErro", "Informações inválidas.");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
        }
    }

