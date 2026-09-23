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

create table producto (
    id_producto int not null,
    id_categoria_especifica int not null,
    nombre varchar(150) not null,
    referencia varchar(100) null,
    marca varchar(100) null,
    descripcion text null,
    
    constraint pk_producto primary key (id_producto),
    constraint fk_caes_prod foreign key (id_categoria_especifica) references categoria_especifica (id_categoria_especifica),
    constraint uk_producto unique (referencia)
);
comment on table producto is 'Almacena la información general de los productos disponibles en MotoGO. Representa el catálogo maestro de repuestos y accesorios para motocicletas.';
comment on column producto.id_producto is 'Identificador único del producto.';
comment on column producto.id_categoria_especifica is 'Categoría específica a la que pertenece el producto.';
comment on column producto.nombre is 'Nombre comercial del producto.';
comment on column producto.referencia is 'Código o referencia del producto.';
comment on column producto.marca is 'Marca fabricante del producto.';
comment on column producto.descripcion is 'Descripción general del producto.';



create table tienda_producto (
    id_tienda_producto int not null,
    id_tienda int not null,
    id_producto int not null,
    precio real not null,
    stock int not null,
    garantia_dias int not null,
    estado_producto varchar(100) not null,
    activo varchar(20) not null,
    fecha_publicacion date not null,
    fecha_actualizacion date not null,
    
    constraint pk_tienda_producto primary key (id_tienda_producto),
    constraint fk_tien_tipr2 foreign key (id_tienda) references tienda (id_tienda),
    constraint fk_prod_tipr foreign key (id_producto) references producto (id_producto)
);
comment on table tienda_producto is 'Almacena las publicaciones de productos realizadas por las tiendas, incluyendo precio, stock, garantía y disponibilidad.';
comment on column tienda_producto.id_tienda_producto is 'Identificador único de la publicación.';
comment on column tienda_producto.id_tienda is 'Tienda que ofrece el producto.';
comment on column tienda_producto.id_producto is 'Producto publicado.';
comment on column tienda_producto.precio is 'Precio de venta del producto.';
comment on column tienda_producto.stock is 'Cantidad disponible en inventario.';
comment on column tienda_producto.garantia_dias is 'Cantidad de días de garantía ofrecida.';
comment on column tienda_producto.estado_producto is 'Estado actual del producto.';
comment on column tienda_producto.activo is 'Indica si la publicación se encuentra activa o inactiva.';
comment on column tienda_producto.fecha_publicacion is 'Fecha de publicación del producto.';
comment on column tienda_producto.fecha_actualizacion is 'Fecha de la última actualización de la publicación.';


create table carrito (
    id_carrito int not null,
    id_cliente int not null,
    fecha_actualizacion date not null,
    
    constraint pk_carrito primary key (id_carrito),
    constraint fk_clie_carr foreign key (id_cliente) references cliente (id_cliente),
    constraint uk_carrito unique (id_cliente)
);

comment on table carrito is 'Almacena el carrito de compras de cada cliente, permitiendo guardar temporalmente los productos seleccionados antes de realizar un pedido.';
comment on column carrito.id_carrito is 'Identificador único del carrito.';
comment on column carrito.id_cliente is 'Cliente propietario del carrito.';
comment on column carrito.fecha_actualizacion is 'Fecha de la última modificación realizada al carrito.';


create table carrito_detalle (
    id_carrito_detalle int not null,
    id_carrito int not null,
    id_tienda_producto int not null,
    cantidad int not null,
    precio_unitario real not null,
    subtotal real not null,
    fecha_agregado date not null,
    
    constraint pk_carrito_detalle primary key (id_carrito_detalle),
    constraint fk_carr_cade foreign key (id_carrito) references carrito (id_carrito),
    constraint fk_tipr_cade foreign key (id_tienda_producto) references tienda_producto (id_tienda_producto)
);
comment on table carrito_detalle is 'Almacena los productos agregados al carrito de compras junto con la cantidad y valores calculados temporalmente antes de confirmar la compra.';
comment on column carrito_detalle.id_carrito_detalle is 'Identificador único del detalle del carrito.';
comment on column carrito_detalle.id_carrito is 'Carrito al que pertenece el producto.';
comment on column carrito_detalle.id_tienda_producto is 'Producto publicado por una tienda.';
comment on column carrito_detalle.cantidad is 'Cantidad seleccionada por el cliente.';
comment on column carrito_detalle.precio_unitario is 'Precio unitario del producto al momento de agregarlo al carrito.';
comment on column carrito_detalle.subtotal is 'Valor parcial calculado para el producto.';
comment on column carrito_detalle.fecha_agregado is 'Fecha en que el producto fue agregado al carrito.';


