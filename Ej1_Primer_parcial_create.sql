-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-05-23 21:18:42.25

-- tables
-- Table: LABORATORIO
CREATE TABLE LABORATORIO (
    id_lab int  NOT NULL,
    nombre_lab varchar(40)  NOT NULL,
    calle varchar(40)  NOT NULL,
    puerta int  NOT NULL,
    piso int  NULL,
    dpto int  NULL,
    ciudad varchar(40)  NOT NULL,
    PARTICULAR_MEDICO_tipo_doc int  NOT NULL,
    PARTICULAR_MEDICO_nro_doc int  NOT NULL,
    CONSTRAINT LABORATORIO_nombre_lav UNIQUE (nombre_lab) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT PK_Lab_id_lab PRIMARY KEY (id_lab)
);

-- Table: MEDICO
CREATE TABLE MEDICO (
    tipo_doc int  NOT NULL,
    nro_doc int  NOT NULL,
    apellido varchar(40)  NOT NULL,
    nombre varchar(40)  NOT NULL,
    e_mail varchar(40)  NOT NULL,
    tipo_med char  NOT NULL,
    CONSTRAINT PK_tipo_doc_nro_doc_medico PRIMARY KEY (tipo_doc,nro_doc)
);

-- Table: MEDICO_visita_LABORATORIO
CREATE TABLE MEDICO_visita_LABORATORIO (
    LABORATORIO_id_lab int  NOT NULL,
    MEDICO_tipo_doc int  NOT NULL,
    MEDICO_nro_doc int  NOT NULL,
    CONSTRAINT PK_id_lab_tipo_doc_nro_doc_visita PRIMARY KEY (LABORATORIO_id_lab,MEDICO_tipo_doc,MEDICO_nro_doc)
);

-- Table: PARTICULAR
CREATE TABLE PARTICULAR (
    nro_matricula int  NOT NULL,
    MEDICO_tipo_doc int  NOT NULL,
    MEDICO_nro_doc int  NOT NULL,
    CONSTRAINT PK_tipo_doc_nro_doc_particular PRIMARY KEY (MEDICO_tipo_doc,MEDICO_nro_doc)
);

-- Table: RESIDENTE
CREATE TABLE RESIDENTE (
    MEDICO_tipo_doc int  NOT NULL,
    MEDICO_nro_doc int  NOT NULL,
    CONSTRAINT PK_tipo_doc_nro_doc_residente PRIMARY KEY (MEDICO_tipo_doc,MEDICO_nro_doc)
);

-- foreign keys
-- Reference: LABORATORIO_PARTICULAR (table: LABORATORIO)
ALTER TABLE LABORATORIO ADD CONSTRAINT LABORATORIO_PARTICULAR
    FOREIGN KEY (PARTICULAR_MEDICO_tipo_doc, PARTICULAR_MEDICO_nro_doc)
    REFERENCES PARTICULAR (MEDICO_tipo_doc, MEDICO_nro_doc)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: MEDICO_visita_LABORATORIO_LABORATORIO (table: MEDICO_visita_LABORATORIO)
ALTER TABLE MEDICO_visita_LABORATORIO ADD CONSTRAINT MEDICO_visita_LABORATORIO_LABORATORIO
    FOREIGN KEY (LABORATORIO_id_lab)
    REFERENCES LABORATORIO (id_lab)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: MEDICO_visita_LABORATORIO_MEDICO (table: MEDICO_visita_LABORATORIO)
ALTER TABLE MEDICO_visita_LABORATORIO ADD CONSTRAINT MEDICO_visita_LABORATORIO_MEDICO
    FOREIGN KEY (MEDICO_tipo_doc, MEDICO_nro_doc)
    REFERENCES MEDICO (tipo_doc, nro_doc)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PARTICULAR_MEDICO (table: PARTICULAR)
ALTER TABLE PARTICULAR ADD CONSTRAINT PARTICULAR_MEDICO
    FOREIGN KEY (MEDICO_tipo_doc, MEDICO_nro_doc)
    REFERENCES MEDICO (tipo_doc, nro_doc)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: RESIDENTE_MEDICO (table: RESIDENTE)
ALTER TABLE RESIDENTE ADD CONSTRAINT RESIDENTE_MEDICO
    FOREIGN KEY (MEDICO_tipo_doc, MEDICO_nro_doc)
    REFERENCES MEDICO (tipo_doc, nro_doc)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

