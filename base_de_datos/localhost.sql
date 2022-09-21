-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 13-09-2022 a las 12:50:03
-- Versión del servidor: 5.7.11
-- Versión de PHP: 5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca_g48`
--
DROP DATABASE `biblioteca_g48`;
CREATE DATABASE IF NOT EXISTS `biblioteca_g48` DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci;
USE `biblioteca_g48`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `codigo_aut` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombre_aut` varchar(80) COLLATE latin1_spanish_ci NOT NULL,
  `email_aut` varchar(80) COLLATE latin1_spanish_ci NOT NULL,
  `genero_aut` varchar(1) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `autor`
--


INSERT INTO `autor` (`codigo_aut`, `nombre_aut`, `email_aut`, `genero_aut`) VALUES
('1', 'Oscar', 'oscar@gmail.com', 'M'),
('2', 'Javier', 'javier@gmail.com', 'M');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor_nacionalidad`
--

CREATE TABLE `autor_nacionalidad` (
  `codigo_aut` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `codigo_nac` varchar(15) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `codigo_car` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombre_car` varchar(50) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`codigo_car`, `nombre_car`) VALUES
('1', 'SISTEMAS'),
('2', 'MECANICA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `codigo_edi` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombre_edi` varchar(50) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`codigo_edi`, `nombre_edi`) VALUES
('1', 'Norma'),
('2', 'LibrosLibres'),
('3', 'Santillana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `codigo_lib` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombre_lib` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `codigo_edi` varchar(15) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`codigo_lib`, `nombre_lib`, `codigo_edi`) VALUES
('1', 'ALGEBRA BALDOR', '1'),
('10', 'ANATOMIA BASICA', '3'),
('2', 'CALCULO', '1'),
('3', 'WINDOWS BASICO', '1'),
('4', 'METODOLOGIA DE LA PROGRAMACION', '1'),
('5', 'LENGUA CASTELLANO', '2'),
('6', 'NACHO LEE', '2'),
('7', 'ZBIOLOGIA INTEGRAL', '2'),
('8', 'BIOLOGIA ANIMAL', '3'),
('9', 'ANATOMIA HUMANA', '3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro_autor`
--

CREATE TABLE `libro_autor` (
  `codigo_lib` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `codigo_aut` varchar(15) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `libro_autor`
--

INSERT INTO `libro_autor` (`codigo_lib`, `codigo_aut`) VALUES
('1', '1'),
('2', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro_prestamo`
--

CREATE TABLE `libro_prestamo` (
  `codigo_lib` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `numero_pre` varchar(15) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `codigo_lib` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `titulo_lib` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `autor_lib` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `editorial_lib` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `categoria_lib` int(11) NOT NULL DEFAULT '1',
  `paginas_lib` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`codigo_lib`, `titulo_lib`, `autor_lib`, `editorial_lib`, `categoria_lib`, `paginas_lib`) VALUES
('1', 'Java Swing', 'Oscar', 'Norma', 2, 10),
('2', 'Mysql 2', 'Javier', 'LibrosLibres', 1, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nacionalidad`
--

CREATE TABLE `nacionalidad` (
  `codigo_nac` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombre_nac` varchar(50) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `numero_pre` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `fecha_pre` date NOT NULL,
  `fecent_pre` date NOT NULL,
  `fecentreal_pre` date NOT NULL,
  `valor_multa` double DEFAULT NULL,
  `codigo_usu` varchar(15) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`numero_pre`, `fecha_pre`, `fecent_pre`, `fecentreal_pre`, `valor_multa`, `codigo_usu`) VALUES
('1', '2022-08-01', '2022-08-01', '2022-08-01', 1000, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tema`
--

CREATE TABLE `tema` (
  `codigo_tem` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombre_tem` varchar(50) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `tema`
--

INSERT INTO `tema` (`codigo_tem`, `nombre_tem`) VALUES
('1', 'Programación'),
('2', 'Ficción'),
('3', 'Ciencias'),
('4', 'Matemáticas'),
('6', 'Sociales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tema_libro`
--

CREATE TABLE `tema_libro` (
  `codigo_tem` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `codigo_lib` varchar(15) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `codigo_usu` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `nombre_usu` varchar(80) COLLATE latin1_spanish_ci NOT NULL,
  `direccion_usu` varchar(80) COLLATE latin1_spanish_ci NOT NULL,
  `telefono_usu` varchar(15) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`codigo_usu`, `nombre_usu`, `direccion_usu`, `telefono_usu`) VALUES
('1', 'Usuario1', 'Direccion1', 'Telefono1'),
('2', 'Usuario2', 'Direccion2', 'Telefono2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_carrera`
--

CREATE TABLE `usuario_carrera` (
  `codigo_usu` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `codigo_car` varchar(15) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `usuario_carrera`
--

INSERT INTO `usuario_carrera` (`codigo_usu`, `codigo_car`) VALUES
('1', '1'),
('2', '1'),
('2', '2');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`codigo_aut`);

--
-- Indices de la tabla `autor_nacionalidad`
--
ALTER TABLE `autor_nacionalidad`
  ADD PRIMARY KEY (`codigo_aut`,`codigo_nac`),
  ADD KEY `autor_nacionalidad_codigo_nac_fk` (`codigo_nac`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`codigo_car`);

--
-- Indices de la tabla `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`codigo_edi`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`codigo_lib`),
  ADD KEY `libro_codigo_edi_fk` (`codigo_edi`);

--
-- Indices de la tabla `libro_autor`
--
ALTER TABLE `libro_autor`
  ADD PRIMARY KEY (`codigo_lib`,`codigo_aut`),
  ADD KEY `libro_autor_codigo_aut_fk` (`codigo_aut`);

--
-- Indices de la tabla `libro_prestamo`
--
ALTER TABLE `libro_prestamo`
  ADD PRIMARY KEY (`codigo_lib`,`numero_pre`),
  ADD KEY `libro_prestamo_numero_pre_fk` (`numero_pre`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`codigo_lib`);

--
-- Indices de la tabla `nacionalidad`
--
ALTER TABLE `nacionalidad`
  ADD PRIMARY KEY (`codigo_nac`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`numero_pre`),
  ADD KEY `prestamo_codigo_usu_fk` (`codigo_usu`);

--
-- Indices de la tabla `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`codigo_tem`);

--
-- Indices de la tabla `tema_libro`
--
ALTER TABLE `tema_libro`
  ADD PRIMARY KEY (`codigo_tem`,`codigo_lib`),
  ADD KEY `tema_libro_codigo_lib_fk` (`codigo_lib`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`codigo_usu`);

--
-- Indices de la tabla `usuario_carrera`
--
ALTER TABLE `usuario_carrera`
  ADD PRIMARY KEY (`codigo_usu`,`codigo_car`),
  ADD KEY `usuario_carrera_codigo_car_fk` (`codigo_car`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autor_nacionalidad`
--
ALTER TABLE `autor_nacionalidad`
  ADD CONSTRAINT `autor_nacionalidad_codigo_aut_fk` FOREIGN KEY (`codigo_aut`) REFERENCES `autor` (`codigo_aut`),
  ADD CONSTRAINT `autor_nacionalidad_codigo_nac_fk` FOREIGN KEY (`codigo_nac`) REFERENCES `nacionalidad` (`codigo_nac`);

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `libro_codigo_edi_fk` FOREIGN KEY (`codigo_edi`) REFERENCES `editorial` (`codigo_edi`);

--
-- Filtros para la tabla `libro_autor`
--
ALTER TABLE `libro_autor`
  ADD CONSTRAINT `libro_autor_codigo_aut_fk` FOREIGN KEY (`codigo_aut`) REFERENCES `autor` (`codigo_aut`),
  ADD CONSTRAINT `libro_autor_codigo_lib_fk` FOREIGN KEY (`codigo_lib`) REFERENCES `libro` (`codigo_lib`);

--
-- Filtros para la tabla `libro_prestamo`
--
ALTER TABLE `libro_prestamo`
  ADD CONSTRAINT `libro_prestamo_codigo_lib_fk` FOREIGN KEY (`codigo_lib`) REFERENCES `libro` (`codigo_lib`),
  ADD CONSTRAINT `libro_prestamo_numero_pre_fk` FOREIGN KEY (`numero_pre`) REFERENCES `prestamo` (`numero_pre`);

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_codigo_usu_fk` FOREIGN KEY (`codigo_usu`) REFERENCES `usuario` (`codigo_usu`);

--
-- Filtros para la tabla `tema_libro`
--
ALTER TABLE `tema_libro`
  ADD CONSTRAINT `tema_libro_codigo_lib_fk` FOREIGN KEY (`codigo_lib`) REFERENCES `libro` (`codigo_lib`),
  ADD CONSTRAINT `tema_libro_codigo_tem_fk` FOREIGN KEY (`codigo_tem`) REFERENCES `tema` (`codigo_tem`);

--
-- Filtros para la tabla `usuario_carrera`
--
ALTER TABLE `usuario_carrera`
  ADD CONSTRAINT `usuario_carrera_codigo_car_fk` FOREIGN KEY (`codigo_car`) REFERENCES `carrera` (`codigo_car`),
  ADD CONSTRAINT `usuario_carrera_codigo_usu_fk` FOREIGN KEY (`codigo_usu`) REFERENCES `usuario` (`codigo_usu`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
