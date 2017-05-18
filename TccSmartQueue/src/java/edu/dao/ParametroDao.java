package edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import edu.vo.Parametro;

public class ParametroDao extends Dao {

    public Parametro getParametro(int id_parametro) {
        Connection conn = null;

        try {
            conn = getConnection();

            String sql = "SELECT id_parametro, desc_parametro, valor_parametro, parametro_habilitado, usuario_alteracao, data_alteracao FROM tab_parametros WHERE id_parametro = ?";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id_parametro);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                Parametro parametro = new Parametro();
                parametro.setId_parametro(result.getInt("id_parametro"));
                parametro.setUsuario_alteracao(result.getInt("usuario_alteracao"));
                parametro.setDesc_parametro(result.getString("desc_parametro"));
                parametro.setParametro_habilitado(result.getInt("parametro_habilitado"));
                parametro.setValor_parametro(result.getString("valor_parametro"));
                parametro.setData_alteracao(result.getDate("data_alteracao"));

                return parametro;
            } else {
                return null;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception closeEx) {
                    //do nothing
                }
            }
        }
    }

    public List<Parametro> getParametros() {
        Connection conn = null;
        List<Parametro> parametros = new ArrayList<Parametro>();

        try {
            conn = getConnection();
            boolean param1=false;
            boolean param7=false;
            
            String sql = "SELECT valor_parametro FROM tab_parametros WHERE id_parametro = 1";
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet result = stmt.executeQuery();
            
            if (result.next()) {
                String valor_parametro = result.getString("valor_parametro");
                if ("24H".equals(valor_parametro)){
                    param1 = true;                  
                }   
            } else {
                return null;
            }
            
            sql = "SELECT parametro_habilitado FROM tab_parametros WHERE id_parametro = 7";
            
            stmt = conn.prepareStatement(sql);
            result = stmt.executeQuery();
            
            if (result.next()) {
                int parametro_habilitado = result.getInt("parametro_habilitado");
                if (parametro_habilitado == 0){
                    param7 = true;                    
                }    
            } else {
                return null;
            }
            
            if (param1 && param7){
                sql = "SELECT id_parametro, desc_parametro, valor_parametro, parametro_habilitado, usuario_alteracao FROM tab_parametros WHERE id_parametro not in (3,4,8)";
            }else if (param1){
                sql = "SELECT id_parametro, desc_parametro, valor_parametro, parametro_habilitado, usuario_alteracao FROM tab_parametros WHERE id_parametro not in (3,4)";
            }else if (param7){
                sql = "SELECT id_parametro, desc_parametro, valor_parametro, parametro_habilitado, usuario_alteracao FROM tab_parametros WHERE id_parametro not in (8)";
            } else{
                sql = "SELECT id_parametro, desc_parametro, valor_parametro, parametro_habilitado, usuario_alteracao FROM tab_parametros";
            }
         
            stmt = conn.prepareStatement(sql);
            result = stmt.executeQuery();

            while (result.next()) {
                Parametro parametro = new Parametro();
                
                parametro.setId_parametro(result.getInt("id_parametro"));
                parametro.setUsuario_alteracao(result.getInt("usuario_alteracao"));
                parametro.setDesc_parametro(result.getString("desc_parametro"));
                parametro.setValor_parametro(result.getString("valor_parametro"));
                parametro.setParametro_habilitado(result.getInt("parametro_habilitado"));
                //parametro.setData_alteracao(result.getDate("data_alteraca"));

                parametros.add(parametro);
            }

            return parametros;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception closeEx) {
                    //do nothing
                }
            }
        }
    }

    public boolean updateParametro(int id, String valor) {
        Connection conn = null;

        try {
            //obtem conexao com o banco de dados
            conn = getConnection();
            conn.setAutoCommit(false);

            //define SQL para atualiza��o
            String sql = "UPDATE tab_parametros SET valor_parametro = ? WHERE id_parametro = ?";

            //instance Prepared statement especificando os par�metros do SQL
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, valor);
            stmt.setInt(2, id);

            //executa a opera��o no banco de dados
            int affectedRows = stmt.executeUpdate();

            //verifica se deu certo. Se sim, atualiza a nota 
            if (affectedRows > 0) {
                //confirma as modifica��es no banco de dados
                conn.commit();
                return true;
                
            } else {
                //cancela as modifica��es no banco de dados
                conn.rollback();
                return false;
            }            

        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception closeEx) {
                    //do nothing
                }
            }
        }
    }
    
    public int verificaFila(int qtd_mesas)
    {
        Connection conn = null;

        try {
            conn = getConnection();
            conn.setAutoCommit(false);
            
            String sql = "SELECT max(id_fila) id_fila FROM tab_fila";
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet result = stmt.executeQuery();
            
            System.out.println("1 - " + qtd_mesas);
            
            if (result.next()) {
                int max_fila = result.getInt("id_fila");
                System.out.println("2 - " + max_fila);
                int affectedRows = 0;
                if (qtd_mesas>max_fila)
                {
                    for(int i=max_fila+1; i<= qtd_mesas; i++)
                    {
                        System.out.println("3 - " + i);
                        sql = "INSERT INTO tab_fila(id_fila, status_fila) VALUES (?,'Fechada')";
                        stmt = conn.prepareStatement(sql);
                        stmt.setInt(1, i);  
                        //executa a opera��o no banco de dados
                        affectedRows = stmt.executeUpdate();
                    }                    
                }
                else
                {
                        sql = "SELECT 1 filas_abertas FROM tab_fila WHERE id_fila > ? and status_fila = 'Aberta'";
                        
                        stmt = conn.prepareStatement(sql);
                        stmt.setInt(1, qtd_mesas);
                        ResultSet result2 = stmt.executeQuery();
            
                        if (result2.next()) {
                            conn.rollback();
                            return 3; //não é possivel excluir filas abetas
                        }
                        else{
                                sql = "DELETE FROM tab_fila WHERE id_fila > ?";
                                stmt = conn.prepareStatement(sql);
                                stmt.setInt(1, qtd_mesas);
                                affectedRows = stmt.executeUpdate();
                        }
                        
                }              
                if (affectedRows > 0) {
                    conn.commit();
                    return 1; //sucesso
                } else 
                {
                    //cancela as modifica��es no banco de dados
                    conn.rollback();
                    return 2; //erro generivco
                } 
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return 2;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception closeEx) {
                    //do nothing
                }
            }
        } 
        return 1;
    }

    public boolean habilitaParametro(int id, int habilitado) {
        Connection conn = null;

        try {
            //obtem conexao com o banco de dados
            conn = getConnection();
            conn.setAutoCommit(false);

            //define SQL para atualiza��o
            String sql = "UPDATE tab_parametros SET parametro_habilitado = ? WHERE id_parametro = ?";

            //instance Prepared statement especificando os par�metros do SQL
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1,habilitado);
            stmt.setInt(2,id);

            //executa a opera��o no banco de dados
            int affectedRows = stmt.executeUpdate();

            //verifica se deu certo. Se sim, atualiza a nota 
            if (affectedRows > 0) {
                  //confirma as modifica��es no banco de dados
                conn.commit();
                return true;
            } else {
                //cancela as modifica��es no banco de dados
                conn.rollback();
                return false;
            }            

        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception closeEx) {
                    //do nothing
                }
            }
        }
    }    
    
}
