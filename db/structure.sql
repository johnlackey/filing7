-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: filing_dev
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

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
-- Table structure for table `CHECK_CONSTRAINTS`
--

DROP TABLE IF EXISTS `CHECK_CONSTRAINTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CHECK_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(128) DEFAULT NULL,
  `CONSTRAINT_SCHEMA` varchar(128) DEFAULT NULL,
  `CONSTRAINT_NAME` varchar(128) NOT NULL,
  `CHECK_CLAUSE` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DBInfo`
--

DROP TABLE IF EXISTS `DBInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DBInfo` (
  `DBInfoId` int(10) NOT NULL AUTO_INCREMENT,
  `ProgramName` varchar(50) DEFAULT NULL,
  `Version` varchar(50) DEFAULT NULL,
  `DateCreated` timestamp NULL DEFAULT NULL,
  `LastBackupTime` timestamp NULL DEFAULT NULL,
  `MaximumUsers` int(10) NOT NULL,
  `ActiveUsers` int(10) NOT NULL,
  `SerialNumber` varchar(20) DEFAULT NULL,
  `NetworkLicense` varchar(20) DEFAULT NULL,
  `AdminTimeStamp` timestamp NULL DEFAULT NULL,
  `Password` varchar(75) DEFAULT NULL,
  UNIQUE KEY `DBInfoId` (`DBInfoId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EmptiedTrash`
--

DROP TABLE IF EXISTS `EmptiedTrash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmptiedTrash` (
  `RecordId` int(10) NOT NULL AUTO_INCREMENT,
  `NumItemId` int(10) NOT NULL,
  `TextItemId` varchar(255) NOT NULL,
  `LocId` int(10) NOT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `Keywords` text,
  `CatId` int(10) DEFAULT NULL,
  `ActionDate` timestamp NULL DEFAULT NULL,
  `DateCreated` timestamp NULL DEFAULT NULL,
  `ReviewFreq` int(10) NOT NULL,
  `ItemNote` text,
  `IsTagged` bit(1) NOT NULL,
  `Status` int(10) NOT NULL,
  `TimeStamp` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `RecordId` (`RecordId`),
  KEY `LocId` (`LocId`),
  KEY `CatId` (`CatId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReportParms`
--

DROP TABLE IF EXISTS `ReportParms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReportParms` (
  `ReportParmsId` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(75) DEFAULT NULL,
  `ReportName` varchar(100) DEFAULT NULL,
  `ReportId` varchar(100) DEFAULT NULL,
  `ParmName` varchar(100) DEFAULT NULL,
  `ParmValue` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ReportParmsId`),
  UNIQUE KEY `ReportParmsId` (`ReportParmsId`),
  UNIQUE KEY `ReportId` (`ReportId`,`UserId`,`ReportName`,`ParmName`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserLocInfo`
--

DROP TABLE IF EXISTS `UserLocInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserLocInfo` (
  `UserLocInfoId` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(75) DEFAULT NULL,
  `LocId` int(10) NOT NULL,
  `LastUsedTimeStamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`UserLocInfoId`),
  UNIQUE KEY `UserLocInfoIdx` (`UserLocInfoId`),
  UNIQUE KEY `UserLocUserId` (`UserId`,`LocId`),
  KEY `FK_UserLocInfo_LocId` (`LocId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `CatId` int(10) NOT NULL AUTO_INCREMENT,
  `CatName` varchar(255) DEFAULT NULL,
  `Catnote` text,
  `Viewable` bit(1) NOT NULL,
  `TimeStamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`CatId`),
  UNIQUE KEY `CatId` (`CatId`),
  UNIQUE KEY `CatName` (`CatName`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `RecordId` int(10) NOT NULL AUTO_INCREMENT,
  `NumItemId` int(10) NOT NULL,
  `TextItemId` varchar(255) NOT NULL,
  `LocId` int(10) NOT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `Keywords` text,
  `CatId` int(10) DEFAULT NULL,
  `ActionDate` timestamp NULL DEFAULT NULL,
  `DateCreated` timestamp NULL DEFAULT NULL,
  `ReviewFreq` int(10) NOT NULL,
  `ItemNote` text,
  `IsTagged` bit(1) NOT NULL,
  `Status` int(10) NOT NULL,
  `TimeStamp` timestamp NULL DEFAULT NULL,
  `ItemNotes` text,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`RecordId`),
  UNIQUE KEY `RecId` (`RecordId`),
  KEY `NumItemId` (`NumItemId`),
  KEY `TextItemId` (`TextItemId`),
  KEY `LocId` (`LocId`),
  KEY `CatId` (`CatId`),
  KEY `Status` (`Status`)
) ENGINE=InnoDB AUTO_INCREMENT=1906 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `LocId` int(10) NOT NULL AUTO_INCREMENT,
  `LocName` varchar(50) DEFAULT NULL,
  `LocNote` text,
  `DateCreated` timestamp NULL DEFAULT NULL,
  `AllowDecimals` bit(1) NOT NULL,
  `MaxCapacity` int(10) NOT NULL,
  `Viewable` bit(1) NOT NULL,
  `ReviewFreqString` varchar(50) DEFAULT NULL,
  `Timestamp` timestamp NULL DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`LocId`),
  UNIQUE KEY `LocId` (`LocId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phinxlog`
--

DROP TABLE IF EXISTS `phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sysdiagrams`
--

DROP TABLE IF EXISTS `sysdiagrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysdiagrams` (
  `name` varchar(128) NOT NULL,
  `principal_id` int(10) NOT NULL,
  `diagram_id` int(10) NOT NULL AUTO_INCREMENT,
  `version` int(10) DEFAULT NULL,
  `definition` blob,
  PRIMARY KEY (`diagram_id`),
  UNIQUE KEY `PK__sysdiagr__C2B05B611B0907CE` (`diagram_id`),
  UNIQUE KEY `UK_principal_name` (`principal_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfers` (
  `TransferId` int(10) NOT NULL AUTO_INCREMENT,
  `OldLocId` int(10) NOT NULL,
  `OldItemId` int(10) NOT NULL,
  `OldItemRecId` int(10) NOT NULL,
  `NewLocId` int(10) NOT NULL,
  `NewItemId` int(10) NOT NULL,
  `NewItemRecId` int(10) NOT NULL,
  `IsConfirmed` bit(1) NOT NULL,
  `TransferDate` timestamp NULL DEFAULT NULL,
  `ConfirmDate` timestamp NULL DEFAULT NULL,
  `IsCancelled` bit(1) NOT NULL,
  `TransferType` varchar(4) DEFAULT NULL,
  `UserId` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`TransferId`),
  UNIQUE KEY `TransferId` (`TransferId`),
  KEY `OldLocId` (`OldLocId`),
  KEY `OldItemId` (`OldItemId`),
  KEY `OldItemRecId` (`OldItemRecId`),
  KEY `NewLocId` (`NewLocId`),
  KEY `NewItemId` (`NewItemId`),
  KEY `NewItemRecId` (`NewItemRecId`)
) ENGINE=InnoDB AUTO_INCREMENT=1598 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-15 18:43:58