create table departamento (
    id_departamento int not null,
    nombre_departamento varchar(100) not null,
    capital varchar(100) not null,
    
    constraint pk_departamento primary key (id_departamento)
);
comment on table departamento is 'Almacena los departamentos utilizados para organizar la ubicación geográfica de las ciudades registradas en MotoGO.';
comment on column departamento.id_departamento is 'Identificador único del departamento.';
comment on column departamento.nombre_departamento is 'Nombre del departamento.';
comment on column departamento.capital is 'Nombre de la ciudad capital del departamento.';

create table ciudad (
    id_ciudad int not null,
    nombre_ciudad varchar(100) not null,
    id_departamento int not null,
    
    constraint pk_ciudad primary key (id_ciudad),
    constraint fk_ciudad_departamento foreign key (id_departamento) references departamento (id_departamento)
);
comment on table ciudad is 'Almacena las ciudades asociadas a los departamentos para gestionar las ubicaciones registradas en MotoGO.';
comment on column ciudad.id_ciudad is 'Identificador único de la ciudad.';
comment on column ciudad.nombre_ciudad is 'Nombre de la ciudad.';
comment on column ciudad.id_departamento is 'Departamento al que pertenece la ciudad.';


create type tipo_ubicacion as enum ('casa', 'trabajo', 'otro');
comment on type tipo_ubicacion is 'tipo ubicacion direccion';


create table direccion (
    id_direccion int not null,
    id_cliente int not null,
    id_ciudad int not null,
    tipo_lugar tipo_ubicacion not null,
    direccion varchar(255) not null,
    barrio varchar(100) not null,
    codigo_postal varchar(20) null,
    info varchar(255) null,
    fecha_registro date not null,
    
    constraint pk_direccion primary key (id_direccion),
    constraint fk_clie_dire foreign key (id_cliente) references cliente (id_cliente),
    constraint fk_ciud_dire foreign key (id_ciudad) references ciudad (id_ciudad)
);
comment on table direccion is 'Almacena las direcciones registradas por los clientes para la entrega de pedidos y gestión de ubicaciones dentro de la plataforma MotoGO.';
comment on column direccion.id_direccion is 'Identificador único de la dirección.';
comment on column direccion.id_cliente is 'Cliente propietario de la dirección.';
comment on column direccion.id_ciudad is 'Ciudad a la que pertenece la dirección registrada.';
comment on column direccion.tipo_lugar is 'Tipo de ubicación registrada (Residencial, Trabajo, Vacacional, etc.).';
comment on column direccion.direccion is 'Dirección principal donde se realizarán las entregas.';
comment on column direccion.barrio is 'Barrio donde se encuentra ubicada la dirección.';
comment on column direccion.codigo_postal is 'Código postal de la ubicación.';
comment on column direccion.info is 'Información adicional o referencias para facilitar la entrega.';
comment on column direccion.fecha_registro is 'Fecha y hora de creación de la dirección.';


create table pedido (
    id_pedido int not null,
    id_cliente int not null,
    id_direccion int not null,
    id_carrito_detalle int not null,
    fecha_registro date not null,
    estado varchar(20) not null,
    
    constraint pk_pedido primary key (id_pedido),
    constraint fk_clie_pedi foreign key (id_cliente) references cliente (id_cliente),
    constraint fk_dire_pedi foreign key (id_direccion) references direccion (id_direccion),
    constraint fk_cade_pedi foreign key (id_carrito_detalle) references carrito_detalle (id_carrito_detalle)
);
comment on table pedido is 'Almacena la información general de las compras realizadas por los clientes dentro de MotoGO.';
comment on column pedido.id_pedido is 'Identificador único del pedido.';
comment on column pedido.id_cliente is 'Cliente que realiza la compra.';
comment on column pedido.id_direccion is 'Dirección seleccionada para la entrega.';
comment on column pedido.id_carrito_detalle is 'Detalle del carrito asociado al pedido.';
comment on column pedido.fecha_registro is 'Fecha y hora en que se registró el pedido.';
comment on column pedido.estado is 'Estado actual del pedido.';


