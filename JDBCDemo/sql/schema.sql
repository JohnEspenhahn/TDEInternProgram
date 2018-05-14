-- MySQL dump 10.13  Distrib 5.5.58, for Linux (x86_64)
--
-- Host: tde-r1.cpldifmsmqqm.us-west-2.rds.amazonaws.com    Database: takenny_freight
-- ------------------------------------------------------
-- Server version	5.6.34-log
USE takenny_freight;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_favorites`
--

DROP TABLE IF EXISTS `account_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_favorites` (
  `user` varchar(30) NOT NULL,
  `report` int(11) NOT NULL,
  PRIMARY KEY (`user`,`report`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `client` varchar(20) NOT NULL DEFAULT '%',
  `carrier` varchar(10) NOT NULL DEFAULT '%',
  `user` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `layout` int(2) unsigned zerofill NOT NULL,
  `last_check_notifications` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `addresscorr`
--

DROP TABLE IF EXISTS `addresscorr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresscorr` (
  `address` varchar(200) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` char(2) NOT NULL,
  `country` char(3) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `corr_id` int(11) DEFAULT NULL,
  `corr_company` varchar(200) DEFAULT NULL,
  `success` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `addr` (`address`,`zip`,`city`,`state`,`country`)
) ENGINE=InnoDB AUTO_INCREMENT=18828 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ap`
--

DROP TABLE IF EXISTS `ap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap` (
  `carrier` varchar(4) DEFAULT NULL,
  `checkno` varchar(6) DEFAULT NULL,
  `checkamount` double DEFAULT NULL,
  `datepaid` date DEFAULT NULL,
  `statement` int(11) NOT NULL AUTO_INCREMENT,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`statement`)
) ENGINE=InnoDB AUTO_INCREMENT=12993 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `approved_cc`
--

DROP TABLE IF EXISTS `approved_cc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approved_cc` (
  `cost_center` varchar(20) NOT NULL,
  KEY `index` (`cost_center`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ar`
--

DROP TABLE IF EXISTS `ar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar` (
  `client` varchar(9) DEFAULT NULL,
  `invoiceno` int(11) NOT NULL AUTO_INCREMENT,
  `enddate` date DEFAULT NULL,
  `freightbill` double DEFAULT NULL,
  `fee` double DEFAULT NULL,
  `totaldue` double DEFAULT NULL,
  `datepaid` date DEFAULT NULL,
  `checkno` varchar(6) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  PRIMARY KEY (`invoiceno`)
) ENGINE=InnoDB AUTO_INCREMENT=9449 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arByCarrier`
--

DROP TABLE IF EXISTS `arByCarrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arByCarrier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceno` int(11) DEFAULT NULL,
  `freightbill` double DEFAULT NULL,
  `fee` double DEFAULT NULL,
  `totaldue` double DEFAULT NULL,
  `carrier` varchar(4) DEFAULT NULL,
  `datepaid` date DEFAULT NULL,
  `checkno` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12597 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `basicchrg`
--

DROP TABLE IF EXISTS `basicchrg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basicchrg` (
  `basicchrg` varchar(3) NOT NULL DEFAULT '',
  `basicdesc` text,
  PRIMARY KEY (`basicchrg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `carrier`
--

