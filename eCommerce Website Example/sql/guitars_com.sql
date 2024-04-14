-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Apr 14, 2024 at 05:35 PM
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
('john@email.com', '12UFlHxel6uMM', 1022);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `imageID` int(11) NOT NULL,
  `productID` int(11) DEFAULT NULL,
  `imagePath` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`imageID`, `productID`, `imagePath`) VALUES
(1, 1, '../images/_gibson/_lpSupreme/lpSupreme01.png'),
(2, 1, '../images/_gibson/_lpSupreme/lpSupreme02.png'),
(3, 1, '../images/_gibson/_lpSupreme/lpSupreme03.png'),
(4, 1, '../images/_gibson/_lpSupreme/lpSupreme04.png'),
(5, 1, '../images/_gibson/_lpSupreme/lpSupreme05.png'),
(6, 2, '../images/_gibson/_70sFlyingV_White/70sFlyingVWhite01.png'),
(7, 2, '../images/_gibson/_70sFlyingV_White/70sFlyingVWhite02.png'),
(8, 2, '../images/_gibson/_70sFlyingV_White/70sFlyingVWhite03.png'),
(9, 2, '../images/_gibson/_70sFlyingV_White/70sFlyingVWhite04.png'),
(14, 2, '../images/_gibson/_70sFlyingV_White/70sFlyingVWhite01.png'),
(15, 3, '../images/_gibson/_70sExplorer_White/70sExplorerWhite01.png'),
(16, 3, '../images/_gibson/_70sExplorer_White/70sExplorerWhite02.png'),
(17, 3, '../images/_gibson/_70sExplorer_White/70sExplorerWhite03.png'),
(18, 3, '../images/_gibson/_70sExplorer_White/70sExplorerWhite04.png'),
(19, 3, '../images/_gibson/_70sExplorer_White/70sExplorerWhite05.png'),
(20, 4, '../images/_gibson/_dove_CherrySunburst/gibsonDove_Cherry01.png'),
(21, 4, '../images/_gibson/_dove_CherrySunburst/gibsonDove_Cherry02.png'),
(22, 4, '../images/_gibson/_dove_CherrySunburst/gibsonDove_Cherry03.png'),
(23, 4, '../images/_gibson/_dove_CherrySunburst/gibsonDove_Cherry04.png'),
(24, 4, '../images/_gibson/_dove_CherrySunburst/gibsonDove_Cherry05.png'),
(25, 5, '../images/_gibson/_lpCustomEbony/_lpCustomEbony01.jpg'),
(26, 5, '../images/_gibson/_lpCustomEbony/_lpCustomEbony02.jpg'),
(27, 5, '../images/_gibson/_lpCustomEbony/_lpCustomEbony03.jpg'),
(28, 5, '../images/_gibson/_lpCustomEbony/_lpCustomEbony04.jpg'),
(29, 6, '../images/_gibson/_fvCustomShop/gibsonFV_Custom01.jpg'),
(30, 6, '../images/_gibson/_fvCustomShop/gibsonFV_Custom02.jpg'),
(31, 6, '../images/_gibson/_fvCustomShop/gibsonFV_Custom03.png'),
(34, 6, '../images/_gibson/_fvCustomShop/gibsonFV_Custom04.png'),
(35, 6, '../images/_gibson/_fvCustomShop/gibsonFV_Custom05.png'),
(36, 7, '../images/_gibson/_hummingbird_HeritageCherry/_hummingbird_HeritageCherry01.png'),
(37, 7, '../images/_gibson/_hummingbird_HeritageCherry/_hummingbird_HeritageCherry02.png'),
(38, 7, '../images/_gibson/_hummingbird_HeritageCherry/_hummingbird_HeritageCherry03.png'),
(39, 7, '../images/_gibson/_hummingbird_HeritageCherry/_hummingbird_HeritageCherry04.png'),
(40, 7, '../images/_gibson/_hummingbird_HeritageCherry/_hummingbird_HeritageCherry05.png'),
(41, 8, '../images/_gibson/_esChuckBerry/_chuckBerry01.jpg'),
(42, 8, '../images/_gibson/_esChuckBerry/_chuckBerry02.jpg'),
(43, 8, '../images/_gibson/_esChuckBerry/_chuckBerry03.jpg'),
(44, 8, '../images/_gibson/_esChuckBerry/_chuckBerry04.png'),
(45, 8, '../images/_gibson/_esChuckBerry/_chuckBerry05.png'),
(46, 9, '../images/_gibson/_firebird/firebird01.jpg'),
(47, 9, '../images/_gibson/_firebird/firebird02.jpg'),
(48, 9, '../images/_gibson/_firebird/firebird03.jpg'),
(49, 9, '../images/_gibson/_firebird/firebird04.jpg'),
(50, 9, '../images/_gibson/_firebird/firebird05.jpg'),
(51, 10, '../images/_gibson/_58FVReissueWhite/58FVReissue01.jpg'),
(52, 10, '../images/_gibson/_58FVReissueWhite/58FVReissue02.jpg'),
(53, 10, '../images/_gibson/_58FVReissueWhite/58FVReissue03.jpg'),
(54, 10, '../images/_gibson/_58FVReissueWhite/58FVReissue04.jpg'),
(55, 10, '../images/_gibson/_58FVReissueWhite/58FVReissue05.jpg'),
(56, 11, '../images/_esp/_ltdKH-V/_espKH_GoldSparkle01.png'),
(57, 11, '../images/_esp/_ltdKH-V/_espKH_GoldSparkle02.png'),
(58, 11, '../images/_esp/_ltdKH-V/_espKH_GoldSparkle03.png'),
(59, 11, '../images/_esp/_ltdKH-V/_espKH_BlackSparkle01.png'),
(60, 11, '../images/_esp/_ltdKH-V/_espKH_BlackSparkle02.png');

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
  `qtyInStock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `productName`, `productDescription`, `manufacturer`, `price`, `qtyInStock`) VALUES
(1, 'Gibson Les Paul Supreme', 'Featuring a beautiful AAA-figured maple top on a mahogany body with Ultra-Modern Weight Relief. \r\nThe mahogany neck has an ebony fretboard with a compound radius and Super Split Block mother-of-pearl inlays. \r\n', 'Gibson', 3999, 10),
(2, 'Gibson 70\'s Flying V', 'The iconic 70s classic is ready to take flight again. With its bound rosewood fingerboard, SlimTaper™ neck, and a pair of uncovered 70s Tribute humbuckers™ hand-wired with Orange Drop® capacitors, this Flying V™ is set to nail all of the classic tones.', 'Gibson', 2499, 10),
(3, 'Gibson 70\'s Explorer', 'It has traveled to stages around the world, but the 70s icon is back to explore a new generation of players. Featuring a pair of 70s Tribute humbuckers™, hand-wired with Orange Drop® capacitors, this Explorer™ begs to be played loud. ', 'Gibson', 2499, 10),
(4, 'Gibson Dove', 'This famous flame maple-backed square-shoulder introduced in the early 60s is intertwined with one of the most revolutionary decades in popular music history. Its maple back and sides and long scale produce crisp, clear tone and projection.', 'Gibson', 3999, 10),
(5, 'Gibson Les Paul Custom', 'As the flagship model from Gibson Custom Shop, the Les Paul Custom lives up to the high standards set by its 1950s archetype while evolving to a level of tone and performance more suited to today\'s musical demands.', 'Gibson', 3999, 10),
(6, 'Gibson Custom Flying V', 'The Flying V Custom adds upscale \"Black Beauty\" appointments to one of Gibson\'s boldest, most legendary designs. The result is guitar that exudes style and distinction -- a statement piece backed up with unparalleled Gibson tone and playability. From the ', 'Gibson', 5499, 10),
(7, 'Gibson Hummingbird', 'The unmistakable Gibson Hummingbird™ is followed by the masses as one of the most remarkable acoustic guitars ever built. The new Hummingbird Original blends vintage appointments and today\'s modern, high-quality build construction.', 'Gibson', 3999, 10),
(8, 'Gibson Chuck Berry', 'Gibson is proud to present this first-ever Chuck Berry signature model, a replica of his 1955 ES-350T, to honor the legendary career of one of music\'s greatest innovators. It features historically-correct construction and appointments, hand-picked figured', 'Gibson', 4699, 10),
(9, 'Gibson 1963 Firebird V', 'When Gibson hired famed automotive designer Ray Dietrich to create a radical new solid body guitar, Rock \'n Roll history ensued. With its offset shape, neck-through construction and scorching mini-humbuckers, the \'63 Firebird™ V became an instant classic.', 'Gibson', 9799, 10),
(10, 'Gibson 1958 Korina Flying V', 'The Gibson Flying V™ was way ahead of its time when it was introduced in 1958, and only 81 were shipped that year, but it has become very popular in the years since then. The classic vintage Flying V features have been carefully recreated in this Historic', 'Gibson', 9999, 10),
(11, 'ESP KH-V Metallic Gold', 'The KH-V offers neck-thru-body construction, with an extra-thin U-shaped three-piece maple neck and korina body at 25.5” scale. Its Macassar ebony fingerboard features pearloid wave inlays and 24 extra-jumbo frets. The sound of the KH-V is powered by a se', 'ESP', 2899, 10);

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
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`imageID`),
  ADD KEY `productID` (`productID`);

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
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `imageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`);

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
