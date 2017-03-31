package edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import edu.vo.Usuario;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDao extends Dao {

    public Usuario getUsuario(String nm_usuario, String senha_usuario) {
        Connection conn = null;

        try {
            conn = getConnection();

            String sql = "SELECT id_usuario, nm_usuario, email_usuario, status_usuario, tipo_usuario FROM tab_usuarios " + "where nm_usuario=? AND senha_usuario=SHA1(?)";
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, nm_usuario);
            stmt.setString(2, senha_usuario);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                Usuario usuario = new Usuario();
                usuario.setId_usuario(result.getInt("id_usuario"));
                usuario.setNm_usuario(result.getString("nm_usuario"));
                usuario.setEmail_usuario(result.getString("email_usuario"));
                usuario.setTipo_usuario(result.getString("tipo_usuario"));

                return usuario;
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
    
    public Usuario getEditarUsuario(String id_usuario) {
        Connection conn = null;

        try {
            conn = getConnection();

            String sql = "SELECT nm_usuario, email_usuario, cpf_usuario, status_usuario, tipo_usuario FROM tab_usuarios " + "where id_usuario=?";
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, id_usuario);
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                Usuario usuario = new Usuario();
                usuario.setId_usuario(Integer.parseInt(id_usuario));
                usuario.setNm_usuario(result.getString("nm_usuario"));
                usuario.setEmail_usuario(result.getString("email_usuario"));
                usuario.setCpf_usuario(result.getInt("cpf_usuario"));
                usuario.setTipo_usuario(result.getString("tipo_usuario"));
                usuario.setStatus_usuario(result.getString("status_usuario"));

                return usuario;
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
        
    public List<Usuario> getUsuarios() {
        Connection conn = null;
        List<Usuario> usuarios = new ArrayList<Usuario>();

        try {
            conn = getConnection();

            String sql = "SELECT id_usuario, nm_usuario, email_usuario, cpf_usuario, tipo_usuario FROM tab_usuarios where status_usuario = 'Ativo'";

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet result = stmt.executeQuery();

            while (result.next()) {
                Usuario usuario = new Usuario();
                
                usuario.setId_usuario(result.getInt("id_usuario"));
                usuario.setNm_usuario(result.getString("nm_usuario"));
                usuario.setEmail_usuario(result.getString("email_usuario"));                
                usuario.setCpf_usuario(result.getInt("cpf_usuario"));
                usuario.setTipo_usuario(result.getString("tipo_usuario"));
                

                usuarios.add(usuario);
            }

            return usuarios;
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
    
    
        public boolean updateUsuario(Usuario usuario) {
        Connection conn = null;

        try {
            //obtem conexao com o banco de dados
            conn = getConnection();
            conn.setAutoCommit(false);

            //define SQL para atualiza��o
            String sql = "UPDATE tab_usuarios SET nm_usuario = ?, email_usuario = ?, cpf_usuario = ?, status_usuario = ?, tipo_usuario = ?  WHERE id_usuario = ?";

            //instance Prepared statement especificando os par�metros do SQL
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario.getNm_usuario());
            stmt.setString(2, usuario.getEmail_usuario());
            stmt.setInt(3, usuario.getCpf_usuario());
            stmt.setString(4, usuario.getStatus_usuario());
            stmt.setString(5, usuario.getTipo_usuario());
            stmt.setInt(6, usuario.getId_usuario());

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

       public boolean deleteUsuario(int id_usuario) {
        Connection conn = null;

        try {
            //obtem conexao com o banco de dados
            conn = getConnection();
            conn.setAutoCommit(false);

            //define SQL para atualiza��o
            String sql = "UPDATE tab_usuarios SET status_usuario = 'Inativo' WHERE id_usuario = ?";

            //instance Prepared statement especificando os par�metros do SQL
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id_usuario);

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
