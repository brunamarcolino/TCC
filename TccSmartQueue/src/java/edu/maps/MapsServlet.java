/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.maps;

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
        
        String API_KEY = "AIzaSyA2V07AOszVncA9R5zZQ5O3U5Y8BClg7_E";
        String origem = "-22.908785,-47.0781327";
        String destino = "-22.8629682,-47.1498136";
        String url_request = "https://maps.googleapis.com/maps/api/distancematrix/json?origins="+origem+"&destinations="+destino+"&mode=driving&language=pt-BR&key=" + API_KEY;        
        int distancia=0;
        int tempo=0;
        
        try {
            URL url = new URL(url_request);
            BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
            StringBuilder builder = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                builder.append(line + "\n");
            }
            

            JSONObject json = new JSONObject(builder.toString());
            JSONArray jsonArray = json.getJSONArray("rows");
            
            json = jsonArray.getJSONObject(0);
            jsonArray = json.getJSONArray("elements");
            
            //System.out.println(jsonArray.length());
            
             json = jsonArray.getJSONObject(0);
             
             JSONObject jsondistancia = json.getJSONObject("distance");
             distancia = jsondistancia.getInt("value");
            
             JSONObject jsontempo = json.getJSONObject("duration");
             tempo = jsontempo.getInt("value");
             
            System.out.println(json);
            System.out.println("distancia " + distancia +" tempo "+ tempo);
                        //System.out.println(distancia);
                //getServletContext().getRequestDispatcher("/json.jsp").forward(request, response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
             
    }

}
