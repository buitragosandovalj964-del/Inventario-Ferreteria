-- =============================================


DROP DATABASE IF EXISTS inventario_ferreteria;
CREATE DATABASE inventario_ferreteria
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_spanish_ci;

USE inventario_ferreteria;

-- ---------------------------------------------
-- Tabla: Categoria
-- ---------------------------------------------
CREATE TABLE Categoria (
    id_categoria     INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Categoria VARCHAR(100) NOT NULL UNIQUE,
    Descripcion      TEXT
);


CREATE TABLE Ubicacion (
    id_ubicacion INT AUTO_INCREMENT PRIMARY KEY,
    Pasillo      VARCHAR(20) NOT NULL,
    Estante      VARCHAR(20) NOT NULL,
    UNIQUE (Pasillo, Estante)
);

CREATE TABLE Productos (
    id_producto          INT AUTO_INCREMENT PRIMARY KEY,
    Referencia_Interna   VARCHAR(50)  NOT NULL UNIQUE,
    Nombre_Producto      VARCHAR(100) NOT NULL,
    Descripcion          TEXT,
    Marca_Producto       VARCHAR(100),
    Unidad_Venta         ENUM('unidad', 'metro', 'litro', 'kilo', 'caja', 'rollo') NOT NULL,
    Precio_Venta         DECIMAL(12,2) NOT NULL,
    Estado               ENUM('disponible', 'descontinuado') NOT NULL DEFAULT 'disponible',
    Cantidad_Disponible  INT NOT NULL DEFAULT 0,
    Cantidad_Minima      INT NOT NULL DEFAULT 0,
    Cantidad_Maxima      INT NOT NULL,
    id_categoria         INT NOT NULL,
    id_ubicacion         INT NOT NULL,

    CONSTRAINT fk_producto_categoria FOREIGN KEY (id_categoria)
        REFERENCES Categoria(id_categoria),
    CONSTRAINT fk_producto_ubicacion FOREIGN KEY (id_ubicacion)
        REFERENCES Ubicacion(id_ubicacion),

    CONSTRAINT chk_cantidad_disponible CHECK (Cantidad_Disponible >= 0),
    CONSTRAINT chk_cantidad_minmax     CHECK (Cantidad_Minima <= Cantidad_Maxima)
);

-- ---------------------------------------------
-- Tabla: Proveedor
-- ---------------------------------------------
CREATE TABLE Proveedor (
    NIT               VARCHAR(20)  NOT NULL PRIMARY KEY,
    Nombre_Proveedor  VARCHAR(50)  NOT NULL,
    Contacto          VARCHAR(100),
    Telefono          VARCHAR(10),
    Correo            VARCHAR(100),
    Direccion         VARCHAR(50),
    Ciudad            VARCHAR(50),
    Estado            ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);

CREATE TABLE Producto_Proveedor (
    id_producto          INT          NOT NULL,
    NIT_proveedor        VARCHAR(20)  NOT NULL,
    Referencia_Proveedor VARCHAR(50),
    Precio_Compra        DECIMAL(12,2) NOT NULL,
    Dias_Entrega         INT          NOT NULL,

    PRIMARY KEY (id_producto, NIT_proveedor),

    CONSTRAINT fk_pp_producto  FOREIGN KEY (id_producto)
        REFERENCES Productos(id_producto),
    CONSTRAINT fk_pp_proveedor FOREIGN KEY (NIT_proveedor)
        REFERENCES Proveedor(NIT)
);