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
 * @author casa
 */
@WebServlet("/BuscarNomeESenhaServlet")
public class BuscarNomeESenhaServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         
        //Declara Variaveis
        int senha;
        SenhaDao senhaDao = new SenhaDao();
        String mensagem = "";
        
        //Verifica se não há clientes em atendimento ou chamados
        String id_usuario_str = request.getParameter("id_usuario");
        int id_usuario = Integer.parseInt(id_usuario_str);
        System.out.println(id_usuario);
        senha = senhaDao.verificaClientesChamados(id_usuario);
        
        //Se não
        if(senha == 0){
            
            //Verifica ultimo tipo de atendimento 
            String tipo_atendimento = senhaDao.UltimoTipoAtendimento();
            System.out.println(tipo_atendimento);
            
            //Chama próximo cliente de acordo com o ultimo atendido
            if (tipo_atendimento.equals("Preferencial")){
                senha = senhaDao.getProximoClienteNormal();
            } else {
                senha = senhaDao.getProximoClientePreferencial();
            }  
            
            boolean sucesso = senhaDao.alteraStatusSenha(senha, "Chamando", id_usuario);            
            System.out.println(sucesso);
            
        }
            //SE FOR 0 É QUE NÃO TEM MAIS CLIENTE NA FILA, SE NÃO APRESENTE CLIENTE NA TELA
            if (senha > 0){
                getServletContext().getRequestDispatcher("/NotificacaoServlet?id_senha="+senha+"&id_fila=1").forward(request, response);             
            }else {
                mensagem = "Não há clientes na fila";
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/chamar_proximo.jsp?habilitado=1").forward(request, response);
        }
    }
}
