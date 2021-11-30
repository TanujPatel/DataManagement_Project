-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 30, 2021 at 04:55 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dataproject`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `amount_taxed`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `amount_taxed`;
CREATE TABLE IF NOT EXISTS `amount_taxed` (
`cart_id` varchar(45)
,`amount_owed` double
);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` varchar(45) NOT NULL,
  `cust_id` varchar(40) NOT NULL,
  `item_id` varchar(5) DEFAULT NULL,
  `item_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_cust_id_idx` (`cust_id`),
  KEY `cart_item_id_idx` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cust_id`, `item_id`, `item_qty`) VALUES
('9001', '1', '5001', 1),
('9002', '2', '5002', 1),
('9003', '3', '5008', 2),
('9004', '4', NULL, NULL),
('9005', '5', NULL, NULL),
('9006', '6', '5006', 1),
('9007', '7', '5009', 3);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `cust_id` varchar(40) NOT NULL,
  `address` varchar(50) NOT NULL,
  `cust_username` varchar(30) NOT NULL,
  `zipcode` char(9) NOT NULL,
  `cart_id` varchar(45) NOT NULL,
  PRIMARY KEY (`cust_id`),
  KEY `cust_username_idx` (`cust_username`),
  KEY `cust_cart_id_idx` (`cart_id`),
  KEY `cust_cust_username_idx` (`cust_username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `address`, `cust_username`, `zipcode`, `cart_id`) VALUES
('1', '4628 Main St Meadow Lake, SK', 'FranMas', 'S0M 1V0', '9001'),
('2', '1595 Holdom Avenue Surrey, BC', 'RudyHam', 'V3T 4Y5', '9002'),
('3', '5644 Jade St Richmond, BC', 'AntRet', 'V7E 2E4', '9003'),
('4', '3403 50th Street Edmonton, AB', 'AlChet', 'T6B 2W9', '9004'),
('5', '3997 Water Street Kitchener, ON', 'BenKing', 'N2H 5A5', '9005'),
('6', '2892 Glen Long Avenue Toronto, ON', 'RicHota', 'M6B 1J8', '9006'),
('7', '3202 Toy Avenue Oshawa, ON', 'TimTapp', 'L1H 7K5', '9007');

-- --------------------------------------------------------