create table factura (
    id_factura int not null,
    id_pedido int not null,
    num_factura varchar(50) not null,
    fecha_emision date not null,
    subtotal real not null,
    impuestos real not null,
    costo_envio real not null,
    total real not null,
    url_pdf varchar(500) null,
    
    constraint pk_factura primary key (id_factura),
    constraint fk_pedi_fact foreign key (id_pedido) references pedido (id_pedido),
    constraint uk_id_pedido unique (id_pedido),
    constraint uk_num_factura unique (num_factura)
);
comment on table factura is 'Almacena la información fiscal y comercial generada después de confirmar una compra, sirviendo como comprobante oficial de la transacción.';
comment on column factura.id_factura is 'Identificador único de la factura.';
comment on column factura.id_pedido is 'Pedido asociado a la factura.';
comment on column factura.num_factura is 'Número consecutivo de la factura.';
comment on column factura.fecha_emision is 'Fecha y hora de emisión de la factura.';
comment on column factura.subtotal is 'Valor de los productos antes de impuestos y cargos adicionales.';
comment on column factura.impuestos is 'Valor total de impuestos aplicados.';
comment on column factura.costo_envio is 'Costo correspondiente al envío del pedido.';
comment on column factura.total is 'Valor final facturado.';
comment on column factura.url_pdf is 'Ruta o URL del documento PDF de la factura.';


create table marca_moto (
    id_marca_moto int not null,
    nombre varchar(100) not null,
    
    constraint pk_marca_moto primary key (id_marca_moto),
    constraint uk_marca_moto unique (nombre)
);
comment on table marca_moto is 'Almacena las marcas de motocicletas registradas en MotoGO para facilitar la búsqueda y compatibilidad de repuestos.';
comment on column marca_moto.id_marca_moto is 'Identificador único de la marca.';
comment on column marca_moto.nombre is 'Nombre de la marca de motocicleta.';


create table modelo_moto (
    id_modelo_moto int not null,
    id_marca_moto int not null,
    nombre_modelo varchar(100) null,
    cilindraje int null,
    
    constraint pk_modelo_moto primary key (id_modelo_moto),
    constraint fk_marc_momo foreign key (id_marca_moto) references marca_moto (id_marca_moto)
);
comment on table modelo_moto is 'Almacena los modelos de motocicletas asociados a una marca específica, permitiendo determinar la compatibilidad de los productos.';
comment on column modelo_moto.id_modelo_moto is 'Identificador único del modelo.';
comment on column modelo_moto.id_marca_moto is 'Marca a la que pertenece el modelo.';
comment on column modelo_moto.nombre_modelo is 'Nombre del modelo de motocicleta.';
comment on column modelo_moto.cilindraje is 'Cilindraje del modelo.';

create table compatibilidad_producto (
    id_compatibilidad_producto int not null,
    id_producto int not null,
    id_modelo_moto int not null,
    
    constraint pk_compatibilidad_producto primary key (id_compatibilidad_producto),
    constraint fk_momo_copr foreign key (id_modelo_moto) references modelo_moto (id_modelo_moto),
    constraint fk_prod_copr foreign key (id_producto) references producto (id_producto),
    constraint uk_compatibilidad unique (id_producto, id_modelo_moto)
);
comment on table compatibilidad_producto is 'Permite relacionar los productos con los modelos de motocicleta para indicar qué repuestos o accesorios son compatibles con cada modelo.';
comment on column compatibilidad_producto.id_compatibilidad_producto is 'Identificador único de la compatibilidad.';
comment on column compatibilidad_producto.id_producto is 'Producto compatible.';
comment on column compatibilidad_producto.id_modelo_moto is 'Modelo de motocicleta compatible.';

create table metodo_pago (
    id_metodo_pago int not null,
    nombre varchar(100) not null,
    
    constraint pk_metodo_pago primary key (id_metodo_pago),
    constraint uk_metodo_pago unique (nombre)
);
comment on table metodo_pago is 'Almacena los métodos de pago disponibles que pueden utilizar los clientes para realizar compras dentro de la plataforma.';
comment on column metodo_pago.id_metodo_pago is 'Identificador único del método de pago.';
comment on column metodo_pago.nombre is 'Nombre del método de pago.';


create table pago (
    id_pago int not null,
    id_metodo_pago int not null,
    id_pedido int not null,
    referencia_pago varchar(100) not null,
    valor_pagado real not null,
    fecha_pago date not null,
    estado_pago varchar(20) not null,
    observaciones varchar(200) null,
    
    constraint pk_pago primary key (id_pago),
    constraint fk_mepa_pago foreign key (id_metodo_pago) references metodo_pago (id_metodo_pago),
    constraint fk_pedi_pago foreign key (id_pedido) references pedido (id_pedido),
    constraint uk_pago unique (referencia_pago, id_pedido)
);

comment on table pago is 'Almacena la información de los pagos realizados por los clientes para cancelar los pedidos generados dentro de MotoGO.';
comment on column pago.id_pago is 'Identificador único del pago.';
comment on column pago.id_metodo_pago is 'Método de pago utilizado.';
comment on column pago.referencia_pago is 'Código o referencia de la transacción.';
comment on column pago.valor_pagado is 'Valor total pagado por el cliente.';
comment on column pago.fecha_pago is 'Fecha y hora en que se realizó el pago.';
comment on column pago.estado_pago is 'Estado actual del pago.';
comment on column pago.observaciones is 'Comentarios o información adicional del pago.';
comment on column pago.id_pedido is 'Se realiza el pago del pedido';


