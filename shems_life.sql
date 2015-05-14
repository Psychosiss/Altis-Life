SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shems_life`
-- Default Schema
--
CREATE DATABASE IF NOT EXISTS `shems_life` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `shems_life`;

DELIMITER $$
--
-- Procedures
-- Edit arma3 and root to match a user in MySQL
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `resetLifeVehicles`()
BEGIN
	UPDATE `vehicles` SET `active`= 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDeadVehicles`()
BEGIN
	DELETE FROM `vehicles` WHERE `alive` = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldHouses`()
BEGIN
  DELETE FROM `houses` WHERE `rentdate` < 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldGangs`()
BEGIN
  DELETE FROM `gangs` WHERE `active` = 0;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `playerid` varchar(50) NOT NULL,
  `aliases` text NOT NULL,
  `civ_money` int(100) NOT NULL DEFAULT '0',
  `civ_atmmoney` int(100) NOT NULL DEFAULT '0',
  `civ_licenses` text,
  `civ_gear` text NOT NULL,
  `civ_position` text NOT NULL,
  `cop_money` int(100) NOT NULL DEFAULT '0',
  `cop_atmmoney` int(100) NOT NULL DEFAULT '0',
  `cop_licenses` text,
  `cop_gear` text NOT NULL,
  `cop_level` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `cop_position` text NOT NULL,
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `med_money` int(100) NOT NULL DEFAULT '0',
  `med_atmmoney` int(100) NOT NULL DEFAULT '0',
  `med_licenses` text,
  `med_gear` text NOT NULL,
  `med_level` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `med_position` text NOT NULL,
  `adminlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `donatorlvl` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `jail_time` int(11) NOT NULL DEFAULT '0',
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `alive` tinyint(4) NOT NULL DEFAULT '0',
  `karma` int(100) NOT NULL DEFAULT '1',
  `lastLogin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`,`playerid`,`lastLogin`),
  UNIQUE KEY `playerid` (`playerid`),
  KEY `name` (`name`),
  KEY `blacklist` (`blacklist`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `side` varchar(15) NOT NULL,
  `classname` varchar(32) NOT NULL,
  `type` varchar(12) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `plate` int(20) NOT NULL,
  `color` int(20) NOT NULL,
  `inventory` text NOT NULL,
  `gear` text NOT NULL,
  `insure` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) NOT NULL,
  `gid` varchar(12) NOT NULL DEFAULT '0',
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text,
  `containers` text,
  `owned` tinyint(4) DEFAULT '0',
  `rentdate` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`pid`,`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `gangs`
--

CREATE TABLE IF NOT EXISTS `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `members` text,
  `maxmembers` int(2) DEFAULT '8',
  `bank` int(100) DEFAULT '0',
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `fromID` varchar(50) NOT NULL,
  `toID` varchar(50) NOT NULL,
  `message` text,
  `fromName` varchar(32) NOT NULL,
  `toName` varchar(32) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dynmarket`
--

DROP TABLE IF EXISTS `dynmarket`;
CREATE TABLE `dynmarket` (
  `id` INT NOT NULL DEFAULT 1,
  `prices` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `dynmarket` VALUES ('1', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `wanted`
--

DROP TABLE IF EXISTS `wanted`;
CREATE TABLE `wanted` (
  `wantedID` varchar(50) NOT NULL,
  `wantedName` varchar(52) NOT NULL,
  `wantedCrimes` text NOT NULL,
  `wantedBounty` int(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wantedID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Event structure for `4hHouseRentTimer`
--
DROP EVENT IF EXISTS `4hHouseRentTimer`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `4hHouseRentTimer` ON SCHEDULE EVERY 4 HOUR STARTS '2014-09-13 03:59:55' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE houses
SET rentdate = rentdate - 1
;;
DELIMITER ;

--
-- Event structure for `6WeeksPlayerDelete`
--
DROP EVENT IF EXISTS `6WeeksPlayerDelete`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `6WeeksPlayerDelete` ON SCHEDULE EVERY 1 DAY STARTS '2014-09-13 23:59:55' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM players where lastLogin < DATE_SUB( CURRENT_TIME(), INTERVAL 6 Week)
;;
DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;