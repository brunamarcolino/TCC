/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.servlet.senha;

import edu.dao.ParametroDao;
import edu.dao.SenhaDao;
import edu.vo.Parametro;
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
@WebServlet(name = "NaoConfirmarPresencaServlet", urlPatterns = {"/NaoConfirmarPresencaServlet"})
public class NaoConfirmarPresencaServlet extends HttpServlet {
    
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
    
    //recebe parametros    
    String senha_str = request.getParameter("senha");
    int senha_int = Integer.parseInt(senha_str);
    String id_sequencia_str = request.getParameter("id_sequencia");
    int id_sequencia = Integer.parseInt(id_sequencia_str);
    String status = request.getParameter("status");
    
    //Define variaveis
    String mensagem = "";
    Senha senha = new Senha();
    SenhaDao senhaDao = new SenhaDao();
    boolean sucesso;
    
    //instancia um parametro
    ParametroDao parametroDao = new ParametroDao();
    Parametro parametro = new Parametro();
        
    //verifica se distancia está habilitada
    parametro = parametroDao.getParametro(5);
    String aceita_chance = parametro.getValor_parametro();
    
    if (aceita_chance.equals("SIM")){       
        if (status.equals("Segunda Chance")){
            sucesso = senhaDao.alteraStatusSenha(senha_int, "Não Compareceu", 0);
        }else {
            sucesso = senhaDao.alteraStatusSenha(senha_int, "Segunda Chance", 0);
        }
    } else {
        sucesso = senhaDao.alteraStatusSenha(senha_int, "Não Compareceu", 0);
    }    
    
    if (sucesso){
        senha = senhaDao.retornaSenha(id_sequencia);
        request.setAttribute("senha", senha);
        mensagem = "<span>Cliente não compareceu. Favor Chamar o próximo! </span>";
        request.setAttribute("mensagemErro", mensagem);
        getServletContext().getRequestDispatcher("/chamar_proximo.jsp?habilitado=1").forward(request, response);
    }else{
        mensagem = "Nenhum cliente foi chamado!";
        request.setAttribute("mensagemErro", mensagem);
        getServletContext().getRequestDispatcher("/chamar_proximo.jsp?habilitado=2").forward(request, response);
    }
  }
}