--Agrega los roles disponibles en el sistema.--

insert into rol 
	(id_rol, nombre_rol)
values
	(1, 'Administrador'),
	(2, 'Repartidor'),
	(3, 'Local'),
	(4, 'Cliente');


create extension if not exists pgcrypto;

--Registra los usuarios y sus datos de acceso en la plataforma.--

insert into usuario
	(id_usuario, login, correo, contrasenia, fecha_registro, token_recu_contra, token_activa)
values
	(1, 101, 'usuario1gmail.com', crypt('MiPasswordSeguro123', gen_salt('bf', 10)), '2026-01-01', null, null),
	(2, 102, 'usuario2@gmail.com', crypt('MiPasswordSeguro123', gen_salt('bf', 10)), '2026-02-02', null, null),
	(3, 103, 'usuario3@gmail.com', crypt('MiPasswordSeguro123', gen_salt('bf', 10)), '2026-03-03', null, null),
	(4, 104, 'usuario4@gmail.com', crypt('MiPasswordSeguro123', gen_salt('bf', 10)), '2026-04-04', null, null),
	(5, 105, 'usuario5@gmail.com', crypt('MiPasswordSeguro123', gen_salt('bf', 10)), '2026-05-05', null, null),
	(6, 106, 'usuario6@gmail.com', crypt('MiPasswordSeguro123', gen_salt('bf', 10)), '2026-06-06', null, null);


--Asocia cada usuario con el rol que tiene asignado.--

insert into rol_usuario
	(id_rol, id_usuario)
values
	(1, 4),
	(4, 5),
	(4, 3),
	(1, 2),
	(4, 1),
	(1, 6);


--Registra los tipos de documento que pueden utilizar los clientes.--

insert into tipo_documento 
	(id_tipo_documento, nombre, abreviatura, estado)
values 
	(1, 'Cédula de ciudadania', 'CC', 'Activo'),
	(2, 'Tarjeta de identidad', 'TI', 'Activo'),
	(3, 'Permiso por protección temporal', 'PPT', 'Activo'),
	(4, 'Pasaporte', 'PP', 'Activo');



--Registra la información personal de los clientes.--

insert into cliente
	(id_cliente, id_tipo_documento, id_usuario, numero_documento, nombres, apellidos, telefono, foto_perfil, activo)
values
	(1, 1, 1, '1023121212', 'Daniel Alexander', 'Oviedo Valencia', '3013834237', null, 'Activo'),
	(2, 1, 2, '7912340', 'Itachi', 'Cardenas', '3103709742', null, 'Activo'),
	(3, 1, 3, '1023854394', 'Ricardo', 'Arevalo', '3132587512', null, 'Activo'),
	(4, 1, 4, '549203', 'Caballo', 'Roa', '3144117140', null, 'Activo'),
	(5, 1, 5, '9120312', 'Eylen', 'Aguilar', '3052042125', null , 'Activo'),
	(6, 1, 6, '3400422','Santigo', 'Rodriguez', '3007554965', null, 'Activo');
	

--Registra las solicitudes y datos de los repartidores.--
insert into repartidor 
	(id_repartidor, id_cliente, num_licencia, fecha_expedicion_licencia, fecha_vencimiento_licencia, 
	licencia_url, fecha_solicitud, fecha_aprobacion, estado, observacion)
values
	(1, 2, '12', '2026-01-01', '2026-01-01', null, '2026-01-01', '2026-01-01', 'Activo', 'Cumple'),
	(2, 3, '123', '2026-03-03', '2026-03-03', null, '2026-03-03', '2026-03-03', 'Activo', 'Cumple'),
	(3, 5, '12345', '2026-05-05', '2026-05-05', null, '2026-05-05', null, 'Pendiente', null);


--Registra los tipos de vehículos disponibles para los repartidores.--

insert into tipo_vehiculo
	(id_tipo_vehiculo, nom_vehiculo, activo)
values
	(1, 'Moto', 'Activo'),
	(2, 'Carro', 'Pendiente'),
	(3, 'Cicla', 'ACtivo'),
	(4, 'Caminando', 'Activo');


--Registra los vehículos asociados a los repartidores.--

insert into vehiculo
	(id_vehiculo, id_repartidor, id_tipo_vehiculo, placa, marca, modelo, color, anio, 
	tarjeta_propiedad_url, soat_vencimiento, mecanico_vencimiento, activo, fecha_registro)
