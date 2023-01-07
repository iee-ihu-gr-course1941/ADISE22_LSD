-- --------------------------------------------------------
-- Διακομιστής:                  127.0.0.1
-- Έκδοση διακομιστή:            10.4.27-MariaDB - mariadb.org binary distribution
-- Λειτ. σύστημα διακομιστή:     Win64
-- HeidiSQL Έκδοση:              12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for procedure database.clean_deck
DELIMITER //
CREATE PROCEDURE `clean_deck`()
BEGIN
REPLACE INTO deck SELECT * FROM deckEmpty;
END//
DELIMITER ;

-- Dumping structure for πίνακας database.deck
CREATE TABLE IF NOT EXISTS `deck` (
  `deckId` int(2) NOT NULL AUTO_INCREMENT,
  `deckNumber` enum('2','3','4','5','6','7','8','9','10','J','Q','K','A') NOT NULL,
  `deckSymbol` enum('Club','Diamond','Heart','Spade') NOT NULL,
  `deckPlayer` enum('A','B','T','P') DEFAULT NULL,
  PRIMARY KEY (`deckId`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table database.deck: ~52 rows (approximately)
INSERT INTO `deck` (`deckId`, `deckNumber`, `deckSymbol`, `deckPlayer`) VALUES
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

-- Dumping structure for πίνακας database.deckempty
CREATE TABLE IF NOT EXISTS `deckempty` (
  `deckEmptyId` int(2) NOT NULL AUTO_INCREMENT,
  `deckEmptyNumber` enum('2','3','4','5','6','7','8','9','10','J','Q','K','A') NOT NULL,
  `deckEmptySymbol` enum('Club','Diamond','Heart','Spade') NOT NULL,
  `deckEmptyPlayer` enum('A','B','T','P') DEFAULT NULL,
  PRIMARY KEY (`deckEmptyId`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table database.deckempty: ~52 rows (approximately)
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

-- Dumping structure for πίνακας database.gamestatus
CREATE TABLE IF NOT EXISTS `gamestatus` (
  `gameStatus` enum('not active','initialized','started','\r\nended','aborded') NOT NULL DEFAULT 'not active',
  `playerTurn` enum('A','B') DEFAULT NULL,
  `gameResult` enum('A','B') DEFAULT NULL,
  `lastChange` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table database.gamestatus: ~0 rows (approximately)

-- Dumping structure for πίνακας database.users
CREATE TABLE IF NOT EXISTS `users` (
  `userName` varchar(20) DEFAULT NULL,
  `user` enum('A','B') NOT NULL,
  `token` varchar(100) NOT NULL,
  `lastChange` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table database.users: ~0 rows (approximately)

-- Dumping structure for trigger database.gameStatusUpdate
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `gameStatusUpdate` BEFORE UPDATE ON `gameStatus` FOR EACH ROW BEGIN
SET NEW.lastChange = NOW();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
