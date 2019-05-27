-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 08, 2018 at 07:38 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hsqli`
--

-- --------------------------------------------------------
CREATE DATABASE IF NOT EXISTS `hsqli`;
USE `hsqli`;
--
-- Table structure for table `challenge_clue`
--

CREATE TABLE `challenge_clue` (
  `id` int(11) NOT NULL,
  `info` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `challenge_clue`
--

INSERT INTO `challenge_clue` (`id`, `info`) VALUES
(1, 'Flag'),
(2, 'ingeHack{EitherIWillFindaWayOrIWillMakeOne}');

-- --------------------------------------------------------

--
-- Table structure for table `hackerspaces`
--

CREATE TABLE `hackerspaces` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `irc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hackerspaces`
--

INSERT INTO `hackerspaces` (`id`, `name`, `address`, `irc`) VALUES
(1, 'iExploit', ' Southampton United Kingdom', 'irc://irc.evilzone.org/#iexploit'),
(2, 'K4CG', '33 Kent Avenue\r\nN2G 3R2 Kitchener\r\nCanada ', 'irc://irc.freenode.net/#kwartzlab '),
(3, 'F53Hack', ' Olot (La Garrotxa)\r\nCatalonia ', 'f53hack@freenode '),
(4, 'Sis-afk', 'Karlskrona\r\nSweden ', 'irc://irc.bthstudent.se/#sis-afk'),
(5, 'Molekula ', 'Delta 5/I (bivši IVEX) 1. kat\r\n51000 Rijeka\r\nCroatia ', 'irc://irc.freenode.net/rirazmjena '),
(6, 'Technarium', 'Aguonų g. 17\r\n03213 Vilnius\r\nLithuania ', 'irc://irc.freenode.net/#driskiai'),
(7, 'KwartzLab', '33 Kent Avenue\r\nN2G 3R2 Kitchener\r\nCanada ', 'irc://irc.freenode.net/#kwartzlab '),
(8, 'Pixelbar', 'Vierhavensstraat 56\r\n3029 BG Rotterdam\r\nNetherlands', 'irc://irc.smurfnet.ch/#pixelbar ');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` char(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'Welc0meT0IngeHack!');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `challenge_clue`
--
ALTER TABLE `challenge_clue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hackerspaces`
--
ALTER TABLE `hackerspaces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `challenge_clue`
--
ALTER TABLE `challenge_clue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hackerspaces`
--
ALTER TABLE `hackerspaces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
