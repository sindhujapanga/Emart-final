-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2020 at 05:54 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emart`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill_details_table`
--

CREATE TABLE `bill_details_table` (
  `bill_details_id` int(11) NOT NULL,
  `bill_id` int(20) NOT NULL,
  `item_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_details_table`
--

INSERT INTO `bill_details_table` (`bill_details_id`, `bill_id`, `item_id`) VALUES
(701, 601, 502),
(702, 602, 501),
(703, 603, 501),
(704, 604, 501),
(705, 605, 501),
(706, 606, 502),
(707, 606, 502),
(708, 607, 501),
(709, 608, 503),
(710, 609, 503),
(711, 610, 505),
(712, 611, 502),
(713, 612, 511);

-- --------------------------------------------------------

--
-- Table structure for table `bill_table`
--

CREATE TABLE `bill_table` (
  `bill_id` int(20) NOT NULL,
  `buyer_id` int(20) NOT NULL,
  `bill_type` varchar(20) NOT NULL,
  `bill_date` date NOT NULL,
  `bill_remarks` varchar(20) NOT NULL,
  `bill_amount` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_table`
--

INSERT INTO `bill_table` (`bill_id`, `buyer_id`, `bill_type`, `bill_date`, `bill_remarks`, `bill_amount`) VALUES
(601, 201, 'debit', '2020-02-04', 'thank you', 100),
(602, 202, 'debit', '2020-02-05', 'visit again', 500),
(603, 202, 'debit', '2020-02-05', 'visit again', 500),
(604, 202, 'debit', '2020-02-05', 'visit again', 500),
(605, 201, 'credit', '2020-03-04', '', 1000),
(606, 201, 'credit', '2020-03-04', '', 200),
(607, 202, 'credit', '2020-03-04', '', 1000),
(608, 202, 'credit', '2020-03-10', '', 25000),
(609, 203, 'credit', '2020-03-11', '', 2500),
(610, 203, 'credit', '2020-03-11', '', 2500),
(611, 203, 'credit', '2020-03-11', '', 100),
(612, 202, 'credit', '2020-03-13', '', 899),
(613, 202, 'credit', '2020-03-13', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `buyer_signup_table`
--

CREATE TABLE `buyer_signup_table` (
  `buyer_id` int(30) NOT NULL,
  `buyer_username` varchar(30) NOT NULL,
  `buyer_email` varchar(30) NOT NULL,
  `buyer_mobile` bigint(30) NOT NULL,
  `buyer_date` date NOT NULL,
  `buyer_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buyer_signup_table`
--

INSERT INTO `buyer_signup_table` (`buyer_id`, `buyer_username`, `buyer_email`, `buyer_mobile`, `buyer_date`, `buyer_password`) VALUES
(201, 'sravya', 'sravya@gmail.com', 987456321, '2020-02-04', '123'),
(202, 'sindhu', 'sindhu@gmail.com', 986547312, '2020-02-03', '456'),
(203, 'rajesh', 'rajesh@gmail.com', 989667677, '2020-03-03', '123'),
(204, 'sravya', 'sravya@gmail.com', 323243543, '2212-03-11', '123');

-- --------------------------------------------------------

--
-- Table structure for table `category_table`
--

CREATE TABLE `category_table` (
  `category_id` int(20) NOT NULL,
  `category_name` varchar(20) NOT NULL,
  `category_brief` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_table`
--

INSERT INTO `category_table` (`category_id`, `category_name`, `category_brief`) VALUES
(301, 'footwear', 'for foot'),
(302, 'electronic appliance', 'electronics'),
(303, 'Clothes', 'dresses');

-- --------------------------------------------------------

--
-- Table structure for table `item_table`
--

CREATE TABLE `item_table` (
  `item_id` int(20) NOT NULL,
  `item_name` varchar(20) NOT NULL,
  `item_image` varchar(200) NOT NULL,
  `item_price` int(20) NOT NULL,
  `item_stock` int(20) NOT NULL,
  `item_description` varchar(20) NOT NULL,
  `subcategory_id` int(20) NOT NULL,
  `item_remarks` varchar(20) NOT NULL,
  `seller_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item_table`
--

INSERT INTO `item_table` (`item_id`, `item_name`, `item_image`, `item_price`, `item_stock`, `item_description`, `subcategory_id`, `item_remarks`, `seller_id`) VALUES
(501, 'sony', 'https://5.imimg.com/data5/RT/DE/RQ/SELLER-65447592/sony-bravia-led-tv-500x500.jpg', 1000, 20, 'watch hd tv', 402, 'good', 101),
(502, 'Casuals', 'https://images.unsplash.com/photo-1533659828870-95ee305cee3e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60', 1000, 10, 'comfort', 403, 'average', 101),
(503, 'Mobile', 'https://www.androidpolice.com/wp-content/uploads/2017/02/nexus2cee_04_Xperia_XA1_white_front_coloured_background.png', 2500, 2, 'The Sony Xperia 10 I', 402, 'no remarks', 101),
(504, 'sparx', 'https://image.freepik.com/free-photo/green-sneakers-sport-running-shoe-isolated-white-background_39665-135.jpg', 999, 2, 'cool', 401, 'no remarks', 101),
(505, 'Titan', 'https://images.unsplash.com/photo-1533139502658-0198f920d8e8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60', 8000, 10, 'nice', 402, 'good', 101),
(506, 'Adidas', 'https://c4.wallpaperflare.com/wallpaper/437/12/978/adidas-photo-backgrounds-wallpaper-preview.jpg', 999, 6, 'level of comfort', 401, 'no remarks', 102),
(507, 'samsung', 'https://image1.pricedekho.com/p/6/1/1/2492601/10448155-samsung-40ku6000-40-inches-led-tv-picture-large.jpg', 9999, 10, 'Do experience the HD', 402, 'no remarks', 102),
(508, 'LG Tv', 'https://i.gadgets360cdn.com/products/televisions/large/1548155009_832_tcl_40-inch-led-full-hd-tv-40s62fs.jpg', 4999, 2, 'Life\'s Good', 402, 'average', 101),
(509, 'M31', 'https://st1.bgr.in/wp-content/uploads/2020/01/samsung-galaxy-m30s-front-and-back.jpg', 7999, 10, '10x Zoom', 402, 'no remarks', 102),
(510, 'Iphone X', 'https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fblogs-images.forbes.com%2Fgordonkelly%2Ffiles%2F2018%2F03%2FScreenshot-2018-03-07-at-02.39.23.jpg', 9999, 2, 'brand of apple', 402, 'average', 101),
(511, 'sparx', 'https://www.fashos.com/pub/media/catalog/product/cache/8435f2f4a6494f6c8ec3a4ef68996c2d/h/t/httpstaging.greenhonchos.comfashos20pubmediaimagesss-414-blue_1.jpg', 899, 10, 'comfortable to wear', 401, 'no remarks', 102),
(512, 'sparx', 'https://5.imimg.com/data5/BD/WT/MY-13681712/ladies-sandal-500x500.jpg', 988, 10, 'comfort', 401, 'no remarks', 102);

-- --------------------------------------------------------

--
-- Table structure for table `seller_signup_table`
--

CREATE TABLE `seller_signup_table` (
  `seller_id` int(30) NOT NULL,
  `seller_username` varchar(30) NOT NULL,
  `seller_password` varchar(30) NOT NULL,
  `seller_company` varchar(30) NOT NULL,
  `seller_brief` varchar(30) NOT NULL,
  `seller_gst` int(30) NOT NULL,
  `seller_address` varchar(30) NOT NULL,
  `seller_email` varchar(30) NOT NULL,
  `seller_contact` int(30) NOT NULL,
  `seller_website` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seller_signup_table`
--

INSERT INTO `seller_signup_table` (`seller_id`, `seller_username`, `seller_password`, `seller_company`, `seller_brief`, `seller_gst`, `seller_address`, `seller_email`, `seller_contact`, `seller_website`) VALUES
(101, 'sindhu', '123', 'Cts', 'Very Good', 100, 'hyderabad', 'abc@gmail.com', 1232456788, 'www.abc.com'),
(102, 'prudhvi', '123', 'cts', 'Good coder', 147, 'hyderabad', 'pro@gmail.com', 125478963, 'www.prudhvi.com'),
(105, 'rajesh', '123', 'rajesh company', 'free to work', 2500, 'perungudi', 'rajesh@gmail.com', 987776676, 'www.rajesh.com'),
(106, 'c', 'c', 'c', 'c', 12, 'c', 'c', 13, '');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category_table`
--

CREATE TABLE `sub_category_table` (
  `subcategory_id` int(20) NOT NULL,
  `subcategory_name` varchar(20) NOT NULL,
  `category_id` int(20) NOT NULL,
  `subcategory_brief` varchar(20) NOT NULL,
  `subcategory_gst` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_category_table`
--

INSERT INTO `sub_category_table` (`subcategory_id`, `subcategory_name`, `category_id`, `subcategory_brief`, `subcategory_gst`) VALUES
(401, 'sandals', 301, 'for foott', 125),
(402, 'Electronics', 302, 'watch tv', 147),
(403, 'Formals', 303, 'jeans,lehengas', 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill_details_table`
--
ALTER TABLE `bill_details_table`
  ADD PRIMARY KEY (`bill_details_id`),
  ADD KEY `bill_id` (`bill_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `bill_table`
--
ALTER TABLE `bill_table`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `buyer_id` (`buyer_id`);

--
-- Indexes for table `buyer_signup_table`
--
ALTER TABLE `buyer_signup_table`
  ADD PRIMARY KEY (`buyer_id`);

--
-- Indexes for table `category_table`
--
ALTER TABLE `category_table`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `item_table`
--
ALTER TABLE `item_table`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `subcategory_id` (`subcategory_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `seller_signup_table`
--
ALTER TABLE `seller_signup_table`
  ADD PRIMARY KEY (`seller_id`);

--
-- Indexes for table `sub_category_table`
--
ALTER TABLE `sub_category_table`
  ADD PRIMARY KEY (`subcategory_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill_details_table`
--
ALTER TABLE `bill_details_table`
  MODIFY `bill_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=714;

--
-- AUTO_INCREMENT for table `bill_table`
--
ALTER TABLE `bill_table`
  MODIFY `bill_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=614;

--
-- AUTO_INCREMENT for table `buyer_signup_table`
--
ALTER TABLE `buyer_signup_table`
  MODIFY `buyer_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `seller_signup_table`
--
ALTER TABLE `seller_signup_table`
  MODIFY `seller_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill_details_table`
--
ALTER TABLE `bill_details_table`
  ADD CONSTRAINT `bill_details_table_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill_table` (`bill_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `bill_details_table_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item_table` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `bill_table`
--
ALTER TABLE `bill_table`
  ADD CONSTRAINT `bill_table_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `buyer_signup_table` (`buyer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `item_table`
--
ALTER TABLE `item_table`
  ADD CONSTRAINT `item_table_ibfk_1` FOREIGN KEY (`subcategory_id`) REFERENCES `sub_category_table` (`subcategory_id`),
  ADD CONSTRAINT `item_table_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `seller_signup_table` (`seller_id`);

--
-- Constraints for table `sub_category_table`
--
ALTER TABLE `sub_category_table`
  ADD CONSTRAINT `sub_category_table_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_table` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
