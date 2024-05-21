-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2024 a las 22:59:45
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `netgram`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message_company_company`
--

CREATE TABLE `message_company_company` (
  `id_company1` int(255) NOT NULL,
  `id_company2` int(255) NOT NULL,
  `shipping_date` date NOT NULL,
  `messages` varchar(6000) NOT NULL,
  `read_confirmation` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message_company_user`
--

CREATE TABLE `message_company_user` (
  `id_company1` int(255) NOT NULL,
  `id_user1` int(255) NOT NULL,
  `shipping_date` datetime(6) NOT NULL,
  `messages` varchar(6000) NOT NULL,
  `read_confirmation` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message_user_user`
--

CREATE TABLE `message_user_user` (
  `id_user1` int(255) NOT NULL,
  `id_user2` int(255) NOT NULL,
  `shipping_date` datetime(6) NOT NULL,
  `messages` varchar(6000) DEFAULT NULL,
  `read_confirmation` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user1` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(75) NOT NULL,
  `user_password` varchar(500) NOT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `bdate` date DEFAULT NULL,
  `profile_picture` blob DEFAULT NULL,
  `admin_type` tinyint(1) DEFAULT NULL,
  `user_score` int(100) DEFAULT NULL,
  `user_calification` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user1`, `name`, `lastname`, `username`, `email`, `user_password`, `phone_number`, `bdate`, `profile_picture`, `admin_type`, `user_score`, `user_calification`) VALUES
(1, 'alex', 'cil', 'alex97', 'alex@gmail.com', 'pass123', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'juanpie', 'piepie', '', 'jp@gmail.com', 'pass123', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_company`
--

CREATE TABLE `user_company` (
  `id_company1` int(11) NOT NULL,
  `name_company` varchar(100) NOT NULL,
  `email_company` varchar(200) NOT NULL,
  `password_company` varchar(500) NOT NULL,
  `phone_company` int(20) DEFAULT NULL,
  `admin_type` tinyint(1) DEFAULT NULL,
  `company_score` int(100) DEFAULT NULL,
  `company_calification` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `message_company_company`
--
ALTER TABLE `message_company_company`
  ADD PRIMARY KEY (`id_company1`,`id_company2`),
  ADD UNIQUE KEY `id_company1` (`id_company1`,`id_company2`),
  ADD KEY `id_company2` (`id_company2`);

--
-- Indices de la tabla `message_company_user`
--
ALTER TABLE `message_company_user`
  ADD PRIMARY KEY (`id_company1`,`id_user1`,`shipping_date`),
  ADD UNIQUE KEY `id_company1` (`id_company1`),
  ADD UNIQUE KEY `id_user1` (`id_user1`);

--
-- Indices de la tabla `message_user_user`
--
ALTER TABLE `message_user_user`
  ADD PRIMARY KEY (`id_user1`,`id_user2`,`shipping_date`),
  ADD UNIQUE KEY `id_user1` (`id_user1`),
  ADD UNIQUE KEY `id_user2` (`id_user2`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user1`),
  ADD UNIQUE KEY `id_user1` (`id_user1`);

--
-- Indices de la tabla `user_company`
--
ALTER TABLE `user_company`
  ADD PRIMARY KEY (`id_company1`),
  ADD UNIQUE KEY `id_company1` (`id_company1`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user1` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user_company`
--
ALTER TABLE `user_company`
  MODIFY `id_company1` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `message_company_company`
--
ALTER TABLE `message_company_company`
  ADD CONSTRAINT `message_company_company_ibfk_1` FOREIGN KEY (`id_company1`) REFERENCES `user_company` (`id_company1`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_company_company_ibfk_2` FOREIGN KEY (`id_company2`) REFERENCES `user_company` (`id_company1`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `message_company_user`
--
ALTER TABLE `message_company_user`
  ADD CONSTRAINT `message_company_user_ibfk_1` FOREIGN KEY (`id_user1`) REFERENCES `users` (`id_user1`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_company_user_ibfk_2` FOREIGN KEY (`id_company1`) REFERENCES `user_company` (`id_company1`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `message_user_user`
--
ALTER TABLE `message_user_user`
  ADD CONSTRAINT `message_user_user_ibfk_1` FOREIGN KEY (`id_user1`) REFERENCES `users` (`id_user1`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_user_user_ibfk_2` FOREIGN KEY (`id_user2`) REFERENCES `users` (`id_user1`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
