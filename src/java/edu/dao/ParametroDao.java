package edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import edu.vo.Parametro;

public class ParametroDao extends Dao {

    public Parametro getParametro(int id_parametro) {
        Connection conn = null;

        try {
            conn = getConnection();

            String sql = "SELECT id_parametro, desc_parametro, valor_parametro, usuario_alteracao, data_alteraca FROM tab_parametros WHERE id_parametro = ?";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id_parametro);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                Parametro parametro = new Parametro();
                parametro.setId_parametro(result.getInt("id_parametro"));
                parametro.setUsuario_alteracao(result.getInt("usuario_alteracao"));
                parametro.setDesc_parametro(result.getString("desc_parametro"));
                parametro.setValor_parametro(result.getString("valor_parametro"));
                parametro.setData_alteracao(result.getDate("data_alteraca"));

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

            String sql = "SELECT id_parametro, desc_parametro, valor_parametro, usuario_alteracao FROM tab_parametros";

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet result = stmt.executeQuery();

            while (result.next()) {
                Parametro parametro = new Parametro();
                
                parametro.setId_parametro(result.getInt("id_parametro"));
                parametro.setUsuario_alteracao(result.getInt("usuario_alteracao"));
                parametro.setDesc_parametro(result.getString("desc_parametro"));
                parametro.setValor_parametro(result.getString("valor_parametro"));
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

    public boolean updateParametro(Parametro parametro) {
        Connection conn = null;

        try {
            //obtem conexao com o banco de dados
            conn = getConnection();
            conn.setAutoCommit(false);

            //define SQL para atualiza��o
            String sql = "UPDATE tab_parametros SET valor_parametro = ? WHERE id_parametro = ?";

            //instance Prepared statement especificando os par�metros do SQL
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, parametro.getValor_parametro());
            stmt.setInt(2, parametro.getId_parametro());

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

    public boolean deleteParametro(int id_parametro) {
        Connection conn = null;

        try {
            //obtem conexao com o banco de dados
            conn = getConnection();

            //define SQL para atualiza��o
            String sql = "DELETE FROM tab_parametros WHERE id_parametro = ?";

            //instance Prepared statement especificando os par�metros do SQL
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id_parametro);

            //executa a opera��o no banco de dados
            return stmt.executeUpdate() > 0;
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
