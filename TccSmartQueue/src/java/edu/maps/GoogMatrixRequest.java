/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.maps;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import java.io.IOException;

/**
 *
 * @author brunacm
 */

public class GoogMatrixRequest {

    private static final String API_KEY = "AIzaSyA2V07AOszVncA9R5zZQ5O3U5Y8BClg7_E";

  OkHttpClient client = new OkHttpClient();

  public String run(String url) throws IOException {
    Request request = new Request.Builder()
        .url(url)
        .build();

    Response response = client.newCall(request).execute();
    return response.body().string();
  }

  public static void main(String[] args) throws IOException {
    GoogMatrixRequest request = new GoogMatrixRequest();
    String url_request = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=Vancouver+BC%7CSeattle&destinations=San+Francisco%7CVictoria+BC&mode=bicycling&language=fr-FR&key=" + API_KEY;

    String response = request.run(url_request);
    System.out.println(response);
  }
}