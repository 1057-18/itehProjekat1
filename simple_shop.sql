-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2020 at 10:45 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simple_shop`
--
CREATE DATABASE IF NOT EXISTS `simple_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `simple_shop`;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `time_ordered` datetime NOT NULL,
  `address` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `time_ordered`, `address`, `status`) VALUES
(1, 1, '2020-01-03 13:13:46', 'test', 1),
(2, 1, '2020-01-04 13:15:02', 'Ulica 1', 1),
(3, 1, '2020-01-04 17:04:33', 'tetst', 1),
(4, 2, '2020-01-06 12:42:20', 'Takovska 11', 1),
(5, 1, '2020-01-06 12:47:03', 'Cara Nikolaja II', 1),
(6, 1, '2020-01-16 11:34:50', 'aaaa', 1),
(7, 1, '2020-01-16 18:29:26', 'vxcvvcxvxc', 0),
(8, 1, '2020-01-16 18:45:48', 'affdfxf', 0),
(9, 1, '2020-01-16 20:27:46', 'Trnska 19', 1),
(10, 1, '2020-01-16 21:03:21', 'Hadzi Prodanova 5', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_list`
--

DROP TABLE IF EXISTS `orders_list`;
CREATE TABLE IF NOT EXISTS `orders_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_list`
--

INSERT INTO `orders_list` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 1, 2, 2),
(2, 1, 3, 123),
(3, 2, 1, 1),
(4, 2, 2, 5),
(5, 2, 3, 10),
(6, 3, 2, 23),
(7, 4, 3, 2),
(8, 4, 1, 10),
(9, 5, 1, 12),
(10, 5, 2, 23),
(11, 5, 5, 2),
(12, 6, 1, 20),
(13, 7, 1, 334),
(14, 8, 1, 23),
(15, 9, 1, 2),
(16, 9, 2, 2),
(17, 9, 3, 2),
(18, 10, 10, 3),
(19, 11, 7, 23),
(20, 12, 1, 123),
(21, 13, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `price`) VALUES
(1, 'Patike', 15),
(2, 'Trenerka', 15),
(3, 'Jakna', 20),
(7, 'Pancerice', 350),
(8, 'Duks', 40),
(9, 'Helanke', 10);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `admin` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `admin`) VALUES
(1, 'ivan', '202cb962ac59075b964b07152d234b70', 1),
(2, 'jovan', '202cb962ac59075b964b07152d234b70', 0),
(3, 'cupka', '202cb962ac59075b964b07152d234b70', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
