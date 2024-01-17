-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 04, 2023 at 06:05 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `guitars.com`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `street` varchar(45) NOT NULL,
  `suburb` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `postcode` varchar(45) NOT NULL,
  `customerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`street`, `suburb`, `city`, `state`, `country`, `postcode`, `customerID`) VALUES
('404 Random Ave', 'Nowhere', 'Adelaide', 'SA', 'Australia', '5000', 1001),
('999 Parkway Drive', 'Somewhere', 'Adelaide', 'SA', 'Australia', '5000', 1002),
('666 Elm Street', 'Overthere', 'Adelaide', 'SA', 'Australia', '5000', 1003),
('421 Evergreen Tce', 'Springfield', 'Adelaide', 'SA', 'Australia', '5000', 1004),
('31 Spooner Street', 'Quahog', 'Adelaide', 'SA', 'Australia', '5000', 1005),
('123 Everystreet', 'Everywhere', 'Adelaide', 'SA', 'Australia', '5022', 1012),
('666 phplane', 'Henley Beach', 'Adelaide', 'SA', 'Australia', '5000', 1013),
('nil', 'nil', 'nil', 'nil', 'nil', 'nil', 1014),
('01 First Street', 'Suburb', 'Adelaide', 'SA', 'Australia', '5000', 1015),
('01 First Street', 'Suburb', 'Adelaide', 'SA', 'Australia', '5000', 1016),
('01 First Street', 'Suburb', 'Adelaide', 'SA', 'Australia', '5000', 1017),
('01 First Street', 'Suburb', 'Adelaide', 'SA', 'Australia', '5000', 1018),
('01 First Street', 'Suburb', 'Adelaide', 'SA', 'Australia', '5000', 1019),
('01 First Street', 'Suburb', 'Adelaide', 'SA', 'Australia', '5000', 1020),
('01 First Street', 'Suburb', 'Adelaide', 'SA', 'Australia', '5000', 1021),
('01 First Street', 'Suburb', 'Adelaide', 'SA', 'Australia', '5000', 1022);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telephone` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `firstName`, `lastName`, `email`, `telephone`) VALUES
(1001, 'Simon', 'Johnson', 'simon@email.com', '0422 123 456'),
(1002, 'Andre', 'Alexandrov', 'andre@email.com', '0422 456 789'),
(1003, 'Jesse', 'Hamilton-Young', 'jesse@email.com', '0422 789 123'),
(1004, 'Jamie', 'Harrod', 'jamie@email.com', '0422 321 654'),
(1005, 'Zoe', 'Pope', 'zoe@email.com', '0422 654 987'),
(1010, 'Andrew', 'Copley', 'andrew@email.com', '0422456789'),
(1011, 'Matthew', 'Hocking', 'matthew@email.com', '0422789456'),
(1012, 'Vanessa', 'Hocking', 'vanessa@email.com', '0422789456'),
(1013, 'Joe', 'Mama', 'phat@email.com', '0422999999'),
(1014, 'guest', 'account', 'guestaccount@email.com', '0000000000'),
(1015, 'John', 'Simonson', 'john@email.com', '0422321654'),
(1016, 'John', 'Simonson', 'john@email.com', '0422321654'),
(1017, 'John', 'Simonson', 'john@email.com', '0422321654'),
(1018, 'John', 'Simonson', 'john@email.com', '0422321654'),
(1019, 'John', 'Simonson', 'john@email.com', '0422321654'),
(1020, 'John', 'Simonson', 'john@email.com', '0422321654'),
(1021, 'John', 'Simonson', 'john@email.com', '0422321654'),
(1022, 'John', 'Simonson', 'john@email.com', '0422321654');

-- --------------------------------------------------------

--
-- Table structure for table `customerlogin`
--

CREATE TABLE `customerlogin` (
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `customerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customerlogin`
--

INSERT INTO `customerlogin` (`email`, `password`, `customerID`) VALUES
('simon@email.com', 'password01', 1001),
('andre@email.com', 'password02', 1002),
('jesse@email.com', 'password03', 1003),
('jamie@email.com', 'password04', 1004),
('zoe@email.com', 'password05', 1005),
('andrew@email.com', '12UFlHxel6uMM', 1010),
('matthew@email.com', '12UFlHxel6uMM', 1011),
('vanessa@email.com', '12UFlHxel6uMM', 1012),
('phat@email.com', '12UFlHxel6uMM', 1013),
('guestaccount@email.com', '12UFlHxel6uMM', 1014),
('john@email.com', '12UFlHxel6uMM', 1015),
('john@email.com', '12UFlHxel6uMM', 1016),
('john@email.com', '12UFlHxel6uMM', 1017),
('john@email.com', '12UFlHxel6uMM', 1018),
('john@email.com', '12UFlHxel6uMM', 1019),
('john@email.com', '12UFlHxel6uMM', 1020),
('john@email.com', '12UFlHxel6uMM', 1021),
('john@email.com', '12UFlHxel6uMM', 1022);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `orderID` varchar(16) NOT NULL,
  `subtotal` float NOT NULL,
  `GST` float NOT NULL,
  `orderTotal` float NOT NULL,
  `dateOfOrder` varchar(45) NOT NULL,
  `noOfItems` int(11) NOT NULL,
  `orderStatus` varchar(45) NOT NULL,
  `customerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`orderID`, `subtotal`, `GST`, `orderTotal`, `dateOfOrder`, `noOfItems`, `orderStatus`, `customerID`) VALUES
('31701660195', 7998, 799.8, 7998, '04/12/2023', 2, 'Pending', 1010),
('71701660021', 3999, 399.9, 3999, '04/12/2023', 1, 'Pending', 1010),
('81701673454', 3999, 399.9, 3999, '04/12/2023', 2, 'Pending', 1010);

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `qtyOrdered` int(11) NOT NULL,
  `orderID` varchar(16) NOT NULL,
  `productID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`qtyOrdered`, `orderID`, `productID`) VALUES