values
	(1, 1, 1, 'MUR-459', 'Yamaha', '200', 'Negro', 2026, '---', '2026-01-01', '2026-01-01', 'Activo', '2026-01-01'),
	(2, 2, 3, 'KDJ-823', 'Honda', '150', 'Rojo', 2026, '---', '2026-02-02', '2026-02-02', 'Activo', '2026-02-02'),
	(3, 3, 2, 'XLW-104', 'Suzuki', '250', 'Azul', 2026, '---', '2026-03-03', '2026-03-03', 'Inactivo', '2026-03-03'),
	(4, 1, 3, 'MLZ-234', 'Suzuki', '250', 'Azul', 2026, '---', '2026-03-03', '2026-03-03', 'Inactivo', '2026-03-03');

--Registra las categorías generales de productos.--

insert into categoria_producto
	(id_categoria_producto, nombre, descripcion, activo, fecha_creacion)
values
	(1, 'Repuestos', 'Piezas de motor, frenos y transmisión', 'Activo', '2026-01-01'),
	(2, 'Accesorios', 'Cascos, guantes y lujos para la moto', 'Activo', '2026-01-01'),
	(3, 'Mantenimiento', 'Aceites, lubricantes y líquidos de frenos', 'Activo', '2026-01-02');

--Registra las tiendas.--

insert into tienda
	(id_tienda, id_cliente, nom_tienda, nit, descripcion, 
	logo_url, tel_tienda, correo_tienda, direccion_tienda, ciudad_tienda, 
	departamento_tienda, fecha_solicitud, estado)
values
	(1, 2, 'MotoGO', '3315783', null, null, '301383', 'MotoGO@gmail.com', 'TV 52 #78C 14 Sur', 'Bogota', 'Cundinamarca', '2026-01-01', 'Activo'),
	(2, 3, 'Rapitienda', '4426894', null, null, '402484', 'contacto@rapitienda.com', 'Calle 45 #12-34', 'Bogota', 'Cundinamarca', '2026-02-02', 'Activo'),
	(3, 5, 'EnviosExpress', '5517920', null, null, '503595', 'info@enviosx.com', 'Av. Ciudad de Cali #26-80', 'Bogota', 'Cundinamarca', '2026-03-03', 'Inactivo');
	

--Relaciona las tiendas con las categorías de productos que manejan.--

insert into tienda_categoria
	(id_tienda, id_categoria_producto)
values
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 2),
	(3, 3);


--Registra categorías específicas pertenecientes a una categoría general.--

insert into categoria_especifica
	(id_categoria_especifica, id_categoria_producto, nombre, descripcion, activo)
values
	(1, 1, 'Culata', 'Encuentra las mejores culatas para tu moto', 'Activo'),
	(2, 1,'LLantas', 'Con llanta pinchada?', 'Activo'),
	(3, 1, 'Frenos', 'Sin frenos?', 'Activo'),
	(4, 2, 'Cascos', 'Cascos resistentes', 'Activo'),
	(5, 2,'Guantes', 'Guantes proteccion', 'Activo'),
	(6, 3, 'Aceite', 'No resbala?', 'Activo');

--Registra los productos disponibles en el catálogo.--

insert into producto
	(id_producto, id_categoria_especifica, nombre, referencia, marca, descripcion)
values
	(1, 1, 'Culata 4029', '4029-25', 'Yamaha', 'Nuevo'),
	(2, 1, 'Culata 3245', '3245-90', 'Boxer', 'La mejor culata'),
	(3, 1, 'Culata 543', '543-10', 'Honda', 'Buen estado'),
	(4, 2, 'LLanta 123', '321', 'Honda', 'Usado'),
	(5, 2, 'LLanta 456', '456-1', 'Ninja', 'Bueno'),
	(6, 5, 'Guantes', null, null, 'Rotos'),
	(7, 4, 'Cascos', null, null, null);

--Registra precio y stock de las tiendas.--

insert into tienda_producto
	(id_tienda_producto, id_tienda, id_producto, precio, stock,
	garantia_dias, estado_producto, activo, fecha_publicacion, fecha_actualizacion)
values
	(1, 1, 1, '10.000', '20', '30', 'Bueno', 'Activo', '2026-01-01', '2026-01-01'),
	(2, 1, 2, '15.000', '0', '10', 'Bueno', 'Pendiente', '2026-02-02', '2026-02-02'),
	(3, 2, 5, '30.000', '5', '5', 'Rotos', 'Activo',' 2026-03-03', '2026-03-03'),
	(4, 3, 7, '500.000', '34', '90', 'Nuevo', 'Activo', '2026-01-01', '2026-01-01');

