-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2021 a las 18:02:46
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
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id_category`, `name`) VALUES
(5, 'Niños'),
(6, 'Unisex'),
(7, 'Masculino'),
(8, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comment`
--

CREATE TABLE `comment` (
  `id_comment` int(11) NOT NULL,
  `content` varchar(300) NOT NULL,
  `score` int(11) NOT NULL,
  `id_author` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comment`
--

INSERT INTO `comment` (`id_comment`, `content`, `score`, `id_author`, `id_product`) VALUES
(1, 'Muy bonito el producto che', 5, 1, 0),
(2, 'Y ahora que hago', 1, 1, 0),
(7, 'comentado', 2, 1, 23),
(8, '213213', 2, 1, 24),
(13, 'asda', 3, 1, 26),
(14, 'HOLA', 2, 1, 26),
(15, 'subundrule', 2, 35, 26),
(21, '213', 2, 34, 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `color` varchar(45) NOT NULL,
  `size` varchar(5) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` float NOT NULL,
  `id_category` int(11) NOT NULL,
  `img` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id_product`, `color`, `size`, `stock`, `price`, `id_category`, `img`) VALUES
(26, 'rojo', 'S', 22, 2, 5, 'img/product/619eecdec1b43.jpg'),
(27, 'azul', 'M', 2, 2, 6, 'img/product/619eecf1071c9.jpg'),
(28, 'amarillo', 'M', 9, 8, 7, 'img/product/619eed189a2a2.jpg'),
(29, 'verde', 'XL', 7, 8, 8, 'img/product/619eed2b8cc04.jpg');

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
(1, 'subudrule', '$2y$10$DVcibF0tEwx.4DlBWnsCk.4J.TPvK08U82esltUA8I6dA5s31dVJC', 1),
(34, 'admin@123.com', '$2y$10$t4EJK0ury1YT67qQ3aW52u0AA4Ajrw7JY76E4POWXgPFXpnUHvJem', 1),
(35, 'noadmin@123.com', '$2y$10$t/e.5.bCrvCwoQMFjB5/TuRqKMKFLOYfC1tRpWJhQ6Hiy7z/gZ8Oa', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indices de la tabla `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `fk_comment_user` (`id_author`),
  ADD KEY `fk_comment_product` (`id_product`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `fk_product_category` (`id_category`);

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
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`id_author`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
