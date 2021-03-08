-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2021 at 06:39 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `cyclo`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `ID` int(11) NOT NULL,
  `CODE` varchar(50) NOT NULL,
  `BRAND` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(1024) NOT NULL,
  `PRICE` decimal(18,2) NOT NULL,
  `QUANTITY` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`ID`, `CODE`, `BRAND`, `DESCRIPTION`, `PRICE`, `QUANTITY`) VALUES
(1, 'AB001', 'Norco', 'Vélo pour la montagne. 21 vitesses ', '2500.00', 2),
(2, 'AB002', 'Peugeot', 'Vélo pour la vie de citadin. ', '807.25', 1),
(3, 'AB003', 'Trek', 'Vélo pour faire du freestyle.', '730.55', 11),
(4, 'AB004', 'CCN', 'Vélo pour enfant. 7 vitesses', '110.00', 9),
(5, 'AB005', 'Olympique Ridley', 'Vélo à vitesse unique. Très léger ', '1250.33', 10),
(6, 'AB006', 'SuperVelo', 'Il va la ou tu veux allé', '1230.45', 8);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `ID` int(11) NOT NULL,
  `USERID` int(11) NOT NULL,
  `ARTICLEID` int(11) NOT NULL,
  `INVOICENUMBER` varchar(50) NOT NULL,
  `SALEDATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`ID`, `USERID`, `ARTICLEID`, `INVOICENUMBER`, `SALEDATE`) VALUES
(5, 3, 3, '3', '2021-01-05 15:57:22'),
(6, 3, 2, '4', '2020-12-30 15:57:22'),
(7, 3, 1, '5', '2021-01-01 02:43:06'),
(8, 3, 3, '6', '2020-12-31 02:44:36'),
(9, 2, 1, '7', '2021-01-07 15:50:45'),
(10, 2, 6, '8', '2021-01-07 15:50:45'),
(11, 2, 1, '9', '2021-01-07 18:02:27'),
(12, 2, 2, '10', '2021-01-07 18:02:27');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `ID` int(11) NOT NULL,
  `SKEY` varchar(50) NOT NULL,
  `SVALUE` varchar(21792) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`ID`, `SKEY`, `SVALUE`) VALUES
(1, 'LASTINVOICENUMBER', '10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `IDCARD` varchar(50) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `LASTNAME` varchar(50) NOT NULL,
  `PHONE` varchar(50) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `ROLE` varchar(50) NOT NULL DEFAULT 'CLIENT'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `IDCARD`, `NAME`, `LASTNAME`, `PHONE`, `EMAIL`, `USERNAME`, `PASSWORD`, `ROLE`) VALUES
(1, '115870399', 'toto', 'tata', '(514)555-5555 ', 'admin@gmail.com', 'admin', 'admin', 'ADMIN'),
(2, '115870400', 'tutu', 'titi', '(450)777-7777', 'toto@gmail.com', 'client', 'client', 'CLIENT'),
(6, '1234567890', 'alex', 'grey', '(555)555-5555', 'julescesar@gmail.com', 'alex', '$2y$10$p04.o1a9G932g9mQ1YEYIOUwo2dkpdL2Ng3QJHWkB7qxHdttvedBS', 'CLIENT');

-- --------------------------------------------------------

--
-- Table structure for table `velo`
--

CREATE TABLE `velo` (
  `idVelo` int(11) NOT NULL,
  `marque` varchar(50) DEFAULT NULL,
  `modele` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `velo`
--

INSERT INTO `velo` (`idVelo`, `marque`, `modele`, `photo`) VALUES
(1, 'Norco', 'OffRoad', 'images/norco-fluid.jpg'),
(2, 'Trek', 'Fuel', 'images/trek_fuel_ex.jpeg');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwsales`
-- (See below for the actual view)
--
CREATE TABLE `vwsales` (
`ID` int(11)
,`USERID` int(11)
,`USERNAME` varchar(50)
,`ARTICLEID` int(11)
,`CODE` varchar(50)
,`BRAND` varchar(50)
,`DESCRIPTION` varchar(1024)
,`INVOICENUMBER` varchar(50)
,`SALEDATE` datetime
);

-- --------------------------------------------------------

--
-- Structure for view `vwsales`
--
DROP TABLE IF EXISTS `vwsales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwsales`  AS SELECT `s`.`ID` AS `ID`, `s`.`USERID` AS `USERID`, `u`.`USERNAME` AS `USERNAME`, `s`.`ARTICLEID` AS `ARTICLEID`, `a`.`CODE` AS `CODE`, `a`.`BRAND` AS `BRAND`, `a`.`DESCRIPTION` AS `DESCRIPTION`, `s`.`INVOICENUMBER` AS `INVOICENUMBER`, `s`.`SALEDATE` AS `SALEDATE` FROM ((`sales` `s` join `users` `u` on(`s`.`USERID` = `u`.`ID`)) join `articles` `a` on(`s`.`ARTICLEID` = `a`.`ID`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `CODE` (`CODE`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `SKEY` (`SKEY`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `IDCARD` (`IDCARD`),
  ADD UNIQUE KEY `PHONE` (`PHONE`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`),
  ADD UNIQUE KEY `USERNAME` (`USERNAME`);

--
-- Indexes for table `velo`
--
ALTER TABLE `velo`
  ADD PRIMARY KEY (`idVelo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `velo`
--
ALTER TABLE `velo`
  MODIFY `idVelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;