(2, '31701660195', 1),
(1, '71701660021', 1),
(1, '81701673454', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `productName` varchar(45) NOT NULL,
  `productDescription` varchar(255) NOT NULL,
  `manufacturer` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `qtyInStock` int(11) NOT NULL,
  `image` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `productName`, `productDescription`, `manufacturer`, `price`, `qtyInStock`, `image`) VALUES
(1, 'Gibson Les Paul Supreme', 'Featuring a beautiful AAA-figured maple top on a mahogany body with Ultra-Modern Weight Relief. \r\nThe mahogany neck has an ebony fretboard with a compound radius and Super Split Block mother-of-pearl inlays. \r\n', 'Gibson', 3999, 10, '../images/_gibson/gibsonLPSup.png'),
(2, 'Gibson 70\'s Flying V', 'The iconic 70s classic is ready to take flight again. With its bound rosewood fingerboard, SlimTaper™ neck, and a pair of uncovered 70s Tribute humbuckers™ hand-wired with Orange Drop® capacitors, this Flying V™ is set to nail all of the classic tones.', 'Gibson', 2499, 10, '../images/_gibson/gibsonFV.png'),
(3, 'Gibson 70\'s Explorer', 'It has traveled to stages around the world, but the 70s icon is back to explore a new generation of players. Featuring a pair of 70s Tribute humbuckers™, hand-wired with Orange Drop® capacitors, this Explorer™ begs to be played loud. ', 'Gibson', 2499, 10, '../images/_gibson/gibsonEx.png'),
(4, 'Gibson Dove', 'This famous flame maple-backed square-shoulder introduced in the early 60s is intertwined with one of the most revolutionary decades in popular music history. Its maple back and sides and long scale produce crisp, clear tone and projection.', 'Gibson', 3999, 10, '../images/_gibson/gibsonDove_Cherry.png'),
(5, 'Gibson Les Paul Custom', 'As the flagship model from Gibson Custom Shop, the Les Paul Custom lives up to the high standards set by its 1950s archetype while evolving to a level of tone and performance more suited to today\'s musical demands.', 'Gibson', 3999, 10, '../images/_gibson/gibsonLP_Custom.jpg'),
(6, 'Gibson Custom Flying V', 'The Flying V Custom adds upscale \"Black Beauty\" appointments to one of Gibson\'s boldest, most legendary designs. The result is guitar that exudes style and distinction -- a statement piece backed up with unparalleled Gibson tone and playability. From the ', 'Gibson', 5499, 10, '../images/_gibson/gibsonFV_Custom.png'),
(7, 'Gibson Hummingbird', 'The unmistakable Gibson Hummingbird™ is followed by the masses as one of the most remarkable acoustic guitars ever built. The new Hummingbird Original blends vintage appointments and today\'s modern, high-quality build construction.', 'Gibson', 3999, 10, '../images/_gibson/gibsonHUM_Sunburst.png'),
(8, 'Gibson Chuck Berry', 'Gibson is proud to present this first-ever Chuck Berry signature model, a replica of his 1955 ES-350T, to honor the legendary career of one of music\'s greatest innovators. It features historically-correct construction and appointments, hand-picked figured', 'Gibson', 4699, 10, '../images/_gibson/gibsonES_Chuck.jpg'),
(9, 'Gibson 1963 Firebird V', 'When Gibson hired famed automotive designer Ray Dietrich to create a radical new solid body guitar, Rock \'n Roll history ensued. With its offset shape, neck-through construction and scorching mini-humbuckers, the \'63 Firebird™ V became an instant classic.', 'Gibson', 9799, 10, '../images/_gibson/gibsonFB_63Reissue.png'),
(10, 'Gibson 1958 Korina Flying V', 'The Gibson Flying V™ was way ahead of its time when it was introduced in 1958, and only 81 were shipped that year, but it has become very popular in the years since then. The classic vintage Flying V features have been carefully recreated in this Historic', 'Gibson', 9999, 10, '../images/_gibson/gibsonFV_58ReissueWhite.png'),
(11, 'ESP KH-V Metallic Gold', 'The KH-V offers neck-thru-body construction, with an extra-thin U-shaped three-piece maple neck and korina body at 25.5” scale. Its Macassar ebony fingerboard features pearloid wave inlays and 24 extra-jumbo frets. The sound of the KH-V is powered by a se', 'ESP', 2899, 10, '../images/_esp/esp_KH_GoldSparkle.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `customerlogin`
--
ALTER TABLE `customerlogin`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderID`,`customerID`),
  ADD KEY `fk_order_customer1_idx` (`customerID`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`orderID`,`productID`),
  ADD KEY `fk_order_product_product1_idx` (`productID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1023;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_address_customer1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `customerlogin`
--
ALTER TABLE `customerlogin`
  ADD CONSTRAINT `fk_customerlogin_customer1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_customer1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `fk_order_product_order1` FOREIGN KEY (`orderID`) REFERENCES `order` (`orderID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_product_product1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
