-- ==============================================
-- Base de datos DevOps_Project
-- Autor: Andrei Harkov Lev
-- Fecha: 2025-11-11
-- ==============================================

CREATE DATABASE IF NOT EXISTS devops_project;
USE devops_project;

-- Tabla de usuarios
CREATE TABLE IF NOT EXISTS usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  correo VARCHAR(120) UNIQUE NOT NULL,
  rol ENUM('admin','empleado','cliente') DEFAULT 'cliente',
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de productos
CREATE TABLE IF NOT EXISTS productos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  descripcion TEXT,
  precio DECIMAL(10,2) NOT NULL,
  existencias INT DEFAULT 0,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de ventas
CREATE TABLE IF NOT EXISTS ventas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT,
  fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  total DECIMAL(10,2),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

-- Inserción de datos iniciales
INSERT INTO usuarios (nombre, correo, rol) VALUES
('Andrei Harkov', 'andrei@storeonline.com', 'admin'),
('Julian Rivas', 'julian@storeonline.com', 'empleado'),
('Cliente Demo', 'cliente@correo.com', 'cliente');

INSERT INTO productos (nombre, descripcion, precio, existencias) VALUES
('Laptop ROG Strix', 'Laptop gamer de alto rendimiento con Ryzen 9', 18999.00, 7),
('Monitor Curvo 32"', 'Monitor curvo con resolución 2K y 165Hz', 2599.99, 12),
('Auriculares Inalámbricos', 'Bluetooth 5.2 con cancelación de ruido', 599.99, 30),
('Teclado Mecánico RGB', 'Switches rojos silenciosos', 799.50, 20);

-- Inserción de venta de ejemplo
INSERT INTO ventas (id_usuario, total) VALUES (1, 599.99);
