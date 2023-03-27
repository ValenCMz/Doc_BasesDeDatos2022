-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-04-20 18:51:10.387

-- tables
-- Table: AUDIO
CREATE TABLE AUDIO (
    formato varchar(40)  NOT NULL,
    duracion time  NOT NULL,
    OBJETO_id_objeto int  NOT NULL
);

-- Table: COLECCION
CREATE TABLE COLECCION (
    id_coleccion int  NOT NULL,
    titulo_coleccion varchar(40)  NOT NULL,
    descripcion varchar(40)  NOT NULL,
    CONSTRAINT PK_id_collecion PRIMARY KEY (id_coleccion)
);

-- Table: DOCUMENTO
CREATE TABLE DOCUMENTO (
    tipo_publicacion varchar(40)  NOT NULL,
    modos_color varchar(40)  NOT NULL,
    resolucion_captura varchar(40)  NOT NULL,
    OBJETO_id_objeto int  NOT NULL
);

-- Table: OBJETO
CREATE TABLE OBJETO (
    id_objeto int  NOT NULL,
    id_coleccion int  NOT NULL,
    id_repositorio int  NOT NULL,
    titulo varchar(40)  NOT NULL,
    descripcion varchar(40)  NOT NULL,
    fuente varchar(40)  NOT NULL,
    fecha date  NOT NULL,
    tipo int  NOT NULL,
    CONSTRAINT PK_id_objeto PRIMARY KEY (id_objeto)
);

-- Table: REPOSITORIO
CREATE TABLE REPOSITORIO (
    id_repositorio int  NOT NULL,
    nombre varchar(40)  NOT NULL,
    publico boolean  NOT NULL,
    descripcion varchar(40)  NOT NULL,
    duenio varchar(40)  NULL,
    CONSTRAINT REPOSITORIO_pk PRIMARY KEY (id_repositorio)
);

-- Table: VIDEO
CREATE TABLE VIDEO (
    resolucion real  NOT NULL,
    frames_x_segundo real  NOT NULL,
    OBJETO_id_objeto int  NOT NULL
);

-- foreign keys
-- Reference: AUDIO_OBJETO (table: AUDIO)
ALTER TABLE AUDIO ADD CONSTRAINT AUDIO_OBJETO
    FOREIGN KEY (OBJETO_id_objeto)
    REFERENCES OBJETO (id_objeto)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: DOCUMENTO_OBJETO (table: DOCUMENTO)
ALTER TABLE DOCUMENTO ADD CONSTRAINT DOCUMENTO_OBJETO
    FOREIGN KEY (OBJETO_id_objeto)
    REFERENCES OBJETO (id_objeto)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: OBJETO_COLECCION (table: OBJETO)
ALTER TABLE OBJETO ADD CONSTRAINT OBJETO_COLECCION
    FOREIGN KEY (id_coleccion)
    REFERENCES COLECCION (id_coleccion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: OBJETO_REPOSITORIO (table: OBJETO)
ALTER TABLE OBJETO ADD CONSTRAINT OBJETO_REPOSITORIO
    FOREIGN KEY (id_repositorio)
    REFERENCES REPOSITORIO (id_repositorio)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: VIDEO_OBJETO (table: VIDEO)
ALTER TABLE VIDEO ADD CONSTRAINT VIDEO_OBJETO
    FOREIGN KEY (OBJETO_id_objeto)
    REFERENCES OBJETO (id_objeto)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