DROP TABLE IF EXISTS `carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrier` (
  `carrier` varchar(4) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `freightype` varchar(4) DEFAULT NULL,
  `paydate` date DEFAULT NULL,
  `start` date DEFAULT NULL,
  `lcinvoice` tinyint(1) DEFAULT NULL,
  `password` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`carrier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `client` varchar(9) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `phone` varchar(14) DEFAULT NULL,
  `fax` varchar(14) DEFAULT NULL,
  `fbcontact` varchar(30) DEFAULT NULL,
  `paycontact` varchar(30) DEFAULT NULL,
  `foot_left` varchar(100) DEFAULT NULL,
  `foot_center` varchar(100) DEFAULT NULL,
  `foot_right` varchar(100) DEFAULT NULL,
  `chargebill` text,
  `chargeperc` text,
  `edicharge` text,
  `billdate` date DEFAULT NULL,
  `baddress1` varchar(100) DEFAULT NULL,
  `baddress2` varchar(100) DEFAULT NULL,
  `bcity` varchar(100) DEFAULT NULL,
  `bstate` varchar(2) DEFAULT NULL,
  `bzipcode` varchar(10) DEFAULT NULL,
  `media` text,
  `handling` text,
  `minimum` text,
  `consulting` text,
  `misccharge` text,
  `bname` varchar(100) DEFAULT NULL,
  `remarks` text,
  `bl_check` tinyint(1) DEFAULT NULL,
  `specterms` tinyint(1) DEFAULT NULL,
  `password` varchar(8) DEFAULT NULL,
  `discount` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`client`),
  KEY `client` (`client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientmap`
--

DROP TABLE IF EXISTS `clientmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientmap` (
  `account` varchar(30) NOT NULL,
  `client` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corrcode`
--

DROP TABLE IF EXISTS `corrcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corrcode` (
  `corrcode` varchar(1) NOT NULL,
  `corrdesc` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`corrcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dateforms`
--

DROP TABLE IF EXISTS `dateforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dateforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `format` varchar(15) NOT NULL DEFAULT 'MM/dd/yyyy',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbstate`
--

DROP TABLE IF EXISTS `dbstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbstate` (
  `id` bit(1) NOT NULL DEFAULT b'1',
  `live` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_updates`
--

DROP TABLE IF EXISTS `invoice_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_updates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `command` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `map_invoice`
--

DROP TABLE IF EXISTS `map_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_invoice` (
  `name` varchar(20) NOT NULL,
  `entryid` text,
  `verifyid` text,
  `servicetype` text,
  `batch` text,
  `dateproc` text,
  `client` text,
  `carrier` text,
  `prono` text,
  `dateship` text,
  `bill_lad` text,
  `addressfrom` text,
  `zipfrom` text,
  `cityfrom` text,
  `statefrom` text,
  `addressto` text,
  `zipto` text,
  `cityto` text,
  `stateto` text,
  `totweight_lbs` text,
  `totweight_kgs` text,
  `totbill` text,
  `corrbill` text,
  `corrcode` text,
  `custvend` text,
  `distcode` text,
  `qtyship` text,
  `suspend` text,
  `suspcode` text,
  `purchorder` text,
  `advance` text,
  `spec_chrg` text,
  `spec_code` text,
  `accesschrg` text,
  `accesscode` text,
  `status` text,
  `freightype` text,
  `freightcls` text,
  `service` text,
  `discamnt` text,
  `discperc` text,
  `checkno` text,
  `paiddate` text,
  `auditdate` text,
  `tariff` text,
  `rate` text,
  `rbno` text,
  `cinvoice` text,
  `nmfc` text,
  `remark` text,
  `interline` text,
  `trkload` text,
  `audit_ok` text,
  `procdate` text,
  `billto` text,
  `il_invoice` text,
  `il_payment` text,
  `invoiceno` text,
  `clientpaid` text,
  `paymethod` text,
  `countryto` text,
  `countryfrom` text,
  `currency` text,
  `ad_carrier` text,
  `by_carrier` text,
  `statement` text,
  `gst` text,
  `skids` text,
  `dcode` text,
  `fbnumber` text,
  `zone` text,
  `dcode2` text,
  `nvendor` text,
  `newfield` text,
  `fuelchrg` text,
  `spec_crg2` text,
  `spec_cd2` text,
  `spec_crg3` text,
  `spec_cd3` text,
  `spec_crg4` text,
  `spec_cd4` text,
  `companyfrom` text,
  `split` tinyint(1) DEFAULT NULL,
  `corr_company` text,
  `corr_city` text,
  `corr_state` text,
  `corr_address` text,
  `corr_zip` text,
  `dimensions` text,
  `listrate` text,
  `cinvoicedate` text,
  `mileage` text,
  `billtocostcenter` text,
  `category` text,
  `spec_cd7` text,
  `spec_crg7` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nfreight`
--

DROP TABLE IF EXISTS `nfreight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nfreight` (
  `entryid` varchar(8) DEFAULT NULL,
  `verifyid` varchar(8) DEFAULT NULL,
  `servicetype` varchar(30) DEFAULT NULL,
  `batch` varchar(4) DEFAULT NULL,
  `client` varchar(9) DEFAULT NULL,
  `carrier` varchar(4) DEFAULT NULL,
  `prono` varchar(40) DEFAULT NULL,
  `dateship` date DEFAULT NULL,
  `cinvoicedate` date DEFAULT NULL,
  `dateproc` date DEFAULT NULL,
  `bill_lad` varchar(16) DEFAULT NULL,
  `purchorder` varchar(50) DEFAULT NULL,
  `companyfrom` varchar(200) DEFAULT NULL,
  `addressfrom` varchar(200) DEFAULT NULL,
  `cityfrom` varchar(200) DEFAULT NULL,
  `statefrom` varchar(2) DEFAULT NULL,
  `zipfrom` varchar(10) DEFAULT NULL,
  `countryfrom` varchar(50) DEFAULT NULL,
  `custvend` varchar(35) DEFAULT NULL,
  `addressto` varchar(200) DEFAULT NULL,
  `cityto` varchar(200) DEFAULT NULL,
  `stateto` varchar(2) DEFAULT NULL,
  `zipto` varchar(10) DEFAULT NULL,
  `countryto` varchar(50) DEFAULT NULL,
  `qtyship` varchar(30) DEFAULT NULL,
  `totweight` decimal(12,6) DEFAULT NULL,
  `totbill` decimal(15,4) DEFAULT NULL,
  `corrbill` decimal(15,4) DEFAULT NULL,
  `corrcode` varchar(1) DEFAULT NULL,
  `distcode` varchar(200) DEFAULT NULL,
  `suspend` tinyint(1) DEFAULT NULL,
  `suspcode` varchar(4) DEFAULT NULL,
  `advance` varchar(50) DEFAULT NULL,
  `accesschrg` varchar(50) DEFAULT NULL,
  `accesscode` varchar(1) DEFAULT NULL,
  `split` tinyint(1) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `freightype` varchar(30) DEFAULT NULL,
  `freightcls` varchar(50) DEFAULT NULL,
  `service` varchar(200) DEFAULT NULL,
  `discamnt` varchar(50) DEFAULT NULL,
  `discperc` varchar(50) DEFAULT NULL,
  `checkno` varchar(6) DEFAULT NULL,
  `paiddate` date DEFAULT NULL,
  `auditdate` date DEFAULT NULL,
  `tariff` varchar(8) DEFAULT NULL,
  `rate` varchar(50) DEFAULT NULL,
  `rbno` varchar(10) DEFAULT NULL,
  `cinvoice` varchar(16) DEFAULT NULL,
  `nmfc` varchar(10) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `interline` varchar(4) DEFAULT NULL,
  `trkload` tinyint(1) DEFAULT NULL,
  `audit_ok` tinyint(1) DEFAULT NULL,
  `procdate` date DEFAULT NULL,
  `billto` varchar(6) DEFAULT NULL,
  `il_invoice` varchar(12) DEFAULT NULL,
  `il_payment` date DEFAULT NULL,
  `invoiceno` int(11) DEFAULT NULL,
  `clientpaid` date DEFAULT NULL,
  `paymethod` varchar(1) DEFAULT NULL,
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  `ad_carrier` varchar(9) DEFAULT NULL,
  `by_carrier` varchar(9) DEFAULT NULL,
  `statement` int(11) DEFAULT NULL,
  `gst` varchar(50) DEFAULT NULL,
  `skids` varchar(50) DEFAULT NULL,
  `dcode` varchar(3) DEFAULT NULL,
  `fbnumber` bigint(13) NOT NULL AUTO_INCREMENT,
  `zone` varchar(3) DEFAULT NULL,
  `dcode2` varchar(2) DEFAULT NULL,
  `nvendor` varchar(10) DEFAULT NULL,
  `mileage` decimal(7,3) DEFAULT NULL,
  `fuelchrg` varchar(50) DEFAULT NULL,
  `spec_chrg` varchar(50) DEFAULT NULL,
  `spec_code` varchar(20) DEFAULT NULL,
  `spec_crg2` varchar(200) DEFAULT NULL,
  `spec_cd2` varchar(20) DEFAULT NULL,
  `spec_crg3` varchar(200) DEFAULT NULL,
  `spec_cd3` varchar(20) DEFAULT NULL,
  `spec_crg4` varchar(200) DEFAULT NULL,
  `spec_cd4` varchar(20) DEFAULT NULL,
  `spec_crg5` varchar(200) DEFAULT NULL,
  `spec_cd5` varchar(20) DEFAULT NULL,
  `spec_crg6` varchar(200) DEFAULT NULL,
  `spec_cd6` varchar(20) DEFAULT NULL,
  `spec_crg7` varchar(200) DEFAULT NULL,
  `spec_cd7` varchar(20) DEFAULT NULL,
  `corr_company` varchar(200) DEFAULT NULL,
  `corr_city` varchar(60) DEFAULT NULL,
  `corr_state` varchar(2) DEFAULT NULL,
  `corr_address` varchar(200) DEFAULT NULL,
  `corr_zip` varchar(10) DEFAULT NULL,
  `length` varchar(7) DEFAULT NULL,
  `width` varchar(7) DEFAULT NULL,
  `height` varchar(7) DEFAULT NULL,
  `listrate` decimal(15,4) DEFAULT NULL,
  `addressfrom_old` int(11) DEFAULT NULL,
  `addressto_old` int(11) DEFAULT NULL,
  `fromaddresscorr` int(11) DEFAULT NULL,
  `billtocostcenter` varchar(50) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`fbnumber`),
  KEY `prono-cinvoice` (`prono`,`cinvoice`),
  KEY `statement` (`statement`),
  KEY `client-procdate-dateship` (`client`,`procdate`,`dateship`,`suspend`),
  KEY `carrier-statement` (`carrier`,`statement`,`suspend`),
  KEY `dateproc` (`dateproc`),
  KEY `addressfrom_old_idx` (`addressfrom_old`),
  KEY `addressto_old_idx` (`addressto_old`)
) ENGINE=InnoDB AUTO_INCREMENT=100004575897 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `text` text NOT NULL,
  `end_date` datetime NOT NULL,
  `added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rate_lookup`
--

DROP TABLE IF EXISTS `rate_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_lookup` (
  `client` char(9) NOT NULL,
  `carrier` char(4) NOT NULL,
  `zone` char(4) NOT NULL DEFAULT '-1',
  `totweight` decimal(6,2) NOT NULL DEFAULT '-1.00',
  `service` varchar(100) NOT NULL,
  `rate` decimal(8,2) unsigned zerofill NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lookupkey` (`client`,`carrier`,`zone`,`totweight`,`service`)
) ENGINE=InnoDB AUTO_INCREMENT=6343 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isaccumulated` bit(1) NOT NULL DEFAULT b'0',
  `user` varchar(30) NOT NULL DEFAULT '%',
  `client` varchar(20) NOT NULL DEFAULT '%%',
  `carrier` varchar(10) NOT NULL DEFAULT '%',
  `name` varchar(45) NOT NULL,
  `search` text NOT NULL,
  `select` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=533 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reports_default_values`
--

DROP TABLE IF EXISTS `reports_default_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports_default_values` (
  `report_id` int(11) NOT NULL,
  `key` varchar(20) NOT NULL,
  `value` varchar(45) NOT NULL,
  KEY `key` (`report_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reports_search`
--

DROP TABLE IF EXISTS `reports_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports_search` (
  `report_id` int(11) NOT NULL,
  `key` varchar(20) NOT NULL,
  `idx` smallint(3) NOT NULL,
  `type` char(1) NOT NULL,
  UNIQUE KEY `key` (`report_id`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reports_select`
--

DROP TABLE IF EXISTS `reports_select`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports_select` (
  `report_id` int(11) NOT NULL,
  `key` varchar(20) NOT NULL,
  `idx` smallint(3) NOT NULL,
  KEY `key` (`report_id`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `specchrg`
--

DROP TABLE IF EXISTS `specchrg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specchrg` (
  `spec_code` varchar(3) NOT NULL,
  `spec_desc` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`spec_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-21 14:12:30
