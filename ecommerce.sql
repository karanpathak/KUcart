-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2015 at 03:55 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `categoryid` int(11) NOT NULL,
  `categoryname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryid`, `categoryname`) VALUES
(4, 'Books'),
(1, 'Electronics'),
(2, 'Footwear'),
(3, 'Watches');

-- --------------------------------------------------------

--
-- Table structure for table `deliverytime`
--

CREATE TABLE IF NOT EXISTS `deliverytime` (
  `time` varchar(10) NOT NULL,
  `cost` int(100) NOT NULL,
  `desc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deliverytime`
--

INSERT INTO `deliverytime` (`time`, `cost`, `desc`) VALUES
('2-3days', 500, 'order will be delivered within 2-3 business days'),
('24hrs', 1000, 'order will be delivered next day'),
('7-8days', 0, 'order will be delivered within 6-7 business days');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE IF NOT EXISTS `orderdetails` (
  `orderid` int(11) NOT NULL,
  `orderuserid` varchar(20) NOT NULL,
  `orderreceivername` varchar(100) NOT NULL,
  `useremail` varchar(30) NOT NULL,
  `useraddr` varchar(100) NOT NULL,
  `userstate` varchar(20) NOT NULL,
  `usercity` varchar(20) NOT NULL,
  `userphone` bigint(10) NOT NULL,
  `orderdate` date NOT NULL,
  `ordertrackno` varchar(10) NOT NULL,
  `orderpayoption` varchar(10) NOT NULL,
  `orderamount` float NOT NULL,
  `deliverytime` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`orderid`, `orderuserid`, `orderreceivername`, `useremail`, `useraddr`, `userstate`, `usercity`, `userphone`, `orderdate`, `ordertrackno`, `orderpayoption`, `orderamount`, `deliverytime`) VALUES
(2, 'karan', 'karan', 'karan@gmail.com', '34 vincente calderon, sector-17,greater noida', 'Uttar pradesh', 'Noida', 9943822810, '2015-04-29', '2', 'cash', 424, '7-8days'),
(3, 'karan', 'karan', 'karan@gmail.com', '34 vincente calderon, sector-17,greater noida', 'Uttar pradesh', 'Noida', 9943822810, '2015-05-07', '3', 'cash', 56336, '7-8days'),
(4, 'karan', 'karan', 'karan@gmail.com', '34 vincente calderon, sector-17,greater noida', 'Uttar pradesh', 'Noida', 9943822810, '2015-05-07', '4', 'cash', 10002, '7-8days'),
(5, 'karan', 'karan', 'karan@gmail.com', '34 vincente calderon, sector-17,greater noida', 'Uttar pradesh', 'Noida', 9943822810, '2015-05-07', '5', 'cash', 13670, '7-8days');

-- --------------------------------------------------------

--
-- Table structure for table `orderedproductdetails`
--

CREATE TABLE IF NOT EXISTS `orderedproductdetails` (
  `detailid` int(11) NOT NULL,
  `detailorderid` int(11) NOT NULL,
  `detailproductid` int(10) NOT NULL,
  `detailquantity` int(11) NOT NULL,
  `detailprice` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderedproductdetails`
--

INSERT INTO `orderedproductdetails` (`detailid`, `detailorderid`, `detailproductid`, `detailquantity`, `detailprice`) VALUES
(1, 2, 30001, 1, 424),
(2, 3, 1002, 1, 56336),
(3, 4, 10000, 1, 1462),
(4, 4, 11001, 1, 8540),
(5, 5, 20000, 2, 6835),
(6, 5, 11001, 1, 8540),
(7, 5, 1, 1, 12000),
(8, 5, 11001, 1, 8540),
(9, 5, 30001, 1, 424),
(10, 5, 31001, 1, 475);

-- --------------------------------------------------------

--
-- Table structure for table `paymentoptions`
--

CREATE TABLE IF NOT EXISTS `paymentoptions` (
  `optionname` varchar(10) NOT NULL,
  `optiondesc` varchar(100) NOT NULL,
  `optiontimemonths` int(11) NOT NULL,
  `optioninterest` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paymentoptions`
--

INSERT INTO `paymentoptions` (`optionname`, `optiondesc`, `optiontimemonths`, `optioninterest`) VALUES
('Cash', 'Full payment in cash on delivery', 0, 0),
('Credit car', 'Full payment through credit card', 0, 0),
('Debit card', 'Payment through debit card', 0, 0),
('EMI', 'Payment in duration of six months in estimated monthly installments', 6, 1.5);

-- --------------------------------------------------------

--
-- Table structure for table `productdetails`
--

CREATE TABLE IF NOT EXISTS `productdetails` (
  `productid` int(10) NOT NULL,
  `productname` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `shortdesc` varchar(1000) NOT NULL,
  `longdesc` text NOT NULL,
  `category` int(11) NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stock` int(6) NOT NULL DEFAULT '0',
  `image` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productdetails`
--

INSERT INTO `productdetails` (`productid`, `productname`, `price`, `shortdesc`, `longdesc`, `category`, `lastupdate`, `stock`, `image`) VALUES
(1, 'Lumia 640', 12000, 'Lumia 640 from Microsoft in black colour', 'Key Features of Microsoft Lumia 640: \r\n1. Dual SIM\r\n2. Wi-Fi Enabled\r\n3. 8 GB ROM\r\n4. Expandable Storage Capacity of 128 GB\r\n5. Dual Standby Sim (GSM + WCDMA)\r\n6. Windows Phone v8.1 with Lumia Denim     Upgradeable to Windows v10 OS\r\n7. 8 MP Primary Camera\r\n8. 1.2 GHz Qualcomm Snapdragon 400 Quad Core Processor\r\n9. 5-inch HD IPS LCD Capacitive Touchscreen\r\n10. 2500 mAh Battery\r\n11. 1 GB RAM', 1, '2015-06-24 14:42:50', 892, 'Pictures/1.jpeg'),
(2, 'MI 64 gb', 21999, 'Mi 64 gb is a prominent new phone from an up and coming chinese company', 'Key Features of Mi4 64 GB\r\nAndroid v4.4 (KitKat) OS,\r\n5-inch Touchscreen,\r\n13 MP Primary Camera,\r\n2.5 GHz Qualcomm Snapdragon 801 MSM8274AC, Quad Core Processor,\r\n8 MP Secondary Camera', 1, '2015-05-01 11:56:38', 996, 'Pictures/2.jpeg'),
(3, 'Apple iPhone 6 64GB', 47980, 'Apple iphone 6 is the best iphone ever, probably the best phone for you if you settle for nothing less than the best', 'Key Features of Apple iPhone 6 : \r\n1.2 MP Secondary Camera,\r\niOS 8,\r\nBluetooth Support,\r\n8 MP Primary Camera,\r\n4.7-inch Touchscreen,\r\nFull HD Recording,\r\nWi-Fi Enabled', 1, '2015-05-07 17:23:43', 1997, 'Pictures/3.jpeg'),
(4, 'Samsung Galaxy Note 3 Neo', 18899, 'Note 3 neo is the best phone for you if you want to do more with your phone, powerpoint presentations, tables, graphs you name and it can be done in note 3', 'Key Features of Samsung Galaxy Note 3 Neo :\r\nHexa Core (1.7 GHz A15 Dual Core + 1.3 GHz, A7 Quad Core) Processor,\r\nExpandable Storage Capacity of 64 GB,\r\nAndroid v4.3 (Jelly Bean) OS,\r\n8 MP Primary Camera,\r\n2 MP Secondary Camera,\r\nWi-Fi Enabled,\r\n5.5-inch Super AMOLED Capacitive, Touchscreen,\r\nFull HD Recording,', 1, '2015-05-01 11:57:04', 99, 'Pictures/4.jpeg'),
(1000, 'Apple MGXC2HN/A MacBook Pro Notebook ', 166999, '', 'Key Features of Apple MGXC2HN/A MacBook Pro: \r\nNotebook (Ci7/ 16GB/ Mac OS X Mavericks/ 2GB Graph),\r\nIntel Core i7,\r\n16 GB DDR3 RAM,\r\n512 GB SSD,\r\nMac OS X Mavericks,\r\nIntel hd 5500 graphics,\r\nRetina display\r\n', 1, '2015-05-01 11:57:14', 2000, 'Pictures/1000.jpeg'),
(1001, 'Dell Alienware 17 Laptop', 194990, '', 'Key Features of Dell Alienware 17 Laptop (4th Gen Ci7/ 16GB/ 750GB/ Win8/ 3GB Graph):\r\nRear GPU / CPU Exhaust Vent,\r\nHD audio Experience,\r\nDurable Anodized Aluminum Shell,\r\nMassive Storage with High Speed,\r\nFaster Boot Speed,\r\nusb 3.0 x 4', 1, '2015-05-01 11:57:24', 100, 'Pictures/1001.jpeg'),
(1002, 'Lenovo B50-70 Notebook', 56336, '', 'Key Features of Lenovo B50-70 Notebook (4th Gen Ci7/ 8GB/ 1TB/ Win8/ 2GB Graph) (59-434775) :\r\nIntel Core i7,\r\n8 GB DDR3 RAM,\r\n1 TB HDD,\r\nWindows 8,\r\n1920x1200 fullhd display', 1, '2015-05-07 18:36:05', 4, 'Pictures/1002.jpeg'),
(10000, 'Puma Atom Fashion Ind. Running Shoes', 1462, '', 'GENERAL :\r\nOccasion	Sports\r\nIdeal For	Men\r\nSHOE DETAILS :\r\nTip Shape	Round\r\nClosure	Laced\r\nWeight	314 gm (per single Shoe) - Weight of the product may vary depending on size.\r\nStyle	Panel and Stitch Detail, Mesh Panel Detail\r\nColor	Black, Macaw Green\r\nDesign	Logo Print, Print Detail\r\nIN THE BOX\r\nPrice Tag, Cardboard Box, Special Feature Tag\r\nADDITIONAL DETAILS\r\nOther Details	Cushioned Ankle, Textured Sole, Padded Footbed', 2, '2015-05-07 18:39:51', 92, 'Pictures/10000.jpeg'),
(10001, 'Puma evoPOWER 1.2 Graphic FG Football Shoes', 12999, '', 'Specifications of Puma evoPOWER 1.2 Graphic FG Football Shoes\r\nGENERAL\r\nOccasion	Sports\r\nIdeal For	Men\r\nSHOE DETAILS\r\nTip Shape	Round\r\nClosure	Laced\r\nWeight	278 (per single Shoe) - Weight of the product may vary depending on size.\r\nStyle	Panel and Stitch Detail, Perforation Detail\r\nTechnology Used	Adaplite, Evopower\r\nColor	01, High Risk Red, White, Sea Pine\r\nADDITIONAL DETAILS\r\nOther Details	Padded Footbed, Textured Sole, 11 Studs', 2, '2015-05-01 11:58:01', 200, 'Pictures/10001.jpeg'),
(11000, 'Reebok Fresh Start III LP Running Shoes', 2849, '', 'Specifications of Reebok Fresh Start III LP Running Shoes\r\nGENERAL\r\nIdeal For	Women\r\nOccasion	Sports\r\nSHOE DETAILS\r\nClosure	Laced\r\nTip Shape	Round\r\nStyle	Panel and Stitch Detail, Mesh Panel Detail\r\nDesign	Logo Detail\r\nColor	Navy, Teal, White\r\nADDITIONAL DETAILS\r\nOther Details	Padded Footbed, Textured Sole, Cushioned Ankle', 2, '2015-05-01 13:32:55', 499, 'Pictures/11000.jpeg'),
(11001, 'Heel & Buckle Pazzion Peep Toes Leather Heels', 8540, '', 'Specifications of Heel & Buckle Pazzion Peep Toes Leather Heels\r\nGENERAL\r\nOccasion	Wedding\r\nIdeal For	Women\r\nSANDAL DETAILS\r\nType	Heels\r\nHeel Height	2.5\r\nOuter Material	Leather\r\nColor	Black\r\n', 2, '2015-06-24 14:43:09', 244, 'Pictures/11001.jpeg'),
(20000, 'Casio G471 G-Shock Analog-Digital Watch - For Men', 6835, '', 'Specifications of Casio G471 G-Shock Analog-Digital Watch - For Men\r\nFUNCTIONS\r\nDate Display	Yes\r\nOther Functions	World Time Display, Stopwatch, Day Display, World Time City Swapping, Countdown Timer, Afterglow, Daylight Saving On/Off, Auto Light Switch, 29 Time Zones, 12/24 Hours Format, Measuring Modes : Elapsed Time and Split Time, Mach Indica, Hourly Time Signal\r\nAlarm Clock	5 Daily Alarm Settings\r\nLight	Amber Color LED Light\r\nCalendar	Yes\r\nDIAL DIMENSIONS\r\nDiameter	35 mm\r\nWeight	75 g\r\nOther Dimensions	Case Width - 51.2 mm, Case Height - 55 mm\r\nThickness	17 mm\r\nGENERAL\r\nType	Analog-Digital\r\nSeries	G-Shock\r\nStyle Code	G471\r\nIdeal For	Men\r\nPower Source	Battery Powered\r\nWARRANTY\r\n1 Year International Warranty\r\nADDITIONAL FEATURES\r\nMagnetic Resistant\r\nBODY FEATURES\r\nBox Material	Plastic\r\nDial Shape	Round\r\nStrap Color	Grey, Black\r\nShock Resistance	Yes\r\nCase / Bezel Material	Resin Bezel, Resin Case\r\nWater Resistant	Yes\r\nWater Resistance Depth	200 m\r\nClasp Type	Buckle\r\nOther Body Features	Mineral Glass, Selectable Illumination Duration\r\nDial Color	Grey, Black\r\nStrap Material	Fabric Strap', 3, '2015-05-07 18:41:56', 2997, 'Pictures/20000.jpeg'),
(20001, 'Casio ED371 Edifice Analog Watch - For Men', 8545, '', 'Specifications of Casio ED371 Edifice Analog Watch - For Men\r\nFUNCTIONS\r\nChronograph	Yes\r\nDate Display	Yes\r\nOther Functions	Tachymeter, Stopwatch, 24 Hours Format\r\nChronograph Feature	Analog Chronograph Function\r\nGENERAL\r\nMechanism	Quartz\r\nType	Analog\r\nSeries	Edifice\r\nStyle Code	ED371\r\nIdeal For	Men\r\nOccasion	Formal\r\nPower Source	Battery Powered\r\nDIAL DIMENSIONS\r\nWeight	176 g\r\nOther Dimensions	51 mm Case Diameter\r\nThickness	12.4 mm\r\nWARRANTY\r\n2 Years Domestic Warranty\r\nBODY FEATURES\r\nDial Shape	Round\r\nStrap Color	Silver\r\nCase / Bezel Material	Stainless Steel Case, Stainless Steel Bezel\r\nWater Resistant	Yes\r\nWater Resistance Depth	100 m\r\nClasp Type	Push Button Three Fold Clasp\r\nDial Color	Black\r\nOther Body Features	Mineral Glass, Screw Lock Back, Double Lock, Ion-plated Stainless Steel and Aluminium Panel Bezel\r\nStrap Material	Stainless Steel Strap', 3, '2015-05-01 11:59:00', 2000, 'Pictures/20001.jpeg'),
(21000, 'TAG Heuer WAC1215.BA0852 Analog Watch - For Women', 102505, '', 'Specifications of TAG Heuer WAC1215.BA0852 Analog Watch - For Women\r\nGENERAL\r\nMechanism	Quartz\r\nType	Analog\r\nStyle Code	WAC1215.BA0852\r\nIdeal For	Women\r\nWARRANTY\r\n2 Years India or international warranty\r\nBODY FEATURES\r\nStrap Type	Bracelet\r\nDial Shape	Round\r\nStrap Color	Silver\r\nCase / Bezel Material	Stainless Steel\r\nDial Color	White', 3, '2015-05-01 11:59:11', 5000, 'Pictures/21000.jpeg'),
(21001, 'Movado 605815 Swiss Analog Watch - For Women', 74299, '', 'Specifications of Movado 605815 Swiss Analog Watch - For Women\r\nFUNCTIONS\r\nChronograph	No\r\nDate Display	No\r\nAltimeter	No\r\nAlarm Clock	No\r\nCalendar	No\r\nGENERAL\r\nMechanism	Quartz\r\nType	Analog\r\nSeries	Swiss\r\nStyle Code	605815\r\nIdeal For	Women\r\nOccasion	Formal\r\nPower Source	Battery Powered\r\nDIAL DIMENSIONS\r\nDiameter	24 mm\r\nWeight	198 g\r\nWARRANTY\r\n2 years International warranty\r\nIN THE BOX\r\nWatch\r\nBODY FEATURES\r\nStrap Type	Bracelet\r\nDial Shape	Round\r\nStrap Color	Silver\r\nCase / Bezel Material	Stainless Steel Case\r\nScratch Resistant	Yes\r\nWater Resistant	Yes\r\nWater Resistance Depth	30 m\r\nDial Color	Black\r\nStrap Material	Metal Strap', 3, '2015-05-07 18:35:18', 3998, 'Pictures/21001.jpeg'),
(30001, 'Data Structures and Algorithms Made Easy', 424, '', 'Specifications of Data Structures and Algorithms Made Easy : Data Structure and Algorithmic Puzzles (English) (Paperback)\r\nBOOK DETAILS\r\nPublisher	CareerMonk Publications\r\nISBN-10	0615459811\r\nNumber of Pages	429 Pages\r\nPublication Year	2014 May\r\nLanguage	English\r\nISBN-13	9780615459813\r\nBinding	Paperback\r\nDIMENSIONS\r\nWeight	2.26 Pounds (US)\r\nHeight	10.8\r\nWidth	8.38\r\nCONTRIBUTORS\r\nAuthored By	Narasimha Karumanchi', 4, '2015-07-24 20:04:12', 685, 'Pictures/30001.jpeg'),
(30002, 'INTRODUCTION TO ALGORITHMS (English) 3rd Edition', 795, '', 'Specifications of INTRODUCTION TO ALGORITHMS (English) 3rd Edition (Paperback)\r\nUNIVERSITY BOOKS DETAILS\r\nSpecialization	\r\nInformation Technology Engineering, Biotechnology, Information Technology Engineering, Instrumentation and Control Engineering, Electronics and Communication Engineering, Computer Science Engineering, Computer Science Engineering, B.Sc(Computer Science), Computer Science Engineering, Computer Scienc...View More\r\nTerm	5th Semester, 6th Semester, 3rd Semester, 7th Semester, 4th Semester\r\nBOOK DETAILS\r\nPublisher	PHI LEARNING PVT. LTD-NEW DELHI\r\nISBN-10	8120340078\r\nEdition	3rd Edition\r\nNumber of Pages	1310 Pages\r\nPublication Year	2009\r\nLanguage	English\r\nISBN-13	9788120340077\r\nBinding	Paperback\r\nCONTRIBUTORS\r\nAuthored By	Al. Cormen', 4, '2015-05-07 17:23:22', 192, 'Pictures/30002.jpeg'),
(31001, 'Operating System Concepts (English) 8th Edition', 475, '', 'Specifications of Operating System Concepts (English) 8th Edition (Paperback)\r\nUNIVERSITY BOOKS DETAILS\r\nSpecialization	\r\nB.Sc(Computer Science), Chemical Engineering, Information Technology Engineering, Electronics and Communication Engineering, Electronics and Communication Engineering, Biotechnology, Computer Science Engineering, Computer Science Engineering, Electronics and Communication Engineering, Electronics an...View More\r\nTerm	2nd Semester, 5th Semester, 6th Semester, 4th Semester\r\nBOOK DETAILS\r\nPublisher	WILEY\r\nISBN-10	8126520515\r\nEdition	8th Edition\r\nNumber of Pages	992 Pages\r\nPublication Year	2009\r\nLanguage	English\r\nISBN-13	9788126520510\r\nBinding	Paperback\r\nTerritorial Rights	India, Nepal. Bhutan, Bangladesh, Pakistan. Sir Lanka\r\nCONTRIBUTORS\r\nAuthored By	Silberschatz Galvin Gagne', 4, '2015-07-31 05:04:37', 796, 'Pictures/31001.jpeg'),
(31002, 'Operating Systems: Design & Implementation (English) 3rd Edition', 676, '', 'Specifications of Operating Systems: Design And Implementation 3rd Edition (English) 3rd Edition (Paperback)\r\nUNIVERSITY BOOKS DETAILS\r\nSubject	Operating System\r\nSpecialization	B.Sc(Computer Science), Computer Science Engineering\r\nDegree/Diploma	B.Tech\r\nTerm	5th Semester\r\nBOOK DETAILS\r\nPublisher	Phi Learning\r\nISBN-10	8120329554\r\nEdition	3rd Edition\r\nNumber of Pages	1080 Pages\r\nPublication Year	2009\r\nLanguage	English\r\nISBN-13	9788120329553\r\nBinding	Paperback\r\nSERIES & SET DETAILS\r\nSeries Volume	0\r\nCONTRIBUTORS\r\nAuthor	Albert S. Woodhull, Andrew S. Tanenbaum', 4, '2015-05-01 12:00:11', 2049, 'Pictures/31002.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `userdetails`
--

CREATE TABLE IF NOT EXISTS `userdetails` (
  `userid` varchar(20) NOT NULL,
  `useremail` varchar(30) NOT NULL,
  `userpass` varchar(16) NOT NULL,
  `userfname` varchar(30) NOT NULL,
  `userlname` varchar(30) NOT NULL,
  `useraddr` varchar(1000) NOT NULL,
  `userstate` varchar(20) NOT NULL,
  `usercity` varchar(20) NOT NULL,
  `userzip` varchar(6) NOT NULL,
  `userphone` bigint(10) NOT NULL,
  `userregdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userdetails`
--

INSERT INTO `userdetails` (`userid`, `useremail`, `userpass`, `userfname`, `userlname`, `useraddr`, `userstate`, `usercity`, `userzip`, `userphone`, `userregdate`) VALUES
('1', 'utkarsh@gmail.com', 'utkarsh', 'Utkarsh', 'Sharma', 'B-34, Sri ram appartments, plot-32, sector-4, dwarka', 'Delhi', 'New delhi', '110075', 9787084760, '2015-04-22'),
('karan', 'karan@gmail.com', 'karan', 'karan', 'pathak', '34 vincente calderon, sector-17,greater noida', 'Uttar pradesh', 'Noida', '', 9943822810, '2015-04-21'),
('karan1', 'karan1@gmail.com', 'karan', 'karan', 'pathk', 'frf', 'grg', 'rgrg', '4564', 9999888877, '2015-04-23'),
('rahul', 'rahul@gmail.com', 'rahul', 'rahul', 'anand', 'ff', 'fef', 'frf', '4854', 9943822810, '2015-04-23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`categoryid`), ADD UNIQUE KEY `categoryname` (`categoryname`);

--
-- Indexes for table `deliverytime`
--
ALTER TABLE `deliverytime`
 ADD PRIMARY KEY (`time`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
 ADD PRIMARY KEY (`orderid`), ADD KEY `orderuserid` (`orderuserid`), ADD KEY `orderpayoption` (`orderpayoption`), ADD KEY `deliverytime` (`deliverytime`);

--
-- Indexes for table `orderedproductdetails`
--
ALTER TABLE `orderedproductdetails`
 ADD PRIMARY KEY (`detailid`), ADD KEY `detailorderid` (`detailorderid`), ADD KEY `detailproductid` (`detailproductid`);

--
-- Indexes for table `paymentoptions`
--
ALTER TABLE `paymentoptions`
 ADD PRIMARY KEY (`optionname`);

--
-- Indexes for table `productdetails`
--
ALTER TABLE `productdetails`
 ADD PRIMARY KEY (`productid`), ADD KEY `category` (`category`);

--
-- Indexes for table `userdetails`
--
ALTER TABLE `userdetails`
 ADD PRIMARY KEY (`userid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
ADD CONSTRAINT `order_userid` FOREIGN KEY (`orderuserid`) REFERENCES `userdetails` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`orderpayoption`) REFERENCES `paymentoptions` (`optionname`),
ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`deliverytime`) REFERENCES `deliverytime` (`time`);

--
-- Constraints for table `orderedproductdetails`
--
ALTER TABLE `orderedproductdetails`
ADD CONSTRAINT `detail_productid` FOREIGN KEY (`detailproductid`) REFERENCES `productdetails` (`productid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `productdetails`
--
ALTER TABLE `productdetails`
ADD CONSTRAINT `product_categoryid` FOREIGN KEY (`category`) REFERENCES `category` (`categoryid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
