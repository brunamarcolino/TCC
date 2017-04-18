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
@WebServlet("/EditarSenhaUsuarioServlet")
public class EditarSenhaUsuarioServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarSenhaUsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            String id_str = request.getParameter("id");
            int id = Integer.parseInt(id_str);
            String nome = request.getParameter("nome");
            String senha = request.getParameter("senha");
            
            String mensagem = "";
            
            Usuario usuario = new Usuario();
            usuario.setId_usuario(id);
            usuario.setNm_usuario(nome);
            request.setAttribute("usuario", usuario);
            
            //VERIFICA SE OS CAMPOS NÃO ESTÃO NULOS  
            if (senha.isEmpty()){    
                request.setAttribute("mensagemErro",  "<span>Você esqueceu de inserir uma senha! </span>");
                getServletContext().getRequestDispatcher("/alterar_senha.jsp").forward(request, response);
            }
            else {            
                //CAMPOS PREENCHIDOS                 
                UsuarioDao usuarioDao = new UsuarioDao();  
            
                //VALIDA SENHA
                boolean validaSenha = usuarioDao.verificaSenhaForte(senha);
                
                //SENHA INVÁLIDA
                if (!validaSenha){
                    request.setAttribute("mensagemErro", "Senha fora da politica de segurança");
                    getServletContext().getRequestDispatcher("/alterar_senha.jsp").forward(request, response);
                }
                else {
                    boolean sucesso;
                    //editar usuario
                    sucesso = usuarioDao.updateSenhaUsuario(id,senha);  
                    if (sucesso){
                        request.setAttribute("mensagem", "<span>Usuário alterado com sucesso</span>");
                        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                    } else {
                        request.setAttribute("mensagemErro", "Erro Gernerico");
                        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                    }
                    
                }     
            }
      
        }catch (Exception e) {
           // System.out.println("Erro " + e);
            request.setAttribute("mensagemErro", "Informações inválidas.");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
        }
    }
