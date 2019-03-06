-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2017 at 04:50 AM
-- Server version: 5.5.57-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `FootballLeagueUpdatedSprint3`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`teja2017`@`%` PROCEDURE `GetTeamPlayers`(IN `teamName` VARCHAR(255))
BEGIN
  SELECT team_name,concat(p.first_name,' ',p.last_name) 'player name'
	from
	 Player p inner join Team_Manager using(teammanager_id) 
	inner join Team using(teammanager_id)
	where team_name=teamName ;
 END$$

CREATE DEFINER=`teja2017`@`%` PROCEDURE `GetTeamsInConference`(IN conferenceName VARCHAR(255))
BEGIN
  SELECT conference_name,division_name,team_name,win,loss,tie
	from
	Team inner join Division using(division_id) 
	inner join Conference using(conference_id)
	where conference_name=conferenceName;
 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Coach`
--

CREATE TABLE IF NOT EXISTS `Coach` (
  `Coach_id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY (`Coach_id`),
  KEY `team_id` (`team_id`),
  KEY `coach_id` (`Coach_id`),
  KEY `name` (`first_name`,`last_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `Coach`
--

INSERT INTO `Coach` (`Coach_id`, `team_id`, `first_name`, `last_name`, `username`, `password`) VALUES
(1, 1, 'Jason', 'Garrett', 'JGarrett', 'Garrett'),
(2, 2, 'Pete', 'Carroll', 'PCarroll', 'Carroll'),
(3, 3, 'Ron', 'Rivera', 'RRivera', 'Rivera'),
(4, 4, 'Todd', 'Bowler', 'TBowler', 'Bowler'),
(5, 5, 'Andy', 'Reid', 'AReid', 'Reid'),
(6, 6, 'Mike', 'Mularkey', 'MMularkey', 'Mularkey'),
(7, 7, 'Marvin', 'Lewis', 'MLewis', 'Lewis');

-- --------------------------------------------------------

--
-- Table structure for table `Conference`
--

CREATE TABLE IF NOT EXISTS `Conference` (
  `conference_id` int(11) NOT NULL AUTO_INCREMENT,
  `conference_name` varchar(15) NOT NULL,
  `league_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`conference_id`),
  UNIQUE KEY `conference_name` (`conference_name`),
  KEY `league_id` (`league_id`),
  KEY `conference_id` (`conference_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Conference`
--

INSERT INTO `Conference` (`conference_id`, `conference_name`, `league_id`) VALUES
(1, 'NFC', 1),
(2, 'AFC', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Division`
--

CREATE TABLE IF NOT EXISTS `Division` (
  `division_id` int(11) NOT NULL AUTO_INCREMENT,
  `division_name` varchar(20) NOT NULL,
  `conference_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`division_id`),
  UNIQUE KEY `division_name` (`division_name`),
  KEY `conference_id` (`conference_id`),
  KEY `division_id` (`division_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `Division`
--

INSERT INTO `Division` (`division_id`, `division_name`, `conference_id`) VALUES
(1, 'NFC_East', 1),
(2, 'NFC_West', 1),
(3, 'NFC_North', 1),
(4, 'NFC_South', 1),
(5, 'AFC_East', 2),
(6, 'AFC_West', 2),
(7, 'AFC_North', 2),
(8, 'AFC_South', 2);

-- --------------------------------------------------------

--
-- Table structure for table `League`
--

CREATE TABLE IF NOT EXISTS `League` (
  `league_id` int(11) NOT NULL AUTO_INCREMENT,
  `league_name` varchar(20) NOT NULL,
  PRIMARY KEY (`league_id`),
  UNIQUE KEY `league_name` (`league_name`),
  KEY `league_id` (`league_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `League`
--

INSERT INTO `League` (`league_id`, `league_name`) VALUES
(1, 'NFL');

-- --------------------------------------------------------

--
-- Table structure for table `League_Manager`
--

CREATE TABLE IF NOT EXISTS `League_Manager` (
  `leaguemanager_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY (`leaguemanager_id`),
  KEY `leaguemanager_id` (`leaguemanager_id`),
  KEY `name` (`first_name`,`last_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `League_Manager`
--

INSERT INTO `League_Manager` (`leaguemanager_id`, `first_name`, `last_name`, `username`, `password`) VALUES
(1, 'Stephen', 'Andrews', 'sandrews', 'brit46'),
(2, 'Roger', 'Goodell', 'rgodell', 'leaderG');

-- --------------------------------------------------------

--
-- Table structure for table `LManager_Conference`
--

CREATE TABLE IF NOT EXISTS `LManager_Conference` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `leaguemanager_id` int(11) DEFAULT NULL,
  `conference_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sno`),
  KEY `conference_id` (`conference_id`),
  KEY `leaguemanager_id` (`leaguemanager_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `LManager_Conference`
--

INSERT INTO `LManager_Conference` (`sno`, `leaguemanager_id`, `conference_id`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `LManager_Division`
--

CREATE TABLE IF NOT EXISTS `LManager_Division` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `leaguemanager_id` int(11) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sno`),
  KEY `division_id` (`division_id`),
  KEY `leaguemanager_id` (`leaguemanager_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `LManager_Division`
--

INSERT INTO `LManager_Division` (`sno`, `leaguemanager_id`, `division_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `LManager_League`
--

CREATE TABLE IF NOT EXISTS `LManager_League` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `league_id` int(11) DEFAULT NULL,
  `leaguemanager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sno`),
  KEY `league_id` (`league_id`),
  KEY `leaguemanager_id` (`leaguemanager_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `LManager_League`
--

INSERT INTO `LManager_League` (`sno`, `league_id`, `leaguemanager_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `LManager_Schedule`
--

CREATE TABLE IF NOT EXISTS `LManager_Schedule` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `leaguemanager_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sno`),
  KEY `schedule_id` (`schedule_id`),
  KEY `leaguemanager_id` (`leaguemanager_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `LManager_Schedule`
--

INSERT INTO `LManager_Schedule` (`sno`, `leaguemanager_id`, `schedule_id`) VALUES
(1, 2, 1),
(2, 1, 2),
(3, 1, 5),
(4, 1, 3),
(5, 2, 4),
(6, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `LManager_Team`
--

CREATE TABLE IF NOT EXISTS `LManager_Team` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `leaguemanager_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sno`),
  KEY `team_id` (`team_id`),
  KEY `leaguemanager_id` (`leaguemanager_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `LManager_Team`
--

INSERT INTO `LManager_Team` (`sno`, `leaguemanager_id`, `team_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 6),
(6, 1, 5),
(7, 1, 7);

-- --------------------------------------------------------

--
-- Stand-in structure for view `NextGameList`
--
CREATE TABLE IF NOT EXISTS `NextGameList` (
`schedule_id` int(11)
,`home` int(11)
,`away` int(11)
,`venue_id` int(11)
,`date` date
,`time` time
);
-- --------------------------------------------------------

--
-- Table structure for table `Player`
--

CREATE TABLE IF NOT EXISTS `Player` (
  `player_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `role` enum('offensive','defensive') DEFAULT NULL,
  `teammanager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  KEY `teammanager_id` (`teammanager_id`),
  KEY `player_id` (`player_id`),
  KEY `name` (`first_name`,`last_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `Player`
--

INSERT INTO `Player` (`player_id`, `first_name`, `last_name`, `username`, `password`, `role`, `teammanager_id`) VALUES
(1, 'Demarcus', 'Lawrence', 'DLawrence', 'Demarcus', 'defensive', 1),
(2, 'Russell', 'Wilson', 'RWilson', 'Russell', 'offensive', 2),
(3, 'David', 'Mayo', 'DMayo', 'David', 'defensive', 3),
(5, 'Demario', 'Davis', 'DDavis', 'Demario', 'defensive', 4),
(6, 'Kareem', 'Hunt', 'KHunt', 'Kareem', 'offensive', 5),
(7, 'Wesley', 'Wood', 'WWood', 'Wesley', 'defensive', 6),
(8, 'Alex', 'Erich', 'AErich', 'Alex', 'offensive', 7),
(9, 'Cameron', 'Payne', 'CPayne', 'Cameron', 'offensive', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Player_Statistics`
--

CREATE TABLE IF NOT EXISTS `Player_Statistics` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `season` varchar(20) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `completion` int(11) DEFAULT NULL,
  `passing_yard` int(11) DEFAULT NULL,
  `rushing_yard` int(11) DEFAULT NULL,
  `touchdown` int(11) DEFAULT NULL,
  `sack` int(11) DEFAULT NULL,
  `assist` int(11) DEFAULT NULL,
  `interception` int(11) DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Player_Statistics`
--

INSERT INTO `Player_Statistics` (`player_id`, `season`, `attempt`, `completion`, `passing_yard`, `rushing_yard`, `touchdown`, `sack`, `assist`, `interception`) VALUES
(1, '2017', 0, 0, 0, 0, 0, 3, 3, 0),
(2, '2017', 41, 26, 452, 30, 0, 2, 0, 1),
(3, '2017', 0, 0, 0, 0, 0, 0, 7, 0),
(5, '2017', 0, 0, 0, 8, 0, 3, 22, 0),
(6, '2017', 18, 0, 0, 87, 0, 0, 0, 0),
(7, '2017', 0, 0, 0, 40, 0, 2, 25, 0),
(8, '2017', 1, 0, 0, 14, 0, 0, 0, 0),
(9, '2017', 35, 24, 0, 8, 2, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Schedule`
--

CREATE TABLE IF NOT EXISTS `Schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `home` int(11) DEFAULT NULL,
  `away` int(11) DEFAULT NULL,
  `venue_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `date_time` (`date`,`time`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `Schedule`
--

INSERT INTO `Schedule` (`schedule_id`, `home`, `away`, `venue_id`, `date`, `time`) VALUES
(1, 7, 6, 1, '2017-11-23', '18:30:00'),
(2, 1, 2, 2, '2017-11-17', '13:00:00'),
(3, 5, 4, 3, '2017-11-19', '14:20:00'),
(4, 4, 3, 4, '2017-12-03', '16:40:00'),
(5, 7, 8, 1, '2017-12-10', '13:00:00'),
(6, 1, 3, 2, '2017-11-17', '16:40:00'),
(7, 5, 4, 3, '2017-12-19', '14:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `Team`
--

CREATE TABLE IF NOT EXISTS `Team` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(35) DEFAULT NULL,
  `win` int(11) DEFAULT NULL,
  `loss` int(11) DEFAULT NULL,
  `tie` int(11) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL,
  `teammanager_id` int(11) DEFAULT NULL,
  `Coach_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `team_name` (`team_name`),
  KEY `division_id` (`division_id`),
  KEY `teammanager_id` (`teammanager_id`),
  KEY `team_id` (`team_id`),
  KEY `teamName` (`team_name`),
  KEY `Coach_id` (`Coach_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `Team`
--

INSERT INTO `Team` (`team_id`, `team_name`, `win`, `loss`, `tie`, `division_id`, `teammanager_id`, `Coach_id`) VALUES
(1, 'Dallas_Cowboys', 4, 2, 0, 1, 1, NULL),
(2, 'Seattle_Seahawk', 6, 0, 0, 2, 2, NULL),
(3, 'Carolina_Panthe', 2, 0, 4, 4, 3, NULL),
(4, 'New_York_Jets', 5, 0, 1, 5, 4, NULL),
(5, 'Kansas_city_chi', 3, 2, 1, 6, 7, NULL),
(6, 'Tennessee_Titan', 1, 3, 2, 8, 6, NULL),
(7, 'Cincinnati_Bega', 3, 2, 1, 7, 5, NULL),
(8, 'Detroit Lions', 1, 3, 2, 3, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Team_Manager`
--

CREATE TABLE IF NOT EXISTS `Team_Manager` (
  `teammanager_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY (`teammanager_id`),
  KEY `teammanager_id` (`teammanager_id`),
  KEY `name` (`first_name`,`last_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `Team_Manager`
--

INSERT INTO `Team_Manager` (`teammanager_id`, `first_name`, `last_name`, `username`, `password`) VALUES
(1, 'Jerry', 'Jones', 'JJones', 'Jerry'),
(2, 'Paul', 'Allen', 'PAllen', 'Paul'),
(3, 'Jerry', 'Richardson', 'JRichardson', 'Jerry'),
(4, 'Christopher', 'Johnson', 'CJohnson', 'Christopher'),
(5, 'Clark', 'Hunt', 'CHunt', 'Clark'),
(6, 'Amy', 'Trunk', 'ATrunk', 'Amy'),
(7, 'Mike', 'Brown', 'MBrown', 'Mike');

-- --------------------------------------------------------

--
-- Table structure for table `TManager_Undrafted`
--

CREATE TABLE IF NOT EXISTS `TManager_Undrafted` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `teammanager_id` int(11) DEFAULT NULL,
  `UndraftedP_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sno`),
  KEY `teammanager_id` (`teammanager_id`),
  KEY `UndraftedP_id` (`UndraftedP_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `TManager_Undrafted`
--

INSERT INTO `TManager_Undrafted` (`sno`, `teammanager_id`, `UndraftedP_id`) VALUES
(1, 1, 1),
(2, 7, 5),
(3, 2, 4),
(4, 1, 2),
(5, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Undrafted_Player`
--

CREATE TABLE IF NOT EXISTS `Undrafted_Player` (
  `UndraftedP_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY (`UndraftedP_id`),
  KEY `UndraftedP_id` (`UndraftedP_id`),
  KEY `name` (`first_name`,`last_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Undrafted_Player`
--

INSERT INTO `Undrafted_Player` (`UndraftedP_id`, `first_name`, `last_name`, `username`, `password`) VALUES
(1, 'Jony', 'Romo', 'JRomo', 'Romo'),
(2, 'Cole', 'Beasley', 'CBeasley', 'Beasley'),
(3, 'Tedric', 'Thompson', 'TThompson', 'Thompson'),
(4, 'Justin', 'Senior', 'Jsenior', 'Senior'),
(5, 'Tony', 'Stevens', 'TStevens', 'Stevens');

-- --------------------------------------------------------

--
-- Table structure for table `Venue`
--

CREATE TABLE IF NOT EXISTS `Venue` (
  `venue_id` int(11) NOT NULL AUTO_INCREMENT,
  `venue` varchar(45) NOT NULL,
  `city` varchar(25) DEFAULT NULL,
  `state` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`venue_id`),
  UNIQUE KEY `venue` (`venue`),
  KEY `venue_id` (`venue_id`),
  KEY `state` (`state`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Venue`
--

INSERT INTO `Venue` (`venue_id`, `venue`, `city`, `state`) VALUES
(1, 'Paul Brown Stadium', 'Cincinnati', 'OH'),
(2, 'AT&T Stadium', 'Arlington', 'TX'),
(3, 'Arrowhead Stadium', 'Kansas City', 'MO'),
(4, 'MetLife Stadium', 'East Rutherford', 'NJ');

-- --------------------------------------------------------

--
-- Structure for view `NextGameList`
--
DROP TABLE IF EXISTS `NextGameList`;

CREATE ALGORITHM=UNDEFINED DEFINER=`teja2017`@`%` SQL SECURITY DEFINER VIEW `NextGameList` AS select `Schedule`.`schedule_id` AS `schedule_id`,`Schedule`.`home` AS `home`,`Schedule`.`away` AS `away`,`Schedule`.`venue_id` AS `venue_id`,`Schedule`.`date` AS `date`,`Schedule`.`time` AS `time` from `Schedule` where (`Schedule`.`date` > curdate());

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Coach`
--
ALTER TABLE `Coach`
  ADD CONSTRAINT `Coach_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `Team` (`team_id`);

--
-- Constraints for table `Conference`
--
ALTER TABLE `Conference`
  ADD CONSTRAINT `Conference_ibfk_1` FOREIGN KEY (`league_id`) REFERENCES `League` (`league_id`);

--
-- Constraints for table `Division`
--
ALTER TABLE `Division`
  ADD CONSTRAINT `Division_ibfk_1` FOREIGN KEY (`conference_id`) REFERENCES `Conference` (`conference_id`);

--
-- Constraints for table `LManager_Conference`
--
ALTER TABLE `LManager_Conference`
  ADD CONSTRAINT `LManager_Conference_ibfk_1` FOREIGN KEY (`conference_id`) REFERENCES `Conference` (`conference_id`),
  ADD CONSTRAINT `LManager_Conference_ibfk_2` FOREIGN KEY (`leaguemanager_id`) REFERENCES `League_Manager` (`leaguemanager_id`);

--
-- Constraints for table `LManager_Division`
--
ALTER TABLE `LManager_Division`
  ADD CONSTRAINT `LManager_Division_ibfk_1` FOREIGN KEY (`division_id`) REFERENCES `Division` (`division_id`),
  ADD CONSTRAINT `LManager_Division_ibfk_2` FOREIGN KEY (`leaguemanager_id`) REFERENCES `League_Manager` (`leaguemanager_id`);

--
-- Constraints for table `LManager_League`
--
ALTER TABLE `LManager_League`
  ADD CONSTRAINT `LManager_League_ibfk_1` FOREIGN KEY (`league_id`) REFERENCES `League` (`league_id`),
  ADD CONSTRAINT `LManager_League_ibfk_2` FOREIGN KEY (`leaguemanager_id`) REFERENCES `League_Manager` (`leaguemanager_id`);

--
-- Constraints for table `LManager_Schedule`
--
ALTER TABLE `LManager_Schedule`
  ADD CONSTRAINT `LManager_Schedule_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `Schedule` (`schedule_id`),
  ADD CONSTRAINT `LManager_Schedule_ibfk_2` FOREIGN KEY (`leaguemanager_id`) REFERENCES `League_Manager` (`leaguemanager_id`);

--
-- Constraints for table `LManager_Team`
--
ALTER TABLE `LManager_Team`
  ADD CONSTRAINT `LManager_Team_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `Team` (`team_id`),
  ADD CONSTRAINT `LManager_Team_ibfk_2` FOREIGN KEY (`leaguemanager_id`) REFERENCES `League_Manager` (`leaguemanager_id`);

--
-- Constraints for table `Player`
--
ALTER TABLE `Player`
  ADD CONSTRAINT `Player_ibfk_1` FOREIGN KEY (`teammanager_id`) REFERENCES `Team_Manager` (`teammanager_id`);

--
-- Constraints for table `Player_Statistics`
--
ALTER TABLE `Player_Statistics`
  ADD CONSTRAINT `Player_Statistics_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `Player` (`player_id`);

--
-- Constraints for table `Team`
--
ALTER TABLE `Team`
  ADD CONSTRAINT `Team_ibfk_3` FOREIGN KEY (`Coach_id`) REFERENCES `Coach` (`Coach_id`),
  ADD CONSTRAINT `Team_ibfk_1` FOREIGN KEY (`division_id`) REFERENCES `Division` (`division_id`),
  ADD CONSTRAINT `Team_ibfk_2` FOREIGN KEY (`teammanager_id`) REFERENCES `Team_Manager` (`teammanager_id`);

--
-- Constraints for table `TManager_Undrafted`
--
ALTER TABLE `TManager_Undrafted`
  ADD CONSTRAINT `TManager_Undrafted_ibfk_1` FOREIGN KEY (`teammanager_id`) REFERENCES `Team_Manager` (`teammanager_id`),
  ADD CONSTRAINT `TManager_Undrafted_ibfk_2` FOREIGN KEY (`UndraftedP_id`) REFERENCES `Undrafted_Player` (`UndraftedP_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
