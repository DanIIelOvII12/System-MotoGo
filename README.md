# 🏍️ MOTOGO

## Descripción

MOTOGO es una plataforma de delivery tipo marketplace diseñada para conectar clientes, tiendas, repartidores y administradores en un único ecosistema digital.

El sistema permite a los usuarios realizar pedidos, gestionar productos, coordinar entregas y monitorear operaciones en tiempo real mediante una arquitectura escalable y orientada a servicios.

---

# Objetivos del Proyecto

- Digitalizar el proceso de pedidos y entregas.
- Facilitar la interacción entre clientes, comercios y repartidores.
- Optimizar la gestión de órdenes y entregas.
- Centralizar la administración de la plataforma.
- Garantizar trazabilidad y control de las operaciones.

---

# Actores del Sistema

## Cliente

- Registro e inicio de sesión.
- Gestión de perfil.
- Búsqueda de tiendas.
- Visualización de productos.
- Realización de pedidos.
- Seguimiento de órdenes.
- Historial de compras.

## Tienda

- Gestión de perfil comercial.
- Administración de productos.
- Gestión de pedidos recibidos.
- Control de disponibilidad.

## Repartidor

- Gestión de perfil.
- Visualización de pedidos asignados.
- Actualización de estados de entrega.
- Historial de entregas realizadas.

## Administrador

- Gestión de usuarios.
- Gestión de tiendas.
- Gestión de repartidores.
- Supervisión general del sistema.
- Generación de reportes.

---

# Arquitectura del Proyecto

```text
MOTOGO
│
├── docs/
│   ├── requisitos/
│   ├── planificacion/
│   ├── diagramas/
│   └── presentaciones/
│
├── src/
│
├── tests/
│
├── .github/
│
├── README.md
├── LICENSE
└── CONTRIBUTING.md
```

---

# Documentación

La documentación del proyecto se encuentra organizada en la carpeta:

```text
docs/
```

## Contenido

### Requisitos

- Documento IEEE 830
- Requerimientos funcionales
- Requerimientos no funcionales

### Planificación

- Cronogramas
- Diagramas de Gantt
- Archivos Microsoft Project

### Diagramas

- Casos de uso
- Diagramas de clases
- Modelo entidad-relación
- Diagramas UML

### Presentaciones

- Material de sustentación
- Avances del proyecto

---

# Metodología de Trabajo

El proyecto utiliza una estrategia basada en Git Flow simplificado.

## Ramas principales

### main

Contiene versiones estables y aprobadas del proyecto.

### develop

Contiene la integración de funcionalidades en desarrollo.

### feature/*

Contiene funcionalidades específicas desarrolladas por cada integrante.

Ejemplos:

```text
feature/authentication
feature/database-design
feature/frontend-structure
feature/order-management
```

---

# Convención de Commits

Se utiliza Conventional Commits.

## Ejemplos

```bash
feat: add authentication module
fix: solve login validation issue
docs: update IEEE 830 documentation
refactor: improve database architecture
test: add user service tests
```

---

# Tecnologías

Tecnologías previstas para el desarrollo:

- Backend
- Frontend
- Base de Datos
- APIs REST
- UML
- Git y GitHub

Las tecnologías específicas serán definidas durante la fase de diseño y construcción.

---

# Estado del Proyecto

🚧 En fase de análisis y diseño.

Actualmente se están desarrollando:

- Documentación de requisitos.
- Diagramas UML.
- Modelado de base de datos.
- Planificación del proyecto.
- Arquitectura del sistema.

---

# Equipo de Desarrollo

Proyecto académico desarrollado por el equipo MOTOGO.

---

# Licencia

Este proyecto se distribuye bajo la licencia MIT.
