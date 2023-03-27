-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-06-01 22:39:09.112

-- tables
-- Table: ASIGNATURA
CREATE TABLE ASIGNATURA (
    tipoAsig char  NOT NULL,
    codAsig int  NOT NULL,
    NombreAsig varchar(40)  NOT NULL,
    CantHst int  NOT NULL,
    CantHsP int  NOT NULL,
    DNI int  NOT NULL,
    CONSTRAINT Alternate_asignatura UNIQUE (NombreAsig) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT Pk_asignatura PRIMARY KEY (tipoAsig,codAsig)
);

-- Table: DICTA
CREATE TABLE DICTA (
    tipoAsig char(10)  NOT NULL,
    codAsig int  NOT NULL,
    DNI int  NOT NULL,
    CONSTRAINT Pk_dicta PRIMARY KEY (tipoAsig,codAsig,DNI)
);

-- Table: PROFESOR
CREATE TABLE PROFESOR (
    DNI int  NOT NULL,
    ApellidoNombre varchar(40)  NOT NULL,
    Titulo varchar(40)  NULL,
    Departamento varchar(40)  NOT NULL,
    tipo_prof char  NOT NULL,
    CONSTRAINT Pk_profesor PRIMARY KEY (DNI)
);

-- Table: PROF_EXCLUSIVO
CREATE TABLE PROF_EXCLUSIVO (
    DNI int  NOT NULL,
    ProyInvestig varchar(200)  NOT NULL,
    CONSTRAINT Pk_prof_exclusivo PRIMARY KEY (DNI)
);

-- Table: PROF_SIMPLE
CREATE TABLE PROF_SIMPLE (
    DNI int  NOT NULL,
    Perfil varchar(200)  NOT NULL,
    CONSTRAINT Pk_prof_simple PRIMARY KEY (DNI)
);

-- foreign keys
-- Reference: Fk_asignatura_dicta (table: DICTA)
ALTER TABLE DICTA ADD CONSTRAINT Fk_asignatura_dicta
    FOREIGN KEY (tipoAsig, codAsig)
    REFERENCES ASIGNATURA (tipoAsig, codAsig)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Fk_prof_exlusivo_asignatura (table: ASIGNATURA)
ALTER TABLE ASIGNATURA ADD CONSTRAINT Fk_prof_exlusivo_asignatura
    FOREIGN KEY (DNI)
    REFERENCES PROF_EXCLUSIVO (DNI)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Fk_profesor_porf_exclusivo (table: PROF_EXCLUSIVO)
ALTER TABLE PROF_EXCLUSIVO ADD CONSTRAINT Fk_profesor_porf_exclusivo
    FOREIGN KEY (DNI)
    REFERENCES PROFESOR (DNI)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Fk_profesor_prof_simple (table: PROF_SIMPLE)
ALTER TABLE PROF_SIMPLE ADD CONSTRAINT Fk_profesor_prof_simple
    FOREIGN KEY (DNI)
    REFERENCES PROFESOR (DNI)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_profesor_dicta (table: DICTA)
ALTER TABLE DICTA ADD CONSTRAINT fk_profesor_dicta
    FOREIGN KEY (DNI)
    REFERENCES PROFESOR (DNI)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

