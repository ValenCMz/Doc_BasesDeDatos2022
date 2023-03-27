-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-05-18 19:33:00.08

-- tables
-- Table: GRUPO
CREATE TABLE GRUPO (
    Nro_Grupo int  NOT NULL,
    Nombre_Grupo varchar(40)  NOT NULL,
    limite_integrantes int  NOT NULL,
    tipo_gr int  NOT NULL,
    CONSTRAINT GRUPO_pk PRIMARY KEY (Nro_Grupo)
);

-- Table: GR_COMUN
CREATE TABLE GR_COMUN (
    caracteristica varchar(200)  NOT NULL,
    GRUPO_Nro_Grupo int  NOT NULL,
    CONSTRAINT GR_COMUN_pk PRIMARY KEY (GRUPO_Nro_Grupo)
);

-- Table: GR_EXCLUSIVO
CREATE TABLE GR_EXCLUSIVO (
    perfil varchar(40)  NOT NULL,
    GRUPO_Nro_Grupo int  NOT NULL,
    CONSTRAINT GR_EXCLUSIVO_pk PRIMARY KEY (GRUPO_Nro_Grupo)
);

-- Table: INTEGRA
CREATE TABLE INTEGRA (
    USUARIO_IdUsuario int  NOT NULL,
    USUARIO_tipo_usuario char  NOT NULL,
    USUARIO_cod_usuario int  NOT NULL,
    GRUPO_Nro_Grupo int  NOT NULL,
    fecha date  NOT NULL,
    CONSTRAINT INTEGRA_pk PRIMARY KEY (USUARIO_IdUsuario,USUARIO_tipo_usuario,USUARIO_cod_usuario,GRUPO_Nro_Grupo)
);

-- Table: USUARIO
CREATE TABLE USUARIO (
    IdUsuario int  NOT NULL,
    tipo_usuario char  NOT NULL,
    cod_usuario int  NOT NULL,
    Apellido varchar(40)  NOT NULL,
    Nombre varchar(40)  NOT NULL,
    Nick varchar(40)  NULL,
    CONSTRAINT PK_idUsuario PRIMARY KEY (IdUsuario,tipo_usuario,cod_usuario)
);

-- foreign keys
-- Reference: GR_COMUN_GRUPO (table: GR_COMUN)
ALTER TABLE GR_COMUN ADD CONSTRAINT GR_COMUN_GRUPO
    FOREIGN KEY (GRUPO_Nro_Grupo)
    REFERENCES GRUPO (Nro_Grupo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: GR_EXCLUSIVO_GRUPO (table: GR_EXCLUSIVO)
ALTER TABLE GR_EXCLUSIVO ADD CONSTRAINT GR_EXCLUSIVO_GRUPO
    FOREIGN KEY (GRUPO_Nro_Grupo)
    REFERENCES GRUPO (Nro_Grupo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: INTEGRA_GRUPO (table: INTEGRA)
ALTER TABLE INTEGRA ADD CONSTRAINT INTEGRA_GRUPO
    FOREIGN KEY (GRUPO_Nro_Grupo)
    REFERENCES GRUPO (Nro_Grupo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: INTEGRA_USUARIO (table: INTEGRA)
ALTER TABLE INTEGRA ADD CONSTRAINT INTEGRA_USUARIO
    FOREIGN KEY (USUARIO_IdUsuario, USUARIO_tipo_usuario, USUARIO_cod_usuario)
    REFERENCES USUARIO (IdUsuario, tipo_usuario, cod_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

