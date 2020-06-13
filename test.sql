-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2020 at 10:23 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'Rakesh', 'Rakesh');

-- --------------------------------------------------------

--
-- Table structure for table `covidfiles`
--

CREATE TABLE `covidfiles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `covidfiles`
--

INSERT INTO `covidfiles` (`id`, `name`, `filename`, `created_at`) VALUES
(1, 'Welcome', '4BUS002.pdf', '2020-06-13 07:42:31'),
(2, 'GreenField', '12ARC001.pdf', '2020-06-13 07:43:43');

-- --------------------------------------------------------

--
-- Table structure for table `histories`
--

CREATE TABLE `histories` (
  `id` int(11) NOT NULL,
  `covid_id` int(10) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `histories`
--

INSERT INTO `histories` (`id`, `covid_id`, `filename`, `created_at`) VALUES
(1, 1, '77BUS003.pdf', '2020-06-13 06:43:14'),
(2, 1, '63INF002R.pdf', '2020-06-13 06:45:44'),
(3, 1, '77BUS003.pdf', '2020-06-13 06:43:14'),
(4, 1, '63INF002R.pdf', '2020-06-13 06:45:44'),
(5, 1, '77BUS003.pdf', '2020-06-13 06:43:14'),
(6, 1, '63INF002R.pdf', '2020-06-13 06:45:44'),
(7, 1, '77BUS003.pdf', '2020-06-13 06:43:14'),
(8, 1, '63INF002R.pdf', '2020-06-13 06:45:44'),
(9, 1, '77BUS003.pdf', '2020-06-13 06:43:14'),
(10, 1, '63INF002R.pdf', '2020-06-13 06:45:44'),
(11, 1, '77BUS003.pdf', '2020-06-13 06:43:14'),
(12, 1, '63INF002R.pdf', '2020-06-13 06:45:44'),
(13, 1, '77BUS003.pdf', '2020-06-13 06:43:14'),
(14, 1, '63INF002R.pdf', '2020-06-13 06:45:44'),
(15, 1, '77BUS003.pdf', '2020-06-13 06:43:14'),
(16, 1, '63INF002R.pdf', '2020-06-13 06:45:44'),
(17, 1, '77BUS003.pdf', '2020-06-13 06:43:14'),
(18, 1, '63INF002R.pdf', '2020-06-13 06:45:44'),
(19, 1, '77BUS003.pdf', '2020-06-13 06:43:14'),
(20, 1, '63INF002R.pdf', '2020-06-13 06:45:44'),
(21, 1, '77BUS003.pdf', '2020-06-13 06:43:14'),
(22, 1, '63INF002R.pdf', '2020-06-13 06:45:44'),
(23, 1, '77BUS003.pdf', '2020-06-13 06:43:14'),
(24, 1, '63INF002R.pdf', '2020-06-13 06:45:44'),
(25, 1, '77BUS003.pdf', '2020-06-13 06:43:14'),
(26, 1, '63INF002R.pdf', '2020-06-13 06:45:44'),
(27, 1, '77BUS003.pdf', '2020-06-13 06:43:14'),
(28, 1, '63INF002R.pdf', '2020-06-13 06:45:44'),
(29, 1, '77BUS003.pdf', '2020-06-13 06:43:14'),
(30, 1, '63INF002R.pdf', '2020-06-13 06:45:44'),
(31, 1, '77BUS003.pdf', '2020-06-13 06:43:14'),
(32, 1, '63INF002R.pdf', '2020-06-13 06:45:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `covidfiles`
--
ALTER TABLE `covidfiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histories`
--
ALTER TABLE `histories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `covidfiles`
--
ALTER TABLE `covidfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `histories`
--
ALTER TABLE `histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
