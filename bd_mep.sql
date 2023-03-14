-- Database: mep

-- DROP DATABASE IF EXISTS mep;

--CREATE DATABASE mep
    --WITH
    --OWNER = postgres
    --ENCODING = 'UTF8'
    --LC_COLLATE = 'Spanish_Mexico.1252'
    --LC_CTYPE = 'Spanish_Mexico.1252'
    --TABLESPACE = pg_default
    --CONNECTION LIMIT = -1
    --IS_TEMPLATE = False;
	
CREATE TABLE instituciones_contenido (
  id_institucion_contenido INT PRIMARY KEY,
  institucion VARCHAR(50),
  tipo_contenido INT,
  detalle VARCHAR(50),
  estado VARCHAR(50)
);
CREATE TABLE tipos_contenido (
  id_tipo_contenido INT PRIMARY KEY,
  nombre VARCHAR(50),
  estado VARCHAR(50)
);
CREATE TABLE instituciones_contacto (
  id_institucion_contacto INT PRIMARY KEY,
  id_institucion INT,
  nombre_contacto VARCHAR(50),
  puesto VARCHAR(50),
  telefono_contacto VARCHAR(50),
  email VARCHAR(50),
  detalle TEXT,
  estado VARCHAR(50)
);
CREATE TABLE publicaciones (
  id_publicacion INT PRIMARY KEY,
  id_institucion INT,
  id_usuario INT,
  encabezado VARCHAR(50),
  fecha_registro DATE,
  fecha_actualizacion DATE
);
CREATE TABLE contenidos (
  id_contenido INT PRIMARY KEY,
  id_publicacion INT,
  detalle TEXT,
  estado VARCHAR(50),
  fecha_registro DATE
);
CREATE TABLE usuario_instituciones (
  id_usuario_institucion INT PRIMARY KEY,
  id_institucion INT,
  id_usuario INT
);
CREATE TABLE kardex (
  id_kardex INT PRIMARY KEY,
  accion VARCHAR(50),
  detalle TEXT,
  fecha_registro DATE,
  modulo VARCHAR(50)
);
CREATE TABLE usuarios (
  id_usuario INT PRIMARY KEY,
  nombre VARCHAR(50),
  apellidos VARCHAR(50),
  identificacion VARCHAR(50),
  email VARCHAR(50),
  telefono VARCHAR(50),
  estado VARCHAR(50),
  fecha_nacimiento DATE
);
CREATE TABLE usuarios_roles (
  id_usuarios_rol INT PRIMARY KEY,
  id_usuario INT,
  id_rol INT
);
CREATE TABLE roles (
  id_rol INT PRIMARY KEY,
  nombre VARCHAR(255),
  estado VARCHAR(50)
);

--ALTER

ALTER TABLE instituciones_contenido ADD FOREIGN KEY (tipo_contenido) REFERENCES tipos_contenido(id_tipo_contenido);
--ALTER TABLE instituciones_contacto ADD FOREIGN KEY (id_institucion) REFERENCES instituciones(id_institucion);
--ALTER TABLE publicaciones ADD FOREIGN KEY (id_institucion) REFERENCES instituciones(id_institucion);
ALTER TABLE publicaciones ADD FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);
ALTER TABLE contenidos ADD FOREIGN KEY (id_publicacion) REFERENCES publicaciones(id_publicacion);
--ALTER TABLE usuario_instituciones ADD FOREIGN KEY (id_institucion) REFERENCES instituciones(id_institucion);
ALTER TABLE usuario_instituciones ADD FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);
ALTER TABLE usuarios_roles ADD FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);
ALTER TABLE usuarios_roles ADD FOREIGN KEY (id_rol) REFERENCES roles(id_rol);