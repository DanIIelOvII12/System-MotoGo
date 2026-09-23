create table rol (
    id_rol int not null,
    nombre_rol varchar(50) not null,
    
    constraint pk_rol primary key (id_rol)
);
comment on table rol is 'Almacena los roles disponibles dentro de la plataforma MotoGO, permitiendo identificar el tipo de participación de cada usuario en el sistema. Un rol puede estar asignado a múltiples usuarios.';
comment on column rol.id_rol is 'Identificador único del rol.';
comment on column rol.nombre_rol is 'Nombre del rol asignado dentro de la plataforma.';


create table usuario (
    id_usuario int not null,
    login varchar(50) not null,
    correo varchar(150) not null,
    contrasenia varchar(255) not null,
    fecha_registro date not null,
    token_recu_contra varchar(20) null,
    token_activa varchar(20) null,
    
    constraint pk_usuario primary key (id_usuario),
    constraint uk_login unique (login),
    constraint uk_usuario_correo unique (correo)
);
comment on table usuario is 'Almacena las credenciales y datos de acceso de los usuarios registrados en MotoGO. Permite gestionar la autenticación, recuperación de contraseña y estado de activación de la cuenta.';
comment on column usuario.id_usuario is 'Identificador único del usuario.';
comment on column usuario.login is 'Código o identificador utilizado para iniciar sesión.';
comment on column usuario.correo is 'Correo electrónico asociado a la cuenta del usuario.';
comment on column usuario.contrasenia is 'Contraseña cifrada utilizada para la autenticación.';
comment on column usuario.fecha_registro is 'Fecha y hora en que se creó la cuenta.';
comment on column usuario.token_recu_contra is 'Token temporal utilizado para recuperar la contraseña.';
comment on column usuario.token_activa is 'Indica si la cuenta se encuentra activa o pendiente de activación.';


create table rol_usuario (
    id_rol int not null,
    id_usuario int not null,
    
    constraint pk_rol_usuario primary key (id_rol, id_usuario),
    constraint fk_rol_rous foreign key (id_rol) references rol (id_rol),
    constraint fk_usu_rous foreign key (id_usuario) references usuario (id_usuario),
    constraint uk_rol_usuario unique (id_usuario)
);
comment on table rol_usuario is 'Permite asociar los roles a los usuarios registrados en MotoGO. Un usuario puede tener uno o varios roles, y un rol puede estar asignado a múltiples usuarios.';
comment on column rol_usuario.id_rol is 'Identificador del rol asignado al usuario.';
comment on column rol_usuario.id_usuario is 'Identificador del usuario al que se le asigna el rol.';



create table tipo_documento (
    id_tipo_documento int not null,
    nombre varchar(50) not null,
    abreviatura varchar(10) not null,
    estado varchar(20) null,
    
    constraint pk_tipo_documento primary key (id_tipo_documento),
    constraint uk_tipo_documento_nombre unique (nombre),
    constraint uk_tipo_documento_abreviatura unique (abreviatura)
);
comment on table tipo_documento is 'Almacena los tipos de documentos permitidos dentro de MotoGO para la identificación de los clientes registrados en la plataforma.';
comment on column tipo_documento.id_tipo_documento is 'Identificador único del tipo de documento.';
comment on column tipo_documento.nombre is 'Nombre completo del tipo de documento.';
comment on column tipo_documento.abreviatura is 'Sigla o abreviación utilizada para identificar el documento.';
comment on column tipo_documento.estado is 'Indica si el tipo de documento se encuentra activo o inactivo.';

create table cliente (
    id_cliente int not null,
    id_tipo_documento int not null,
    id_usuario int not null,
    numero_documento varchar(30) not null,
    nombres varchar(100) not null,
    apellidos varchar(100) not null,
    telefono varchar(20) not null,
    foto_perfil varchar(500) null,
    activo varchar(20) not null,
    
    constraint pk_cliente primary key (id_cliente),
    constraint fk_usua_clie foreign key (id_usuario) references usuario (id_usuario),
    constraint fk_tido_clie foreign key (id_tipo_documento) references tipo_documento (id_tipo_documento),
    constraint uk_numero_documento unique (numero_documento)
);
comment on table cliente is 'Almacena la información personal de los usuarios registrados en MotoGO. Un cliente puede realizar compras, registrar direcciones, crear tiendas y solicitar convertirse en repartidor o tienda.';
comment on column cliente.id_cliente is 'Identificador único del cliente.';
comment on column cliente.id_tipo_documento is 'Tipo de documento asociado al cliente.';
comment on column cliente.id_usuario is 'Usuario propietario del perfil del cliente.';
comment on column cliente.numero_documento is 'Número de identificación del cliente.';
comment on column cliente.nombres is 'Nombres del cliente.';
comment on column cliente.apellidos is 'Apellidos del cliente.';
comment on column cliente.telefono is 'Número telefónico de contacto.';
comment on column cliente.foto_perfil is 'Imagen de perfil del cliente.';
comment on column cliente.activo is 'Indica si el cliente se encuentra activo o inactivo dentro de la plataforma.';


