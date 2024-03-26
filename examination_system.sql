-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2024 at 07:11 PM
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
-- Database: `examination_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `exam_id` int(11) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `exam_name` varchar(255) NOT NULL,
  `exam_topics` text NOT NULL,
  `total_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`exam_id`, `admin_name`, `admin_email`, `admin_password`, `exam_name`, `exam_topics`, `total_time`) VALUES
(1, 'CollegeBoard', 'collegeboard@gmail.com', '1234abcd', 'SAT', 'English and Math', 180),
(2, 'IITG', 'iitg@iitg.com', 'chsihcwioh', 'HS 100', 'English', 10),
(3, 'IITG', 'iitg@iitg.ac.in', 'dbsd', 'try', 'test', 4),
(4, 'IITG', 'arushiaro@gmail.com', 'gyg', 'try2', 'nn', 6),
(7, 'IITG', 'bhb@ggg', 'bbb', 'tryyy', 'ppp', 77);

-- --------------------------------------------------------

--
-- Table structure for table `exam_slots`
--

CREATE TABLE `exam_slots` (
  `slot_id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `slot_datetime` datetime DEFAULT NULL,
  `max_capacity` int(11) DEFAULT NULL,
  `fees` int(11) DEFAULT NULL,
  `booked_capacity` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam_slots`
--

INSERT INTO `exam_slots` (`slot_id`, `exam_id`, `slot_datetime`, `max_capacity`, `fees`, `booked_capacity`) VALUES
(111, 1, '2024-03-29 21:41:18', 10, 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `question` text NOT NULL,
  `options` text NOT NULL,
  `correct_answer` varchar(255) NOT NULL,
  `total_points` int(11) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `difficulty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `exam_id`, `question`, `options`, `correct_answer`, `total_points`, `topic`, `difficulty`) VALUES
(1, NULL, 'what am i doing', '\"[\\\"sleeping\\\",\\\"standing\\\",\\\"texting\\\",\\\"walking\\\"]\"', 'walking', 4, 'gk', 1),
(2, NULL, 'Which of the following is correct gramatically', '\"[\\\"india is a state\\\",\\\"India is a state\\\",\\\"India is a state.\\\",\\\"india is a country\\\"]\"', 'India is a state.', 1, 'English', 1),
(3, NULL, 'Which of the following is correct gramatically', '\"[\\\"A apple\\\",\\\"an apple\\\",\\\"the apple\\\",\\\"a orange\\\"]\"', 'an apple', 1, 'english', 1),
(4, NULL, 'Which of the following is correct gramatically', '\"[\\\"1\\\",\\\"2\\\",\\\"3\\\",\\\"4\\\"]\"', '0', 1, 'gg', 1),
(5, NULL, 'what am i doing', '\"[\\\"t\\\",\\\"h\\\",\\\"r\\\",\\\"e\\\"]\"', '2', 6, 'gg', 1),
(6, 7, 'Which of the following is correct gramatically', '\"[\\\"1\\\",\\\"2\\\",\\\"3\\\",\\\"4\\\"]\"', '1', 11, 'nn', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `slot_id` int(11) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `educationLevel` varchar(255) DEFAULT NULL,
  `educationStatus` varchar(255) DEFAULT NULL,
  `completionYear` int(11) DEFAULT NULL,
  `schoolName` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `password`, `educationLevel`, `educationStatus`, `completionYear`, `schoolName`, `major`) VALUES
(1, 'Arushi', 'arushiaro@gmail.com', '12345678', 'bachelors', 'ongoing', 0, 'IIT Guwahati', 'DSAI'),
(3, 'Arushi', 'arushi.kumar@gmail.com', '12345678', 'bachelors', 'ongoing', 0, 'IIT Guwahati', 'DSAI'),
(4, 'Arushi', 'arushi@gmail.com', '12345678', 'bachelors', 'ongoing', 0, 'IIT Guwahati', 'DSAI');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`exam_id`),
  ADD UNIQUE KEY `exam_name` (`exam_name`);

--
-- Indexes for table `exam_slots`
--
ALTER TABLE `exam_slots`
  ADD PRIMARY KEY (`slot_id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `exam_id` (`exam_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `exam_id` (`exam_id`),
  ADD KEY `slot_id` (`slot_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `exam_slots`
--
ALTER TABLE `exam_slots`
  MODIFY `slot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exam_slots`
--
ALTER TABLE `exam_slots`
  ADD CONSTRAINT `exam_slots_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`);

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `sessions_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`),
  ADD CONSTRAINT `sessions_ibfk_3` FOREIGN KEY (`slot_id`) REFERENCES `exam_slots` (`slot_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
