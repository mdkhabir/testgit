-- phpMyAdmin SQL Dump
-- version 3.4.11.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 17, 2013 at 02:16 AM
-- Server version: 5.5.23


--
-- Database: `hariff_erd`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_drink_set`
--

DROP TABLE IF EXISTS `tbl_drink_set`;
CREATE TABLE IF NOT EXISTS `tbl_drink_set` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint(20) DEFAULT NULL,
  `drink_set_id` bigint(20) DEFAULT NULL,
  `drink_set_name` varchar(255) DEFAULT NULL,
  `drink_name` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `sorting` int(4) DEFAULT NULL,
  `account_code` varchar(255) NOT NULL DEFAULT 'tee',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food_category`
--

DROP TABLE IF EXISTS `tbl_food_category`;
CREATE TABLE IF NOT EXISTS `tbl_food_category` (
  `food_category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `food_category_name` varchar(255) DEFAULT NULL,
  `short_desc` varchar(255) DEFAULT NULL,
  `merchant_id` bigint(20) DEFAULT NULL,
  `image_hash` int(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `sorting` int(4) DEFAULT NULL,
  `default_period` tinyint(4) DEFAULT NULL COMMENT '1 - Have default select period, 0 - don''t have',
  `default_time_start` varchar(8) DEFAULT NULL,
  `default_time_end` varchar(8) DEFAULT NULL,
  `account_code` varchar(300) NOT NULL DEFAULT 'tee',
  PRIMARY KEY (`food_category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food_set`
--

DROP TABLE IF EXISTS `tbl_food_set`;
CREATE TABLE IF NOT EXISTS `tbl_food_set` (
  `food_set_id` int(20) NOT NULL AUTO_INCREMENT,
  `food_set_name` varchar(255) NOT NULL,
  `merchant_id` bigint(20) NOT NULL,
  `food_category_id` bigint(20) NOT NULL,
  `drink_set_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `sorting` tinyint(4) DEFAULT NULL,
  `account_code` varchar(255) NOT NULL DEFAULT 'tee',
  PRIMARY KEY (`food_set_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food_set_detail`
--

DROP TABLE IF EXISTS `tbl_food_set_detail`;
CREATE TABLE IF NOT EXISTS `tbl_food_set_detail` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `merchant_id` varchar(100) DEFAULT NULL,
  `food_set_id` varchar(255) DEFAULT NULL,
  `food_detail_name` varchar(255) DEFAULT NULL,
  `food_detail_type` int(4) DEFAULT NULL COMMENT 'CMS fixed 5 components (exclude drink set)',
  `selling_price` decimal(19,2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `sorting` int(4) DEFAULT NULL,
  `account_code` varchar(255) NOT NULL DEFAULT 'tee',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=210 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
