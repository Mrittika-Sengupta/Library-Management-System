-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2022 at 07:24 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library management system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL,
  `mobile` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `mobile`) VALUES
(29, 'admin', 'admin@gmail.com', 'admin@123', 1919333);

--
-- Triggers `admins`
--
DELIMITER $$
CREATE TRIGGER `updatelogsadmin` BEFORE UPDATE ON `admins` FOR EACH ROW INSERT INTO logs_admins VALUES(null,old.id,old.email,old.mobile,'updated')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL,
  `author_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `author_name`) VALUES
(137, 'David');

--
-- Triggers `authors`
--
DELIMITER $$
CREATE TRIGGER `insertlogauthors` AFTER INSERT ON `authors` FOR EACH ROW INSERT INTO logs_authors VALUES(null, new.author_name, new.author_id, 'insertion done')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatelogauthor` BEFORE UPDATE ON `authors` FOR EACH ROW INSERT INTO logs_authors VALUES(null,old.author_name,old.author_id,'updated')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `book_name` varchar(250) NOT NULL,
  `author_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `book_no` int(11) NOT NULL,
  `book_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `book_name`, `author_id`, `cat_id`, `book_no`, `book_price`) VALUES
(27, 'C Programming', 137, 1, 8, 350);

--
-- Triggers `books`
--
DELIMITER $$
CREATE TRIGGER `deletelogbooks` BEFORE DELETE ON `books` FOR EACH ROW INSERT INTO logs_books VALUES(null,old.book_name,old.author_id,old.cat_id,old.book_name,old.book_price,'Deleted')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertlogbooks` AFTER INSERT ON `books` FOR EACH ROW INSERT INTO logs_books VALUES(null,new.book_name,new.author_id,new.cat_id,new.book_no,new.book_price,'insertion done')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatelogsbook` AFTER UPDATE ON `books` FOR EACH ROW INSERT INTO logs_books VALUES(null,new.book_name,new.author_id,new.cat_id,new.book_no,new.book_price,'updated')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(1, 'Computer Science and Engineering'),
(5, 'Story'),
(10, 'database'),
(11, 'Novel '),
(12, 'Electrical Engineering');

--
-- Triggers `category`
--
DELIMITER $$
CREATE TRIGGER `deletelogcat` BEFORE DELETE ON `category` FOR EACH ROW INSERT INTO logs_cate VALUES(null,old.cat_id,old.cat_name,'deleted')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatelogcate` BEFORE UPDATE ON `category` FOR EACH ROW INSERT logs_cate VALUES(null,old.cat_id,old.cat_name,'updated')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `issued_books`
--

CREATE TABLE `issued_books` (
  `s_no` int(11) NOT NULL,
  `book_no` int(11) NOT NULL,
  `book_name` varchar(200) NOT NULL,
  `book_author` varchar(200) NOT NULL,
  `student_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `issue_date` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `issued_books`
--

INSERT INTO `issued_books` (`s_no`, `book_no`, `book_name`, `book_author`, `student_id`, `status`, `issue_date`) VALUES
(24, 8, 'C Programming', 'David', 23, 1, '2121-12-31');

--
-- Triggers `issued_books`
--
DELIMITER $$
CREATE TRIGGER `insertlogsissue` AFTER INSERT ON `issued_books` FOR EACH ROW INSERT INTO logs_issue VALUES (null,new.book_no,new.book_name,new.book_author,new.student_id,new.issue_date,'insertion done')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `logs_admins`
--

