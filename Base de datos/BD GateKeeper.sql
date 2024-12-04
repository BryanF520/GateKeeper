-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 04-12-2024 a las 07:04:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `new_gate`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE `acceso` (
  `numAcceso` int(11) NOT NULL,
  `id_recep` varchar(10) NOT NULL,
  `visitante_id` varchar(10) NOT NULL,
  `motivo_visita` varchar(50) NOT NULL,
  `estadoAutorizacion` tinyint(10) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `acceso`
--

INSERT INTO `acceso` (`numAcceso`, `id_recep`, `visitante_id`, `motivo_visita`, `estadoAutorizacion`, `fecha`) VALUES
(1, '1000000009', '1000000001', 'Entrevista', 0, '2021-12-22 10:44:40'),
(2, '1000000012', '1000000002', 'Entrevista', 1, '2021-09-21 16:32:16'),
(3, '1000000010', '1000000003', 'Asesoria', 1, '2024-12-01 09:40:52'),
(4, '1000000011', '1000000005', 'Cotizar mantenimiento', 1, '2022-06-21 08:37:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `empleado_tdoc` varchar(2) NOT NULL,
  `empleado_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`empleado_tdoc`, `empleado_id`) VALUES
('CC', '1000000004'),
('CC', '1000000007'),
('CE', '1000000006'),
('CE', '1000000008');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `nit` int(11) NOT NULL,
  `area` varchar(15) NOT NULL,
  `contacto` varchar(10) NOT NULL,
  `ubicacion` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`nit`, `area`, `contacto`, `ubicacion`) VALUES
(256432178, 'Informatica ', '318425678', 'Piso 3'),
(306457203, 'Recepción', '601264793', 'Piso 1'),
(352146785, 'Recursos Humano', '315885621', 'Piso 2'),
(510742985, 'Seguridad', '323646654', 'Piso 5'),
(586314289, 'Administración ', '324568792', 'Piso 4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `tipo_doc` varchar(2) NOT NULL,
  `id_documento` varchar(10) NOT NULL,
  `nombre1` varchar(25) NOT NULL,
  `nombre2` varchar(25) NOT NULL,
  `apellido1` varchar(25) NOT NULL,
  `apellido2` varchar(25) NOT NULL,
  `edad` int(2) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `correo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`tipo_doc`, `id_documento`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `edad`, `fecha_nacimiento`, `correo`) VALUES
('CC', '1000000001', 'Carlos', 'Andrés', 'Pérez', 'López', 25, '1999-07-15', 'carlos.perez@example.com'),
('CC', '1000000002', 'María', 'Fernanda', 'Gómez', 'Torres', 30, '1994-03-22', 'maria.gomez@example.com'),
('CC', '1000000004', 'Ana', 'Isabel', 'Hernández', 'Ruiz', 35, '1989-12-05', 'ana.hernandez@example.com'),
('CC', '1000000007', 'Diana', 'Carolina', 'Sánchez', 'Castro', 27, '1997-01-30', 'diana.sanchez@example.com'),
('CC', '1000000009', 'Paula', 'Andrea', 'Vargas', 'Jiménez', 29, '1995-09-17', 'paula.vargas@example.com'),
('CC', '1000000012', 'Juan', 'Sebastián', 'Ospina', 'Salazar', 26, '1998-10-30', 'juan.ospina@example.com'),
('CE', '1000000003', 'Luis', 'Miguel', 'Rodríguez', 'Martínez', 28, '1996-05-10', 'luis.rodriguez@example.com'),
('CE', '1000000005', 'Jorge', 'Alberto', 'López', 'Díaz', 40, '1984-08-21', 'jorge.lopez@example.com'),
('CE', '1000000006', 'Laura', 'Marcela', 'Ramírez', 'García', 22, '2002-11-02', 'laura.ramirez@example.com'),
('CE', '1000000008', 'Andrés', 'Felipe', 'Moreno', 'Velásquez', 32, '1992-04-15', 'andres.moreno@example.com'),
('CE', '1000000010', 'Santiago', 'David', 'Ortiz', 'Pineda', 24, '2000-06-25', 'santiago.ortiz@example.com'),
('CE', '1000000011', 'Catalina', 'María', 'Mejía', 'Rincón', 23, '2001-02-14', 'catalina.mejia@example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recepcionista`
--

CREATE TABLE `recepcionista` (
  `recep_tdoc` varchar(2) NOT NULL,
  `recep_id` varchar(10) NOT NULL,
  `password` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recepcionista`
--

INSERT INTO `recepcionista` (`recep_tdoc`, `recep_id`, `password`) VALUES
('CC', '1000000009', '2548'),
('CC', '1000000012', '8475'),
('CE', '1000000010', '9632'),
('CE', '1000000011', '2314');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta_acceso`
--

CREATE TABLE `tarjeta_acceso` (
  `visitante_tdoc` varchar(2) NOT NULL,
  `visitante_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarjeta_acceso`
--

INSERT INTO `tarjeta_acceso` (`visitante_tdoc`, `visitante_id`) VALUES
('CC', '1000000001'),
('CC', '1000000002'),
('CE', '1000000003'),
('CE', '1000000005');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `id_telefono` int(11) NOT NULL,
  `id_persona` varchar(10) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `tipo` enum('Celular','Fijo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefono`
--

INSERT INTO `telefono` (`id_telefono`, `id_persona`, `numero`, `tipo`) VALUES
(1, '1000000001', '3201234567', 'Celular'),
(2, '1000000002', '3109876543', 'Celular'),
(3, '1000000004', '3112345678', 'Fijo'),
(4, '1000000007', '3128765432', 'Celular'),
(5, '1000000009', '3134567890', 'Celular'),
(6, '1000000012', '3145678901', 'Celular'),
(7, '1000000003', '3156789012', 'Fijo'),
(8, '1000000005', '3167890123', 'Celular'),
(9, '1000000006', '3178901234', 'Fijo'),
(10, '1000000008', '3189012345', 'Celular'),
(11, '1000000010', '3190123456', 'Celular'),
(12, '1000000011', '3549255687', 'Fijo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitante`
--

CREATE TABLE `visitante` (
  `visitante_tdoc` varchar(2) NOT NULL,
  `visitante_id` varchar(10) NOT NULL,
  `oficina` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `visitante`
--

INSERT INTO `visitante` (`visitante_tdoc`, `visitante_id`, `oficina`) VALUES
('CC', '1000000001', 'contabilidad'),
('CC', '1000000002', 'contabilidad'),
('CE', '1000000003', 'recursos humanos'),
('CE', '1000000005', 'informática');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`numAcceso`),
  ADD KEY `id_recep` (`id_recep`),
  ADD KEY `visitante_id` (`visitante_id`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`empleado_tdoc`,`empleado_id`),
  ADD KEY `empleado_tdoc` (`empleado_tdoc`),
  ADD KEY `empleado_id` (`empleado_id`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`nit`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`tipo_doc`,`id_documento`),
  ADD KEY `id_documento` (`id_documento`);

--
-- Indices de la tabla `recepcionista`
--
ALTER TABLE `recepcionista`
  ADD PRIMARY KEY (`recep_tdoc`,`recep_id`),
  ADD KEY `recep_tdoc` (`recep_tdoc`),
  ADD KEY `recep_id` (`recep_id`);

--
-- Indices de la tabla `tarjeta_acceso`
--
ALTER TABLE `tarjeta_acceso`
  ADD PRIMARY KEY (`visitante_tdoc`,`visitante_id`),
  ADD KEY `visitante_tdoc` (`visitante_tdoc`),
  ADD KEY `visitante_id` (`visitante_id`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`id_telefono`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `visitante`
--
ALTER TABLE `visitante`
  ADD PRIMARY KEY (`visitante_tdoc`,`visitante_id`),
  ADD KEY `visitante_tdoc` (`visitante_tdoc`),
  ADD KEY `visitante_id` (`visitante_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD CONSTRAINT `acceso_ibfk_1` FOREIGN KEY (`id_recep`) REFERENCES `recepcionista` (`recep_id`),
  ADD CONSTRAINT `acceso_ibfk_2` FOREIGN KEY (`visitante_id`) REFERENCES `visitante` (`visitante_id`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`empleado_tdoc`) REFERENCES `persona` (`tipo_doc`),
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `persona` (`id_documento`);

--
-- Filtros para la tabla `recepcionista`
--
ALTER TABLE `recepcionista`
  ADD CONSTRAINT `recepcionista_ibfk_1` FOREIGN KEY (`recep_tdoc`) REFERENCES `persona` (`tipo_doc`),
  ADD CONSTRAINT `recepcionista_ibfk_2` FOREIGN KEY (`recep_id`) REFERENCES `persona` (`id_documento`);

--
-- Filtros para la tabla `tarjeta_acceso`
--
ALTER TABLE `tarjeta_acceso`
  ADD CONSTRAINT `tarjeta_acceso_ibfk_1` FOREIGN KEY (`visitante_tdoc`) REFERENCES `visitante` (`visitante_tdoc`),
  ADD CONSTRAINT `tarjeta_acceso_ibfk_2` FOREIGN KEY (`visitante_id`) REFERENCES `visitante` (`visitante_id`);

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_documento`);

--
-- Filtros para la tabla `visitante`
--
ALTER TABLE `visitante`
  ADD CONSTRAINT `visitante_ibfk_1` FOREIGN KEY (`visitante_tdoc`) REFERENCES `persona` (`tipo_doc`),
  ADD CONSTRAINT `visitante_ibfk_2` FOREIGN KEY (`visitante_id`) REFERENCES `persona` (`id_documento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
