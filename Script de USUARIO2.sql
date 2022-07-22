DROP TABLE USUARIO;
DROP TABLE CALORIAS_DIARIAS;
DROP TABLE IMC;
DROP TABLE PAGO;
DROP TABLE TELEFONO_USUARIO;



--------------------CREAMOS LA TABLA USUARIOS--------------
CREATE TABLE USUARIO(
IDUSUARIO NUMBER (5) PRIMARY KEY,
CEDULA NUMERIC (9),
NOMBRE VARCHAR2 (30),
APELLIDO_P VARCHAR2 (30),
APELLIDO_M VARCHAR2 (30),
EDAD NUMERIC (3),
PESO NUMERIC (3),
TALLA NUMERIC (3),
EMAIL VARCHAR2 (50)
);

---------------------------MODIFICAMOS LAS COLUMNAS PARA NO ACEPTAR VALORES NULOS---------
ALTER TABLE USUARIO
MODIFY NOMBRE NOT NULL;

ALTER TABLE USUARIO
MODIFY APELLIDO_P NOT NULL;

ALTER TABLE USUARIO
MODIFY APELLIDO_M NOT NULL;

ALTER TABLE USUARIO
MODIFY EDAD NOT NULL;

ALTER TABLE USUARIO
MODIFY PESO NOT NULL;

ALTER TABLE USUARIO
MODIFY TALLA NOT NULL;

ALTER TABLE USUARIO
MODIFY CEDULA NOT NULL;

ALTER TABLE USUARIO 
MODIFY EMAIL NOT NULL;

ALTER TABLE USUARIO
MODIFY IDUSUARIO NOT NULL;
---------------------------------------------------------MODIFICAMOS EL CAMPO CEDULA PARA SER UNICO----------------------------
ALTER TABLE USUARIO
ADD CONSTRAINT UQ_CEDULA
UNIQUE (CEDULA);
---------------------------------------------------------CREAMOS LA TABLA TELEFONO-USUARIO--------------------------

CREATE TABLE TELEFONO_USUARIO(
TELEFONO_ID NUMBER (10),
TELEFONO NUMBER (15),
TIPO NUMBER(3),
IDUSUARIO NUMBER (5),
PRIMARY KEY (TELEFONO_ID),
FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO(IDUSUARIO)
);
-------------------------------------MODIFICAMOS LAS COLUMNAS PARA NO ACEPTAR NULOS-------------------------
ALTER TABLE TELEFONO_USUARIO
MODIFY TELEFONO_ID NOT NULL;

ALTER TABLE TELEFONO_USUARIO
MODIFY TELEFONO NOT NULL;

ALTER TABLE TELEFONO_USUARIO
MODIFY TIPO NOT NULL;

ALTER TABLE TELEFONO_USUARIO
MODIFY IDUSUARIO NOT NULL;

----------------------------------------CREAMOS LA TABLA PAGOS----------------------------------------------------------------------------
CREATE TABLE PAGO(
ID_PAGO NUMBER (10),
NOMBRE VARCHAR2 (30),
CANTIDAD NUMBER (1),
MONTO NUMBER (10),
FECHA DATE,
IDUSUARIO,
PRIMARY KEY (ID_PAGO),
FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO(IDUSUARIO)
);

-------------------------------------MODIFICAMOS LAS COLUMNAS PARA NO ACEPTAR NULOS-------------------------

ALTER TABLE PAGO
MODIFY ID_PAGO NOT NULL;

ALTER TABLE PAGO
MODIFY NOMBRE NOT NULL;

ALTER TABLE PAGO
MODIFY CANTIDAD NOT NULL;

ALTER TABLE PAGO
MODIFY MONTO NOT NULL;

ALTER TABLE PAGO
MODIFY FECHA NOT NULL;


--------------------------------------------------CREAMOS LA TABLA CALORIAS_DIARIAS------------------------------------------------
CREATE TABLE CALORIAS_DIARIAS(
ID_CALORIAS NUMBER (10),
CALORIAS_DIA VARCHAR2 (5),
FECHA DATE,
IDUSUARIO NUMBER (5),
PRIMARY KEY (ID_CALORIAS),
FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO(IDUSUARIO)
);

-------------------------------------MODIFICAMOS LAS COLUMNAS PARA NO ACEPTAR NULOS-------------------------

ALTER TABLE CALORIAS_DIARIAS
MODIFY ID_CALORIAS NOT NULL;

ALTER TABLE CALORIAS_DIARIAS
MODIFY CALORIAS_DIA NOT NULL;

