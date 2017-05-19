package edu.servlet.usuario;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.dao.UsuarioDao;
import edu.vo.Usuario;

/**
 * Servlet implementation class AlunoServlet
 */
@WebServlet("/IncluirUsuarioServlet")
public class IncluirUsuarioServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public IncluirUsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            //RECEBE PARAMETROS DA REQUISICAO    
            String nome = request.getParameter("inome");
            String email = request.getParameter("iemail");
            String cpf = request.getParameter("icpf");
            String tipo = request.getParameter("itipo");
            String mensagem = "";
            
            Usuario usuario = new Usuario();
            usuario.setId_usuario(0);
            usuario.setNm_usuario(nome);
            usuario.setCpf_usuario(cpf);
            usuario.setEmail_usuario(email);
            usuario.setTipo_usuario(tipo);            
            
            request.setAttribute("usuario", usuario);
          //VERIFICA SE OS CAMPOS NÃO ESTÃO NULOS
            if(nome.isEmpty()){
                mensagem = mensagem + "<span>Você esqueceu de inserir o nome! </span>";
            }
            if(email.isEmpty()){
                mensagem = mensagem + "<span>Você esqueceu de inserir o email! </span>";
            } 
            if(cpf.isEmpty()){
                mensagem = mensagem + "<span>Você esqueceu de inserir o CPF! </span>";
            }
            if (!mensagem.equals("")){    
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/modal_usuario.jsp").forward(request, response);
            }
            else {            
                //CAMPOS PREENCHIDOS                
                UsuarioDao usuarioDao = new UsuarioDao();  
            
                //VALIDA CPF (SE SUCESSO RETORNA 3)
                int validaCpf = usuarioDao.verificaCpfUsuario(cpf);
                
                //CPF INVÁLIDO
                if (validaCpf != 3){
                    switch (validaCpf){
                        case 1:  mensagem = "<span>ERRO! Esse CPF está inativo, deseja reativar ?</span>"; 
                                 break;
                        case 2:  mensagem = "<span> ERRO! Já existe um cadastro ativo para esse CPF!</span>"; 
                                 break;
                        case 4:  mensagem = "<span>ERRO! Favor digitar um cpf válido!</span>"; 
                                 break;   
                        default : mensagem = "<span>ERRO INESPERADO!</span>"; 
                                break;
                    }
                    request.setAttribute("mensagemErro", mensagem);
                    getServletContext().getRequestDispatcher("/modal_usuario.jsp").forward(request, response);
                }
                else {
                    //CPF VÁLIDO
                    //VALIDA LOGIN USUÁRIO
                    boolean validaLogin = usuarioDao.verificaLoginUsuario(nome);
                    
                    if (!validaLogin){
                        //USUARIO JÁ EXISTE 
                        request.setAttribute("mensagemErro", "FAVOR ESCOLHER OUTRO NOME DE USUARIO");
                        getServletContext().getRequestDispatcher("/modal_usuario.jsp").forward(request, response);
                    }
                    else {
                        //USUARIO NÃO EXISTE
                        //VALIDA EMAIL
                        boolean validaEmail = usuarioDao.verificaEmailUsuario(email);
                        if (!validaEmail){
                            //EMAIL INVALIDO
                            request.setAttribute("mensagemErro", "EMAIL INVÁLIDO");
                            getServletContext().getRequestDispatcher("/modal_usuario.jsp").forward(request, response);
                        }
                        else {
                            //INSERE USUARIO
                            String token = usuarioDao.insereUsuario(nome, email, cpf, tipo);
                            System.out.println("token servet "+token);
                            if (!token.equals("Erro")) {
                                //requisi��o foi bem sucedida, vamos finaliza-la e redirecionar o usuario para outro servlet
                                
                                //Envia email para criar nova senha
                                String destinatario = email;
                                String assunto = "Cadastrar senha no SmartQueue";
                                String corpo = ("<p style='font-family: Arial, sans-serif'>Olá, "+nome+" </p>" +
                                    "<p style='font-family: Arial, sans-serif'>Você foi cadastrado como "+tipo+" no Smrtqueue. </p>" +
                                    "<p style='font-family: Arial, sans-serif'>Para ter acesso ao sistema, você precisa realizar a criação da sua senha <a href=\"https://smartqueue.com.br/RecuperarDadosToken?token="+token+"\">aqui</a>. A sua senha deve:</p>" +
                                    "<h4 style='font-family: Arial, sans-serif'>Ter mais que 6 caracteres, sendo eles:</h4>" +
                                    "<ul>" +        
                                    "<li><span style='font-family: Arial, sans-serif; list-style: disc inside'>Letras (a-z);</span></li>" +
                                    "<li><span style='font-family: Arial, sans-serif; list-style: disc inside'>Números (0-9).</span></li>" +
                                    "</ul>" +
                                    "Ignore este e-mail se você não solicitou cadastro no Smartqueue.");  
                                
                                mensagem = "<span>Usuário incluido com sucesso! As intruções para definição de senha foram enviadas por email! </span>";
                                
                                getServletContext().getRequestDispatcher("/EnviaEmailServlet?destinatario="+destinatario+"&assunto="+assunto+"&corpo="+corpo+"&mensagem="+mensagem+"&redirecionar=/ListaUsuarioServlet").forward(request, response);
                                
                            } 
                            else {
                                mensagem = "<span>Erro inesperado</span>";
                                request.setAttribute("mensagemErro", mensagem);
                                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                            }
                        }
                    }
                }
            }
        } 
        catch (Exception e) {
            // System.out.println("Erro " + e);
            request.setAttribute("mensagemErro", "ERRO");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
