
package com.usuario.cr.entity;


public class Usuario {
    private int IDUSUARIO;
    private int CEDULA;
    private String NOMBRE;
    private String APELLIDOP;
    private String APELLIDOM;
    private int EDAD;
    private int PESO;
    private int TALLA;
    private String EMAIL;

    public Usuario() {
    }

    public Usuario(int IDUSUARIO, int CEDULA, String NOMBRE, String APELLIDOP, String APELLIDOM,int EDAD, int PESO, int TALLA, String EMAIL) {
        this.IDUSUARIO=IDUSUARIO;
        this.CEDULA = CEDULA;
        this.NOMBRE = NOMBRE;
        this.APELLIDOP = APELLIDOP;
        this.APELLIDOM = APELLIDOM;
        this.EDAD= EDAD;
        this.PESO = PESO;
        this.TALLA = TALLA;
        this.EMAIL = EMAIL;
    }
    public int getIDUSUARIO() {
        return IDUSUARIO;
    }

    public void setIDUSUARIO(int IDUSUARIO) {
        this.IDUSUARIO = IDUSUARIO;
    }
    public int getCEDULA() {
        return CEDULA;
    }

    public void setCEDULA(int CEDULA) {
        this.CEDULA = CEDULA;
    }

    public String getNOMBRE() {
        return NOMBRE;
    }

    public void setNOMBRE(String NOMBRE) {
        this.NOMBRE = NOMBRE;
    }

    public String getAPELLIDOP() {
        return APELLIDOP;
    }

    public void setAPELLIDOP(String APELLIDOP) {
        this.APELLIDOP = APELLIDOP;
    }

    public String getAPELLIDOM() {
        return APELLIDOM;
    }

    public void setAPELLIDOM(String APELLIDOM) {
        this.APELLIDOM = APELLIDOM;
    }
    public int getEDAD(){
        return EDAD;
    }
    public void setEDAD(int EDAD){
        this.EDAD=EDAD;
    }
    public int getPESO() {
        return PESO;
    }

    public void setPESO(int PESO) {
        this.PESO = PESO;
    }

    public int getTALLA() {
        return TALLA;
    }

    public void setTALLA(int TALLA) {
        this.TALLA = TALLA;
    }

    public String getEMAIL() {
        return EMAIL;
    }

    public void setEMAIL(String EMAIL) {
        this.EMAIL = EMAIL;
    }

    
    
    
}