ALTER TABLE CALORIAS_DIARIAS
MODIFY FECHA NOT NULL;

ALTER TABLE CALORIAS_DIARIAS
MODIFY IDUSUARIO NOT NULL;

--------------------------------------------------CREAMOS LA TABLA IMC ------------------------------------------------

CREATE TABLE IMC(
ID_IMC NUMBER (10),
FECHA DATE,
IMC NUMBER (15),
IDUSUARIO NUMBER (5),
PRIMARY KEY (ID_IMC),
FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO(IDUSUARIO)
);



-------------------------------------MODIFICAMOS LAS COLUMNAS PARA NO ACEPTAR NULOS-------------------------

ALTER TABLE IMC
MODIFY ID_IMC NOT NULL;

ALTER TABLE IMC
MODIFY FECHA NOT NULL;

ALTER TABLE IMC
MODIFY IMC NOT NULL;

ALTER TABLE IMC
MODIFY IDUSUARIO NOT NULL;

------------------------CREAMOS LA TABLA EJERCICIO----------------------
CREATE TABLE EJERCICIO(
ID_EJERCICIO NUMBER(5) PRIMARY KEY,
TIPO_MUSCULAR VARCHAR2(50),
NOM_EJERCICIO VARCHAR2(50)

);

------------------------CREAMOS LA TABLA PRODUCTO----------------------
CREATE TABLE PRODUCTO(
ID_PRODUCTO NUMBER(5) PRIMARY KEY,
NOM_PRODUCTO VARCHAR2(50),
PRECIO_COMPRA NUMBER(8),
PRECIO_VENTA NUMBER(8),
FECHA DATE,
ID_PAGO NUMBER(5),
FOREIGN KEY (ID_PAGO) REFERENCES PAGO(ID_PAGO)
);

---------------------------MODIFICAMOS LAS COLUMNAS PARA NO ACEPTAR VALORES NULOS---------
ALTER TABLE PRODUCTO
MODIFY ID_PRODUCTO NOT NULL;

ALTER TABLE PRODUCTO
MODIFY NOM_PRODUCTO NOT NULL;

ALTER TABLE PRODUCTO
MODIFY PRECIO_COMPRA NOT NULL;

ALTER TABLE PRODUCTO
MODIFY PRECIO_VENTA NOT NULL;

ALTER TABLE PRODUCTO
MODIFY FECHA NOT NULL;

ALTER TABLE PRODUCTO
MODIFY ID_PAGO NOT NULL;

---------------------------MODIFICAMOS LAS COLUMNAS PARA NO ACEPTAR VALORES NULOS---------
ALTER TABLE EJERCICIO
MODIFY ID_EJERCICIO NOT NULL;

ALTER TABLE EJERCICIO
MODIFY TIPO_MUSCULAR NOT NULL;

ALTER TABLE EJERCICIO
MODIFY NOM_EJERCICIO NOT NULL;


------------------------CREAMOS LA TABLA INVENTARIO----------------------
CREATE TABLE INVENTARIO(
ID_EQUIPO NUMBER(5) PRIMARY KEY,
NOMBRE VARCHAR2(50),
CANTIDAD NUMBER(3),
FECHA DATE,
ID_PAGO NUMBER(5),
FOREIGN KEY (ID_PAGO) REFERENCES PAGO(ID_PAGO)
);

---------------------------MODIFICAMOS LAS COLUMNAS PARA NO ACEPTAR VALORES NULOS---------
ALTER TABLE INVENTARIO
MODIFY ID_EQUIPO NOT NULL;

ALTER TABLE INVENTARIO
MODIFY NOMBRE NOT NULL;

ALTER TABLE INVENTARIO
MODIFY CANTIDAD NOT NULL;

ALTER TABLE INVENTARIO
MODIFY FECHA NOT NULL;

ALTER TABLE INVENTARIO
MODIFY ID_PAGO NOT NULL;

------------------------CREAMOS LA TABLA MACRONUTRIENTES----------------------
CREATE TABLE MACRONUTRIENTES(
ID_MACRO NUMBER(5) PRIMARY KEY,
FECHA DATE,
GRAMOS_G NUMBER(4),
GRAMOS_P NUMBER (4),
GRAMOS_C number(4),
IDUSUARIO NUMBER(9),
FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO(IDUSUARIO)
);

---------------------------MODIFICAMOS LAS COLUMNAS PARA NO ACEPTAR VALORES NULOS---------
ALTER TABLE MACRONUTRIENTES
MODIFY ID_MACRO NOT NULL;

