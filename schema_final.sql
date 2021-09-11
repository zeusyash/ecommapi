-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2021 at 08:33 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- QUERY---
--SELECT salesperson.Name FROM orders, Salesperson WHERE orders.salesperson_id = salesperson.ID GROUP BY salesperson.ID HAVING SUM( orders.Amount ) >1400


--
-- Database: `schema_final`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Industry_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `Name`, `City`, `Industry_type`) VALUES
(4, 'Samsonic', 'pleasant', 'J'),
(6, 'Panasung', 'oaktown', 'J'),
(7, 'Samony', 'jackson', 'B'),
(9, 'Orange', 'jackson', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Number` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `cust_id` int(11) NOT NULL,
  `salesperson_id` int(11) NOT NULL,
  `Amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Number`, `order_date`, `cust_id`, `salesperson_id`, `Amount`) VALUES
(10, '1996-08-02', 4, 2, 540),
(20, '1999-01-30', 4, 8, 1800),
(30, '1995-07-14', 9, 1, 460),
(40, '1998-01-29', 7, 2, 2400),
(50, '1998-02-03', 6, 7, 600),
(60, '1998-03-02', 6, 7, 720),
(70, '1998-05-06', 9, 7, 150);

-- --------------------------------------------------------

--
-- Table structure for table `salesperson`
--

CREATE TABLE `salesperson` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Age` int(50) NOT NULL,
  `Salary` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salesperson`
--

INSERT INTO `salesperson` (`ID`, `Name`, `Age`, `Salary`) VALUES
(1, 'Abe', 61, 140000),
(2, 'Bob', 34, 44000),
(5, 'Chris', 34, 40000),
(7, 'Dan', 41, 52000),
(8, 'Ken', 57, 115000),
(11, 'Joe', 38, 38000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Number`),
  ADD KEY `cust_id` (`cust_id`),
  ADD KEY `salesperson_id` (`salesperson_id`);

--
-- Indexes for table `salesperson`
--
ALTER TABLE `salesperson`
  ADD PRIMARY KEY (`ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`ID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`salesperson_id`) REFERENCES `salesperson` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
