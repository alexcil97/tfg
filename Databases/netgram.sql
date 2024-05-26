-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2024 at 05:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `netgram`
--

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id_image` int(255) NOT NULL,
  `image path` varchar(5000) NOT NULL,
  `image_name` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_company_company`
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
-- Table structure for table `message_company_user`
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
-- Table structure for table `message_user_user`
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
-- Table structure for table `publication`
--

CREATE TABLE `publication` (
  `id_user` int(11) NOT NULL,
  `id_publication` int(255) NOT NULL,
  `id_image` int(255) NOT NULL,
  `publication_date` datetime NOT NULL DEFAULT current_timestamp(),
  `publication_message` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
  `profile_picture_id` int(11) DEFAULT NULL,
  `admin_type` tinyint(1) DEFAULT NULL,
  `user_score` int(100) DEFAULT NULL,
  `user_calification` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_company`
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
-- Indexes for dumped tables
--

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id_image`);

--
-- Indexes for table `message_company_company`
--
ALTER TABLE `message_company_company`
  ADD PRIMARY KEY (`id_company1`,`id_company2`,`shipping_date`),
  ADD UNIQUE KEY `id_company1` (`id_company1`,`id_company2`,`shipping_date`);

--
-- Indexes for table `message_company_user`
--
ALTER TABLE `message_company_user`
  ADD PRIMARY KEY (`id_company1`,`id_user1`,`shipping_date`),
  ADD UNIQUE KEY `id_company1` (`id_company1`,`id_user1`,`shipping_date`),
  ADD KEY `id_user1` (`id_user1`);

--
-- Indexes for table `message_user_user`
--
ALTER TABLE `message_user_user`
  ADD PRIMARY KEY (`id_user1`,`id_user2`,`shipping_date`),
  ADD UNIQUE KEY `id_user1` (`id_user1`,`id_user2`,`shipping_date`);

--
-- Indexes for table `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`id_user`,`id_publication`,`publication_date`),
  ADD UNIQUE KEY `id_user` (`id_user`,`id_image`),
  ADD KEY `id_image` (`id_image`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user1`),
  ADD UNIQUE KEY `id_user1` (`id_user1`),
  ADD UNIQUE KEY `profile_picture_id` (`profile_picture_id`);

--
-- Indexes for table `user_company`
--
ALTER TABLE `user_company`
  ADD PRIMARY KEY (`id_company1`),
  ADD UNIQUE KEY `id_company1` (`id_company1`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id_image` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user1` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_company`
--
ALTER TABLE `user_company`
  MODIFY `id_company1` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `message_company_company`
--
ALTER TABLE `message_company_company`
  ADD CONSTRAINT `message_company_company_ibfk_1` FOREIGN KEY (`id_company1`) REFERENCES `user_company` (`id_company1`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message_company_user`
--
ALTER TABLE `message_company_user`
  ADD CONSTRAINT `message_company_user_ibfk_2` FOREIGN KEY (`id_company1`) REFERENCES `user_company` (`id_company1`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_company_user_ibfk_3` FOREIGN KEY (`id_user1`) REFERENCES `users` (`id_user1`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message_user_user`
--
ALTER TABLE `message_user_user`
  ADD CONSTRAINT `message_user_user_ibfk_1` FOREIGN KEY (`id_user1`) REFERENCES `users` (`id_user1`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `publication`
--
ALTER TABLE `publication`
  ADD CONSTRAINT `publication_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user1`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `publication_ibfk_2` FOREIGN KEY (`id_image`) REFERENCES `images` (`id_image`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`profile_picture_id`) REFERENCES `images` (`id_image`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
