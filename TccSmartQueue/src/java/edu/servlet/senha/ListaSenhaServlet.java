/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.servlet.senha;

import edu.dao.DadosSenhaDao;
import edu.dao.ParametroDao;
import edu.vo.DadosSenha;
import edu.vo.Parametro;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author brunacm
 */
@WebServlet("/ListaSenhaServlet")
public class ListaSenhaServlet extends HttpServlet{
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            
            //DECLARAÇÃO DE VARIAVEIS
            String distancia_str = request.getParameter("distancia");
            boolean distancia = Boolean.parseBoolean(distancia_str);
            String tipo_atendimento = request.getParameter("tipo_atendimento");
            System.out.println("distancia " + distancia + " tipo_atendimento " + tipo_atendimento);
            
            DadosSenhaDao dadosSenhaDao = new DadosSenhaDao();
            DadosSenha dadosSenha = new DadosSenha();
        
            ParametroDao parametroDao = new ParametroDao();
            Parametro parametro = new Parametro();
            boolean horario_comercial = false;
            
            
            
        
        
            //verifica horário de atendimento
            parametro = parametroDao.getParametro(1);
            if (parametro.getValor_parametro().equals("DETERMINADO")){
            
                SimpleDateFormat sdf = new SimpleDateFormat("HH");
                
                parametro = parametroDao.getParametro(3);
                Date hi = sdf.parse(parametro.getValor_parametro());
                int hora_inicio = Integer.parseInt(sdf.format(hi));
                
                parametro = parametroDao.getParametro(4);
                Date hf = sdf.parse(parametro.getValor_parametro());
                int hora_fim = Integer.parseInt(sdf.format(hf));
                
                Date ha=new Date();    
                int hora_atual = Integer.parseInt(sdf.format(ha));
                
                //horário atual dentro do período de atendimento
                if (hora_atual >= hora_inicio && hora_atual <= hora_fim){
                   System.out.println("horário atual dentro do período de atendimento");
                    horario_comercial = true;
                    dadosSenha = dadosSenhaDao.getDados(tipo_atendimento, 0);
                    dadosSenha.setDistancia(distancia);
                    dadosSenha.setTipo_atendimento(tipo_atendimento);
                    dadosSenha.setHorario_comercial(horario_comercial);  
                }
                //horário atual FORA do período de atendimento
                else {
                    System.out.println("horário atual FORA do período de atendimento");
                    horario_comercial = false;
                    dadosSenha.setPrevisao_atendimento(null);
                    dadosSenha.setQuantidade_pessoas(0);
                    dadosSenha.setTempo_medio(null);
                    dadosSenha.setHorario_comercial(horario_comercial);
                    dadosSenha.setDistancia(distancia);
                    dadosSenha.setTipo_atendimento(tipo_atendimento);
                }
            //Estabelecimento 24H
            } else {
                System.out.println("Estabelecimento 24H");
                horario_comercial = true;
                dadosSenha = dadosSenhaDao.getDados(tipo_atendimento, 0);
                dadosSenha.setDistancia(distancia);
                dadosSenha.setTipo_atendimento(tipo_atendimento);
                dadosSenha.setHorario_comercial(horario_comercial);  
            }
        
        
              
        request.setAttribute("dadossenha", dadosSenha);
        
        getServletContext().getRequestDispatcher("/senha.jsp").forward(request, response);
        
        } catch (Exception e) {
            e.printStackTrace();
	}
    }

}