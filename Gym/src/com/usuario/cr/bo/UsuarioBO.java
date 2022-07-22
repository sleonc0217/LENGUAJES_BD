
package com.usuario.cr.bo;

import com.usuario.cr.bd.Conexion;
import com.usuario.cr.dao.UsuarioDAO;
import com.usuario.cr.entity.Usuario;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JTable;


public class UsuarioBO {
    
    private String mensaje="";
    private UsuarioDAO udao= new UsuarioDAO();
    
    public String agregarUsuario(Usuario usuario){
        Connection conn= Conexion.getConnection();
        try {
            mensaje= udao.agregarUsuario(conn,usuario);  
            
        } catch (Exception e) {
            
            
            mensaje=mensaje+ " "+e.getMessage();
            
        }finally{
            try {
                if(conn != null){
                    conn.close();
                }
            } catch (Exception e) {
                mensaje= mensaje + " "+e.getMessage();
            }
        }
        
        
        
    return mensaje;
     }
    public String editarUsuario(Usuario usuario){
         Connection conn= Conexion.getConnection();
        try {
            mensaje= udao.editarUsuario(conn,usuario);  
            
        } catch (Exception e) {
            
            
            mensaje=mensaje+ " "+e.getMessage();
            
        }finally{
            try {
                if(conn != null){
                    conn.close();
                }
            } catch (Exception e) {
                mensaje= mensaje + " "+e.getMessage();
            }
        }
        
        
        
    return mensaje;
     }
    public String borrarUsuario(int cedula){
         Connection conn= Conexion.getConnection();
        try {
            mensaje= udao.borrarUsuario(conn,cedula);  
            
        } catch (Exception e) {
            
            
            mensaje=mensaje+ " "+e.getMessage();
            
        }finally{
            try {
                if(conn != null){
                    conn.close();
                }
            } catch (Exception e) {
                mensaje= mensaje + " "+e.getMessage();
            }
        }
        
        
        
    return mensaje;
     }
    
    
    
    
    public void listarUsuario(JTable tabla){
        Connection conn= Conexion.getConnection();
         udao.listarUsuario(conn, tabla);
        try {
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
     } 
    
    public int getMaxID(){
        Connection conn= Conexion.getConnection();
         int id=udao.getMaxID(conn);
        try {
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return id;
    }
}