CREATE TABLE `logs_admins` (
  `id` int(11) NOT NULL,
  `admins_id` int(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `mobile` int(10) NOT NULL,
  `action` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logs_admins`
--

INSERT INTO `logs_admins` (`id`, `admins_id`, `email`, `mobile`, `action`) VALUES
(2, 29, 'admin@gmail.com', 1919333, 'updated');

-- --------------------------------------------------------

--
-- Table structure for table `logs_authors`
--

CREATE TABLE `logs_authors` (
  `id` int(11) NOT NULL,
  `author_name` varchar(100) NOT NULL,
  `author_id` int(20) NOT NULL,
  `action` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logs_authors`
--

INSERT INTO `logs_authors` (`id`, `author_name`, `author_id`, `action`) VALUES
(1, 'Rahim Ahmed', 129, 'insertion done'),
(2, 'ewe', 130, 'insertion done'),
(3, 'David', 131, 'insertion done'),
(5, 'David', 133, 'insertion done'),
(6, 'aaa', 134, 'insertion done'),
(7, 'Gosling', 135, 'insertion done'),
(9, 'James', 136, 'insertion done'),
(12, 'james', 136, 'updated'),
(13, 'David', 137, 'insertion done');

-- --------------------------------------------------------

--
-- Table structure for table `logs_books`
--

CREATE TABLE `logs_books` (
  `id` int(11) NOT NULL,
  `book_name` varchar(40) NOT NULL,
  `author_id` int(20) NOT NULL,
  `cat_id` int(20) NOT NULL,
  `book_no` int(20) NOT NULL,
  `book_price` int(20) NOT NULL,
  `action` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logs_books`
--

INSERT INTO `logs_books` (`id`, `book_name`, `author_id`, `cat_id`, `book_no`, `book_price`, `action`) VALUES
(1, 'Software engineering', 104, 1, 4518, 270, 'updated'),
(12, 'c', 3, 3, 3, 3, 'insertion done'),
(16, 'Java', 4, 3, 4, 400, 'insertion done'),
(17, 'c', 3, 3, 0, 3, 'Deleted'),
(18, 'Data structure', 102, 2, 0, 300, 'Deleted'),
(19, 'Java', 4, 3, 0, 400, 'Deleted'),
(20, 'C Programming', 1, 3, 8, 250, 'insertion done'),
(21, 'C Programming', 137, 3, 8, 250, 'updated'),
(22, 'C Programming', 137, 1, 8, 250, 'updated'),
(23, 'C Programming', 137, 1, 8, 350, 'updated');

-- --------------------------------------------------------

--
-- Table structure for table `logs_cate`
--

CREATE TABLE `logs_cate` (
  `id` int(11) NOT NULL,
  `cat_id` int(20) NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `action` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logs_cate`
--

INSERT INTO `logs_cate` (`id`, `cat_id`, `cat_name`, `action`) VALUES
(1, 1, 'Computer Science ', 'updated'),
(2, 2, 'Novel', 'updated'),
(3, 2, 'Novel and Friction', 'deleted'),
(4, 1, 'Computer Science Engineering', 'updated'),
(5, 4, 'Motivational', 'updated'),
(6, 4, 'Motivational', 'deleted'),
(7, 12, 'Electrical Engineering', 'updated'),
(8, 11, 'Novel and Friction', 'updated'),
(9, 1, 'Computer Science Engineering', 'updated');

-- --------------------------------------------------------

--
-- Table structure for table `logs_issue`
--

CREATE TABLE `logs_issue` (
  `id` int(11) NOT NULL,
  `book_no` int(20) NOT NULL,
  `book_author` varchar(40) NOT NULL,
  `book_name` varchar(100) NOT NULL,
  `student_id` int(20) NOT NULL,
  `issue_date` date NOT NULL,
  `action` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logs_issue`
--

INSERT INTO `logs_issue` (`id`, `book_no`, `book_author`, `book_name`, `student_id`, `issue_date`, `action`) VALUES
(1, 54, 'xyz', 'ewe', 21, '2121-12-31', 'insertion done'),
(2, 54, 'C Programming', 'David', 21, '2121-12-31', 'insertion done'),
(3, 8, 'C Programming', 'David', 23, '2121-12-31', 'insertion done'),
(4, 8, 'C Programming', 'David', 25, '2022-01-01', 'insertion done');

-- --------------------------------------------------------

--
-- Table structure for table `logs_users`
--

CREATE TABLE `logs_users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` int(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `action` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logs_users`
--

INSERT INTO `logs_users` (`id`, `name`, `email`, `mobile`, `address`, `action`) VALUES
(1, 'user', 'user@gmail.com', 192637263, 'xyz,Dhaka', 'updated'),
(2, 'user', 'user@gmail.com', 1944444, 'XYZA,Dhaka', 'updated'),
(3, 'Donald', 'donald@gmail.com', 1943433, 'ABC Road,Dhaka', 'updated');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `mobile` int(10) NOT NULL,
  `address` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `mobile`, `address`) VALUES
(23, 'user', 'user@gmail.com', 'user@123456', 1944444, 'XYZA,Dhaka'),
(25, 'Donald', 'donald@gmail.com', 'donald12', 1943433, 'ABC Road,Dhaka');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `updateloguser` BEFORE UPDATE ON `users` FOR EACH ROW INSERT INTO logs_users VALUES(null,old.name,old.email,old.mobile,old.address,'updated')
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `issued_books`
--
ALTER TABLE `issued_books`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `logs_admins`
--
ALTER TABLE `logs_admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs_authors`
--
ALTER TABLE `logs_authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs_books`
--
ALTER TABLE `logs_books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs_cate`
--
ALTER TABLE `logs_cate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs_issue`
--
ALTER TABLE `logs_issue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs_users`
--
ALTER TABLE `logs_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `issued_books`
--
ALTER TABLE `issued_books`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `logs_admins`
--
ALTER TABLE `logs_admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `logs_authors`
--
ALTER TABLE `logs_authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `logs_books`
--
ALTER TABLE `logs_books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `logs_cate`
--
ALTER TABLE `logs_cate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `logs_issue`
--
ALTER TABLE `logs_issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `logs_users`
--
ALTER TABLE `logs_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
