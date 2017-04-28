package edu.servlet.notificacao;

import edu.dao.SenhaDao;
import edu.dao.UsuarioDao;
import edu.vo.Senha;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class AlunoServlet
 */
@WebServlet("/NotificacaoServlet")
public class NotificacaoServlet extends HttpServlet {
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotificacaoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
        protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            try {
                
                //delaracao de variaveis
                String id_senha_str = request.getParameter("id_senha");
                int id_senha = Integer.parseInt(id_senha_str);
                String id_fila_str = request.getParameter("id_fila");
                int id_fila = Integer.parseInt(id_fila_str);
                
                System.out.println("id_senha " + id_senha + " id_fila " + id_fila);
                
                //Recupera objeto senha
                Senha senha = new Senha();
                SenhaDao senhaDao = new SenhaDao();
                senha = senhaDao.getSenha(id_senha);
                
                if (senha.getId_player() != null){
                
                    UsuarioDao usuarioDao = new UsuarioDao();
                    String nome_usuario = usuarioDao.getUsuario(senha.getId_usuario_atendente());
                
                    //envia mensagem para o cliente atual
                    String jsonResponse;
   
                    URL url = new URL("https://onesignal.com/api/v1/notifications");
                    HttpURLConnection con = (HttpURLConnection)url.openConnection();
                    con.setUseCaches(false);
                    con.setDoOutput(true);
                    con.setDoInput(true);

                    con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
                    con.setRequestProperty("Authorization", "Basic NGEwMGZmMjItY2NkNy0xMWUzLTk5ZDUtMDAwYzI5NDBlNjJj");
                    con.setRequestMethod("POST");

                    String strJsonBody = "{"
                      +   "\"app_id\": \"d65a5424-a984-45c5-ae6a-1b29fd9795a0\","
                      +   "\"include_player_ids\": [\""+senha.getId_player()+"\"],"
                      +   "\"data\": {\"foo\": \"bar\"},"
                      +   "\"headings\": {\"en\": \"Chegou sua Vez\"},"
                      +   "\"contents\": {\"en\": \"Olá "+senha.getNome_cliente()+"! Seu atendimento será realizado pelo(a) "+ nome_usuario + ". Favor dirigir-se para a mesa " + id_fila +"."+"\"}"
                      + "}";
         
   
                    System.out.println("strJsonBody:\n" + strJsonBody);

                    byte[] sendBytes = strJsonBody.getBytes("UTF-8");
                    con.setFixedLengthStreamingMode(sendBytes.length);

                    OutputStream outputStream = con.getOutputStream();
                    outputStream.write(sendBytes);

                    int httpResponse = con.getResponseCode();
                    System.out.println("httpResponse: " + httpResponse);

                    if (  httpResponse >= HttpURLConnection.HTTP_OK
                        && httpResponse < HttpURLConnection.HTTP_BAD_REQUEST) {
                        Scanner scanner = new Scanner(con.getInputStream(), "UTF-8");
                        jsonResponse = scanner.useDelimiter("\\A").hasNext() ? scanner.next() : "";
                        scanner.close();
                    } else {
                        Scanner scanner = new Scanner(con.getErrorStream(), "UTF-8");
                        jsonResponse = scanner.useDelimiter("\\A").hasNext() ? scanner.next() : "";
                        scanner.close();
                    }
   
                    System.out.println("jsonResponse:\n" + jsonResponse);
                }
                
                request.setAttribute("senha",senha);
                String mensagem = "Próximo Cliente Chamado";
                request.setAttribute("mensagemSucesso", mensagem);
                if (senha.getStatus_atendimento().equals("Em Atendimento")){
                    getServletContext().getRequestDispatcher("/chamar_proximo.jsp?habilitado=3").forward(request, response);
                }else {
                    getServletContext().getRequestDispatcher("/chamar_proximo.jsp?habilitado=2").forward(request, response);
                } 
                
                
                
                
    } catch(Throwable t) {
        t.printStackTrace();
    }
      
    }
}



