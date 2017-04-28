/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.servlet.senha;

import edu.dao.SenhaDao;
import edu.vo.Senha;
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
@WebServlet(name = "GerarSenhaLocalServlet", urlPatterns = {"/GerarSenhaLocalServlet"})
public class GerarSenhaLocalServlet extends HttpServlet {


     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        //RECEBE PARAMETROS DA REQUEST
        String nomecliente = request.getParameter("nome_cliente");
        String tipo_atendimento = request.getParameter("tipo_atendimento");   
        String mensagem = "";
        System.out.println(tipo_atendimento);
        
        //VERIFICA AUSENCIA DE PREENCHIMENTO DOS CAMPOS 
        if(nomecliente.isEmpty()){
            mensagem = mensagem + "<span>Por favor insira um nome! </span>";
        }
        if(tipo_atendimento.isEmpty()){
            mensagem = mensagem + "<span>Selecione o tipo de Atendimento! </span>";
        }
        if (!mensagem.equals("")){    
            request.setAttribute("mensagemErro", mensagem);
            getServletContext().getRequestDispatcher("/gerar_senha_local.jsp").forward(request, response);
        }
        else {
            //TODOS OS CAMPOS FORAM PREENCHIDOS
            SenhaDao senhaDao = new SenhaDao();

            int id_sequencia = senhaDao.geraSenhaLocal(nomecliente,tipo_atendimento);
            
            //SENHA GERADA COM SUCESSO
            if (id_sequencia > 0){        
                Senha senha = senhaDao.retornaSenha(id_sequencia);
                mensagem = "<span>Sua senha foi gerada com sucesso!</span>";
                request.setAttribute("mensagemSucesso", mensagem);
                request.setAttribute("senha", senha.getId_senha());
                getServletContext().getRequestDispatcher("/gerar_senha_local.jsp").forward(request, response);
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