create table repartidor (
    id_repartidor int not null,
    id_cliente int not null,
    num_licencia varchar(30) not null,
    fecha_expedicion_licencia date not null,
    fecha_vencimiento_licencia date not null,
    licencia_url varchar(500) null,
    fecha_solicitud date not null,
    fecha_aprobacion date null,
    estado varchar(20) not null,
    observacion text null,
    
    constraint pk_repartidor primary key (id_repartidor),
    constraint fk_clie_repa foreign key (id_cliente) references cliente (id_cliente),
    constraint uk_repartidor unique (id_cliente),
    constraint uk_num_licencia unique (num_licencia)
);
comment on table repartidor is 'Almacena la información de los clientes que solicitan convertirse en repartidores dentro de MotoGO, incluyendo los datos de su licencia de conducción y el estado de aprobación.';
comment on column repartidor.id_repartidor is 'Identificador único del repartidor.';
comment on column repartidor.id_cliente is 'Cliente asociado al perfil de repartidor.';
comment on column repartidor.num_licencia is 'Número de licencia de conducción.';
comment on column repartidor.fecha_expedicion_licencia is 'Fecha de expedición de la licencia.';
comment on column repartidor.fecha_vencimiento_licencia is 'Fecha de vencimiento de la licencia.';
comment on column repartidor.licencia_url is 'Ruta o URL del documento de la licencia.';
comment on column repartidor.fecha_solicitud is 'Fecha en que se realizó la solicitud para ser repartidor.';
comment on column repartidor.fecha_aprobacion is 'Fecha de aprobación de la solicitud.';
comment on column repartidor.estado is 'Estado actual de la solicitud del repartidor.';
comment on column repartidor.observacion is 'Comentarios u observaciones relacionadas con la solicitud.';


create table tipo_vehiculo (
    id_tipo_vehiculo int not null,
    nom_vehiculo varchar(50) not null,
    activo varchar(20) not null,
    
    constraint pk_tipo_vehiculo primary key (id_tipo_vehiculo)
);
comment on table tipo_vehiculo is 'Almacena los tipos de vehículos permitidos para que los repartidores realicen entregas dentro de la plataforma MotoGO.';
comment on column tipo_vehiculo.id_tipo_vehiculo is 'Identificador único del tipo de vehículo.';
comment on column tipo_vehiculo.nom_vehiculo is 'Nombre del tipo de vehículo.';
comment on column tipo_vehiculo.activo is 'Indica si el tipo de vehículo se encuentra activo o inactivo.';



create table vehiculo (
    id_vehiculo int not null,
    id_repartidor int not null,
    id_tipo_vehiculo int not null,
    placa varchar(10) not null,
    marca varchar(50) not null,
    modelo varchar(50) not null,
    color varchar(30) not null,
    anio int not null,
    tarjeta_propiedad_url varchar(500) not null,
    soat_vencimiento date not null,
    mecanico_vencimiento date not null,
    activo varchar(20) not null,
    fecha_registro date not null,

    constraint pk_vehiculo primary key (id_vehiculo),
    constraint fk_repa_vehi foreign key (id_repartidor) references repartidor (id_repartidor),
    constraint fk_tive_vehi foreign key (id_tipo_vehiculo) references tipo_vehiculo (id_tipo_vehiculo),
    constraint uk_placa unique (placa)
);
comment on table vehiculo is 'Almacena la información de los vehículos registrados por los repartidores para realizar entregas dentro de la plataforma MotoGO.';
comment on column vehiculo.id_vehiculo is 'Identificador único del vehículo.';
comment on column vehiculo.id_repartidor is 'Repartidor propietario del vehículo.';
comment on column vehiculo.id_tipo_vehiculo is 'Tipo de vehículo registrado.';
comment on column vehiculo.placa is 'Placa única del vehículo.';
comment on column vehiculo.marca is 'Marca del vehículo.';
comment on column vehiculo.modelo is 'Modelo del vehículo.';
comment on column vehiculo.color is 'Color del vehículo.';
comment on column vehiculo.anio is 'Año de fabricación del vehículo.';
comment on column vehiculo.tarjeta_propiedad_url is 'Ruta o URL de la tarjeta de propiedad.';
comment on column vehiculo.soat_vencimiento is 'Fecha de vencimiento del SOAT.';
comment on column vehiculo.mecanico_vencimiento is 'Fecha de vencimiento de la revisión técnico-mecánica.';
comment on column vehiculo.activo is 'Indica si el vehículo se encuentra activo o inactivo.';
comment on column vehiculo.fecha_registro is 'Fecha de registro del vehículo en la plataforma.';



