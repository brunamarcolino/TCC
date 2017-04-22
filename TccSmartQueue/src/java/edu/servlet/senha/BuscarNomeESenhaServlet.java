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
        Senha senha = new Senha();
        SenhaDao senhaDao = new SenhaDao();
        String mensagem = "";
        
        //Verifica se não há clientes em atendimento ou chamados
        String id_usuario_str = request.getParameter("id_usuario");
        int id_usuario = Integer.parseInt(id_usuario_str);
        System.out.println(id_usuario);
        senha = senhaDao.verificaClientesChamados(id_usuario);
        
        //Se não
        if(senha == null){

            //Verifica ultimo tipo de atendimento 
            String tipo_atendimento = senhaDao.UltimoTipoAtendimento();
            System.out.println(tipo_atendimento);
        
            boolean sucesso = senhaDao.alteraStatusSenha(senha.getId_senha(), "Chamando", id_usuario);
            System.out.println(sucesso);
                
            //Chama próximo cliente de acordo com o ultimo atendido
            if (tipo_atendimento.equals("Preferencial")){
                senha = senhaDao.getProximoClienteNormal();
            } else if (tipo_atendimento.equals("Normal")){
                senha = senhaDao.getProximoClienteChance();
            } else {
                senha = senhaDao.getProximoClientePreferencial();
            }
        }
        
            //SE FOR NULL É QUE NÃO TEM MAIS CLIENTE NA FILA, SE NÃO APRESENTE CLIENTE NA TELA
            if (senha != null){
                request.setAttribute("senha",senha);
                mensagem = "Próximo Cliente Chamado";
                request.setAttribute("mensagemSucesso", mensagem);
                if (senha.getStatus_atendimento().equals("Em Atendimento")){
                    getServletContext().getRequestDispatcher("/chamar_proximo.jsp?habilitado=3").forward(request, response);
                }else {
                    getServletContext().getRequestDispatcher("/chamar_proximo.jsp?habilitado=2").forward(request, response);
                }  
            }else {
                mensagem = "Não há clientes na fila";
                request.setAttribute("mensagemErro", mensagem);
                getServletContext().getRequestDispatcher("/chamar_proximo.jsp?habilitado=1").forward(request, response);
        }
    }
}
