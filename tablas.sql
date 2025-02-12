create table departamento_empleado(id_departamento smallint primary key, departamento varchar(50) not null);

create table empleado(id_empleado smallint primary key, nombre varchar(100) not null, primer_apellido varchar(50) not null, segundo_apellido varchar(50), genero char (1) not null, id_departamento smallint references departamento_empleado(id_departamento));

create table usuario(id_usuario smallint primary key, nombre varchar(100) not null, primer_apellido varchar(50) not null, segundo_apellido varchar(50), genero char(1) not null);

create table estado(id_estado smallint primary key, estado varchar(100) not null);

create table municipio(id_municipio smallint primary key, municipio varchar(100) not null, id_estado smallint references estado(id_estado));

create table localidad(id_localidad smallint primary key, localidad varchar(100) not null, id_municipio smallint references municipio(id_municipio));

create table contacto_usuario(teléfono varchar(50), email varchar(100), id_usuario smallint references usuario(id_usuario));

create table contacto_empleado(telefono varchar(50), email varchar(100), id_empleado smallint references empleado(id_empleado));

create table propiedad(id_propiedad smallint primary key, metros_cuadrados smallint not null, fecha_instalacion date, id_usuario smallint references usuario(id_usuario));

create table problema(id_problema smallint primary key, descripcion text not null, solucionado boolean not null, id_propiedad smallint references propiedad(id_propiedad));
