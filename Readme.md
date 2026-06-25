# 🔧 Inventario Ferretería El Martillo

Sistema de control de inventario para la ferretería **El Martillo**, desarrollado como ejercicio académico del Ciclo 3 – Introducción a las Bases de Datos.

---

## 📋 Descripción

Este repositorio contiene el modelo relacional y los scripts SQL necesarios para gestionar el inventario de una ferretería, incluyendo productos, categorías, ubicaciones, proveedores y las relaciones entre ellos.

---

## 📁 Contenido del repositorio

| Archivo | Descripción |
|---|---|
| `ERDDiagram1.svg` | Diagrama relacional (ERD) del modelo de base de datos |
| `ddl.sql` | Script DDL para crear la base de datos y todas las tablas en MySQL 8 |
| `dml-data.sql` | Script DML con la inserción de 10 registros por tabla |
| `dml-querys.sql` | Script DML con las 10 consultas requeridas |

---

## 🗃️ Modelo de datos

El sistema cuenta con **5 tablas**:

- **Categoria** — organiza los productos por tipo (herramientas, electricidad, plomería, etc.)
- **Ubicacion** — registra el pasillo y estante donde se almacena cada producto
- **Productos** — información completa del producto, cantidades y estado del inventario
- **Proveedor** — datos de contacto y estado de cada proveedor
- **Producto_Proveedor** — relación N:M entre productos y proveedores, con precio de compra, referencia del proveedor y días de entrega

---

## ⚙️ Instrucciones de uso

1. Tener instalado **MySQL 8**
2. Ejecutar primero el script DDL:
   ```bash
   mysql -u root -p < ddl.sql
   ```
3. Luego poblar la base de datos:
   ```bash
   mysql -u root -p < dml-data.sql
   ```
4. Finalmente ejecutar las consultas:
   ```bash
   mysql -u root -p < dml-querys.sql
   ```

---

## 👥 Integrante

| Nombre | GitHub |
|---|---|
| ✏️ Nombre Jhoan sebastian Buitrago Sandoval 


---

## 🏫 Información académica

- **Curso:** Ciclo 3 – Introducción a las Bases de Datos
- **Ejercicio:** Control de inventario de una ferretería