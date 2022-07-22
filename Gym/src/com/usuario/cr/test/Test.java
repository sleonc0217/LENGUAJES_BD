/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.usuario.cr.test;

import com.usuario.cr.bo.UsuarioBO;
import com.usuario.cr.entity.Usuario;

/**
 *
 * @author sebas
 */
public class Test {
    
    UsuarioBO ubo= new UsuarioBO();
    Usuario usu= new Usuario();
    String mensaje="";
////////////////Eliminamos//////////////   
//    public void eliminar(){
//    mensaje = ubo.borrarUsuario(1);
//    System.out.println(mensaje);
        
        
/////////////////////////////////////////////
//////////////////Agregamos//////////////////
///////////////////////////////////////////// 
//        public void insertar(){
//        usu.setCEDULA(118524576);
//        usu.setNOMBRE("Pedro");
//        usu.setAPELLIDOP("Cordero");
//        usu.setAPELLIDOM("Correa");
//        usu.setEDAD(56);
//        usu.setPESO(78);
//        usu.setTALLA(170);
//        usu.setEMAIL("pcordero@test.com");
//          mensaje=ubo.agregarUsuario(usu);

//////////////////////////////////////////////
//////////////////////Modificamos/////////////
//////////////////////////////////////////////
        public void modificar(){
        usu.setCEDULA(1);
        usu.setNOMBRE("Francisco");
        usu.setAPELLIDOP("Porras");
        usu.setAPELLIDOM("Castro");
        usu.setEDAD(24);
        usu.setPESO(80);
        usu.setTALLA(175);
        usu.setEMAIL("test2@gmail.com");
        mensaje=ubo.editarUsuario(usu);
        
        System.out.println(mensaje);
        
        
    }
    public static void main(String[] args){
        Test test=new Test();
//        test.insertar();
        test.modificar();
//          test.eliminar();

    }
    
    
}
