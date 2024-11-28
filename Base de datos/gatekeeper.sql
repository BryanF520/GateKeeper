-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2024 a las 05:28:36
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
-- Base de datos: `gatekeeper`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE `acceso` (
  `numAcceso` int(10) NOT NULL,
  `datosAutorizante` varchar(45) NOT NULL,
  `estadoAutorizacion` tinyint(10) NOT NULL,
  `persona_fkpk_tdoc` varchar(10) NOT NULL,
  `pers_id_document` int(10) NOT NULL,
  `recepcionista_persona_fkpk_tdoc` varchar(10) NOT NULL,
  `recepcionista_persona_id_documento` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `persona_fkpk_tdoc` varchar(10) NOT NULL,
  `persona_id_documento` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `nit` int(11) NOT NULL,
  `area` varchar(15) NOT NULL,
  `contacto` int(10) NOT NULL,
  `ubicacion` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_acceso`
--

CREATE TABLE `nivel_acceso` (
  `id_acceso` int(10) NOT NULL,
  `motivoVisita` varchar(50) CHARACTER SET armscii8 COLLATE armscii8_general_ci NOT NULL,
  `fecha` date NOT NULL,
  `acceso_numAcceso` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `fkpk_tdoc` varchar(10) NOT NULL,
  `id_documento` int(10) NOT NULL,
  `nombre1` varchar(25) NOT NULL,
  `nombre2` varchar(25) NOT NULL,
  `apellido1` varchar(25) NOT NULL,
  `apellido2` varchar(25) NOT NULL,
  `edad` int(2) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `correo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_tipo_telefono`
--

CREATE TABLE `persona_tipo_telefono` (
  `persona_fkpk_tdoc` varchar(10) NOT NULL,
  `persona_id_documento` int(10) NOT NULL,
  `tipo_telefono_id_tipo_telefono` int(10) NOT NULL,
  `n_telefono` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recepcionista`
--

CREATE TABLE `recepcionista` (
  `password` varchar(15) NOT NULL,
  `persona_fkpk_tdoc` varchar(10) NOT NULL,
  `persona_id_documento` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetaacceso`
--

CREATE TABLE `tarjetaacceso` (
  `idTarjeta` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `empleado_persona_fkpk_tdoc` varchar(10) NOT NULL,
  `empleado_persona_id_documento` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `tipo_doc` varchar(10) NOT NULL,
  `desc_tdoc` varchar(40) NOT NULL,
  `estado_tdoc` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_telefono`
--

CREATE TABLE `tipo_telefono` (
  `id_tipo_telefono` int(10) NOT NULL,
  `desc_tipotel` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitante`
--

CREATE TABLE `visitante` (
  `oficina` varchar(25) NOT NULL,
  `persona_fkpk_tdoc` varchar(10) NOT NULL,
  `persona_id_documento` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`numAcceso`,`pers_id_document`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`persona_fkpk_tdoc`,`persona_id_documento`),
  ADD KEY `emp_tjacc` (`persona_id_documento`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`nit`);

--
-- Indices de la tabla `nivel_acceso`
--
ALTER TABLE `nivel_acceso`
  ADD PRIMARY KEY (`id_acceso`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`fkpk_tdoc`),
  ADD KEY `pers_id_documento` (`id_documento`);

--
-- Indices de la tabla `persona_tipo_telefono`
--
ALTER TABLE `persona_tipo_telefono`
  ADD PRIMARY KEY (`persona_fkpk_tdoc`,`persona_id_documento`,`tipo_telefono_id_tipo_telefono`),
  ADD KEY `telef_id_tipo_telef` (`tipo_telefono_id_tipo_telefono`),
  ADD KEY `persona_id_documento` (`persona_id_documento`);

--
-- Indices de la tabla `recepcionista`
--
ALTER TABLE `recepcionista`
  ADD PRIMARY KEY (`persona_fkpk_tdoc`,`persona_id_documento`);

--
-- Indices de la tabla `tarjetaacceso`
--
ALTER TABLE `tarjetaacceso`
  ADD PRIMARY KEY (`idTarjeta`,`empleado_persona_fkpk_tdoc`,`empleado_persona_id_documento`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`tipo_doc`);

--
-- Indices de la tabla `tipo_telefono`
--
ALTER TABLE `tipo_telefono`
  ADD PRIMARY KEY (`id_tipo_telefono`);

--
-- Indices de la tabla `visitante`
--
ALTER TABLE `visitante`
  ADD PRIMARY KEY (`persona_fkpk_tdoc`,`persona_id_documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `nivel_acceso`
--
ALTER TABLE `nivel_acceso`
  MODIFY `id_acceso` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tarjetaacceso`
--
ALTER TABLE `tarjetaacceso`
  MODIFY `idTarjeta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD CONSTRAINT `acce_niv` FOREIGN KEY (`numAcceso`) REFERENCES `nivel_acceso` (`id_acceso`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `emp_tjacc` FOREIGN KEY (`persona_id_documento`) REFERENCES `tarjetaacceso` (`idTarjeta`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fkpk_tdoc` FOREIGN KEY (`fkpk_tdoc`) REFERENCES `recepcionista` (`persona_fkpk_tdoc`),
  ADD CONSTRAINT `per_emp` FOREIGN KEY (`fkpk_tdoc`) REFERENCES `empleado` (`persona_fkpk_tdoc`),
  ADD CONSTRAINT `per_vis` FOREIGN KEY (`fkpk_tdoc`) REFERENCES `visitante` (`persona_fkpk_tdoc`),
  ADD CONSTRAINT `pers_id_documento` FOREIGN KEY (`id_documento`) REFERENCES `acceso` (`numAcceso`);

--
-- Filtros para la tabla `persona_tipo_telefono`
--
ALTER TABLE `persona_tipo_telefono`
  ADD CONSTRAINT `persona_tipo_telefono_ibfk_1` FOREIGN KEY (`persona_id_documento`) REFERENCES `persona` (`id_documento`);

--
-- Filtros para la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD CONSTRAINT `tip_doc` FOREIGN KEY (`tipo_doc`) REFERENCES `persona` (`fkpk_tdoc`);

--
-- Filtros para la tabla `tipo_telefono`
--
ALTER TABLE `tipo_telefono`
  ADD CONSTRAINT `tip_telf_id` FOREIGN KEY (`id_tipo_telefono`) REFERENCES `persona_tipo_telefono` (`tipo_telefono_id_tipo_telefono`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
