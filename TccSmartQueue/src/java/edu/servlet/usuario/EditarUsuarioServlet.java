package edu.servlet;

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
                getServletContext().getRequestDispatcher("/usuario.jsp").forward(request, response);
            }
            else {            
                //CAMPOS PREENCHIDOS                 
                UsuarioDao usuarioDao = new UsuarioDao();  
            
                //VALIDA CPF 
                boolean validaCpf = usuarioDao.isCPF(cpf);
                
                //CPF INVÁLIDO
                if (!validaCpf){
                    request.setAttribute("mensagemErro", "CPF inválido");
                    getServletContext().getRequestDispatcher("/usuario.jsp").forward(request, response);
                }
                else {
                    boolean validaEmail = usuarioDao.verificaEmailUsuario(email);
                        if (!validaEmail){
                            //EMAIL INVALIDO
                            request.setAttribute("mensagemErro", "EMAIL INVÁLIDO");
                            getServletContext().getRequestDispatcher("/usuario.jsp").forward(request, response);
                        } else {
                                Usuario usuario = new Usuario();
                                usuario.setId_usuario(id);
                                usuario.setNm_usuario(nome);
                                usuario.setCpf_usuario(cpf);
                                usuario.setEmail_usuario(email);
                                usuario.setTipo_usuario(tipo);
        
        
                                boolean sucesso = usuarioDao.updateUsuario(usuario);
                                if (sucesso) {
                                    //requisi��o foi bem sucedida, vamos finaliza-la e redirecionar o usuario para outro servlet
                                    response.sendRedirect(getServletContext().getContextPath() + "/ListaUsuarioServlet");
                                } else {
                                    request.setAttribute("mensagemErro", "Não foi possível salvar dados do usuário.");
                                    getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
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