--Registra los carritos de compra.--

insert into carrito
	(id_carrito, id_cliente, fecha_actualizacion)
values
	(1, 2, '2026-01-01'),
	(2, 3, '2026-02-02'),
	(3, 5, '2026-03-03');



--Agrega productos y cantidades a los carritos de compra.--

insert into carrito_detalle
	(id_carrito_detalle, id_carrito, id_tienda_producto, 
	cantidad, precio_unitario, subtotal, fecha_agregado)
values
	(1, 1, 1, '2', '10.000', '20.000', '2026-01-01'),
	(2, 1, 2, '3', '30.000', '90.000', '2026-02-02'),
	(3, 1, 3, '4', '100.000', '400.000', '2026-03-03'),
	(4, 2, 1, '6', '10.000', '60.000', '2026-04-04'),
	(5, 2, 4, '1', '500.000', '500.000', '2026-05-05');


--Registra los departamentos utilizados para organizar las ubicaciones.--

insert into departamento 
	(id_departamento, nombre_departamento, capital) 
values
(1, 'amazonas', 'leticia'), (2, 'antioquia', 'medellín'), (3, 'arauca', 'arauca'),
(4, 'atlántico', 'barranquilla'), (5, 'bolívar', 'cartagena de indias'), (6, 'boyacá', 'tunja'),
(7, 'caldas', 'manizales'), (8, 'caquetá', 'florencia'), (9, 'casanare', 'yopal'),
(10, 'cauca', 'popayán'), (11, 'cesar', 'valledupar'), (12, 'chocó', 'quibdó'),
(13, 'córdoba', 'montería'), (14, 'cundinamarca', 'bogotá'), (15, 'guainía', 'inírida'),
(16, 'guaviare', 'san josé del guaviare'), (17, 'huila', 'neiva'), (18, 'la guajira', 'riohacha'),
(19, 'magdalena', 'santa marta'), (20, 'meta', 'villavicencio'), (21, 'nariño', 'san juan de pasto'),
(22, 'norte de santander', 'san josé de cúcuta'), (23, 'putumayo', 'mocoa'), (24, 'quindío', 'armenia'),
(25, 'risaralda', 'pereira'), (26, 'san andrés y providencia', 'san andrés'), (27, 'santander', 'bucaramanga'),
(28, 'sucre', 'sincelejo'), (29, 'tolima', 'ibagué'), (30, 'valle del cauca', 'cali'),
(31, 'vaupés', 'mitú'), (32, 'vichada', 'puerto carreño');

--Registra las ciudades y el departamento al que pertenece cada una.--

insert into ciudad 
(id_ciudad, nombre_ciudad, id_departamento) 
values
(1, 'medellín', 2), (2, 'bello', 2), (3, 'itagüí', 2), (4, 'envigado', 2), (5, 'rionegro', 2),
(6, 'barranquilla', 4), (7, 'soledad', 4),
(8, 'cartagena de indias', 5),
(9, 'bogotá', 14), (10, 'soacha', 14), (11, 'chía', 14), (12, 'zipaquirá', 14),
(13, 'manizales', 7),
(14, 'santa marta', 19),
(15, 'san josé de cúcuta', 22),
(16, 'pereira', 25),
(17, 'bucaramanga', 27), (18, 'floridablanca', 27),
(19, 'cali', 30), (20, 'buenaventura', 30), (21, 'palmira', 30);

--Registra las direcciones de entrega de los clientes.--

insert into direccion 
	(id_direccion, id_cliente, tipo_lugar, direccion, barrio, id_ciudad, codigo_postal, info, fecha_registro) 
values
(1, 2, 'casa', 'calle 45 #12-34', 'chapinero', 9, '110221', 'apto 402, torre b', '2026-09-07'),
(2, 3, 'trabajo', 'carrera 43a #7-50', 'el poblado', 1, null, 'oficina central motogo', '2026-09-07'),
(3, 5, 'otro', 'avenida 6n #20-12', 'granada', 19, '760001', null, '2026-09-07');

--Registra los pedidos realizados por los clientes.--

insert into pedido
	(id_pedido, id_cliente, id_direccion, id_carrito_detalle, fecha_registro, estado)
values
	(1, 2, 1, 3, '2026-01-01', 'Entregado'),
	(2, 3, 2, 1, '2026-02-02', 'Pendiente'),
	(3, 5, 1, 5, '2026-03-03', 'Se daño'),
	(4, 5, 1, 2, '2026-04-04', 'Entregado');

insert into factura
	(id_factura, id_pedido, num_factura, fecha_emision, subtotal, impuestos, costo_envio, total, url_pdf)
