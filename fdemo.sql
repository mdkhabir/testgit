/*
SQLyog Community Edition- MySQL GUI v5.30
Host - 5.5.8-log : Database - quiz
*********************************************************************
Server version : 5.5.8-log
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `quiz`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `answers` */

CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `row_column` tinyint(4) NOT NULL DEFAULT '0',
  `text_box` tinyint(1) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `is_correct` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=167 DEFAULT CHARSET=latin1;

/*Table structure for table `category` */

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `paypment_log` */

CREATE TABLE `paypment_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mc_gross` float NOT NULL,
  `payment_gross` float NOT NULL,
  `user_id` int(11) NOT NULL,
  `payer_id` varchar(200) DEFAULT NULL,
  `payment_date` varchar(200) DEFAULT NULL,
  `payer_status` varchar(100) DEFAULT NULL,
  `payment_type` varchar(100) DEFAULT NULL,
  `custom` varchar(100) DEFAULT NULL,
  `txn_id` varchar(150) DEFAULT NULL,
  `ipn_track_id` varchar(150) DEFAULT NULL,
  `payer_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `questions` */

CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '0',
  `catg_id` int(11) NOT NULL,
  `question_text` text NOT NULL,
  `question_order` int(4) NOT NULL DEFAULT '0',
  `question_on` tinyint(1) NOT NULL DEFAULT '1',
  `mandatoryQuestion` enum('Yes','No') NOT NULL DEFAULT 'No',
  `dragged_type` enum('page_title','header','email','single','paragraph','multiple_choice','matrix','datetime','address','video','image','ranking','constant_sum','multiple_checkbox') DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `explanation` text,
  PRIMARY KEY (`id`),
  KEY `survey_id` (`form_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Table structure for table `reg_users` */

CREATE TABLE `reg_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_key` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `apt_box` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `status` enum('active','inactive','banned') NOT NULL DEFAULT 'inactive',
  `quota` int(11) DEFAULT '2500',
  `queued_email` int(11) DEFAULT '0',
  `paid_status` int(11) NOT NULL DEFAULT '0',
  `subscription_id` varchar(250) DEFAULT NULL,
  `mst_date` date DEFAULT NULL,
  `mend_date` date DEFAULT NULL,
  `custom` varchar(50) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `valid_member` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `taken_form_answers` */

CREATE TABLE `taken_form_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL DEFAULT '0',
  `answer_text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `user_forms` */

CREATE TABLE `user_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `form_name` varchar(128) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `on` tinyint(1) NOT NULL DEFAULT '1',
  `totalviewed` int(11) DEFAULT NULL,
  `totalcompleted` int(11) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `users` */

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_key` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `status` enum('active','inactive','banned') NOT NULL DEFAULT 'inactive',
  `is_admin` int(11) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
