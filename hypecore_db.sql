-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para hypecore_db
CREATE DATABASE IF NOT EXISTS `hypecore_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `hypecore_db`;

-- Volcando estructura para tabla hypecore_db.cargo
CREATE TABLE IF NOT EXISTS `cargo` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_cargo`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla hypecore_db.cargo: ~3 rows (aproximadamente)
INSERT INTO `cargo` (`id_cargo`, `nombre`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
	(1, 'Administrador', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(2, 'Empleado', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(3, 'Cliente', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25');

-- Volcando estructura para tabla hypecore_db.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `idx_estado` (`estado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla hypecore_db.categoria: ~5 rows (aproximadamente)
INSERT INTO `categoria` (`id_categoria`, `nombre`, `descripcion`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
	(1, 'Ropa Deportiva', 'Prendas para entrenamiento y deporte', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(2, 'Calzado', 'Zapatillas, botines y más', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(3, 'Accesorios', 'Gorras, mochilas, etc.', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(4, 'Pantalones', 'Pantalones deportivos y casuales', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(5, 'Casacas', 'Chaquetas y abrigos', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25');

-- Volcando estructura para tabla hypecore_db.color
CREATE TABLE IF NOT EXISTS `color` (
  `id_color` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `codigo_hex` varchar(7) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_color`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `idx_estado` (`estado`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla hypecore_db.color: ~11 rows (aproximadamente)
INSERT INTO `color` (`id_color`, `nombre`, `codigo_hex`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
	(1, 'Negro', '#000000', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(2, 'Blanco', '#FFFFFF', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(3, 'Rojo', '#FF0000', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(4, 'Azul Marino', '#001F3F', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(5, 'Verde Oliva', '#808000', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(6, 'Gris', '#808080', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(7, 'Beige', '#F5F5DC', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(8, 'Azul Claro', '#ADD8E6', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(9, 'Azul Oscuro', '#00008B', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(10, 'Crema', '#FFFDD0', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(11, 'Multicolor', '#FFFFFF', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25');

-- Volcando estructura para tabla hypecore_db.detalle_pedido
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `idx_pedido` (`id_pedido`),
  KEY `idx_producto` (`id_producto`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla hypecore_db.detalle_pedido: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hypecore_db.marca
CREATE TABLE IF NOT EXISTS `marca` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `logo_url` varchar(500) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_marca`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `idx_estado` (`estado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla hypecore_db.marca: ~6 rows (aproximadamente)
INSERT INTO `marca` (`id_marca`, `nombre`, `descripcion`, `logo_url`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
	(1, 'Nike', 'Just Do It', 'https://logo.clearbit.com/nike.com', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(2, 'Adidas', 'Impossible is Nothing', 'https://logo.clearbit.com/adidas.com', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(3, 'Zara', 'Love Your Curves', 'https://logo.clearbit.com/zara.com', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(4, 'Puma', 'Forever Faster', 'https://logo.clearbit.com/puma.com', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(5, 'Reebok', 'Be More Human', 'https://logo.clearbit.com/reebok.com', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25');

-- Volcando estructura para tabla hypecore_db.modelo
CREATE TABLE IF NOT EXISTS `modelo` (
  `id_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_modelo`),
  UNIQUE KEY `unique_modelo_marca` (`nombre`,`id_marca`),
  KEY `idx_marca` (`id_marca`),
  KEY `idx_estado` (`estado`),
  CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla hypecore_db.modelo: ~9 rows (aproximadamente)
INSERT INTO `modelo` (`id_modelo`, `nombre`, `id_marca`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
	(1, 'Air Force 1', 1, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(2, 'Dri-FIT Legend', 1, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(3, 'Tech Fleece', 1, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(4, 'Ultraboost', 2, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(5, 'Essentials', 2, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(6, 'Oversized Blazer', 3, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(7, 'Slim Fit', 3, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(8, 'RS-X³', 4, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(9, 'Club C', 5, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25');

-- Volcando estructura para tabla hypecore_db.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `numero_orden` varchar(50) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `estado_pedido` enum('Pendiente','Procesando','Enviado','Entregado','Cancelado') DEFAULT 'Pendiente',
  `direccion_envio` text NOT NULL,
  `telefono_contacto` varchar(20) NOT NULL,
  `fecha_pedido` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_pedido`),
  UNIQUE KEY `numero_orden` (`numero_orden`),
  KEY `idx_usuario` (`id_usuario`),
  KEY `idx_estado` (`estado_pedido`),
  KEY `idx_fecha` (`fecha_pedido`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla hypecore_db.pedido: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hypecore_db.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `imagen_url` varchar(500) DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `id_modelo` int(11) NOT NULL,
  `id_talla` int(11) NOT NULL,
  `id_color` int(11) NOT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_producto`),
  KEY `id_talla` (`id_talla`),
  KEY `id_color` (`id_color`),
  KEY `idx_categoria` (`id_categoria`),
  KEY `idx_marca` (`id_marca`),
  KEY `idx_modelo` (`id_modelo`),
  KEY `idx_estado` (`estado`),
  KEY `idx_precio` (`precio`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON UPDATE CASCADE,
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`) ON UPDATE CASCADE,
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id_modelo`) ON UPDATE CASCADE,
  CONSTRAINT `producto_ibfk_4` FOREIGN KEY (`id_talla`) REFERENCES `talla` (`id_talla`) ON UPDATE CASCADE,
  CONSTRAINT `producto_ibfk_5` FOREIGN KEY (`id_color`) REFERENCES `color` (`id_color`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla hypecore_db.producto: ~11 rows (aproximadamente)
INSERT INTO `producto` (`id_producto`, `nombre`, `descripcion`, `precio`, `stock`, `imagen_url`, `id_categoria`, `id_marca`, `id_modelo`, `id_talla`, `id_color`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
	(1, 'Nike Air Force 1 Blanco', 'Zapatillas clásicas Air Force 1 en color blanco', 350.00, 25, 'https://images.unsplash.com/photo-1600269452121-4f2416e55c28', 2, 1, 1, 15, 2, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(2, 'Nike Air Force 1 Negro', 'Zapatillas clásicas Air Force 1 en color negro', 350.00, 20, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff', 2, 1, 1, 15, 1, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(3, 'Adidas Ultraboost Negro', 'Zapatillas de running con tecnología Boost', 450.00, 15, 'https://images.unsplash.com/photo-1558191053-c03db2757e3d', 2, 2, 4, 16, 1, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(4, 'Adidas Ultraboost Blanco', 'Zapatillas de running con tecnología Boost', 450.00, 18, 'https://images.unsplash.com/photo-1597892657493-6847b9640bac', 2, 2, 4, 16, 2, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(5, 'Zara Blazer Oversize Negro', 'Blazer de corte moderno y elegante', 189.00, 30, 'https://images.unsplash.com/photo-1532453288672-3a27e9be9efd', 1, 3, 6, 3, 1, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(6, 'Zara Blazer Oversize Beige', 'Blazer de corte moderno y elegante', 189.00, 28, 'https://images.unsplash.com/photo-1532453288672-3a27e9be9efd', 1, 3, 6, 3, 7, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(7, 'Nike Tech Fleece Negro', 'Sudadera premium con tecnología térmica', 220.00, 22, 'https://images.unsplash.com/photo-1554201502-1c99ebd0c836', 1, 1, 3, 4, 1, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(8, 'Adidas Essentials Tee Blanco', 'Camiseta básica de algodón orgánico', 65.00, 50, 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab', 1, 2, 5, 3, 2, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(9, 'Zara Slim Fit Jeans Azul Oscuro', 'Jeans de corte slim fit en denim premium', 120.00, 35, 'https://images.unsplash.com/photo-1542272604-787c3835535d', 4, 3, 7, 9, 9, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(10, 'Puma RS-X³ Multicolor', 'Zapatillas con diseño futurista', 280.00, 12, 'https://images.unsplash.com/photo-1597892657493-6847b9640bac', 2, 4, 8, 15, 11, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(11, 'Reebok Club C Blanco', 'Zapatillas retro clásicas', 180.00, 40, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff', 2, 5, 9, 14, 2, 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25');

-- Volcando estructura para procedimiento hypecore_db.sp_registrar_pedido
DELIMITER //
CREATE PROCEDURE `sp_registrar_pedido`(
    IN p_id_usuario INT,
    IN p_numero_orden VARCHAR(50),
    IN p_total DECIMAL(10,2),
    IN p_direccion_envio TEXT,
    IN p_telefono_contacto VARCHAR(20),
    OUT p_id_pedido INT
)
BEGIN
    INSERT INTO pedido (id_usuario, numero_orden, total, direccion_envio, telefono_contacto)
    VALUES (p_id_usuario, p_numero_orden, p_total, p_direccion_envio, p_telefono_contacto);
    
    SET p_id_pedido = LAST_INSERT_ID();
END//
DELIMITER ;

-- Volcando estructura para procedimiento hypecore_db.sp_validar_login
DELIMITER //
CREATE PROCEDURE `sp_validar_login`(
    IN p_correo VARCHAR(100),
    IN p_clave VARCHAR(255)
)
BEGIN
    SELECT 
        u.id_usuario,
        u.nombres,
        u.apellidos,
        u.correo,
        u.telefono,
        u.direccion,
        u.nro_documento,
        c.id_cargo,
        c.nombre AS cargo_nombre,
        td.id_tipo_documento,
        td.nombre AS tipo_documento_nombre
    FROM usuario u
    INNER JOIN cargo c ON u.id_cargo = c.id_cargo
    INNER JOIN tipo_documento td ON u.id_tipo_documento = td.id_tipo_documento
    WHERE u.correo = p_correo 
    AND u.clave = p_clave 
    AND u.estado = TRUE;
END//
DELIMITER ;

-- Volcando estructura para tabla hypecore_db.talla
CREATE TABLE IF NOT EXISTS `talla` (
  `id_talla` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('Internacional','Numérica','Calzado') NOT NULL,
  `valor` varchar(10) NOT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_talla`),
  UNIQUE KEY `unique_tipo_valor` (`tipo`,`valor`),
  KEY `idx_tipo` (`tipo`),
  KEY `idx_estado` (`estado`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla hypecore_db.talla: ~18 rows (aproximadamente)
INSERT INTO `talla` (`id_talla`, `tipo`, `valor`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
	(1, 'Internacional', 'XS', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(2, 'Internacional', 'S', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(3, 'Internacional', 'M', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(4, 'Internacional', 'L', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(5, 'Internacional', 'XL', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(6, 'Internacional', 'XXL', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(7, 'Numérica', '28', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(8, 'Numérica', '30', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(9, 'Numérica', '32', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(10, 'Numérica', '34', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(11, 'Numérica', '36', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(12, 'Calzado', '6', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(13, 'Calzado', '7', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(14, 'Calzado', '8', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(15, 'Calzado', '9', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(16, 'Calzado', '10', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(17, 'Calzado', '11', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(18, 'Calzado', '12', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25');

-- Volcando estructura para tabla hypecore_db.tipo_documento
CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_tipo_documento`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla hypecore_db.tipo_documento: ~3 rows (aproximadamente)
INSERT INTO `tipo_documento` (`id_tipo_documento`, `nombre`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
	(1, 'DNI', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(2, 'Pasaporte', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(3, 'RUC', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25');

-- Volcando estructura para tabla hypecore_db.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `id_cargo` int(11) NOT NULL,
  `id_tipo_documento` int(11) NOT NULL,
  `nro_documento` varchar(20) NOT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`),
  UNIQUE KEY `nro_documento` (`nro_documento`),
  KEY `id_cargo` (`id_cargo`),
  KEY `id_tipo_documento` (`id_tipo_documento`),
  KEY `idx_correo` (`correo`),
  KEY `idx_estado` (`estado`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`) ON UPDATE CASCADE,
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_documento` (`id_tipo_documento`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla hypecore_db.usuario: ~3 rows (aproximadamente)
INSERT INTO `usuario` (`id_usuario`, `nombres`, `apellidos`, `correo`, `clave`, `telefono`, `direccion`, `id_cargo`, `id_tipo_documento`, `nro_documento`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
	(1, 'Cristhian', 'Mamani Cori', 'admin@hypecore.com', '123456', '987654321', 'Av. Principal 123', 1, 1, '12345678', 1, '2025-10-22 15:32:25', '2025-10-22 20:10:25'),
	(2, 'María', 'García López', 'empleado@hypecore.com', '123456', '987654322', 'Av. Secundaria 456', 2, 1, '87654321', 1, '2025-10-22 15:32:25', '2025-10-22 15:32:25'),
	(3, 'Juan', 'Pérez Silva', 'cliente@gmail.com', '123456', '987654323', 'Calle Terciaria 789', 3, 1, '45678912', 1, '2025-10-22 15:32:25', '2025-10-22 20:47:48');

-- Volcando estructura para vista hypecore_db.vista_productos
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vista_productos` (
	`id_producto` INT(11) NOT NULL,
	`nombre` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`descripcion` TEXT NULL COLLATE 'utf8mb4_unicode_ci',
	`precio` DECIMAL(10,2) NOT NULL,
	`stock` INT(11) NOT NULL,
	`imagen_url` VARCHAR(1) NULL COLLATE 'utf8mb4_unicode_ci',
	`estado` TINYINT(1) NULL,
	`id_categoria` INT(11) NOT NULL,
	`categoria_nombre` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`id_marca` INT(11) NOT NULL,
	`marca_nombre` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`marca_logo` VARCHAR(1) NULL COLLATE 'utf8mb4_unicode_ci',
	`id_modelo` INT(11) NOT NULL,
	`modelo_nombre` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`id_talla` INT(11) NOT NULL,
	`talla_tipo` ENUM('Internacional','Numérica','Calzado') NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`talla_valor` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`id_color` INT(11) NOT NULL,
	`color_nombre` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`color_hex` VARCHAR(1) NULL COLLATE 'utf8mb4_unicode_ci'
);

-- Volcando estructura para vista hypecore_db.vista_usuarios
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `vista_usuarios` (
	`id_usuario` INT(11) NOT NULL,
	`nombres` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`apellidos` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`correo` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`telefono` VARCHAR(1) NULL COLLATE 'utf8mb4_unicode_ci',
	`direccion` TEXT NULL COLLATE 'utf8mb4_unicode_ci',
	`nro_documento` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`estado` TINYINT(1) NULL,
	`id_cargo` INT(11) NOT NULL,
	`cargo_nombre` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`id_tipo_documento` INT(11) NOT NULL,
	`tipo_documento_nombre` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_unicode_ci'
);

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vista_productos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_productos` AS SELECT 
    p.id_producto,
    p.nombre,
    p.descripcion,
    p.precio,
    p.stock,
    p.imagen_url,
    p.estado,
    c.id_categoria,
    c.nombre AS categoria_nombre,
    m.id_marca,
    m.nombre AS marca_nombre,
    m.logo_url AS marca_logo,
    mo.id_modelo,
    mo.nombre AS modelo_nombre,
    t.id_talla,
    t.tipo AS talla_tipo,
    t.valor AS talla_valor,
    co.id_color,
    co.nombre AS color_nombre,
    co.codigo_hex AS color_hex
FROM producto p
INNER JOIN categoria c ON p.id_categoria = c.id_categoria
INNER JOIN marca m ON p.id_marca = m.id_marca
INNER JOIN modelo mo ON p.id_modelo = mo.id_modelo
INNER JOIN talla t ON p.id_talla = t.id_talla
INNER JOIN color co ON p.id_color = co.id_color 
;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `vista_usuarios`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_usuarios` AS SELECT 
    u.id_usuario,
    u.nombres,
    u.apellidos,
    u.correo,
    u.telefono,
    u.direccion,
    u.nro_documento,
    u.estado,
    c.id_cargo,
    c.nombre AS cargo_nombre,
    td.id_tipo_documento,
    td.nombre AS tipo_documento_nombre
FROM usuario u
INNER JOIN cargo c ON u.id_cargo = c.id_cargo
INNER JOIN tipo_documento td ON u.id_tipo_documento = td.id_tipo_documento 
;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
