create table proveedor(
    id_proveedor integer auto_increment primary key,
    razon_social varchar(100) not null,
    rfc varchar(13) not null,
    domicilio_fiscal text not null,
    cp varchar(5) not null
);

create table marca(
    id_marca integer auto_increment primary key,
    marca varchar(50) not null,
    id_proveedor integer references proveedor(id_proveedor)
);

create table categoria(
    id_categoria integer auto_increment primary key,
    categoria varchar(50) not null
);

create table marca_categoria(
    id_marca integer not null references marca(id_marca),
    id_categoria integer not null references categoria(id_categoria),
    constraint marca_categoriaPK primary key (id_marca,id_categoria)
);

create table usuario(
    id_usuario integer auto_increment primary key,
    correo varchar(50) not null unique,
    contrasena varchar(32) not null
);

create table producto(
    id_producto integer auto_increment primary key,
    producto varchar(50) not null,
    precio decimal(8,2) not null check (precio > 0),
    id_marca integer references marca(id_marca)
);

create table estado(
    id_estado smallint auto_increment primary key,
    estado varchar(50) not null
);

create table municipio(
    id_municipio integer auto_increment primary key,
    municipio varchar(100) not null,
    id_estado smallint not null references estado(id_estado)
);

create table localidad(
    id_localidad integer auto_increment primary key,
    localidad varchar(200) not null,
    id_municipio integer not null,
    constraint  localidadFK foreign key (id_municipio) references municipio(id_municipio)
);

create table tienda(
    id_tienda integer auto_increment primary key,
    tienda varchar(50),
    id_localidad integer not null references localidad(id_localidad)
);

create table empleado(
    id_empleado integer auto_increment primary key,
    nombre varchar(50) not null,
    primer_apellido varchar(50) not null,
    segundo_apellido varchar(50),
    rfc varchar(13) not null,
    curp varchar(18) not null,
    nss varchar(11) not null,
    nacimiento date not null,
    id_localidad integer references localidad(id_localidad),
    id_usuario integer references usuario(id_usuario)
);

create table cliente(
    id_cliente integer auto_increment primary key,
    nombre varchar(50) not null,
    primer_apellido varchar(50) not null,
    segundo_apellido varchar(50),
    curp varchar(18),
    nacimiento date,
    id_localidad integer references localidad(id_localidad),
    id_usuario integer references usuario(id_usuario)
);

create table venta(
    id_venta integer auto_increment primary key,
    id_cliente integer references cliente(id_cliente),
    id_empleado integer references empleado(id_empleado),
    id_tienda integer references tienda(id_tienda),
    fecha date not null default now()
);

create table venta_detalle(
    id_venta integer references venta(id_venta),
    id_producto integer references producto(id_producto),
    cantidad decimal(8,2) not null check (cantidad>0)
);