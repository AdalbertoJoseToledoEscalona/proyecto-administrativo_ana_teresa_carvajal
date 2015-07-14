DROP TABLE proyecto_administrativo.personas;
DROP TABLE proyecto_administrativo.empresas;

CREATE TABLE proyecto_administrativo.empresas (
       rif VARCHAR(12) NOT NULL
     , nit CHAR(10) NOT NULL
     , nombre VARCHAR(100) NOT NULL
     , fecha_creacion DATE NOT NULL
);

CREATE TABLE proyecto_administrativo.personas (
       ci VARCHAR(12) NOT NULL
     , nombre VARCHAR(100) NOT NULL
     , apellido VARCHAR(100) NOT NULL
     , "sexo (M)" BOOLEAN NOT NULL
     , fecha_creacion DATE NOT NULL
);

ALTER TABLE proyecto_administrativo.empresas
  ADD CONSTRAINT PK_EMPRESAS
      PRIMARY KEY (rif);

ALTER TABLE proyecto_administrativo.personas
  ADD CONSTRAINT PK_PERSONAS
      PRIMARY KEY (ci);