ALTER TABLE MACRONUTRIENTES
MODIFY FECHA NOT NULL;

ALTER TABLE MACRONUTRIENTES
MODIFY GRAMOS_G NOT NULL;

ALTER TABLE MACRONUTRIENTES
MODIFY GRAMOS_C NOT NULL;

ALTER TABLE MACRONUTRIENTES
MODIFY GRAMOS_P NOT NULL;

ALTER TABLE MACRONUTRIENTES
MODIFY IDUSUARIO NOT NULL;


------------------------CREAMOS LA TABLA RUTINA_L_EJERCICIO----------------------
CREATE TABLE RUTINA_LUNES(
ID_RUTINA_L NUMBER(5) PRIMARY KEY,
EJERCICIO_1 VARCHAR2 (70),
EJERCICIO_2 VARCHAR2 (70),
EJERCICIO_3 VARCHAR2 (70),
EJERCICIO_4 VARCHAR2 (70),
EJERCICIO_5 VARCHAR2 (70),
EJERCICIO_6 VARCHAR2 (70),
EJERCICIO_7 VARCHAR2 (70),
EJERCICIO_8 VARCHAR2 (70),
EJERCICIO_9 VARCHAR2 (70),
IDUSUARIO NUMBER(5),
FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO(IDUSUARIO)
);

---------------------------MODIFICAMOS LAS COLUMNAS PARA NO ACEPTAR VALORES NULOS---------
ALTER TABLE RUTINA_LUNES
MODIFY ID_RUTINA_L NOT NULL;

ALTER TABLE RUTINA_LUNES
MODIFY EJERCICIO_1 NOT NULL;

ALTER TABLE RUTINA_LUNES
MODIFY EJERCICIO_2 NOT NULL;

ALTER TABLE RUTINA_LUNES
MODIFY EJERCICIO_3 NOT NULL;

ALTER TABLE RUTINA_LUNES
MODIFY EJERCICIO_4 NOT NULL;

ALTER TABLE RUTINA_LUNES
MODIFY EJERCICIO_5 NOT NULL;

ALTER TABLE RUTINA_LUNES
MODIFY EJERCICIO_6 NOT NULL;

ALTER TABLE RUTINA_LUNES
MODIFY EJERCICIO_7 NOT NULL;

ALTER TABLE RUTINA_LUNES
MODIFY EJERCICIO_8 NOT NULL;

ALTER TABLE RUTINA_LUNES
MODIFY EJERCICIO_9 NOT NULL;

ALTER TABLE RUTINA_LUNES
MODIFY IDUSUARIO NUMBER(5) NOT NULL;


------------------------CREAMOS LA TABLA RUTINA_K_EJERCICIO----------------------
CREATE TABLE RUTINA_MARTES(
ID_RUTINA_K NUMBER(5) PRIMARY KEY,
EJERCICIO_1 VARCHAR2 (70),
EJERCICIO_2 VARCHAR2 (70),
EJERCICIO_3 VARCHAR2 (70),
EJERCICIO_4 VARCHAR2 (70),
EJERCICIO_5 VARCHAR2 (70),
EJERCICIO_6 VARCHAR2 (70),
EJERCICIO_7 VARCHAR2 (70),
EJERCICIO_8 VARCHAR2 (70),
EJERCICIO_9 VARCHAR2 (70),
IDUSUARIO NUMBER(5),
FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO(IDUSUARIO)
);

---------------------------MODIFICAMOS LAS COLUMNAS PARA NO ACEPTAR VALORES NULOS---------
ALTER TABLE RUTINA_MARTES
MODIFY ID_RUTINA_K NOT NULL;

ALTER TABLE RUTINA_MARTES
MODIFY EJERCICIO_1 NOT NULL;

ALTER TABLE RUTINA_MARTES
MODIFY EJERCICIO_2 NOT NULL;

ALTER TABLE  RUTINA_MARTES
MODIFY EJERCICIO_3 NOT NULL;

ALTER TABLE  RUTINA_MARTES
MODIFY EJERCICIO_4 NOT NULL;

ALTER TABLE  RUTINA_MARTES
MODIFY EJERCICIO_5 NOT NULL;

ALTER TABLE  RUTINA_MARTES
MODIFY EJERCICIO_6 NOT NULL;

ALTER TABLE  RUTINA_MARTES
MODIFY EJERCICIO_7 NOT NULL;

ALTER TABLE  RUTINA_MARTES
MODIFY EJERCICIO_8 NOT NULL;

ALTER TABLE  RUTINA_MARTES
MODIFY EJERCICIO_9 NOT NULL;

