-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 02, 2020 at 01:29 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbfood`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbadmin`
--

CREATE TABLE `tbadmin` (
  `fld_id` int(10) NOT NULL,
  `fld_username` varchar(30) NOT NULL,
  `fld_password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbadmin`
--

INSERT INTO `tbadmin` (`fld_id`, `fld_username`, `fld_password`) VALUES
(1, 'admin', 'admin@123');

-- --------------------------------------------------------

--
-- Table structure for table `tbfood`
--

CREATE TABLE `tbfood` (
  `food_id` int(11) NOT NULL,
  `fldvendor_id` int(11) NOT NULL,
  `foodname` varchar(100) NOT NULL,
  `cost` bigint(15) NOT NULL,
  `cuisines` varchar(50) NOT NULL,
  `paymentmode` varchar(50) NOT NULL,
  `fldimage` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbfood`
--

INSERT INTO `tbfood` (`food_id`, `fldvendor_id`, `foodname`, `cost`, `cuisines`, `paymentmode`, `fldimage`) VALUES
(2, 22, 'malai Kofta', 50, 'vegetable,veg', 'COD', '1469258122-malai-kofta.jpg'),
(3, 22, 'shahi panner', 20, 'vegetable', 'COD', 'Shahi-Paneer-Recipe.jpg'),
(4, 22, 'chola kulcha', 100, 'lunch', 'COD', 'maxresdefault.jpg'),
(5, 23, 'Pizza', 100, 'Medium Size, fast food', 'COD', 'phut_0.jpg'),
(6, 23, 'Pizza Full', 300, 'Fast food,full size', 'COD', 'phut_0.jpg'),
(7, 23, 'burger ', 50, 'Fast food', 'COD', 'photo-1534790566855-4cb788d389ec.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblcart`
--

CREATE TABLE `tblcart` (
  `fld_cart_id` int(11) NOT NULL,
  `fld_product_id` bigint(11) NOT NULL,
  `fld_customer_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomer`
--

CREATE TABLE `tblcustomer` (
  `cust_id` int(10) NOT NULL,
  `cust_name` varchar(30) NOT NULL,
  `cust_email` varchar(30) NOT NULL,
  `cust_mobile` bigint(10) NOT NULL,
  `cust_password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblcustomer`
--

INSERT INTO `tblcustomer` (`cust_id`, `cust_name`, `cust_email`, `cust_mobile`, `cust_password`) VALUES
(1, 'gajender', 'customer1@gmail.com', 7503515382, 'customer1'),
(2, 'sanjay', 'customer2@gmail.com', 7503515386, 'customer2'),
(3, 'saana', 'customer3@gmail.com', 7503515383, 'customer3'),
(4, 'Khushi Pundir', 'janedoe@gmail.com', 0, '6484738'),
(5, 'Tai', 'janedoe@gmail.com', 6484738, 'pass'),
(6, 'Tai', 'janedoe@gmail.com', 6484738, 'pass'),
(7, 'tegen', 'abc@gmail.com', 12345678, '1234'),
(8, 'tegen', 'quk@gmail.com', 167820, '1234');

-- --------------------------------------------------------

--
-- Table structure for table `tblmessage`
--

CREATE TABLE `tblmessage` (
  `fld_msg_id` int(10) NOT NULL,
  `fld_name` varchar(50) NOT NULL,
  `fld_email` varchar(50) NOT NULL,
  `fld_phone` bigint(10) DEFAULT NULL,
  `fld_msg` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblorder`
--

CREATE TABLE `tblorder` (
  `fld_order_id` int(10) NOT NULL,
  `fld_cart_id` bigint(10) NOT NULL,
  `fldvendor_id` bigint(10) DEFAULT NULL,
  `fld_food_id` bigint(10) DEFAULT NULL,
  `fld_email_id` varchar(50) DEFAULT NULL,
  `fld_payment` varchar(20) DEFAULT NULL,
  `fldstatus` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblorder`
--

INSERT INTO `tblorder` (`fld_order_id`, `fld_cart_id`, `fldvendor_id`, `fld_food_id`, `fld_email_id`, `fld_payment`, `fldstatus`) VALUES
(1, 1, 21, 1, 'customer3@gmail.com', '50', 'Delivered'),
(2, 2, 22, 3, 'customer3@gmail.com', '20', 'Out Of Stock');

-- --------------------------------------------------------

--
-- Table structure for table `tblvendor`
--

CREATE TABLE `tblvendor` (
  `hotel_id` int(10) NOT NULL,
  `hotel_name` varchar(30) NOT NULL,
  `hotel_email` varchar(50) NOT NULL,
  `hotel_password` varchar(50) NOT NULL,
  `hotel_mob` bigint(10) NOT NULL,
  `hotel_phone` bigint(10) NOT NULL,
  `hotel_address` varchar(50) NOT NULL,
  `hotel_logo` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblvendor`
--

INSERT INTO `tblvendor` (`hotel_id`, `hotel_name`, `hotel_email`, `hotel_password`, `hotel_mob`, `hotel_phone`, `hotel_address`, `hotel_logo`) VALUES
(22, 'Hotel Radison', 'vendor1@gmail.com', 'vendor1', 7503515386, 114565457, 'noida', '46388969.jpg'),
(23, 'Hotel Piccaso', 'vendor2@gmail.com', 'vendor2', 7503515385, 114565457, 'C-33, SWARN PARK, MUNDKA', '46388969.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbadmin`
--
ALTER TABLE `tbadmin`
  ADD PRIMARY KEY (`fld_id`);

--
-- Indexes for table `tbfood`
--
ALTER TABLE `tbfood`
  ADD PRIMARY KEY (`food_id`),
  ADD KEY `fldvendor_id` (`fldvendor_id`);

--
-- Indexes for table `tblcart`
--
ALTER TABLE `tblcart`
  ADD PRIMARY KEY (`fld_cart_id`);

--
-- Indexes for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `tblmessage`
--
ALTER TABLE `tblmessage`
  ADD PRIMARY KEY (`fld_msg_id`);

--
-- Indexes for table `tblorder`
--
ALTER TABLE `tblorder`
  ADD PRIMARY KEY (`fld_order_id`);

--
-- Indexes for table `tblvendor`
--
ALTER TABLE `tblvendor`
  ADD PRIMARY KEY (`hotel_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbadmin`
--
ALTER TABLE `tbadmin`
  MODIFY `fld_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbfood`
--
ALTER TABLE `tbfood`
  MODIFY `food_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblcart`
--
ALTER TABLE `tblcart`
  MODIFY `fld_cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  MODIFY `cust_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblmessage`
--
ALTER TABLE `tblmessage`
  MODIFY `fld_msg_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblorder`
--
ALTER TABLE `tblorder`
  MODIFY `fld_order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblvendor`
--
ALTER TABLE `tblvendor`
  MODIFY `hotel_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbfood`
--
ALTER TABLE `tbfood`
  ADD CONSTRAINT `tbfood_ibfk_1` FOREIGN KEY (`fldvendor_id`) REFERENCES `tblvendor` (`hotel_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
