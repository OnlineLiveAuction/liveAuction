-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2021 at 01:59 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineauction`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL,
  `categoryName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `categoryName`) VALUES
(1, 'Vehicle');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `sellerID` int(11) NOT NULL,
  `productName` varchar(45) NOT NULL,
  `productPicture` blob DEFAULT NULL,
  `productDescription` varchar(255) NOT NULL,
  `startTime` varchar(255) NOT NULL,
  `stopTime` varchar(255) DEFAULT NULL,
  `bidCount` int(11) NOT NULL,
  `productcol` varchar(45) DEFAULT NULL,
  `winnerID` int(11) DEFAULT NULL,
  `closingPrice` int(11) DEFAULT NULL,
  `productStatus` varchar(45) DEFAULT NULL,
  `categoryID` int(11) DEFAULT NULL,
  `productMinPrice` int(11) NOT NULL,
  `biddingDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `sellerID`, `productName`, `productPicture`, `productDescription`, `startTime`, `stopTime`, `bidCount`, `productcol`, `winnerID`, `closingPrice`, `productStatus`, `categoryID`, `productMinPrice`, `biddingDate`) VALUES
(1, 1, '123', NULL, 'sfdsdfds', '00:34', NULL, 0, '12', NULL, NULL, 'not sold', 1, 123, '2021-01-04'),
(2, 1, '12', NULL, 'QWER', '00:34', NULL, 0, 'WErr', NULL, NULL, 'not sold', 1, 123, '2018-06-21'),
(3, 1, 'Point', NULL, 'sdjfbsdjf', '00:23', NULL, 0, 'CXolo', NULL, NULL, 'not sold', 1, 123, '2020-10-14'),
(4, 2, 'QWEProd', NULL, 'sdhfkj', '00:21', NULL, 0, 'sdfinds', NULL, NULL, 'not sold', 1, 12333, '2021-01-20'),
(5, 1, 'ABCProd', NULL, 'asdas', '12:22', NULL, 0, 'asdas', NULL, NULL, 'not sold', 1, 121, '2021-01-04');

-- --------------------------------------------------------

--
-- Table structure for table `productregistration`
--

CREATE TABLE `productregistration` (
  `bidderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productregistration`
--

INSERT INTO `productregistration` (`bidderID`, `productID`) VALUES
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `userprofile`
--

CREATE TABLE `userprofile` (
  `userID` int(11) NOT NULL,
  `userName` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contactNo` varchar(45) DEFAULT NULL,
  `birthdate` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userprofile`
--

INSERT INTO `userprofile` (`userID`, `userName`, `email`, `contactNo`, `birthdate`, `street`, `city`, `state`, `country`, `pincode`, `password`, `Name`) VALUES
(1, 'crg', 'crg213', '99', '45', 'sadas', 'asdsa', 'sasad', 'sadas', 45, '12345', 'Chinmay Gosavi'),
(2, 'qwe', 'qwe@crg', '12312', '213123', '12312', '12312', '1231', '12312', 213, '12345', 'CG');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`),
  ADD UNIQUE KEY `categoryID_UNIQUE` (`categoryID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`),
  ADD UNIQUE KEY `idProduct_UNIQUE` (`productID`),
  ADD UNIQUE KEY `sellerID_UNIQUE` (`sellerID`,`winnerID`),
  ADD KEY `winnerID_idx` (`winnerID`),
  ADD KEY `categoryID_fk_idx` (`categoryID`);

--
-- Indexes for table `productregistration`
--
ALTER TABLE `productregistration`
  ADD PRIMARY KEY (`bidderID`,`productID`);

--
-- Indexes for table `userprofile`
--
ALTER TABLE `userprofile`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userID_UNIQUE` (`userID`),
  ADD UNIQUE KEY `userName_UNIQUE` (`userName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `userprofile`
--
ALTER TABLE `userprofile`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `categoryID_fk` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`),
  ADD CONSTRAINT `sellerID_fk` FOREIGN KEY (`sellerID`) REFERENCES `userprofile` (`userID`),
  ADD CONSTRAINT `winnerID_fk` FOREIGN KEY (`winnerID`) REFERENCES `userprofile` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