--
-- Stand-in structure for view `distinct_cart_shoes`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `distinct_cart_shoes`;
CREATE TABLE IF NOT EXISTS `distinct_cart_shoes` (
`item_id` varchar(5)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `highest_price`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `highest_price`;
CREATE TABLE IF NOT EXISTS `highest_price` (
`shoe_name` varchar(25)
,`price` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `inventory`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
`stock` int(11)
,`shoe_name` varchar(25)
,`price` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `later_order`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `later_order`;
CREATE TABLE IF NOT EXISTS `later_order` (
`cust_id` varchar(40)
,`order_id` varchar(40)
);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `cust_id` varchar(40) NOT NULL,
  `login_username` varchar(30) NOT NULL,
  `login_pwd` varchar(25) NOT NULL,
  `cust_email` varchar(50) NOT NULL,
  PRIMARY KEY (`cust_id`,`login_username`),
  KEY `login_username_idx` (`login_username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`cust_id`, `login_username`, `login_pwd`, `cust_email`) VALUES
('1', 'FranMas', 'oijwojeofje89', 'Fran@email.com'),
('2', 'RudyHam', 'ejfahoiharo4593', 'Rudy@emailnow.com'),
('3', 'AntRet', 'rettyjpeojfj754', 'BigRet@gmail.com'),
('4', 'AlChet', 'uhfeuhhekjjh332772', 'ChetAl@gmail.com'),
('5', 'BenKing', 'jhfuhkjnsjnfjk4763ng', 'Bigbenking@email.com'),
('6', 'RicHota', 'biihewufh74', 'Hota@emailme.com'),
('7', 'TimTapp', 'rhiawoierkf4562', 'TimTap@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `new_customer`
--

DROP TABLE IF EXISTS `new_customer`;
CREATE TABLE IF NOT EXISTS `new_customer` (
  `cust_username` varchar(30) NOT NULL,
  `cust_email` varchar(50) NOT NULL,
  `cust_pwd` varchar(25) NOT NULL,
  PRIMARY KEY (`cust_username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `new_customer`
--

INSERT INTO `new_customer` (`cust_username`, `cust_email`, `cust_pwd`) VALUES
('AlChet', 'ChetAl@gmail.com', 'uhfeuhhekjjh332772'),
('AntRet', 'BigRet@gmail.com', 'rettyjpeojfj754'),
('BenKing', 'Bigbenking@email.com', 'jhfuhkjnsjnfjk4763ng'),
('FranMas', 'Fran@email.com', 'oijwojeofje89'),
('RicHota', 'Hota@emailme.com', 'biihewufh74'),
('RudyHam', 'Rudy@emailnow.com', 'ejfahoiharo4593'),
('TimTapp', 'TimTap@email.com', 'rhiawoierkf4562');

-- --------------------------------------------------------

--
-- Stand-in structure for view `num_users`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `num_users`;
CREATE TABLE IF NOT EXISTS `num_users` (
`cust_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` varchar(40) NOT NULL,
  `item_qty` int(11) DEFAULT NULL,
  `shippedDate` date DEFAULT NULL,
  `deliveredDate` date DEFAULT NULL,
  `expectedDate` date DEFAULT NULL,
  `cust_id` varchar(40) DEFAULT NULL,
  `cart_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_cart_id_idx` (`cart_id`),
  KEY `order_cust_id_idx` (`cust_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `item_qty`, `shippedDate`, `deliveredDate`, `expectedDate`, `cust_id`, `cart_id`) VALUES
('8000', 1, '2021-11-05', '2021-11-07', '2021-11-07', '1', '9004'),
('8001', 2, '2021-10-09', '2021-10-10', '2021-10-09', '5', '9002'),
('8002', 2, '2021-09-21', '2021-09-24', '2021-09-24', '2', '9001'),
('8003', 1, '2021-11-07', NULL, '2021-11-10', '4', '9005'),
('8004', 3, '2021-10-14', '2021-10-18', '2021-10-16', '6', '9003'),
('8005', 1, NULL, NULL, '2021-11-11', '3', '9006');

-- --------------------------------------------------------

--
-- Stand-in structure for view `order_record`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `order_record`;
CREATE TABLE IF NOT EXISTS `order_record` (
`cust_id` varchar(40)
,`order_id` varchar(40)
,`payment_type` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `paid_users`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `paid_users`;
CREATE TABLE IF NOT EXISTS `paid_users` (
`cust_username` varchar(30)
,`cust_id` varchar(40)
,`payment_type` varchar(15)
);

-- --------------------------------------------------------

--
-- Table structure for table `pay_info`
--

DROP TABLE IF EXISTS `pay_info`;
CREATE TABLE IF NOT EXISTS `pay_info` (
  `payment_id` int(11) NOT NULL,
  `payment_type` varchar(15) DEFAULT NULL,
  `order_id` varchar(40) DEFAULT NULL,
  `cust_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `pay_order_id_idx` (`order_id`),
  KEY `pay_cust_id_idx` (`cust_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pay_info`
--

INSERT INTO `pay_info` (`payment_id`, `payment_type`, `order_id`, `cust_id`) VALUES
(100001, 'Master', '8000', '1'),
(200001, 'Visa', '8001', '2'),
(300001, 'Visa', '8002', '3'),
(400001, 'Master', '8003', '4'),
(500001, 'Visa', '8004', '5'),
(600001, 'Master', '8005', '6');

-- --------------------------------------------------------

--
-- Stand-in structure for view `percentage_late`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `percentage_late`;
CREATE TABLE IF NOT EXISTS `percentage_late` (
`percentage_late` decimal(24,4)
);

-- --------------------------------------------------------

--
-- Table structure for table `shoe`
--

DROP TABLE IF EXISTS `shoe`;
CREATE TABLE IF NOT EXISTS `shoe` (
  `shoe_id` varchar(30) NOT NULL,
  `shoe_name` varchar(25) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `type` varchar(15) NOT NULL,
  `descr` varchar(40) NOT NULL,
  `price` double DEFAULT NULL,
  `brand` varchar(15) NOT NULL,
  `size` varchar(10) NOT NULL,
  `image` mediumtext,
  PRIMARY KEY (`shoe_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shoe`
--

INSERT INTO `shoe` (`shoe_id`, `shoe_name`, `stock`, `type`, `descr`, `price`, `brand`, `size`, `image`) VALUES
('5001', 'Air Max 90', 10, 'Trainer', 'True to roots', 160, 'Nike', '7-14', 'AM90.jpg'),
('5002', 'Ultra Boost21', 13, 'Trainer', 'Increased responsiveness', 300, 'Adidas', '4-12', 'UlraBoost21.jpg'),
('5003', 'Super Star Classic', 21, 'Shell-Toe', 'Classic shell toed shoe', 150, 'Adidas', '5-14', 'SuperStarClassic.jpg'),
('5004', 'Zoom Fly 4', 9, 'Trainer', 'Breathe easy, stretchy collar', 200, 'Nike', '6.5-14', 'ZoomFly4.jpg'),
('5005', 'Eightyone Clude C FVS', 8, 'Old-School', 'Old court style shoe', 100, 'Reebok', '4-11', 'EightyoneClubCFVS.jpg'),
('5006', 'Air Max 95', 1, 'Jordan', '95 style with modern comfort', 200, 'Nike', '6-15', 'AM95.jpg'),
('5007', '100 Ace', 4, 'Sneaker', 'Old Ace style playing omage', 940, 'Gucci', '5-14.5', '100Ace.jpg'),
('5008', 'Tennis 1997', 2, 'Tennis', 'High top with black seude, 1997 style', 1091, 'Gucci', '5-11', 'Tennis1997.jpg'),
('5009', 'Speed Lace-Up', 7, 'Sneaker', 'Ergo sole, extra light, flexible', 999, 'Balenciaga', '6-14', 'SpeedLace-Up.jpg');

-- --------------------------------------------------------

--
-- Stand-in structure for view `shoes_in_carts`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `shoes_in_carts`;
CREATE TABLE IF NOT EXISTS `shoes_in_carts` (
`shoe_name` varchar(25)
,`stock` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `total_costs`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `total_costs`;
CREATE TABLE IF NOT EXISTS `total_costs` (
`cart_id` varchar(45)
,`total_cost` double
);

-- --------------------------------------------------------

--
-- Structure for view `amount_taxed`
--
DROP TABLE IF EXISTS `amount_taxed`;

DROP VIEW IF EXISTS `amount_taxed`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `amount_taxed`  AS  select `cart`.`cart_id` AS `cart_id`,((`shoe`.`price` * `cart`.`item_qty`) + ((`shoe`.`price` * `cart`.`item_qty`) * 0.13)) AS `amount_owed` from (`cart` join `shoe`) where (`shoe`.`shoe_id` = `cart`.`item_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `distinct_cart_shoes`
--
DROP TABLE IF EXISTS `distinct_cart_shoes`;

DROP VIEW IF EXISTS `distinct_cart_shoes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `distinct_cart_shoes`  AS  select `c`.`item_id` AS `item_id` from (`cart` `c` join (select `cart`.`item_id` AS `item_id`,count(0) AS `cnt` from `cart` group by `cart`.`item_id`) `s` on((`c`.`item_id` = `s`.`item_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `highest_price`
--
DROP TABLE IF EXISTS `highest_price`;

DROP VIEW IF EXISTS `highest_price`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `highest_price`  AS  select `shoe`.`shoe_name` AS `shoe_name`,`shoe`.`price` AS `price` from `shoe` where (`shoe`.`price` = (select max(`shoe`.`price`) from `shoe` where (`shoe`.`stock` <> 0))) ;

-- --------------------------------------------------------

--
-- Structure for view `inventory`
--
DROP TABLE IF EXISTS `inventory`;

DROP VIEW IF EXISTS `inventory`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `inventory`  AS  select `a`.`stock` AS `stock`,`a`.`shoe_name` AS `shoe_name`,`a`.`price` AS `price` from `shoe` `a` where (`a`.`stock` = `a`.`stock`) ;

-- --------------------------------------------------------

--
-- Structure for view `later_order`
--
DROP TABLE IF EXISTS `later_order`;

DROP VIEW IF EXISTS `later_order`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `later_order`  AS  select `o`.`cust_id` AS `cust_id`,`o`.`order_id` AS `order_id` from `orders` `o` where ((`o`.`deliveredDate` - `o`.`expectedDate`) >= 2) ;

-- --------------------------------------------------------

--
-- Structure for view `num_users`
--
DROP TABLE IF EXISTS `num_users`;

DROP VIEW IF EXISTS `num_users`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `num_users`  AS  select count(`customer`.`cust_id`) AS `cust_count` from `customer` ;

-- --------------------------------------------------------

--
-- Structure for view `order_record`
--
DROP TABLE IF EXISTS `order_record`;

DROP VIEW IF EXISTS `order_record`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `order_record`  AS  select `a`.`cust_id` AS `cust_id`,`b`.`order_id` AS `order_id`,`c`.`payment_type` AS `payment_type` from ((`customer` `a` join `orders` `b`) join `pay_info` `c`) where ((`a`.`cust_id` = `b`.`cust_id`) and (`a`.`cust_id` = `c`.`cust_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `paid_users`
--
DROP TABLE IF EXISTS `paid_users`;

DROP VIEW IF EXISTS `paid_users`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `paid_users`  AS  select `c`.`cust_username` AS `cust_username`,`c`.`cust_id` AS `cust_id`,`p`.`payment_type` AS `payment_type` from (`customer` `c` left join `pay_info` `p` on((`c`.`cust_id` = `p`.`cust_id`))) union select `c`.`cust_username` AS `cust_username`,`c`.`cust_id` AS `cust_id`,`p`.`payment_type` AS `payment_type` from (`pay_info` `p` left join `customer` `c` on((`c`.`cust_id` = `p`.`cust_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `percentage_late`
--
DROP TABLE IF EXISTS `percentage_late`;

DROP VIEW IF EXISTS `percentage_late`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `percentage_late`  AS  select (count(0) / (select count(`o2`.`order_id`) from `orders` `o2`)) AS `percentage_late` from `orders` `o1` where ((`o1`.`deliveredDate` - `o1`.`expectedDate`) >= 2) ;

-- --------------------------------------------------------

--
-- Structure for view `shoes_in_carts`
--
DROP TABLE IF EXISTS `shoes_in_carts`;

DROP VIEW IF EXISTS `shoes_in_carts`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `shoes_in_carts`  AS  select `s`.`shoe_name` AS `shoe_name`,`s`.`stock` AS `stock` from `shoe` `s` where `s`.`shoe_id` in (select `c`.`item_id` from `cart` `c` where (`c`.`item_qty` > 1)) group by `s`.`stock`,`s`.`shoe_name` ;

-- --------------------------------------------------------

--
-- Structure for view `total_costs`
--
DROP TABLE IF EXISTS `total_costs`;

DROP VIEW IF EXISTS `total_costs`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_costs`  AS  select `cart`.`cart_id` AS `cart_id`,(`shoe`.`price` * `cart`.`item_qty`) AS `total_cost` from (`cart` join `shoe`) where (`shoe`.`shoe_id` = `cart`.`item_id`) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