values
	(1, 1, '01', '2026-01-01', '20.000', '1.000', '5.000', '26.000', null),
	(2, 2, '02', '2026-02-02', '35.000', '2.500', '6.650', '44.150', null),
	(3, 3, '03', '2026-03-03', '15.000', '0.000', '2.850', '17.850', null);



--Registra las marcas de motocicletas disponibles.--

insert into marca_moto 
	(id_marca_moto, nombre) 
values
	(1, 'yamaha'),
	(2, 'honda'),
	(3, 'suzuki');

--Registra los modelos de motocicletas y sus marcas.--

insert into modelo_moto 
	(id_modelo_moto, id_marca_moto, nombre_modelo, cilindraje) 
values
	(1, 1, 'bws', 125),
	(2, 1, 'fz25', 249),
	(3, 2, 'cb 125f', 124),
	(4, 2, 'xre 300', 291),
	(5, 3, 'gixxer', 155);

--Registra la compatibilidad entre productos y modelos de motocicleta.--

insert into compatibilidad_producto
	(id_compatibilidad_producto, id_producto, id_modelo_moto)
values
	(1, 1, 1),
	(2, 1, 3),
	(3, 2, 4),
	(4, 3, 2),
	(5, 3, 5);


--Registra los métodos de pago disponibles.--

insert into metodo_pago
	(id_metodo_pago, nombre)
values
	(1, 'Nequi'),
	(2, 'BanColombia'),
	(3, 'Davivienda'),
	(4, 'Banco Caja Social'),
	(5, 'PSE'),
	(6, 'Efectivo');


--Registra los pagos realizados para los pedidos.--

insert into pago
	(id_pago, id_metodo_pago, id_pedido,referencia_pago, 
	valor_pagado, fecha_pago, estado_pago, observaciones)
values
	(1, 1, 1, '0001', '20.000', '2026-01-01', 'Recibido', null),
	(2, 2, 2, '0002', '44.150', '2026-02-02', 'Recibido', null),
	(3, 5, 3, '0003', '17.850', '2026-03-03', 'Error', null),
	(4, 6, 4, '0004', '62.500', '2026-04-04', 'Error', null);



-- INNER JOIN

-- Esta consulta relaciona los clientes con sus direcciones mediante el id_cliente.
-- Muestra el nombre y teléfono del cliente junto con la dirección reg  istrada.

select
	c.nombres,
	c.telefono,
	d.direccion
from
	cliente c
inner join direccion d on c.id_cliente = d.id_cliente;


-- Esta consulta relaciona al cliente con su carrito, los detalles del carrito, los productos publicados por las tiendas y finalmente el nombre del producto.
-- Permite ver qué productos están asociados al carrito de cada cliente.
select
	c.id_cliente,
	c.nombres,
	ca.id_carrito,
	cade.id_carrito_detalle,
  	p.nombre
from
	cliente c
inner join carrito ca on c.id_cliente = ca.id_cliente
inner join carrito_detalle cade on ca.id_carrito = cade.id_carrito
inner join tienda_producto tp on cade.id_tienda_producto = tp.id_tienda_producto
inner join producto p on tp.id_producto = p.id_producto;


-- Esta consulta relaciona al cliente con su registro como repartidor y con los vehículos que tiene registrados.
-- Permite mostrar qué vehículo está asociado a cada repartidor.
select
	c.nombres,
	c.id_cliente,
	r.id_repartidor,
	v.id_vehiculo,
	v.marca
from
	cliente c
inner join repartidor r on c.id_cliente = r.id_cliente
inner join vehiculo v on r.id_repartidor = v.id_repartidor;


-- Esta consulta relaciona al cliente con su carrito, los detalles del carrito,  los productos publicados por las tiendas y la información del producto.
-- Muestra la cantidad, subtotal, tienda, precio y nombre del producto.
select
	c.nombres,
	ca.id_carrito,
	cade.cantidad,
	cade.subtotal,
	tipr.id_tienda,
	tipr.precio,
	p.nombre
from
	cliente c
inner join carrito ca on c.id_cliente = ca.id_cliente
inner join carrito_detalle cade on ca.id_carrito = cade.id_carrito
inner join tienda_producto tipr on cade.id_tienda_producto = tipr.id_tienda_producto
inner join producto p on tipr.id_producto = p.id_producto;
	

-- Esta consulta relaciona la información de usuario con la información del cliente.
--Permite mostrar los datos de acceso del usuario junto con el nombre y teléfono del cliente.
select
	u.id_usuario,
	u.login,
	u.correo,
	c.nombres,
	c.telefono
from
	cliente c
inner join usuario u on c.id_cliente = u.id_usuario;

	
-- Consultas

