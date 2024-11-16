CREATE DATABASE SistemaStockMonarcaMarket3;
USE SistemaStockMonarcaMarket3;

-- Creación de tablas

-- Creación de tabla Rol primero

CREATE TABLE `rol` (
  `ID_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `categoria` (
  `ID_categoria` int NOT NULL,
  `nombre` varchar(90) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`ID_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `producto` (
  `ID_producto` int NOT NULL,
  `nombre` varchar(90) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `tipo_producto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orden_de_compra` (
  `ID_porden` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `ID_producto` int DEFAULT NULL,
  `ID_cliente` int DEFAULT NULL,
  PRIMARY KEY (`ID_porden`),
  KEY `ID_producto` (`ID_producto`),
  CONSTRAINT `orden_de_compra_ibfk_1` FOREIGN KEY (`ID_producto`) REFERENCES `producto` (`ID_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `venta` (
  `ID_venta` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `detalle_Venta` varchar(90) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `ID_producto` int DEFAULT NULL,
  PRIMARY KEY (`ID_venta`),
  KEY `ID_producto` (`ID_producto`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`ID_producto`) REFERENCES `producto` (`ID_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cliente` (
  `ID_cliente` int NOT NULL,
  `nombre_usuario` varchar(90) DEFAULT NULL,
  `apellido` varchar(90) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `contacto` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`ID_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `devolucion` (
  `ID_devolucion` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `ID_producto` int DEFAULT NULL,
  `ID_cliente` int DEFAULT NULL,
  PRIMARY KEY (`ID_devolucion`),
  KEY `ID_producto` (`ID_producto`),
  KEY `ID_cliente` (`ID_cliente`),
  CONSTRAINT `devolucion_ibfk_1` FOREIGN KEY (`ID_producto`) REFERENCES `producto` (`ID_producto`),
  CONSTRAINT `devolucion_ibfk_2` FOREIGN KEY (`ID_cliente`) REFERENCES `cliente` (`ID_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `proveedor` (
  `ID_proveedor` int NOT NULL,
  `nombre` varchar(90) DEFAULT NULL,
  `contacto` varchar(90) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `ID_producto` int DEFAULT NULL,
  PRIMARY KEY (`ID_proveedor`),
  KEY `ID_producto` (`ID_producto`),
  CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`ID_producto`) REFERENCES `producto` (`ID_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `usuario` (
  `ID_usuario` int NOT NULL,
  `nombre` varchar(90) DEFAULT NULL,
  `apellido` varchar(90) DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL,
  `contrasena` varchar(90) DEFAULT NULL,
  `ID_rol` int DEFAULT NULL,
  PRIMARY KEY (`ID_usuario`),
  KEY `ID_rol` (`ID_rol`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`ID_rol`) REFERENCES `rol` (`ID_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `historial` (
  `ID_historial` int NOT NULL,
  `usuario` int DEFAULT NULL,
  `ID_producto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`ID_historial`),
  KEY `usuario` (`usuario`),
  KEY `ID_producto` (`ID_producto`),
  CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`ID_usuario`),
  CONSTRAINT `historial_ibfk_2` FOREIGN KEY (`ID_producto`) REFERENCES `producto` (`ID_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Inserción de datos

-- Insertar datos en Rol
INSERT INTO Rol (ID_rol, nombre, descripcion) VALUES (1, 'Administrador', 'Rol de administrador en el sistema');

-- Insertar datos en Categoria
INSERT INTO Categoria (ID_categoria, nombre, descripcion) VALUES (1, 'Alimentos', 'Productos alimenticios');

-- Insertar datos en Producto
INSERT INTO Producto (ID_producto, nombre, descripcion, precio, stock) 
VALUES (1, 'Yogur', 'Frutilla', 50.50, 100);

-- Insertar datos en Orden_de_Compra
INSERT INTO Orden_de_Compra (ID_porden, fecha, total, ID_producto) 
VALUES (1, '2024-10-03', 500.00, 1); -- Cambiado total a DECIMAL

-- Insertar datos en Venta
INSERT INTO Venta (ID_venta, fecha, detalle_Venta, total, ID_producto) 
VALUES (1, '2024-10-03', 'Compra de yogur', 150.00, 1); -- Cambiado total a DECIMAL

-- Insertar datos en Cliente
INSERT INTO Cliente (ID_cliente, nombre_usuario, apellido, email, contrasena, contacto) 
VALUES (1, 'Cliente 1', 'Apellido 1', 'cliente1@gmail.com', 'contrasena123','123456789');

-- Insertar datos en Devolucion
INSERT INTO Devolucion (ID_devolucion, fecha, motivo, ID_producto, ID_cliente) 
VALUES (1, '2024-10-05', 'Producto dañado', 1, 1);

-- Insertar datos en Proveedor
INSERT INTO Proveedor (ID_proveedor, nombre, contacto, telefono, ID_producto) 
VALUES (1, 'Proveedor 1', 'jorge@gmail.com', '9876543210', 1);

-- Insertar datos en Usuario
INSERT INTO Usuario (ID_usuario, nombre, apellido, email, contrasena, ID_rol) 
VALUES (1, 'Admin', 'Admin', 'admin@gmail.com', '554321', 1);

-- Insertar datos en Historial
INSERT INTO Historial (ID_historial, usuario, ID_producto, cantidad, fecha) 
VALUES (1, 1, 1, 10, '2024-10-04');

-- Consultar Ordenes de compra
SELECT * FROM Orden_de_Compra;

-- Consultar Devolucion
SELECT * FROM Devolucion;

-- Consultar Venta
SELECT * FROM Venta;

-- Consultar Cliente
SELECT * FROM Cliente;

-- Consultar Proveedor
SELECT * FROM Proveedor;

-- Consultar Usuario
SELECT * FROM Usuario;

-- Consultar productos
SELECT * FROM Producto;

-- Consultar ventas y productos vendidos
SELECT Venta.ID_venta, Producto.nombre, Venta.total 
FROM Venta 
JOIN Producto ON Venta.ID_producto = Producto.ID_producto;

-- Consultar stock
SELECT 
    p.ID_producto, 
    p.nombre, 
    p.stock,
    CASE
        WHEN p.stock < 0 THEN 'Stock negativo'
        WHEN p.stock BETWEEN 0 AND 5 THEN 'Stock bajo'
        WHEN p.stock BETWEEN 6 AND 100 THEN 'Stock adecuado'
        WHEN p.stock BETWEEN 101 AND 500 THEN 'Stock alto'
        ELSE 'Exceso de stock'
    END AS estado_stock
FROM Producto p;

-- Consultar el historial de un usuario
SELECT Usuario.nombre, Historial.cantidad, Producto.nombre AS Producto, Historial.fecha 
FROM Historial 
JOIN Usuario ON Historial.usuario = Usuario.ID_usuario 
JOIN Producto ON Historial.ID_producto = Producto.ID_producto 
WHERE Usuario.ID_usuario = 1;


-- Eliminar registros de devoluciones que dependen del producto
DELETE FROM Devolucion WHERE ID_producto = 1;

-- Eliminar registros de órdenes de compra que dependen del producto
DELETE FROM Orden_de_Compra WHERE ID_producto = 1;

-- Eliminar registros de ventas que dependen del producto
DELETE FROM Venta WHERE ID_producto = 1;

-- Eliminar registros de historial que dependen del producto
DELETE FROM Historial WHERE ID_producto = 1;

-- Eliminar registros de proveedor que dependen del producto
DELETE FROM Proveedor WHERE ID_producto = 1;

-- Finalmente, eliminar el producto
DELETE FROM Producto WHERE ID_producto = 1;
