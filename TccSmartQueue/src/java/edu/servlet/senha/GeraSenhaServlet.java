/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.servlet.senha;

import edu.dao.SenhaDao;
import edu.vo.Senha;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author brunacm
 */
@WebServlet("/GeraSenhaServlet")
public class GeraSenhaServlet extends HttpServlet{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
               
        //RECEBE PARAMETROS DA REQUEST
        String logincliente = request.getParameter("cliente");
        String senhacliente = request.getParameter("senhacliente");
        String cpfcliente = request.getParameter("cpf");   
        String mensagem = "";
        
        //VERIFICA AUSENCIA DE PREENCHIMENTO DOS CAMPOS 
        if(logincliente.isEmpty()){
            mensagem = mensagem + "<span>Você esqueceu de inserir um nome! </span>";
        }
        if(senhacliente.isEmpty()){
            mensagem = mensagem + "<span>Por favor insira uma senha! </span>";
        }
        if(cpfcliente.isEmpty()){
            mensagem = mensagem + "<span>Seu CPF não está preenchido! </span>";
        }
        if (!mensagem.equals("")){    
            request.setAttribute("mensagemErro", mensagem);
            getServletContext().getRequestDispatcher("/login_cliente.jsp").forward(request, response);
        }
        else {
            //TODOS OS CAMPOS FORAM PREENCHIDOS
            
            SenhaDao senhaDao = new SenhaDao();
            int id_sequencia = senhaDao.geraSenha(logincliente,cpfcliente,senhacliente);
            
            //SENHA GERADA COM SUCESSO
            if (id_sequencia > 0){        
                Senha senha = senhaDao.retornaSenha(id_sequencia);
                mensagem = "<span>Sua senha foi gerada com sucesso!</span>";
                request.setAttribute("mensagemSucesso", mensagem);
                request.setAttribute("senha", senha);
                getServletContext().getRequestDispatcher("/gerar_senha.jsp").forward(request, response);
            } 
            else {
                //SENHA INVÁLIDA
                if (id_sequencia == -1){
                    mensagem = "<span>Senha Inválida para CPF Ativo! </span>";
                    request.setAttribute("mensagemErro", mensagem);
                    getServletContext().getRequestDispatcher("/login_cliente.jsp").forward(request, response);
                }
                else {
                    //ERRO INESPERADO
                    mensagem = "<span>ERRO INESPERADO, CONTATE O ADMINISTRADOR! </span>";
                    request.setAttribute("mensagemErro", mensagem);
                    getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                }
            }
        }
    }
}
