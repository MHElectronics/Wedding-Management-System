-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2021 at 06:45 PM
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
-- Database: `weeding`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `food_id` int(255) DEFAULT NULL,
  `photoblust_id` int(255) DEFAULT NULL,
  `user_id` int(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `hall_id` int(255) DEFAULT NULL,
  `book_id` int(255) DEFAULT NULL,
  `decor_id` int(255) DEFAULT NULL,
  `book_date` date DEFAULT NULL,
  `book_type` int(255) DEFAULT NULL,
  `book_quantity` int(255) DEFAULT NULL,
  `book_time` time(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `decor`
--

CREATE TABLE `decor` (
  `decor_id` int(11) NOT NULL,
  `decor_comp_name` varchar(255) NOT NULL,
  `decor_comp_location` varchar(255) NOT NULL,
  `decor_comp_cost` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `food_id` int(11) NOT NULL,
  `food_shop_name` varchar(255) NOT NULL,
  `food_shop_des` varchar(255) NOT NULL,
  `food_item` varchar(255) NOT NULL,
  `food_quantity` int(11) NOT NULL,
  `food_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hall`
--

CREATE TABLE `hall` (
  `hall_id` int(11) NOT NULL,
  `hall_name` varchar(255) NOT NULL,
  `hall_capacity` int(11) NOT NULL,
  `hall_location` varchar(255) NOT NULL,
  `hall_parking` int(11) NOT NULL,
  `hall_des` varchar(255) NOT NULL,
  `hall_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `photoblust`
--

CREATE TABLE `photoblust` (
  `photoblust_id` int(11) NOT NULL,
  `photography_comp_name` varchar(255) NOT NULL,
  `photography_comp_cost` double NOT NULL,
  `photography_comp_location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `registrationform`
--

CREATE TABLE `registrationform` (
  `fname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `gender` int(255) NOT NULL,
  `phone` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registrationform`
--

INSERT INTO `registrationform` (`fname`, `address`, `gender`, `phone`, `email`, `username`, `password`) VALUES
('Hasan', 'abd', 1, 123, 'a@gmail.com', 'abc', '123');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `hall_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `photoblust_id` int(11) NOT NULL,
  `decor_id` int(11) NOT NULL,
  `user_location` varchar(255) NOT NULL,
  `user_ph_no` char(14) NOT NULL,
  `username` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD UNIQUE KEY `booking_idx` (`food_id`),
  ADD KEY `decor_booking_fk` (`decor_id`),
  ADD KEY `photoblust_booking_fk` (`photoblust_id`),
  ADD KEY `hall_booking_fk` (`hall_id`),
  ADD KEY `user_booking_fk` (`user_id`,`user_email`);

--
-- Indexes for table `decor`
--
ALTER TABLE `decor`
  ADD PRIMARY KEY (`decor_id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`food_id`);

--
-- Indexes for table `hall`
--
ALTER TABLE `hall`
  ADD PRIMARY KEY (`hall_id`),
  ADD UNIQUE KEY `hall_idx` (`hall_id`);

--
-- Indexes for table `photoblust`
--
ALTER TABLE `photoblust`
  ADD PRIMARY KEY (`photoblust_id`);

--
-- Indexes for table `registrationform`
--
ALTER TABLE `registrationform`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`,`user_email`,`hall_id`,`food_id`,`photoblust_id`,`decor_id`),
  ADD KEY `decor_user_fk` (`decor_id`),
  ADD KEY `photoblust_user_fk` (`photoblust_id`),
  ADD KEY `food_user_fk` (`food_id`),
  ADD KEY `hall_user_fk` (`hall_id`),
  ADD KEY `registrationform_user_fk` (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `decor_booking_fk` FOREIGN KEY (`decor_id`) REFERENCES `decor` (`decor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `food_booking_fk` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hall_booking_fk` FOREIGN KEY (`hall_id`) REFERENCES `hall` (`hall_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `photoblust_booking_fk` FOREIGN KEY (`photoblust_id`) REFERENCES `photoblust` (`photoblust_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_booking_fk` FOREIGN KEY (`user_id`,`user_email`) REFERENCES `user` (`user_id`, `user_email`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `decor_user_fk` FOREIGN KEY (`decor_id`) REFERENCES `decor` (`decor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `food_user_fk` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `hall_user_fk` FOREIGN KEY (`hall_id`) REFERENCES `hall` (`hall_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `photoblust_user_fk` FOREIGN KEY (`photoblust_id`) REFERENCES `photoblust` (`photoblust_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `registrationform_user_fk` FOREIGN KEY (`username`) REFERENCES `registrationform` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
