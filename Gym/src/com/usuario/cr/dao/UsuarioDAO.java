
package com.usuario.cr.dao;

import com.usuario.cr.entity.Usuario;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import java.sql.*;
import javax.swing.JTable;



public class UsuarioDAO { 
    
    private String mensaje="";
    
    
     public String agregarUsuario(Connection con , Usuario usuario){
         PreparedStatement pst= null;
         String sql="INSERT INTO USUARIO (IdUsuario,Cedula, Nombre, Apellido_P, Apellido_M, Edad, Peso, Talla, Email)"
                     + "VALUES(?,?,?,?,?,?,?,?,?)";
         try{ 
             pst = con.prepareStatement(sql);
             pst.setInt(1,usuario.getIDUSUARIO());
             pst.setInt(2,usuario.getCEDULA());
             pst.setString(3,usuario.getNOMBRE());
             pst.setString(4,usuario.getAPELLIDOP());
             pst.setString(5,usuario.getAPELLIDOM());
             pst.setInt(6,usuario.getEDAD());
             pst.setInt(7,usuario.getPESO());
             pst.setInt(8,usuario.getTALLA());
             pst.setString(9,usuario.getEMAIL());
             mensaje= "GUARDADO CORRECTAMENTE";
             pst.execute();
             pst.close();
         }catch(SQLException e){
              mensaje= "NO SE PUDO GUARDAR CORRECTAMENTE" + e.getMessage();
         }
         return mensaje;
     }
    public String editarUsuario(Connection con, Usuario usuario){
         PreparedStatement pst= null;
         String sql="UPDATE USUARIO SET CEDULA = ?, NOMBRE = ?, APELLIDO_P = ?, APELLIDO_M = ?, EDAD = ?, PESO = ?, TALLA = ?, EMAIL = ?"
                 + "WHERE IDUSUARIO = ?";
         try{
             pst = con.prepareStatement(sql);
             
             pst.setInt(1,usuario.getCEDULA());
             pst.setString(2,usuario.getNOMBRE());
             pst.setString(3,usuario.getAPELLIDOP());
             pst.setString(4,usuario.getAPELLIDOM());
             pst.setInt(5,usuario.getEDAD());
             pst.setInt(6,usuario.getPESO());
             pst.setInt(7,usuario.getTALLA());
             pst.setString(8,usuario.getEMAIL());
             pst.setInt(9,usuario.getIDUSUARIO());
             mensaje= "ACTUALIZADO CORRECTAMENTE";
             pst.execute();
             pst.close();
         }catch(SQLException e){
              mensaje= "NO SE PUDO ACTUALIZAR CORRECTAMENTE" + e.getMessage();
         }
        return mensaje;
     }
    public String borrarUsuario(Connection con, int cedula){
        PreparedStatement pst= null;
         String sql="DELETE FROM USUARIO WHERE CEDULA= ?";
         try{
             pst = con.prepareStatement(sql);
             pst.setInt(1,cedula);
            
             mensaje= "ELIMINADO CORRECTAMENTE";
             pst.execute();
             pst.close();
         }catch(SQLException e){
              mensaje= "NO SE PUDO ELIMINAR CORRECTAMENTE" + e.getMessage();
         }
         return null;
     }
    public void listarUsuario(Connection con, JTable tabla){
         DefaultTableModel model;
         String [] columnas = {"IDUSUARIO","CEDULA","NOMBRE","APELLIDO_P","APELLIDO_M","EDAD","PESO","TALLA","EMAIL"};
         model = new DefaultTableModel(null, columnas);
         
         String sql = "SELECT * FROM USUARIO ORDER BY IDUSUARIO";
         
         String [] filas = new String [9];
         Statement st = null;
         ResultSet rs = null;
         try {
            st = con.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()){
                for(int i=0; i<9; i++){
                    filas[i]=rs.getString(i+1);
                }
                model.addRow(filas);
            }
            tabla.setModel(model);
        } catch (Exception e) {
        
        JOptionPane.showMessageDialog(null, "No se puede desplegar en la tabla");
        
        }
     } 
     
    public int getMaxID(Connection con){
        int id=0;
        PreparedStatement pst= null;
        ResultSet rs=null;
        try {
            pst=con.prepareStatement("SELECT MAX(IDUSUARIO)+1 AS id FROM USUARIO");
            rs=pst.executeQuery();
            if(rs.next()){
                id=rs.getInt(1);
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Error al mostrar id"+e.getMessage());
        }
        return id;
    }
    
    
}