ALTER TABLE  RUTINA_MARTES
MODIFY IDUSUARIO NUMBER(5) NOT NULL;



------------------------CREAMOS LA TABLA RUTINA_M_EJERCICIO----------------------
CREATE TABLE RUTINA_MIERCOLES(
ID_RUTINA_M NUMBER(5) PRIMARY KEY,
EJERCICIO_1 VARCHAR2 (70),
EJERCICIO_2 VARCHAR2 (70),
EJERCICIO_3 VARCHAR2 (70),
EJERCICIO_4 VARCHAR2 (70),
EJERCICIO_5 VARCHAR2 (70),
EJERCICIO_6 VARCHAR2 (70),
EJERCICIO_7 VARCHAR2 (70),
EJERCICIO_8 VARCHAR2 (70),
EJERCICIO_9 VARCHAR2 (70),
IDUSUARIO NUMBER(5),
FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO(IDUSUARIO)
);

---------------------------MODIFICAMOS LAS COLUMNAS PARA NO ACEPTAR VALORES NULOS---------
ALTER TABLE RUTINA_MIERCOLES
MODIFY ID_RUTINA_M NOT NULL;

ALTER TABLE RUTINA_MIERCOLES
MODIFY EJERCICIO_1 NOT NULL;

ALTER TABLE RUTINA_MIERCOLES
MODIFY EJERCICIO_2 NOT NULL;

ALTER TABLE  RUTINA_MIERCOLES
MODIFY EJERCICIO_3 NOT NULL;

ALTER TABLE  RUTINA_MIERCOLES
MODIFY EJERCICIO_4 NOT NULL;

ALTER TABLE  RUTINA_MIERCOLES
MODIFY EJERCICIO_5 NOT NULL;

ALTER TABLE  RUTINA_MIERCOLES
MODIFY EJERCICIO_6 NOT NULL;

ALTER TABLE  RUTINA_MIERCOLES
MODIFY EJERCICIO_7 NOT NULL;

ALTER TABLE  RUTINA_MIERCOLES
MODIFY EJERCICIO_8 NOT NULL;

ALTER TABLE  RUTINA_MIERCOLES
MODIFY EJERCICIO_9 NOT NULL;

ALTER TABLE  RUTINA_MIERCOLES
MODIFY IDUSUARIO NUMBER(5) NOT NULL;

------------------------CREAMOS LA TABLA RUTINA_J_EJERCICIO----------------------
CREATE TABLE RUTINA_JUEVES(
ID_RUTINA_J NUMBER(5) PRIMARY KEY,
EJERCICIO_1 VARCHAR2 (70),
EJERCICIO_2 VARCHAR2 (70),
EJERCICIO_3 VARCHAR2 (70),
EJERCICIO_4 VARCHAR2 (70),
EJERCICIO_5 VARCHAR2 (70),
EJERCICIO_6 VARCHAR2 (70),
EJERCICIO_7 VARCHAR2 (70),
EJERCICIO_8 VARCHAR2 (70),
EJERCICIO_9 VARCHAR2 (70),
IDUSUARIO NUMBER(5),
FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO(IDUSUARIO)
);

---------------------------MODIFICAMOS LAS COLUMNAS PARA NO ACEPTAR VALORES NULOS---------
ALTER TABLE RUTINA_JUEVES
MODIFY ID_RUTINA_J NOT NULL;

ALTER TABLE RUTINA_JUEVES
MODIFY EJERCICIO_1 NOT NULL;

ALTER TABLE RUTINA_JUEVES
MODIFY EJERCICIO_2 NOT NULL;

ALTER TABLE  RUTINA_JUEVES
MODIFY EJERCICIO_3 NOT NULL;

ALTER TABLE  RUTINA_JUEVES
MODIFY EJERCICIO_4 NOT NULL;

ALTER TABLE  RUTINA_JUEVES
MODIFY EJERCICIO_5 NOT NULL;

ALTER TABLE  RUTINA_JUEVES
MODIFY EJERCICIO_6 NOT NULL;

ALTER TABLE  RUTINA_JUEVES
MODIFY EJERCICIO_7 NOT NULL;

ALTER TABLE  RUTINA_JUEVES
MODIFY EJERCICIO_8 NOT NULL;

ALTER TABLE  RUTINA_JUEVES
MODIFY EJERCICIO_9 NOT NULL;

ALTER TABLE  RUTINA_JUEVES
MODIFY IDUSUARIO NUMBER(5) NOT NULL;











