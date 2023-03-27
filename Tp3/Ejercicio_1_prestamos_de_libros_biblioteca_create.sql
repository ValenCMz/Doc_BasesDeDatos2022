-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-04-20 20:27:13.678

-- tables
-- Table: AUTOR
CREATE TABLE AUTOR (
    id_autor int  NOT NULL,
    nombre varchar(40)  NOT NULL,
    apellido varchar(40)  NOT NULL,
    CATALOGO_LIBRO_cod_catalogo int  NOT NULL
);

-- Table: CATALOGO_LIBRO
CREATE TABLE CATALOGO_LIBRO (
    cod_catalogo int  NOT NULL,
    titulo varchar(40)  NOT NULL,
    formato varchar(40)  NOT NULL,
    editorial varchar(40)  NOT NULL,
    CONSTRAINT CATALOGO_LIBRO_pk PRIMARY KEY (cod_catalogo)
);

-- Table: CON_CARNET
CREATE TABLE CON_CARNET (
    nro_carnet int  NOT NULL,
    USUARIO_id_usuario int  NOT NULL
);

-- Table: EJEMPLAR_LIB
CREATE TABLE EJEMPLAR_LIB (
    nro_ejemplar int  NOT NULL,
    anio_edicion date  NOT NULL,
    nro_edicion int  NOT NULL,
    CATALOGO_LIBRO_cod_catalogo int  NOT NULL,
    CONSTRAINT EJEMPLAR_LIB_pk PRIMARY KEY (nro_ejemplar)
);

-- Table: PRESTAMO
CREATE TABLE PRESTAMO (
    id_prestamo int  NOT NULL,
    fecha_desde date  NOT NULL,
    fecha_hasta date  NOT NULL,
    EJEMPLAR_LIB_nro_ejemplar int  NOT NULL,
    CONSTRAINT PRESTAMO_pk PRIMARY KEY (id_prestamo)
);

-- Table: SIN_CARNET
CREATE TABLE SIN_CARNET (
    nro_celular int  NOT NULL,
    USUARIO_id_usuario int  NOT NULL
);

-- Table: USUARIO
CREATE TABLE USUARIO (
    id_usuario int  NOT NULL,
    tipo_doc varchar(%)  NOT NULL,
    nro_doc int  NOT NULL,
    apellido varchar(40)  NOT NULL,
    nombre varchar(40)  NOT NULL,
    email varchar(40)  NOT NULL,
    CONSTRAINT USUARIO_pk PRIMARY KEY (id_usuario)
);

-- foreign keys
-- Reference: AUTOR_CATALOGO_LIBRO (table: AUTOR)
ALTER TABLE AUTOR ADD CONSTRAINT AUTOR_CATALOGO_LIBRO
    FOREIGN KEY (CATALOGO_LIBRO_cod_catalogo)
    REFERENCES CATALOGO_LIBRO (cod_catalogo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: CON_CARNET_USUARIO (table: CON_CARNET)
ALTER TABLE CON_CARNET ADD CONSTRAINT CON_CARNET_USUARIO
    FOREIGN KEY (USUARIO_id_usuario)
    REFERENCES USUARIO (id_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: EJEMPLAR_LIB_CATALOGO_LIBRO (table: EJEMPLAR_LIB)
ALTER TABLE EJEMPLAR_LIB ADD CONSTRAINT EJEMPLAR_LIB_CATALOGO_LIBRO
    FOREIGN KEY (CATALOGO_LIBRO_cod_catalogo)
    REFERENCES CATALOGO_LIBRO (cod_catalogo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PRESTAMO_CON_CARNET (table: PRESTAMO)
ALTER TABLE PRESTAMO ADD CONSTRAINT PRESTAMO_CON_CARNET
    FOREIGN KEY ()
    REFERENCES CON_CARNET ()  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PRESTAMO_EJEMPLAR_LIB (table: PRESTAMO)
ALTER TABLE PRESTAMO ADD CONSTRAINT PRESTAMO_EJEMPLAR_LIB
    FOREIGN KEY (EJEMPLAR_LIB_nro_ejemplar)
    REFERENCES EJEMPLAR_LIB (nro_ejemplar)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: SIN_CARNET_USUARIO (table: SIN_CARNET)
ALTER TABLE SIN_CARNET ADD CONSTRAINT SIN_CARNET_USUARIO
    FOREIGN KEY (USUARIO_id_usuario)
    REFERENCES USUARIO (id_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

