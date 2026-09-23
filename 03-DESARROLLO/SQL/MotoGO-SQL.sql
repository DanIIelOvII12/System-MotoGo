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