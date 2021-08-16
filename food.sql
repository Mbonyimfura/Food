-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2001 at 10:45 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `title`, `image_name`, `featured`, `active`) VALUES
(4, 'Mixed dishes', 'Food_Category_635.jpg', 'Yes', 'Yes'),
(5, 'Protein foods', 'Food_Category_655.jpg', 'Yes', 'Yes'),
(6, 'Fruits', 'Food_Category_322.jpg', 'Yes', 'Yes'),
(7, 'Snacks', 'Food_Category_744.jpg', 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food`
--

CREATE TABLE `tbl_food` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_food`
--

INSERT INTO `tbl_food` (`id`, `title`, `description`, `price`, `image_name`, `category_id`, `featured`, `active`) VALUES
(3, 'Beef and Macaroni', 'Made with macoroni and ground beef', '3.00', 'Food-Name-5760.jpg', 4, 'Yes', 'Yes'),
(4, 'Chicken pot pie', 'Made with chicken and vegetables in a sauce with a biscuit ', '4.00', 'Food-Name-9657.jpg', 4, 'Yes', 'Yes'),
(5, 'Seafood', 'Includes lobsters,mussels,and crabs and other sea creatures that you can eat', '6.00', 'Food-Name-5043.jpg', 5, 'Yes', 'Yes'),
(6, 'Pineaple', 'Its packed with nutrients', '1.00', 'Food-Name-8215.jpg', 6, 'Yes', 'Yes'),
(7, 'Popcorn', '', '2.00', 'Food-Name-456.jpg', 7, 'Yes', 'Yes'),
(8, 'pizza', 'With dough,tomato sauce and cheese', '1.00', 'Food-Name-4821.jpg', 4, 'No', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `food` varchar(150) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `customer_contact` varchar(20) NOT NULL,
  `customer_email` varchar(150) NOT NULL,
  `customer_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `food`, `price`, `qty`, `total`, `order_date`, `status`, `customer_name`, `customer_contact`, `customer_email`, `customer_address`) VALUES
(1, 'seafood', '2.00', 1, '1.00', '2001-01-01 00:00:00', 'ordered', 'tresor', '0780531877', 'tresor@gmail.com', 'huye'),
(3, 'Mixed Pizza', '10.00', 2, '20.00', '2020-11-30 04:07:17', 'Delivered', 'kevin', '0780531879', 'kevin@gmail.com', 'HUYE'),
(4, 'Beef and Macaroni', '3.00', 1, '3.00', '2001-01-01 10:02:35', 'Ordered', 'edwin', '0780531878', 'nambajeeeeedwin@gmail.com', 'huye'),
(5, '', '0.00', 0, '0.00', '2001-01-01 03:10:49', '', '', '', '', ''),
(6, 'Chicken pot pie', '4.00', 1, '4.00', '2001-01-01 10:20:42', 'Ordered', 'eric', '0780531876', 'eric@gmail.com', 'huye');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `isadmin` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `full_name`, `username`, `email`, `password`, `isadmin`) VALUES
(1, 'Mboyimfura Tresor', 'tresor', 'tresor@gmail.com', '123', 1),
(10, 'nambaje edwin', 'edwin', 'nambajeeedwin@gmail.com', '202cb962ac59075b964b07152d234b70', 0),
(11, 'nkusi kevin', 'kevin', 'kevin@gmal.com', 'd41d8cd98f00b204e9800998ecf8427e', 0),
(12, 'iradu eric', 'eric', 'eric@gmal.com', '81dc9bdb52d04dc20036dbd8313ed055', 0),
(13, 'nambaje edwin', 'nambaje edwin', 'eric@gmail.com', '202cb962ac59075b964b07152d234b70', 0),
(14, 'Agaba Cedric', 'cedric', 'cedric@gmal.com', '202cb962ac59075b964b07152d234b70', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_food`
--
ALTER TABLE `tbl_food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_food`
--
ALTER TABLE `tbl_food`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
