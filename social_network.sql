-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2015 at 09:01 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `social_network`
--

-- --------------------------------------------------------

--
-- Table structure for table `status_likes`
--

CREATE TABLE IF NOT EXISTS `status_likes` (
`id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `liked_by` int(11) NOT NULL,
  `liked_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status_likes`
--

INSERT INTO `status_likes` (`id`, `status_id`, `liked_by`, `liked_date`) VALUES
(1, 1, 2, '2015-11-27 07:35:31'),
(2, 1, 1, '2015-11-27 07:43:17'),
(3, 2, 2, '2015-11-27 07:45:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT NULL,
  `activation_code` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_date`, `modified_date`, `activation_code`, `is_active`) VALUES
(1, 'dixanta', 'dixanta@gmail.com', 'b9f74cd9a948a0ecc0609de5e1bd846a05304cfc', '2015-11-27 06:59:43', NULL, '', 1),
(2, 'chiran', 'chiran.np@gmail.com', '38208c9e0d455d0654c60afb44ffa0dca7095287', '2015-11-27 07:14:10', NULL, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_friends`
--

CREATE TABLE IF NOT EXISTS `user_friends` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `friend_to` int(11) NOT NULL,
  `friend_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `follow` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE IF NOT EXISTS `user_profiles` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` enum('M','F','O') DEFAULT NULL,
  `dob` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`user_id`, `first_name`, `last_name`, `gender`, `dob`) VALUES
(1, 'Dixanta', 'Shrestha', 'M', '1981-11-15'),
(2, 'Chiran', 'Neupane', 'M', '1986-06-27');

-- --------------------------------------------------------

--
-- Table structure for table `user_status`
--

CREATE TABLE IF NOT EXISTS `user_status` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_text` text NOT NULL,
  `status_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delete_flag` tinyint(1) NOT NULL,
  `delete_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_status`
--

INSERT INTO `user_status` (`id`, `user_id`, `status_text`, `status_date`, `delete_flag`, `delete_date`) VALUES
(1, 1, 'I guess I fall in love with someone ;)', '2015-11-27 07:11:26', 0, NULL),
(2, 2, 'Hello world', '2015-11-27 07:43:46', 0, NULL),
(3, 1, 'a for apple', '2015-11-27 07:47:29', 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `status_likes`
--
ALTER TABLE `status_likes`
 ADD PRIMARY KEY (`id`), ADD KEY `status_id` (`status_id`), ADD KEY `liked_by` (`liked_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_friends`
--
ALTER TABLE `user_friends`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
 ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_status`
--
ALTER TABLE `user_status`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `status_likes`
--
ALTER TABLE `status_likes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_friends`
--
ALTER TABLE `user_friends`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_status`
--
ALTER TABLE `user_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `status_likes`
--
ALTER TABLE `status_likes`
ADD CONSTRAINT `status_likes_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `user_status` (`id`),
ADD CONSTRAINT `status_likes_ibfk_2` FOREIGN KEY (`liked_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
ADD CONSTRAINT `user_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_status`
--
ALTER TABLE `user_status`
ADD CONSTRAINT `user_status_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