------------------------CREAMOS LA TABLA RUTINA_V_EJERCICIO----------------------
CREATE TABLE RUTINA_VIERNES(
ID_RUTINA_V NUMBER(5) PRIMARY KEY,
EJERCICIO_1 VARCHAR2 (70),
EJERCICIO_2 VARCHAR2 (70),
EJERCICIO_3 VARCHAR2 (70),
EJERCICIO_4 VARCHAR2 (70),
EJERCICIO_5 VARCHAR2 (70),
EJERCICIO_6 VARCHAR2 (70),
EJERCICIO_7 VARCHAR2 (70),
EJERCICIO_8 VARCHAR2 (70),
EJERCICIO_9 VARCHAR2 (70),
IDUSUARIO NUMBER(5),
FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO(IDUSUARIO)
);

---------------------------MODIFICAMOS LAS COLUMNAS PARA NO ACEPTAR VALORES NULOS---------
ALTER TABLE RUTINA_VIERNES
MODIFY ID_RUTINA_J NOT NULL;

ALTER TABLE RUTINA_VIERNES
MODIFY EJERCICIO_1 NOT NULL;

ALTER TABLE RUTINA_VIERNES
MODIFY EJERCICIO_2 NOT NULL;

ALTER TABLE  RUTINA_VIERNES
MODIFY EJERCICIO_3 NOT NULL;

ALTER TABLE  RUTINA_VIERNES
MODIFY EJERCICIO_4 NOT NULL;

ALTER TABLE  RUTINA_VIERNES
MODIFY EJERCICIO_5 NOT NULL;

ALTER TABLE  RUTINA_VIERNES
MODIFY EJERCICIO_6 NOT NULL;

ALTER TABLE  RUTINA_VIERNES
MODIFY EJERCICIO_7 NOT NULL;

ALTER TABLE  RUTINA_VIERNES
MODIFY EJERCICIO_8 NOT NULL;

ALTER TABLE  RUTINA_VIERNES
MODIFY EJERCICIO_9 NOT NULL;

ALTER TABLE  RUTINA_VIERNES
MODIFY IDUSUARIO NUMBER(5) NOT NULL;




------------------------CREAMOS LA TABLA RUTINA_S_EJERCICIO----------------------
CREATE TABLE RUTINA_SABADO(
ID_RUTINA_S NUMBER(5) PRIMARY KEY,
EJERCICIO_1 VARCHAR2 (70),
EJERCICIO_2 VARCHAR2 (70),
EJERCICIO_3 VARCHAR2 (70),
EJERCICIO_4 VARCHAR2 (70),
EJERCICIO_5 VARCHAR2 (70),
EJERCICIO_6 VARCHAR2 (70),
EJERCICIO_7 VARCHAR2 (70),
EJERCICIO_8 VARCHAR2 (70),
EJERCICIO_9 VARCHAR2 (70),
IDUSUARIO NUMBER(5),
FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO(IDUSUARIO)
);

---------------------------MODIFICAMOS LAS COLUMNAS PARA NO ACEPTAR VALORES NULOS---------
ALTER TABLE RUTINA_SABADO
MODIFY ID_RUTINA_S NOT NULL;

ALTER TABLE RUTINA_SABADO
MODIFY EJERCICIO_1 NOT NULL;

ALTER TABLE RUTINA_SABADO
MODIFY EJERCICIO_2 NOT NULL;

ALTER TABLE  RUTINA_SABADO
MODIFY EJERCICIO_3 NOT NULL;

ALTER TABLE  RUTINA_SABADO
MODIFY EJERCICIO_4 NOT NULL;

ALTER TABLE  RUTINA_SABADO
MODIFY EJERCICIO_5 NOT NULL;

ALTER TABLE  RUTINA_SABADO
MODIFY EJERCICIO_6 NOT NULL;

ALTER TABLE  RUTINA_SABADO
MODIFY EJERCICIO_7 NOT NULL;

ALTER TABLE  RUTINA_SABADO
MODIFY EJERCICIO_8 NOT NULL;

ALTER TABLE  RUTINA_SABADO
MODIFY EJERCICIO_9 NOT NULL;

ALTER TABLE  RUTINA_SABADO
MODIFY IDUSUARIO NUMBER(5) NOT NULL;





------------------------------ALTERACIONES EXTRA A LAS TABLAS---------------------------------------------------

ALTER TABLE PAGO
ADD IDUSUARIO NUMBER(5) NOT NULL;

ALTER TABLE PAGO
ADD CONSTRAINT FK_PAGO FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO(IDUSUARIO);