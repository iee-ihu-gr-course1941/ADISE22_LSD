-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2023 at 09:30 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_deck` ()   BEGIN
REPLACE INTO deck SELECT * FROM deckEmpty;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `shuffle` ()   BEGIN
UPDATE deck SET deckPlayer = 'A' WHERE deckPlayer IS NULL LIMIT 26;
  UPDATE deck SET deckPlayer = 'B' WHERE deckPlayer IS NULL LIMIT 26;
  UPDATE deck SET deckPlayer = 'A' WHERE deckPlayer = 'B' AND RAND() < 0.5 LIMIT 13;
  UPDATE deck SET deckPlayer = 'B' WHERE deckPlayer = 'A' AND RAND() < 0.5 LIMIT 13;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `deck`
--

CREATE TABLE `deck` (
  `deckId` int(2) NOT NULL,
  `deckNumber` enum('2','3','4','5','6','7','8','9','10','J','Q','K','A') NOT NULL,
  `deckSymbol` enum('Club','Diamond','Heart','Spade') NOT NULL,
  `deckPlayer` enum('A','B','T','P') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deck`
--

INSERT INTO `deck` (`deckId`, `deckNumber`, `deckSymbol`, `deckPlayer`) VALUES
(1, '2', 'Club', 'A'),
(2, '3', 'Club', 'A'),
(3, '4', 'Club', 'B'),
(4, '5', 'Club', 'A'),
(5, '6', 'Club', 'B'),
(6, '7', 'Club', 'B'),
(7, '8', 'Club', 'B'),
(8, '9', 'Club', 'B'),
(9, '10', 'Club', 'B'),
(10, 'J', 'Club', 'B'),
(11, 'Q', 'Club', 'A'),
(12, 'K', 'Club', 'B'),
(13, 'A', 'Club', 'B'),
(14, '2', 'Diamond', 'B'),
(15, '3', 'Diamond', 'B'),
(16, '4', 'Diamond', 'B'),
(17, '5', 'Diamond', 'B'),
(18, '6', 'Diamond', 'A'),
(19, '7', 'Diamond', 'B'),
(20, '8', 'Diamond', 'A'),
(21, '9', 'Diamond', 'B'),
(22, '10', 'Diamond', 'B'),
(23, 'J', 'Diamond', 'B'),
(24, 'Q', 'Diamond', 'A'),
(25, 'K', 'Diamond', 'A'),
(26, 'A', 'Diamond', 'A'),
(27, '2', 'Heart', 'B'),
(28, '3', 'Heart', 'A'),
(29, '4', 'Heart', 'A'),
(30, '5', 'Heart', 'A'),
(31, '6', 'Heart', 'A'),
(32, '7', 'Heart', 'B'),
(33, '8', 'Heart', 'A'),
(34, '9', 'Heart', 'A'),
(35, '10', 'Heart', 'A'),
(36, 'J', 'Heart', 'B'),
(37, 'Q', 'Heart', 'A'),
(38, 'K', 'Heart', 'B'),
(39, 'A', 'Heart', 'B'),
(40, '2', 'Spade', 'B'),
(41, '3', 'Spade', 'A'),
(42, '4', 'Spade', 'A'),
(43, '5', 'Spade', 'A'),
(44, '6', 'Spade', 'A'),
(45, '7', 'Spade', 'A'),
(46, '8', 'Spade', 'A'),
(47, '9', 'Spade', 'B'),
(48, '10', 'Spade', 'B'),
(49, 'J', 'Spade', 'A'),
(50, 'Q', 'Spade', 'A'),
(51, 'K', 'Spade', 'A'),
(52, 'A', 'Spade', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `deckempty`
--

CREATE TABLE `deckempty` (
  `deckEmptyId` int(2) NOT NULL,
  `deckEmptyNumber` enum('2','3','4','5','6','7','8','9','10','J','Q','K','A') NOT NULL,
  `deckEmptySymbol` enum('Club','Diamond','Heart','Spade') NOT NULL,
  `deckEmptyPlayer` enum('A','B','T','P') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deckempty`
--

INSERT INTO `deckempty` (`deckEmptyId`, `deckEmptyNumber`, `deckEmptySymbol`, `deckEmptyPlayer`) VALUES
(1, '2', 'Club', NULL),
(2, '3', 'Club', NULL),
(3, '4', 'Club', NULL),
(4, '5', 'Club', NULL),
(5, '6', 'Club', NULL),
(6, '7', 'Club', NULL),
(7, '8', 'Club', NULL),
(8, '9', 'Club', NULL),
(9, '10', 'Club', NULL),
(10, 'J', 'Club', NULL),
(11, 'Q', 'Club', NULL),
(12, 'K', 'Club', NULL),
(13, 'A', 'Club', NULL),
(14, '2', 'Diamond', NULL),
(15, '3', 'Diamond', NULL),
(16, '4', 'Diamond', NULL),
(17, '5', 'Diamond', NULL),
(18, '6', 'Diamond', NULL),
(19, '7', 'Diamond', NULL),
(20, '8', 'Diamond', NULL),
(21, '9', 'Diamond', NULL),
(22, '10', 'Diamond', NULL),
(23, 'J', 'Diamond', NULL),
(24, 'Q', 'Diamond', NULL),
(25, 'K', 'Diamond', NULL),
(26, 'A', 'Diamond', NULL),
(27, '2', 'Heart', NULL),
(28, '3', 'Heart', NULL),
(29, '4', 'Heart', NULL),
(30, '5', 'Heart', NULL),
(31, '6', 'Heart', NULL),
(32, '7', 'Heart', NULL),
(33, '8', 'Heart', NULL),
(34, '9', 'Heart', NULL),
(35, '10', 'Heart', NULL),
(36, 'J', 'Heart', NULL),
(37, 'Q', 'Heart', NULL),
(38, 'K', 'Heart', NULL),
(39, 'A', 'Heart', NULL),
(40, '2', 'Spade', NULL),
(41, '3', 'Spade', NULL),
(42, '4', 'Spade', NULL),
(43, '5', 'Spade', NULL),
(44, '6', 'Spade', NULL),
(45, '7', 'Spade', NULL),
(46, '8', 'Spade', NULL),
(47, '9', 'Spade', NULL),
(48, '10', 'Spade', NULL),
(49, 'J', 'Spade', NULL),
(50, 'Q', 'Spade', NULL),
(51, 'K', 'Spade', NULL),
(52, 'A', 'Spade', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gamestatus`
--

CREATE TABLE `gamestatus` (
  `gameStatus` enum('not active','initialized','started','\r\nended','aborded') NOT NULL DEFAULT 'not active',
  `playerTurn` enum('A','B') DEFAULT NULL,
  `gameResult` enum('A','B') DEFAULT NULL,
  `lastChange` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gamestatus`
--

INSERT INTO `gamestatus` (`gameStatus`, `playerTurn`, `gameResult`, `lastChange`) VALUES
('started', '', NULL, '2023-01-09 18:25:13');

--
-- Triggers `gamestatus`
--
DELIMITER $$
CREATE TRIGGER `gameStatusUpdate` BEFORE UPDATE ON `gamestatus` FOR EACH ROW BEGIN
SET NEW.lastChange = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userName` varchar(20) DEFAULT NULL,
  `user` enum('A','B') NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `lastChange` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userName`, `user`, `token`, `lastChange`) VALUES
('cat', 'A', '1cf21e4f4e1eb72e140d34479bc181f5', '2023-01-09 18:24:40'),
('cat', 'B', '16455d4e0c6ac9e130081a2653b1c95a', '2023-01-09 18:24:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deck`
--
ALTER TABLE `deck`
  ADD PRIMARY KEY (`deckId`);

--
-- Indexes for table `deckempty`
--
ALTER TABLE `deckempty`
  ADD PRIMARY KEY (`deckEmptyId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deck`
--
ALTER TABLE `deck`
  MODIFY `deckId` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `deckempty`
--
ALTER TABLE `deckempty`
  MODIFY `deckEmptyId` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
