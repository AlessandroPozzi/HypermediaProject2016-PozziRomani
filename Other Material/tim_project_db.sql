-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2016 at 12:01 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tim_project_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `assistance`
--

CREATE TABLE `assistance` (
  `id_assistance` int(11) NOT NULL,
  `name` varchar(255) COLLATE ascii_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `assistance_faq`
--

CREATE TABLE `assistance_faq` (
  `id_assistance` int(11) NOT NULL,
  `question` varchar(255) COLLATE ascii_bin DEFAULT NULL,
  `answer` text COLLATE ascii_bin
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `assistance_for`
--

CREATE TABLE `assistance_for` (
  `id_device` int(11) NOT NULL,
  `id_assistance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `assistance_to_faq`
--

CREATE TABLE `assistance_to_faq` (
  `id_assistance` int(11) NOT NULL,
  `id_FAQ` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `available_sl_service`
--

CREATE TABLE `available_sl_service` (
  `id_device` int(11) NOT NULL,
  `id_sl` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `category_content`
--

CREATE TABLE `category_content` (
  `category` varchar(255) COLLATE ascii_bin NOT NULL,
  `content` varchar(255) COLLATE ascii_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE `device` (
  `id_device` int(11) NOT NULL,
  `name` varchar(255) COLLATE ascii_bin NOT NULL,
  `description` text COLLATE ascii_bin NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `device_to_promo`
--

CREATE TABLE `device_to_promo` (
  `id` int(11) NOT NULL,
  `id_promo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `device_to_spec`
--

CREATE TABLE `device_to_spec` (
  `id_device` int(11) NOT NULL,
  `id_spec` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `for_device_1`
--

CREATE TABLE `for_device_1` (
  `id_sl` int(11) NOT NULL,
  `id_device` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `for_device_2`
--

CREATE TABLE `for_device_2` (
  `id_assistance` int(11) NOT NULL,
  `id_device` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `high_level_categories`
--

CREATE TABLE `high_level_categories` (
  `macro_group` varchar(255) COLLATE ascii_bin NOT NULL,
  `category` varchar(255) COLLATE ascii_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `id_promo` int(11) NOT NULL,
  `new_price` decimal(10,0) DEFAULT NULL,
  `payment_instalments` varchar(255) COLLATE ascii_bin DEFAULT NULL,
  `other_promo` varchar(255) COLLATE ascii_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `sl`
--

CREATE TABLE `sl` (
  `id_sl` int(11) NOT NULL,
  `name` varchar(255) COLLATE ascii_bin NOT NULL,
  `description` text COLLATE ascii_bin NOT NULL,
  `price` int(11) NOT NULL,
  `how_to` text COLLATE ascii_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `sl_benefits`
--

CREATE TABLE `sl_benefits` (
  `id_sl` int(11) NOT NULL,
  `name` varchar(255) COLLATE ascii_bin NOT NULL,
  `content` varchar(255) COLLATE ascii_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `sl_to_benefits`
--

CREATE TABLE `sl_to_benefits` (
  `id_sl` int(11) NOT NULL,
  `id_benefits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Table structure for table `technical_spec`
--

CREATE TABLE `technical_spec` (
  `id_spec` int(11) NOT NULL,
  `name` varchar(255) COLLATE ascii_bin NOT NULL,
  `content` varchar(255) COLLATE ascii_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assistance`
--
ALTER TABLE `assistance`
  ADD PRIMARY KEY (`id_assistance`);

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`id_device`);

--
-- Indexes for table `sl`
--
ALTER TABLE `sl`
  ADD PRIMARY KEY (`id_sl`);

--
-- Indexes for table `technical_spec`
--
ALTER TABLE `technical_spec`
  ADD PRIMARY KEY (`id_spec`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assistance`
--
ALTER TABLE `assistance`
  MODIFY `id_assistance` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `device`
--
ALTER TABLE `device`
  MODIFY `id_device` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sl`
--
ALTER TABLE `sl`
  MODIFY `id_sl` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `technical_spec`
--
ALTER TABLE `technical_spec`
  MODIFY `id_spec` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
