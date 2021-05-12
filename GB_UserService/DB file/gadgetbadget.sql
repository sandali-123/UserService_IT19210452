-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2021 at 07:55 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gadgetbadget`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `U_id` int(30) NOT NULL,
  `fname` varchar(250) NOT NULL,
  `lname` varchar(250) NOT NULL,
  `nic` varchar(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `type` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`U_id`, `fname`, `lname`, `nic`, `address`, `phone`, `email`, `username`, `password`, `type`) VALUES
(11, 'Sandali', 'Wijekoon', '990234780V', 'No26,Aluvihare rd,Matale', '0778996678', 'sanda1999@gmail.com', 'sandali', 'c2FuZGFsaTk5', 'Researcher'),
(134, 'Sam', 'Perera', '896578678V', 'No12,Pilimathalawa rd,Kandy', '0713454678', 'samp@gmail.com', 'admin', 'YWRtaW4xMjM=', 'Admin'),
(135, 'Ayesha', 'Fernando', '924565789V', 'No46,Palapathwala rd,Matale', '0773046756', 'ayeshfer@gmail.com', 'ayesha', 'YXllc2hhOTI=', 'Seller'),
(136, 'piumi', 'Rathnayaka', '945676891V', 'No02,Pilimathalawa rd,Kandy', '0774345678', 'piumirath@gmail.com', 'piumi', 'cGl1bWk5NA==', 'Buyer'),
(137, 'Gehan', 'Silva', '967876892V', 'No02,Katugastota rd,Kandy', '0754543567', 'gehansil@gmail.com', 'gehan', 'Z2VoYW45Ng==', 'Researcher');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`U_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `U_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
