-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2019 at 04:29 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `project`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `leaderboard`()
    NO SQL
select q.quizname,s.score,s.totalscore,st.name,s.mail from score s,student st,quiz q where s.mail=st.mail and q.quizid=s.quizid order by score DESC$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE IF NOT EXISTS `dept` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`dept_id`, `dept_name`) VALUES
(1, 'CSE'),
(2, 'ISE'),
(3, 'ECE'),
(4, 'EEE');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `qs` varchar(200) NOT NULL,
  `op1` varchar(30) NOT NULL,
  `op2` varchar(30) NOT NULL,
  `op3` varchar(30) NOT NULL,
  `answer` varchar(30) NOT NULL,
  `quizid` int(11) NOT NULL,
  UNIQUE KEY `qs` (`qs`),
  KEY `quizid` (`quizid`),
  KEY `quizid_2` (`quizid`),
  KEY `quizid_3` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`qs`, `op1`, `op2`, `op3`, `answer`, `quizid`) VALUES
('/ Assume that integers take 4 bytes.<br>  #include<iostream> <br>    using namespace std; <br>       class Test  { <br>   static int i;<br>    int j;<br>  }; <br>    int Test::i; <br>    int main() { ', '1', '2', '3', '4', 5),
('choose correct jumble word of EERT?', 'ETRE', 'REET', 'TEER', 'TREE  ', 25),
('How many letters are there in alphabet?', '23', '25', '45', '26', 25),
('How many types of noun?', '4  ', '7', ' 9', '8  ', 25),
('who invented python?', 'Dennis Ritchie', 'James Gosling', 'Bjarne Stroustrup', 'Guido Van Rossum', 26),
('which country owns python?', 'Germany', 'India', 'china', 'Netherlands', 26),
('when was python first released', '04-02-2001', '23-04-1999', '12-12-2000', '20-02-1991', 26);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
  `quizid` int(11) NOT NULL AUTO_INCREMENT,
  `quizname` varchar(20) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mail` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`quizid`),
  KEY `mail` (`mail`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`quizid`, `quizname`, `date_created`, `mail`) VALUES
(25, 'english', '2023-01-15 14:33:59', 'bhaskar@gmail.com'),
(26, 'python', '2023-01-15 14:36:10', 'dhruthi@gmail.com');


--
-- Triggers `quiz`
--
DROP TRIGGER IF EXISTS `ondeleteqs`;
DELIMITER //
CREATE TRIGGER `ondeleteqs` AFTER DELETE ON `quiz`
 FOR EACH ROW delete from questions where questions.quizid=old.quizid
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE IF NOT EXISTS `score` (
  `slno` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL,
  `quizid` int(11) NOT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `totalscore` int(11) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`slno`),
  KEY `quizid` (`quizid`),
  KEY `mail` (`mail`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`slno`, `score`, `quizid`, `mail`, `totalscore`, `remark`) VALUES
(43, 0, 25, 'hitha@gmail.com', 3, 'bad'),
(44, 3, 26, 'anusha@gmail.com', 3, 'good')
(45, 2, 25, 'anki@gmail.com', 3, 'good'),
(46, 1, 26, 'anki@gmail.com', 3, 'good'),
(47, 2, 25, 'ananya@gmail.com', 3, 'good'),
(49, 2, 25, 'lishan@gmail.com', 3, 'good'),
(50, 3, 25, 'lishan@gmail.com', 3, 'good');

--
-- Triggers `score`
--
DROP TRIGGER IF EXISTS `remarks`;
DELIMITER //
CREATE TRIGGER `remarks` BEFORE INSERT ON `score`
 FOR EACH ROW set NEW.remark = if(NEW.score = 0, 'bad', 'good')
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `staffid` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `phno` varchar(10) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `pw` varchar(200) NOT NULL,
  `dept` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`mail`),
  UNIQUE KEY `mail` (`mail`,`phno`),
  UNIQUE KEY `staffid` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffid`, `name`, `mail`, `phno`, `gender`, `DOB`, `pw`, `dept`) VALUES
('678', 'bhaskar', 'bhaskar@gmail.com', '6789054321', 'M', '1990-12-20', 'gaW1Zx8kh0Dz', 'EEE'),
('234', 'dhruthi', 'dhruthi@gmail.com', '6543219084', 'F', '1991-02-15', 'gaW1Zx8kh0Dz', 'ISE');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `usn` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `phno` varchar(10) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `pw` varchar(200) NOT NULL,
  `dept` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`mail`),
  UNIQUE KEY `mail` (`mail`),
  UNIQUE KEY `phno` (`phno`),
  UNIQUE KEY `usn` (`usn`),
  KEY `dept` (`dept`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`usn`, `name`, `mail`, `phno`, `gender`, `DOB`, `pw`, `dept`) VALUES
('1jt20ee035', 'ananya', 'ananya@gmail.com', '2345678999', 'F', '2001-03-23', 'gaW1Zx8kh0Dz', 'EEE'),
('1jt20cs055', 'ankitha', 'ankitha@gmail.com', '7483450801', 'F', '2000-06-09', 'gaW1Zx8kh0Dz', 'CSE'),
('1jt20cs010', 'Anusha', 'anusha@gmail.com', '8974321098', 'F', '2000-06-09', 'gaW1Zx8kh0Dz', 'CSE'),
('1jt20ee043', 'bavana', 'bavana@gmail.com', '9087654321', 'F', '2002-07-23', 'gaW1Zx8kh0Dz', 'EEE'),
('1jt19is28', 'hitha', 'hitha@gmail.com', '9844199326', 'F', '2001-05-06', 'gaW1Zx8kh0Dz', 'ISE'),
('1jt20ec011', 'lishan', 'lishan@gmail.com', '2345678901', 'M', '2001-04-23', 'gaW1Zx8kh0Dz', 'ECE');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`mail`) REFERENCES `staff` (`mail`) ON DELETE CASCADE;

--
-- Constraints for table `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `score_ibfk_1` FOREIGN KEY (`quizid`) REFERENCES `quiz` (`quizid`) ON DELETE CASCADE,
  ADD CONSTRAINT `score_ibfk_2` FOREIGN KEY (`mail`) REFERENCES `student` (`mail`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
