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
@WebServlet("/EditarUsuarioServlet")
public class EditarUsuarioServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarUsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
        protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            String id_str = request.getParameter("id");
            int id = Integer.parseInt(id_str);
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String cpf = request.getParameter("cpf");
            String tipo = request.getParameter("tipo");
            String mensagem = "";
            
            Usuario usuario = new Usuario();
            usuario.setId_usuario(id);
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
            
                //VALIDA CPF 
                String validaCpf = usuarioDao.verificaCpfUsuarioEditar(cpf,id);
                
                //CPF INVÁLIDO
                if (validaCpf == "invalido"){
                    request.setAttribute("mensagemErro", "Novo CPF inválido");
                    getServletContext().getRequestDispatcher("/modal_usuario.jsp").forward(request, response);
                }
                else {
                    if (validaCpf == "ok") {
                        boolean validaEmail = usuarioDao.verificaEmailUsuario(email);
                        if (!validaEmail){
                            //EMAIL INVALIDO
                            request.setAttribute("mensagemErro", "EMAIL INVÁLIDO");
                            getServletContext().getRequestDispatcher("/modal_usuario.jsp").forward(request, response);
                        } 
                        else {
                            //VALIDA LOGIN USUÁRIO
                            boolean validaLogin = usuarioDao.verificaLoginUsuarioEditar(nome,id);
                    
                            if (!validaLogin){
                            //USUARIO JÁ EXISTE 
                            request.setAttribute("mensagemErro", "FAVOR ESCOLHER OUTRO NOME DE USUARIO");
                            getServletContext().getRequestDispatcher("/modal_usuario.jsp").forward(request, response);
                            }
                            else {
                                boolean sucesso = false;
                                if (id == 0){
                                   //incluir usuário 
                                   String token = usuarioDao.insereUsuario(nome, email, cpf, tipo);
                                   mensagem = "<span>Usuário incluido com sucesso</span>";
                                   sucesso = true;
                                }
                                else {
                                    //editar usuario
                                   sucesso = usuarioDao.updateUsuario(usuario);  
                                   mensagem = "<span>Usuário alterado com sucesso</span>";
                                }
                                      
                                 
                                if (sucesso) {
                                    request.setAttribute("mensagemSucesso", mensagem);
                                    response.sendRedirect(getServletContext().getContextPath() + "/ListaUsuarioServlet");
                                } else {
                                    request.setAttribute("mensagemErro", "Não foi possível salvar dados do usuário.");
                                    getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                                }
                            }
                        }
                    } 
                    else {
                        if (validaCpf.isEmpty()){
                            //ERRO INESPERADO
                            request.setAttribute("mensagemErro", "ERRO INESPERADO");
                            getServletContext().getRequestDispatcher("/modal_usuario.jsp").forward(request, response);
                        } 
                        else {
                            //OUTRO USUARIO COM O MESMO CPF
                            mensagem = "<span>O usuário " +  validaCpf + " possui mesmo CPF cadastrado. Não é possível cadastrar 2 CPFs iguais. </span>";
                            request.setAttribute("mensagemErro", mensagem);
                            getServletContext().getRequestDispatcher("/modal_usuario.jsp").forward(request, response);
                        }
                    }
                            
                }
            }
      
        
        
        } catch (Exception e) {
           // System.out.println("Erro " + e);
            request.setAttribute("mensagemErro", "Informações inválidas.");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
        }
    }
