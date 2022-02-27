-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2022 at 09:14 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `home_care_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `complaint_tbl`
--

CREATE TABLE `complaint_tbl` (
  `complaint_id` int(11) NOT NULL,
  `worker_name` varchar(30) NOT NULL,
  `complaint` varchar(300) NOT NULL,
  `date` date NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaint_tbl`
--

INSERT INTO `complaint_tbl` (`complaint_id`, `worker_name`, `complaint`, `date`, `role_id`) VALUES
(1, 'xyz', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillu', '2022-02-13', 6);

-- --------------------------------------------------------

--
-- Table structure for table `role_db`
--

CREATE TABLE `role_db` (
  `role_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(15) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role_db`
--

INSERT INTO `role_db` (`role_id`, `email`, `password`, `role`, `status`) VALUES
(1, 'admin@gmail.com', 'admin', 'admin', 1),
(6, 'vt9796@gmail.com', '123456', '1', 0),
(33, 'V@m.com', 'V@blah123', '1', 1),
(34, 'koice@m.com', 'Koice@123', '1', 1),
(35, 'pra@m.com', 'Pra@1234', '1', 0),
(36, 'f@m.com', 'Vim@l160', '1', 1),
(42, 'blah@m.com', '123456', '2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `services_db`
--

CREATE TABLE `services_db` (
  `services_id` int(11) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `service_type` varchar(100) NOT NULL,
  `service_price` int(11) NOT NULL,
  `service_desc` varchar(500) NOT NULL,
  `tags` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services_db`
--

INSERT INTO `services_db` (`services_id`, `service_name`, `service_type`, `service_price`, `service_desc`, `tags`) VALUES
(5, 'Electrician', '1', 500, 'Provides Electrical Services', 'fan, lights, motor'),
(6, 'Plumber', '2', 600, 'Provides Plumbing services', 'water');

-- --------------------------------------------------------

--
-- Table structure for table `service_type`
--

CREATE TABLE `service_type` (
  `type_id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_type`
--

INSERT INTO `service_type` (`type_id`, `type`) VALUES
(1, 'Electrician'),
(2, 'Plumber'),
(3, 'Carpenter'),
(4, 'Mechanic'),
(5, 'AC Mechanic'),
(6, 'Home Nurse'),
(7, 'Painter'),
(8, 'Cleaner');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(40) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `place` varchar(80) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fname`, `phone`, `place`, `role_id`) VALUES
(124, 'Vimal', '9149900160', 'Koovapally', 6),
(128, 'Vimal', '9149900160', 'blah', 33),
(144, 'Joice', '9898989898', 'katti', 34),
(145, 'pradeeshk', '1122334455', 'jjjjj', 35),
(146, 'ffff', '1212121212', 'gtgtg', 36),
(151, 'sdfsdfg', '9149900000', 'Koovapally', 42);

-- --------------------------------------------------------

--
-- Table structure for table `worker`
--

CREATE TABLE `worker` (
  `worker_id` int(11) NOT NULL,
  `aadhar_no` varchar(30) NOT NULL,
  `profession` varchar(30) NOT NULL,
  `age` int(10) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `role_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `worker`
--

INSERT INTO `worker` (`worker_id`, `aadhar_no`, `profession`, `age`, `gender`, `role_id`) VALUES
(5, '123456789', 'Carpenter', 23, 'male', 42);

-- --------------------------------------------------------

--
-- Table structure for table `work_db`
--

CREATE TABLE `work_db` (
  `work_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complaint_tbl`
--
ALTER TABLE `complaint_tbl`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `role_db`
--
ALTER TABLE `role_db`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `services_db`
--
ALTER TABLE `services_db`
  ADD PRIMARY KEY (`services_id`);

--
-- Indexes for table `service_type`
--
ALTER TABLE `service_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`worker_id`);

--
-- Indexes for table `work_db`
--
ALTER TABLE `work_db`
  ADD PRIMARY KEY (`work_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `complaint_tbl`
--
ALTER TABLE `complaint_tbl`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role_db`
--
ALTER TABLE `role_db`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `services_db`
--
ALTER TABLE `services_db`
  MODIFY `services_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `service_type`
--
ALTER TABLE `service_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `worker`
--
ALTER TABLE `worker`
  MODIFY `worker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `work_db`
--
ALTER TABLE `work_db`
  MODIFY `work_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
