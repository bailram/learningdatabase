-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2021 at 08:22 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(4) NOT NULL,
  `id_card_number` varchar(16) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `place_of_birth` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `price_room`
--

CREATE TABLE `price_room` (
  `id` int(4) NOT NULL,
  `room_type_id` int(4) NOT NULL,
  `price` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `updated_by` varchar(15) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `room_category`
--

CREATE TABLE `room_category` (
  `id` int(4) NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_by` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `id` int(4) NOT NULL,
  `room_category_id` int(4) NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_by` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stock_room`
--

CREATE TABLE `stock_room` (
  `id` int(4) NOT NULL,
  `room_type_id` int(4) NOT NULL,
  `stock_total` int(4) DEFAULT NULL,
  `stock_available` int(4) DEFAULT NULL,
  `stock_ordered` int(4) DEFAULT NULL,
  `created_by` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(15) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

CREATE TABLE `transaction_history` (
  `id` int(4) NOT NULL,
  `number` varchar(15) DEFAULT NULL,
  `customer_id` int(4) DEFAULT NULL,
  `created_by` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history_detail`
--

CREATE TABLE `transaction_history_detail` (
  `id` int(4) NOT NULL,
  `transaction_history_id` int(4) DEFAULT NULL,
  `room_type_id` int(4) DEFAULT NULL,
  `room_ordered` int(4) DEFAULT NULL,
  `quantity` int(4) DEFAULT NULL,
  `price` int(4) DEFAULT NULL,
  `created_by` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(15) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `price_room`
--
ALTER TABLE `price_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `price_room_fk` (`room_type_id`);

--
-- Indexes for table `room_category`
--
ALTER TABLE `room_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_type_fk` (`room_category_id`);

--
-- Indexes for table `stock_room`
--
ALTER TABLE `stock_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_room_fk` (`room_type_id`);

--
-- Indexes for table `transaction_history`
--
ALTER TABLE `transaction_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_history_fk` (`customer_id`);

--
-- Indexes for table `transaction_history_detail`
--
ALTER TABLE `transaction_history_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_history_detail_fk` (`transaction_history_id`),
  ADD KEY `transaction_history_detail_fk_1` (`room_type_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `price_room`
--
ALTER TABLE `price_room`
  ADD CONSTRAINT `price_room_fk` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`id`);

--
-- Constraints for table `room_type`
--
ALTER TABLE `room_type`
  ADD CONSTRAINT `room_type_fk` FOREIGN KEY (`room_category_id`) REFERENCES `room_category` (`id`);

--
-- Constraints for table `stock_room`
--
ALTER TABLE `stock_room`
  ADD CONSTRAINT `stock_room_fk` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`id`);

--
-- Constraints for table `transaction_history`
--
ALTER TABLE `transaction_history`
  ADD CONSTRAINT `transaction_history_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `transaction_history_detail`
--
ALTER TABLE `transaction_history_detail`
  ADD CONSTRAINT `transaction_history_detail_fk` FOREIGN KEY (`transaction_history_id`) REFERENCES `transaction_history` (`id`),
  ADD CONSTRAINT `transaction_history_detail_fk_1` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
