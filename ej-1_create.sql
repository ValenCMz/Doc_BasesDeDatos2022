-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-05-20 00:31:20.847

-- tables
-- Table: AUDIO
CREATE TABLE AUDIO (
    formato varchar(40)  NOT NULL,
    duracion time  NOT NULL,
    OBJETO_id_objeto int  NOT NULL,
    OBJETO_COLECCION_id_coleccion int  NOT NULL,
    CONSTRAINT AUDIO_pk PRIMARY KEY (OBJETO_id_objeto,OBJETO_COLECCION_id_coleccion)
);

-- Table: COLECCION
CREATE TABLE COLECCION (
    id_coleccion int  NOT NULL,
    titulo_coleccion varchar(40)  NOT NULL,
    descripcion varchar(200)  NOT NULL,
    CONSTRAINT COLECCION_pk PRIMARY KEY (id_coleccion)
);

-- Table: DOCUMENTO
CREATE TABLE DOCUMENTO (
    tipo_publicacion varchar(40)  NOT NULL,
    modos_color varchar(40)  NOT NULL,
    resolucion_captura real  NOT NULL,
    OBJETO_id_objeto int  NOT NULL,
    OBJETO_COLECCION_id_coleccion int  NOT NULL,
    CONSTRAINT DOCUMENTO_pk PRIMARY KEY (OBJETO_id_objeto,OBJETO_COLECCION_id_coleccion)
);

-- Table: OBJETO
CREATE TABLE OBJETO (
    id_objeto int  NOT NULL,
    COLECCION_id_coleccion int  NOT NULL,
    titulo varchar(40)  NOT NULL,
    descripcion varchar(200)  NOT NULL,
    fuente int  NOT NULL,
    fecha int  NOT NULL,
    tipo char  NOT NULL,
    REPOSITORIO_id_repositorio int  NOT NULL,
    CONSTRAINT OBJETO_pk PRIMARY KEY (id_objeto,COLECCION_id_coleccion)
);

-- Table: REPOSITORIO
CREATE TABLE REPOSITORIO (
    id_repositorio int  NOT NULL,
    nombre varchar(40)  NOT NULL,
    publico boolean  NOT NULL,
    descripcion varchar(200)  NOT NULL,
    duenio varchar(40)  NULL,
    CONSTRAINT REPOSITORIO_pk PRIMARY KEY (id_repositorio)
);

-- Table: VIDEO
CREATE TABLE VIDEO (
    resolucion real  NOT NULL,
    frames_x_segundo real  NOT NULL,
    OBJETO_id_objeto int  NOT NULL,
    OBJETO_COLECCION_id_coleccion int  NOT NULL,
    CONSTRAINT VIDEO_pk PRIMARY KEY (OBJETO_id_objeto,OBJETO_COLECCION_id_coleccion)
);

-- foreign keys
-- Reference: AUDIO_OBJETO (table: AUDIO)
ALTER TABLE AUDIO ADD CONSTRAINT AUDIO_OBJETO
    FOREIGN KEY (OBJETO_id_objeto, OBJETO_COLECCION_id_coleccion)
    REFERENCES OBJETO (id_objeto, COLECCION_id_coleccion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: DOCUMENTO_OBJETO (table: DOCUMENTO)
ALTER TABLE DOCUMENTO ADD CONSTRAINT DOCUMENTO_OBJETO
    FOREIGN KEY (OBJETO_id_objeto, OBJETO_COLECCION_id_coleccion)
    REFERENCES OBJETO (id_objeto, COLECCION_id_coleccion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: OBJETO_COLECCION (table: OBJETO)
ALTER TABLE OBJETO ADD CONSTRAINT OBJETO_COLECCION
    FOREIGN KEY (COLECCION_id_coleccion)
    REFERENCES COLECCION (id_coleccion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: OBJETO_REPOSITORIO (table: OBJETO)
ALTER TABLE OBJETO ADD CONSTRAINT OBJETO_REPOSITORIO
    FOREIGN KEY (REPOSITORIO_id_repositorio)
    REFERENCES REPOSITORIO (id_repositorio)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: VIDEO_OBJETO (table: VIDEO)
ALTER TABLE VIDEO ADD CONSTRAINT VIDEO_OBJETO
    FOREIGN KEY (OBJETO_id_objeto, OBJETO_COLECCION_id_coleccion)
    REFERENCES OBJETO (id_objeto, COLECCION_id_coleccion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

