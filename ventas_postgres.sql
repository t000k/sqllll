create table proveedor(
    id_proveedor serial primary key,
    razón_social varchar(100) not null,
    rfc varchar(13)  not null,
    domicilio_fiscal text not null,
    cp varchar(5) not null
);

create table marca(
id_marca serial primary key,
marca varchar(50) not null,
id_proveedor integer references proveedor(id_proveedor)
);

create table categoria(
    id_categoria serial primary key,
    categoría varchar(50) not null
);

create table marca_categoria(
    id_marca int references marca(id_marca) not null,
    id_categoria int references categoria(id_categoria) not null,
    primary key (id_marca,id_categoria)
);

create table usuario(
    id_usuario serial primary key,
    correo varchar(50) not null unique,
    contraseña varchar(32) not null
);

create table producto(
    id_producto serial primary key,
    producto varchar(50) not null,
    precio numeric(8,2) not null check (precio>0),
    id_marcar int references marca(id_marca)
);

create table estado(
    id_estado smallserial primary key,
    estado varchar(50) not null
);

create table municipio(
    id_municipio serial primary key,
    municipio varchar(50) not null,
    id_estador smallint references estado(id_estado)
);

create table localidad(
    id_localidad serial primary key,
    localidad varchar(50) not null,
    id_municipio int references municipio(id_municipio)
);

create table tienda(
    id_tienda serial primary key,
    tienda varchar(50),
    id_localidad int references localidad(id_localidad)
);

create table empleado(
    id_empleado serial primary key,
    nombre varchar(50) not null,
    primer_Apellido varchar(50) not null,
    segundo_apellido varchar(50),
    rfc varchar(13) not null,
    curp varchar(18) not null,
    ncss varchar(11) not null,
    nacimiento  date not null,
    id_localidad int references localidad(id_localidad),
    id_usuario int references usuario(id_usuario)
);

create table cliente(
id_cliente serial primary key,
nombre varchar(50) not null,
primer_apellido varchar(50) not null,
segundo_apellido varchar(50),
curp varchar(18),
nacimiento date,
id_localidad int references localidad(id_localidad),
id_usuario int references usuario(id_usuario)
);

create table venta(
    id_venta    serial primary key,
    id_cliente  int references cliente (id_cliente),
    id_empleado int references empleado (id_empleado),
    id_tienda   int references tienda (id_tienda),
    fecha       date not null default now()
);

create table venta_detalle(
    id_venta int references venta(id_venta),
    id_producto int references producto(id_producto),
    cantidad numeric (8,2) not null check (cantidad>0)
);