-- Esta consulta muestra los nombres y teléfonos de los clientes que actualmente tienen el campo activo con el valor 'Activo'.
	
select nombres, telefono
from cliente c
where activo = 'Activo';


-- Esta consulta muestra los subtotales de los detalles del carrito cuyo valor es mayor que 10.000.
select subtotal
from carrito_detalle cd 
where cd.subtotal > 10.000;


-- Esta consulta muestra el total de las facturas en las que el subtotal es menor o igual al total facturado.
select total
from factura f 
where f.subtotal <= f.total ;


-- Esta consulta muestra el nombre, referencia, marca y descripción de los productos y los ordena alfabéticamente según la marca.
select nombre, referencia, marca, descripcion
from producto p
order by marca asc;
	

-- Esta consulta muestra el precio, stock y días de garantía de los productos publicados cuya garantía es de 90 días o menos.
select precio, stock, garantia_dias 
from tienda_producto tp 
where tp.garantia_dias <= 90;


-- Subconsultas

-- Esta consulta muestra el nombre y la marca de los productos que están publicados en una tienda cuyo stock es menor a 30 unidades.
-- La subconsulta obtiene los id_producto que cumplen esa condición y la consulta principal utiliza esos identificadores para mostrar los datos del producto.

select nombre, marca
from producto p 
where p.id_producto in(
	select id_producto 
	from tienda_producto
	where stock < 30
);

-- Esta consulta muestra todos los vehículos pertenecientes a repartidores que están activos.
-- La subconsulta obtiene los id_repartidor cuyo estado es 'Activo' y la consulta principal utiliza esos identificadores para filtrar los vehículos.
select *
from vehiculo
where id_repartidor in (
    select id_repartidor
    from repartidor
    where activo = 'Activo'
);

-- Esta subconsulta muestra los productos cuyo precio es mayor al precio promedio de todos los productos publicados en tienda_producto.
-- La subconsulta calcula el promedio de los precios y la consulta principal compara cada precio con ese resultado.
select nombre, precio
from producto p
inner join tienda_producto tp on p.id_producto = tp.id_producto
where tp.precio > (
    select avg(precio) 
    from tienda_producto
);

-- Esta subconsulta muestra los clientes que tienen al menos un pedido registrado.
-- La subconsulta obtiene los id_cliente presentes en la tabla pedido y la consulta principal utiliza esos identificadores para mostrar los nombres y apellidos de los clientes.
select nombres, apellidos
from cliente c
where c.id_cliente in (
    select id_cliente 
    from pedido
);

-- Esta subconsulta muestra las tiendas que tienen al menos un producto con stock disponible.
-- La subconsulta obtiene los id_tienda de las publicaciones cuyo stock es mayor que cero y la consulta principal muestra el nombre de esas tiendas.
select nom_tienda
from tienda t
where t.id_tienda in (
    select id_tienda
    from tienda_producto
    where stock > 0
);


-- Update

-- Esta actualización cambia el número de teléfono del cliente cuyo id_cliente es 1.

update cliente
set telefono = '3013833742'
where id_cliente = 1;

-- Esta actualización cambia el estado del pedido de los pedidos realizados por el cliente 3 y establece su estado como 'Entregado'.
update pedido
set estado = 'Entregado'
where id_cliente = 3;

-- Esta actualización cambia el nombre, NIT, teléfono y correo de la tienda cuyo id_tienda es 2.
update tienda
set nom_tienda = 'Cambio nombre',
	nit = '10210230',
	tel_tienda  = '(601) 617239',
	correo_tienda = 'cambionombre@gmail.com'
where id_tienda = 2;

-- Esta actualización cambia el nombre del método de pago cuyo id_metodo_pago es 3.
update metodo_pago
set nombre = 'Davibank'
where id_metodo_pago = 3;

-- Esta actualización cambia el correo electrónico del usuario cuyo id_usuario es 1.
update usuario
set correo = 'admin1@gmail.com'
where id_usuario = 1;

-- Delete

-- Esta eliminación borra de la tabla ciudad el registro cuyo id_ciudad es 3.

delete from ciudad
where id_ciudad = 3;

-- Esta eliminación borra de la tabla factura la factura cuyo id_factura es 2.

delete from factura
where id_factura = 2;

-- Esta eliminación borra de la tabla metodo_pago el método de pago cuyo id_metodo_pago es 3.

delete from metodo_pago
where id_metodo_pago = 3;

-- Esta eliminación borra de la tabla pago el registro cuyo id_pago es 2.

delete from pago
where id_pago = 2;

-- Esta eliminación borra de la tabla departamento el registro cuyo id_departamento es 3.

delete from departamento
where id_departamento = 3;
