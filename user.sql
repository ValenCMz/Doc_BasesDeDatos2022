-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-11-2021 a las 21:36:32
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tpe_web2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(245) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_user`, `email`, `password`, `admin`) VALUES
(1, 'Valentin', '$2y$10$DVcibF0tEwx.4DlBWnsCk.4J.TPvK08U82esltUA8I6dA5s31dVJC', 0),
(6, 'prueba', '$2y$10$HWQ07juP/O6XHQRk0Cx18uCRX7jFSAmQBNcvxXMogKObSlppO.gHC', 0),
(7, 'prueba1', '$2y$10$nRKQSvtcZEOK/1100QnNYOCjQJSe2oYUAz3K16HN02xnQtNdPnd0G', 0),
(12, 'pepitoPistolero@jaja.com', '$2y$10$1ZrAF46RyRvYsSIi9s4k3.EFITOyvgXVsoqJ3dqT6DJBGTPmB5M6u', 0),
(13, 'valentincaminosmartinez@hotmail.com', '$2y$10$jsMHcXMBEX/d/gl2QXCsiuNGGKooAZgj9AF29ztTFZwlU/wklh6sS', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `emailUnique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
