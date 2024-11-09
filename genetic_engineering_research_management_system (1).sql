-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2024 at 11:23 PM
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
-- Database: `genetic_engineering_research_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `experiment`
--

CREATE TABLE `experiment` (
  `Experiment_id` int(11) NOT NULL,
  `Project_id` int(11) DEFAULT NULL,
  `Experiment_Name` varchar(100) NOT NULL,
  `Objective` text DEFAULT NULL,
  `Start_date` date DEFAULT NULL,
  `End_date` date DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fundingsource`
--

CREATE TABLE `fundingsource` (
  `Funding_id` int(11) NOT NULL,
  `Project_id` int(11) DEFAULT NULL,
  `Funding_agency` varchar(100) DEFAULT NULL,
  `Amount` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gene`
--

CREATE TABLE `gene` (
  `Gene_id` int(11) NOT NULL,
  `Gene_Symbol` varchar(50) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Chromosome` varchar(20) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Name_of_Organism` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `geneticmodification`
--

CREATE TABLE `geneticmodification` (
  `Modification_id` int(11) NOT NULL,
  `Experiment_id` int(11) DEFAULT NULL,
  `Gene_id` int(11) DEFAULT NULL,
  `Modification_type` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Impact` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `labequipment`
--

CREATE TABLE `labequipment` (
  `Equipment_id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Maintenance_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `Project_id` int(11) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `Start_date` date DEFAULT NULL,
  `End_date` date DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Budget` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `researcher`
--

CREATE TABLE `researcher` (
  `Researcher_id` int(11) NOT NULL,
  `First_name` varchar(50) NOT NULL,
  `Last_name` varchar(50) NOT NULL,
  `Position` varchar(100) DEFAULT NULL,
  `Specialty` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `Project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `Result_id` int(11) NOT NULL,
  `Experiment_id` int(11) DEFAULT NULL,
  `Gene_id` int(11) DEFAULT NULL,
  `Observation` text DEFAULT NULL,
  `Measurement` decimal(10,2) DEFAULT NULL,
  `Date_recorded` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sample`
--

CREATE TABLE `sample` (
  `Sample_id` int(11) NOT NULL,
  `Experiment_id` int(11) DEFAULT NULL,
  `Gene_id` int(11) DEFAULT NULL,
  `Collection_date` date DEFAULT NULL,
  `Condition1` varchar(100) DEFAULT NULL,
  `Storage_Location` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `experiment`
--
ALTER TABLE `experiment`
  ADD PRIMARY KEY (`Experiment_id`),
  ADD KEY `Project_id` (`Project_id`);

--
-- Indexes for table `fundingsource`
--
ALTER TABLE `fundingsource`
  ADD PRIMARY KEY (`Funding_id`),
  ADD KEY `Project_id` (`Project_id`);

--
-- Indexes for table `gene`
--
ALTER TABLE `gene`
  ADD PRIMARY KEY (`Gene_id`);

--
-- Indexes for table `geneticmodification`
--
ALTER TABLE `geneticmodification`
  ADD PRIMARY KEY (`Modification_id`),
  ADD KEY `Experiment_id` (`Experiment_id`),
  ADD KEY `Gene_id` (`Gene_id`);

--
-- Indexes for table `labequipment`
--
ALTER TABLE `labequipment`
  ADD PRIMARY KEY (`Equipment_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`Project_id`);

--
-- Indexes for table `researcher`
--
ALTER TABLE `researcher`
  ADD PRIMARY KEY (`Researcher_id`),
  ADD KEY `Project_id` (`Project_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`Result_id`),
  ADD KEY `Experiment_id` (`Experiment_id`),
  ADD KEY `Gene_id` (`Gene_id`);

--
-- Indexes for table `sample`
--
ALTER TABLE `sample`
  ADD PRIMARY KEY (`Sample_id`),
  ADD KEY `Experiment_id` (`Experiment_id`),
  ADD KEY `Gene_id` (`Gene_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `experiment`
--
ALTER TABLE `experiment`
  ADD CONSTRAINT `experiment_ibfk_1` FOREIGN KEY (`Project_id`) REFERENCES `project` (`Project_id`);

--
-- Constraints for table `fundingsource`
--
ALTER TABLE `fundingsource`
  ADD CONSTRAINT `fundingsource_ibfk_1` FOREIGN KEY (`Project_id`) REFERENCES `project` (`Project_id`);

--
-- Constraints for table `geneticmodification`
--
ALTER TABLE `geneticmodification`
  ADD CONSTRAINT `geneticmodification_ibfk_1` FOREIGN KEY (`Experiment_id`) REFERENCES `experiment` (`Experiment_id`),
  ADD CONSTRAINT `geneticmodification_ibfk_2` FOREIGN KEY (`Gene_id`) REFERENCES `gene` (`Gene_id`);

--
-- Constraints for table `researcher`
--
ALTER TABLE `researcher`
  ADD CONSTRAINT `researcher_ibfk_1` FOREIGN KEY (`Project_id`) REFERENCES `project` (`Project_id`);

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`Experiment_id`) REFERENCES `experiment` (`Experiment_id`),
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`Gene_id`) REFERENCES `gene` (`Gene_id`);

--
-- Constraints for table `sample`
--
ALTER TABLE `sample`
  ADD CONSTRAINT `sample_ibfk_1` FOREIGN KEY (`Experiment_id`) REFERENCES `experiment` (`Experiment_id`),
  ADD CONSTRAINT `sample_ibfk_2` FOREIGN KEY (`Gene_id`) REFERENCES `gene` (`Gene_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
