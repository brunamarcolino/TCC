/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.maps;

import edu.dao.ParametroDao;
import edu.vo.Parametro;
import org.json.JSONObject;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;

/**
 * Servlet implementation class ListaAlunosServlet
 */
@WebServlet("/MapsServlet")
public class MapsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MapsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            //BUSCA PARAMETROS DO JSP
            String localizacao = request.getParameter("localiza");
            String tipo_atendimento = request.getParameter("tipo_atendimento");
            
            System.out.println("localizacao " + localizacao);
            System.out.println("tipo_atendimento " + tipo_atendimento);
            
            //instancia um parametro
            ParametroDao parametroDao = new ParametroDao();
            Parametro parametro = new Parametro();
        
            //verifica se distancia está habilitada
            parametro = parametroDao.getParametro(7);
            int parametro_habilitado = parametro.getParametro_habilitado();
            int raio_permitido = Integer.parseInt(parametro.getValor_parametro())*1000;
        
            //se sim, calcula se está dentro da distancia permitida
            if (parametro_habilitado == 1){
                
                //Chave gerada pelo Google na conta de bruna1marcolino@gmail.om para uso da API distance matrix
                String API_KEY = "AIzaSyA2V07AOszVncA9R5zZQ5O3U5Y8BClg7_E";
        
                //LOCAL DE ORIGEM (USUÁRIO)
                String origem = localizacao;
        
                //LOCAL DESTINO (ATENDIMENTO) - PARAMETRIZADO    
                parametro = parametroDao.getParametro(8);
                String destino = parametro.getValor_parametro();
                destino = destino.replace(" ", "+");
                System.out.println(destino); 
                //String destino = "-22.8629682,-47.1498136";
        
                //URL da API, retorna um JSON das informações passadas por parametro
                String url_request = "https://maps.googleapis.com/maps/api/distancematrix/json?origins="+origem+"&destinations="+destino+"&mode=driving&language=pt-BR&key=" + API_KEY;        
        
                int distancia=0;
                int tempo=0;
        
                //executa a URL e guarda retorno em um buffer
                URL url = new URL(url_request);
                BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
                StringBuilder builder = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    builder.append(line + "\n");
                }
            
                //transforma em Json    
                JSONObject json = new JSONObject(builder.toString());
                System.out.println(json);
                String status = json.getString("status");
                
                //Verifica se jason foi retornado com sucesso
                if (status.equals("OK")){
                    //gambis para pegar a o elemnto
                    JSONArray jsonArray = json.getJSONArray("rows");
                    json = jsonArray.getJSONObject(0);
                    jsonArray = json.getJSONArray("elements");
                    json = jsonArray.getJSONObject(0);
            
                    //pega distancia
                    JSONObject jsondistancia = json.getJSONObject("distance");
                    distancia = jsondistancia.getInt("value");
            
                    //pega tempo
                    JSONObject jsontempo = json.getJSONObject("duration");
                    tempo = jsontempo.getInt("value");
             
                    System.out.println(json);
                    System.out.println("distancia " + distancia +" tempo "+ tempo+ " raio " + raio_permitido);
                    if (distancia > raio_permitido){
                        //redireciona para erro
                        getServletContext().getRequestDispatcher("/ListaSenhaServlet?distancia=false").forward(request, response);
                    }
                    else{
                        //redireciona para sucesso
                        
                        getServletContext().getRequestDispatcher("/ListaSenhaServlet?distancia=true&tipo_atendimento="+tipo_atendimento).forward(request, response);
                    }   
                } else {
                    request.setAttribute("mensagemErro", "Erro ao retornar JSON.");
                    getServletContext().getRequestDispatcher("/ListaSenhaServlet?distancia=false").forward(request, response);
                }
                
            }
            //se não redireciona para gerar senha
            else
            {
                getServletContext().getRequestDispatcher("/ListaSenhaServlet?distancia=true&tipo_atendimento="+tipo_atendimento).forward(request, response);
            }        
            //getServletContext().getRequestDispatcher("/json.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensagemErro", "Erro na localização.");
            getServletContext().getRequestDispatcher("/localizacao.jsp").forward(request, response);            
	}
             
    }

}
