package edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import edu.vo.Usuario;

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
}
