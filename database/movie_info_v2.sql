-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2025 at 11:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie_info`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `Person_ID` int(11) NOT NULL,
  `Actor_Name` varchar(100) NOT NULL,
  `Birth_Year` int(11) NOT NULL,
  `No_Of_Films` int(11) NOT NULL,
  `No_Of_Awards` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`Person_ID`, `Actor_Name`, `Birth_Year`, `No_Of_Films`, `No_Of_Awards`) VALUES
(11, 'Uttam Kumar', 1926, 190, 150),
(12, 'Razzak', 1942, 120, 100),
(7, 'Aparna Sen', 1945, 73, 43),
(6, 'Goutam Ghose', 1950, 3, 1),
(8, 'Kaushik Ganguly', 1968, 22, 7),
(10, 'Soumitra Chatterjee', 1935, 250, 220),
(4, 'Anjan Dutt', 1953, 39, 10);

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `Person_ID` int(11) NOT NULL,
  `Director_Name` varchar(100) NOT NULL,
  `Birth_Year` int(11) NOT NULL,
  `No_Of_Films` int(11) NOT NULL,
  `No_Of_Awards` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`Person_ID`, `Director_Name`, `Birth_Year`, `No_Of_Films`, `No_Of_Awards`) VALUES
(1, 'Zahir Raihan', 1935, 5, 5),
(2, 'Rajkumar Hirani', 1962, 5, 9),
(3, 'Satyajit Ray', 1921, 45, 55),
(4, 'Anjan Dutt', 1953, 23, 17),
(5, 'Rituparno Ghosh', 1963, 20, 15),
(6, 'Goutam Ghose', 1950, 12, 8),
(7, 'Aparna Sen', 1945, 12, 7),
(8, 'Kaushik Ganguly', 1968, 23, 30);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `Movie_ID` int(11) NOT NULL,
  `Movie_Name` varchar(50) DEFAULT NULL,
  `Genre` varchar(20) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `IMDB_Rating` float DEFAULT NULL,
  `Director_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`Movie_ID`, `Movie_Name`, `Genre`, `Year`, `IMDB_Rating`, `Director_ID`) VALUES
(1, 'Pather Panchali', 'Drama', 1955, 8.5, 3),
(2, 'Noukadubi', 'Drama', 2011, 7.6, 5),
(3, 'Abohomaan', 'Drama', 2009, 7.3, 5),
(4, 'Joi Baba Felunath', 'Thriller', 1979, 8, 3),
(5, 'Jibon Theke Neya', 'Drama', 1970, 9.4, 1),
(6, 'Moner Manush', 'Bioghaphy', 2010, 8, 6),
(7, 'Apur Panchali', 'Bioghaphy', 2013, 8.2, 8),
(8, 'Goynar Baksho', 'Comedy', 2013, 7.1, 7),
(9, 'Byomkesh O Agnibaan', 'Thriller', 2017, 7.4, 4),
(10, 'Byomkesh Bakshi', 'Thriller', 2010, 7.4, 4),
(11, 'PK', 'Fiction', 2014, 8.2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `movie_characters`
--

CREATE TABLE `movie_characters` (
  `Character_ID` int(11) NOT NULL,
  `Character_Name` varchar(100) NOT NULL,
  `Age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie_characters`
--

INSERT INTO `movie_characters` (`Character_ID`, `Character_Name`, `Age`) VALUES
(1, 'Apu', 7),
(2, 'Durga', 10),
(3, 'Harihar', 42),
(4, 'Sarbajaya', 35),
(5, 'Ramesh', 28),
(6, 'Hemnalini', 25),
(7, 'Nalinaksha', 30),
(8, 'Kamala', 20),
(9, 'Shikha', 21),
(10, 'Apratim', 26),
(11, 'Feluda', 25),
(12, 'Maganlal Meghraj', 35),
(13, 'Jatayu', 45),
(14, 'Topshe', 18),
(15, 'Ruku', 6),
(16, 'Faruk', 22),
(17, 'Bithi', 19),
(18, 'Sathi', 24),
(19, 'Lalon', NULL),
(20, 'Kaluah', 25),
(21, 'Siraj Saain', 45),
(22, 'Komli', 25),
(23, 'Subir Banerjee', NULL),
(24, 'Ashima', 24),
(25, 'Rashmoni', NULL),
(26, 'Somalata', 24),
(27, 'Chaitali', 18),
(28, 'Byomkesh Bakshi', 26),
(29, 'Ajit', 27),
(30, 'Malati', 16),
(31, 'Debkumar', 50),
(32, 'Doctor Anukul', 45),
(33, 'Prabhat', 27),
(34, 'Satyabati', 22),
(35, 'Anadi Babu', 55),
(36, 'PK', NULL),
(37, 'Jaggu', 26),
(38, 'Sarfaraz', 29),
(39, 'Tapasvi Maharaj', 50);

-- --------------------------------------------------------

--
-- Table structure for table `movie_character_relationship`
--

CREATE TABLE `movie_character_relationship` (
  `Character_ID` int(11) NOT NULL,
  `Movie_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie_character_relationship`
--

INSERT INTO `movie_character_relationship` (`Character_ID`, `Movie_ID`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 3),
(10, 3),
(11, 4),
(12, 4),
(13, 4),
(14, 4),
(15, 4),
(16, 5),
(17, 5),
(18, 5),
(19, 6),
(20, 6),
(21, 6),
(22, 6),
(23, 7),
(24, 7),
(25, 8),
(26, 8),
(27, 8),
(28, 9),
(28, 10),
(29, 9),
(29, 10),
(30, 9),
(31, 9),
(32, 9),
(33, 10),
(34, 9),
(34, 10),
(35, 10),
(36, 11),
(37, 11),
(38, 11),
(39, 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`Person_ID`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`Movie_ID`),
  ADD KEY `Director_ID` (`Director_ID`);

--
-- Indexes for table `movie_characters`
--
ALTER TABLE `movie_characters`
  ADD PRIMARY KEY (`Character_ID`);

--
-- Indexes for table `movie_character_relationship`
--
ALTER TABLE `movie_character_relationship`
  ADD PRIMARY KEY (`Character_ID`,`Movie_ID`),
  ADD KEY `Movie_ID` (`Movie_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`Director_ID`) REFERENCES `director` (`Person_ID`);

--
-- Constraints for table `movie_character_relationship`
--
ALTER TABLE `movie_character_relationship`
  ADD CONSTRAINT `movie_character_relationship_ibfk_1` FOREIGN KEY (`Character_ID`) REFERENCES `movie_characters` (`Character_ID`),
  ADD CONSTRAINT `movie_character_relationship_ibfk_2` FOREIGN KEY (`Movie_ID`) REFERENCES `movie` (`Movie_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