create table categoria_producto (
    id_categoria_producto int not null,
    nombre varchar(100) not null,
    descripcion varchar(255) null,
    activo varchar(20) not null,
    fecha_creacion date not null,
    
    constraint pk_categoria_producto primary key (id_categoria_producto),
    constraint uk_categoria_producto unique (nombre)
);

comment on table categoria_producto is 'Almacena las categorías utilizadas para clasificar los productos publicados por las tiendas dentro de MotoGO.';
comment on column categoria_producto.id_categoria_producto is 'Identificador único de la categoría.';
comment on column categoria_producto.nombre is 'Nombre de la categoría del producto.';
comment on column categoria_producto.descripcion is 'Descripción de la categoría.';
comment on column categoria_producto.activo is 'Indica si la categoría se encuentra activa o inactiva.';
comment on column categoria_producto.fecha_creacion is 'Fecha de creación de la categoría.';

create table tienda (
    id_tienda int not null,
    id_cliente int not null,
    nom_tienda varchar(150) not null,
    nit varchar(30) not null,
    descripcion text null,
    logo_url varchar(500) null,
    tel_tienda varchar(20) not null,
    correo_tienda varchar(100) not null,
    direccion_tienda varchar(255) not null,
    ciudad_tienda varchar(100) not null,
    departamento_tienda varchar(100) not null,
    fecha_solicitud date not null,
    estado varchar(20) not null,
    
    constraint pk_tienda primary key (id_tienda),
    constraint fk_clie_tien foreign key (id_cliente) references cliente (id_cliente),
    constraint uk_nom_tienda unique (nom_tienda),
    constraint uk_nit unique (nit)
);

comment on table tienda is 'Almacena la información de las tiendas registradas en MotoGO que ofrecen productos para la venta dentro de la plataforma.';
comment on column tienda.id_tienda is 'Identificador único de la tienda.';
comment on column tienda.id_cliente is 'Cliente propietario de la tienda.';
comment on column tienda.nom_tienda is 'Nombre comercial de la tienda.';
comment on column tienda.nit is 'Número de identificación tributaria de la tienda.';
comment on column tienda.descripcion is 'Descripción general de la tienda.';
comment on column tienda.logo_url is 'Ruta o URL del logo de la tienda.';
comment on column tienda.tel_tienda is 'Teléfono de contacto de la tienda.';
comment on column tienda.correo_tienda is 'Correo electrónico de contacto de la tienda.';
comment on column tienda.direccion_tienda is 'Dirección de la tienda.';
comment on column tienda.ciudad_tienda is 'Ciudad donde opera la tienda.';
comment on column tienda.departamento_tienda is 'Departamento donde opera la tienda.';
comment on column tienda.fecha_solicitud is 'Fecha en que se registró la solicitud de la tienda.';
comment on column tienda.estado is 'Estado actual de la solicitud o aprobación de la tienda.';


create table tienda_categoria (
    id_tienda int not null,
    id_categoria_producto int not null,
    
    constraint pk_tienda_categoria primary key (id_tienda, id_categoria_producto),
    constraint fk_tien_tipr foreign key (id_tienda) references tienda (id_tienda),
    constraint fk_capr_tipr foreign key (id_categoria_producto) references categoria_producto (id_categoria_producto)
);
comment on table tienda_categoria is 'Relaciona las tiendas registradas en MotoGO con las categorías de productos que ofrecen.';
comment on column tienda_categoria.id_tienda is 'Identificador de la tienda asociada a la categoría.';
comment on column tienda_categoria.id_categoria_producto is 'Identificador de la categoría de productos asociada a la tienda.';


create table categoria_especifica (
    id_categoria_especifica int not null,
    id_categoria_producto int not null,
    nombre varchar(100) not null,
    descripcion varchar(255) null,
    activo varchar(20) not null,
    
    constraint pk_categoria_especifica primary key (id_categoria_especifica),
    constraint fk_capr_caes foreign key (id_categoria_producto) references categoria_producto (id_categoria_producto),
    constraint uk_categoria_especifica unique (nombre)
);
comment on table categoria_especifica is 'Almacena categorías específicas asociadas a una categoría general de productos para permitir una clasificación más detallada.';
comment on column categoria_especifica.id_categoria_especifica is 'Identificador único de la categoría específica.';
comment on column categoria_especifica.id_categoria_producto is 'Categoría general de producto a la que pertenece la categoría específica.';
comment on column categoria_especifica.nombre is 'Nombre de la categoría específica.';
comment on column categoria_especifica.descripcion is 'Descripción de la categoría específica.';
comment on column categoria_especifica.activo is 'Indica si la categoría específica se encuentra activa o inactiva.';