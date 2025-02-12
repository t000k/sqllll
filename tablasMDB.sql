USE proyecto;

CREATE TABLE departamento_empleado(
    id_departamento SMALLINT PRIMARY KEY,
    departamento VARCHAR(50) NOT NULL
);

CREATE TABLE empleado(
    id_empleado SMALLINT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50),
    genero CHAR(1) NOT NULL,
    id_departamento SMALLINT,
    FOREIGN KEY (id_departamento) REFERENCES departamento_empleado(id_departamento) ON DELETE CASCADE
);

CREATE TABLE usuario(
    id_usuario SMALLINT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50),
    genero CHAR(1) NOT NULL
);

CREATE TABLE estado(
    id_estado SMALLINT PRIMARY KEY,
    estado VARCHAR(100) NOT NULL
);

CREATE TABLE municipio(
    id_municipio SMALLINT PRIMARY KEY,
    municipio VARCHAR(100) NOT NULL,
    id_estado SMALLINT,
    FOREIGN KEY (id_estado) REFERENCES estado(id_estado) ON DELETE CASCADE
);

CREATE TABLE localidad(
    id_localidad SMALLINT PRIMARY KEY,
    localidad VARCHAR(100) NOT NULL,
    id_municipio SMALLINT,
    FOREIGN KEY (id_municipio) REFERENCES municipio(id_municipio) ON DELETE CASCADE
);

CREATE TABLE contacto_usuario(
    telefono VARCHAR(50),
    email VARCHAR(100),
    id_usuario SMALLINT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE
);

CREATE TABLE contacto_empleado(
    telefono VARCHAR(50),
    email VARCHAR(100),
    id_empleado SMALLINT,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado) ON DELETE CASCADE
);

CREATE TABLE propiedad(
    id_propiedad SMALLINT PRIMARY KEY,
    metros_cuadrados SMALLINT NOT NULL,
    fecha_instalacion DATE,
    id_usuario SMALLINT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE
);

CREATE TABLE problema(
    id_problema SMALLINT PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL, -- MariaDB usa VARCHAR en lugar de TEXT
    solucionado TINYINT(1) NOT NULL,  -- MariaDB no tiene BOOLEAN, usamos TINYINT(1)
    id_propiedad SMALLINT,
    FOREIGN KEY (id_propiedad) REFERENCES propiedad(id_propiedad) ON DELETE CASCADE
);
