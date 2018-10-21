-- MySQL dump 10.13  Distrib 5.7.23, for osx10.13 (x86_64)
--
-- Host: 192.168.0.254    Database: Tenant_testing_disal
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.16.04.1-log

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
-- Table structure for table `agentStorage`
--

DROP TABLE IF EXISTS `agentStorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agentStorage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `start` datetime NOT NULL,
  `eventId` varchar(128) NOT NULL,
  `data` mediumtext,
  `owner` varchar(64) NOT NULL,
  `eventType` varchar(64) NOT NULL,
  `isInvalid` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`id`) USING BTREE,
  KEY `start_idx` (`start`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agentStorage`
--

LOCK TABLES `agentStorage` WRITE;
/*!40000 ALTER TABLE `agentStorage` DISABLE KEYS */;
/*!40000 ALTER TABLE `agentStorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `behaviourIndicator`
--

DROP TABLE IF EXISTS `behaviourIndicator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `behaviourIndicator` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `headerId` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` decimal(6,3) NOT NULL,
  `kpi` decimal(6,3) NOT NULL,
  `grade` decimal(6,3) NOT NULL,
  `state` smallint(6) NOT NULL DEFAULT '1',
  `weightedUnit` varchar(28) NOT NULL,
  `tripGrade` bigint(20) NOT NULL,
  `travelTimeLength` decimal(5,2) NOT NULL,
  `travelKms` bigint(20) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `filterTags` varchar(256) DEFAULT NULL,
  `featureTags` varchar(256) DEFAULT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_start` (`start`) USING BTREE,
  KEY `idx_headerId` (`headerId`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `behaviourIndicator`
--

LOCK TABLES `behaviourIndicator` WRITE;
/*!40000 ALTER TABLE `behaviourIndicator` DISABLE KEYS */;
/*!40000 ALTER TABLE `behaviourIndicator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entityhomologation`
--

DROP TABLE IF EXISTS `entityhomologation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entityhomologation` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entityId` bigint(20) NOT NULL,
  `entityType` varchar(32) NOT NULL,
  `externalEntityId` varchar(64) NOT NULL,
  `dataSource` varchar(128) DEFAULT NULL,
  `active` smallint(6) NOT NULL,
  `entityAlias` varchar(128) NOT NULL,
  `state` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_key` (`entityId`,`entityType`,`dataSource`) USING BTREE,
  UNIQUE KEY `idx_ext_key` (`externalEntityId`,`entityType`,`dataSource`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entityhomologation`
--

LOCK TABLES `entityhomologation` WRITE;
/*!40000 ALTER TABLE `entityhomologation` DISABLE KEYS */;
/*!40000 ALTER TABLE `entityhomologation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventAssignedDrivenSection`
--

DROP TABLE IF EXISTS `eventAssignedDrivenSection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventAssignedDrivenSection` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(128) NOT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `agentAlias` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` mediumtext,
  `serializedPrunedEvents` mediumtext,
  `metadata` varchar(8192) DEFAULT NULL,
  `filterTags` varchar(1024) DEFAULT NULL,
  `featureTags` varchar(1024) DEFAULT NULL,
  `batchguid` varchar(256) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `startGranular` datetime NOT NULL,
  `endGranular` datetime NOT NULL,
  `sourceGeoZoneId` bigint(20) NOT NULL,
  `destinationGeoZoneId` bigint(20) NOT NULL,
  `sourceGeoZoneAlias` varchar(128) DEFAULT NULL,
  `destinationGeoZoneAlias` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_start` (`start`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_start_end_driverId` (`driverId`,`start`,`end`) USING BTREE,
  KEY `idx_start_end_vehicleId` (`vehicleId`,`start`,`end`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventAssignedDrivenSection`
--

LOCK TABLES `eventAssignedDrivenSection` WRITE;
/*!40000 ALTER TABLE `eventAssignedDrivenSection` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventAssignedDrivenSection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventBPM`
--

DROP TABLE IF EXISTS `eventBPM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventBPM` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(128) NOT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `agentAlias` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` mediumtext,
  `serializedPrunedEvents` mediumtext,
  `metadata` varchar(8192) DEFAULT NULL,
  `filterTags` varchar(1024) DEFAULT NULL,
  `featureTags` varchar(1024) DEFAULT NULL,
  `batchguid` varchar(256) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `typeTTE` varchar(128) NOT NULL,
  `bpmProcessId` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_start_end` (`start`,`end`) USING BTREE,
  KEY `idx_start_end_driverId` (`start`,`end`,`driverId`) USING BTREE,
  KEY `idx_start_end_vehicleId` (`start`,`end`,`vehicleId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventBPM`
--

LOCK TABLES `eventBPM` WRITE;
/*!40000 ALTER TABLE `eventBPM` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventBPM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventBehaviourModel`
--

DROP TABLE IF EXISTS `eventBehaviourModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventBehaviourModel` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(128) NOT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `agentAlias` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` mediumtext,
  `serializedPrunedEvents` mediumtext,
  `metadata` varchar(8192) DEFAULT NULL,
  `filterTags` varchar(1024) DEFAULT NULL,
  `featureTags` varchar(1024) DEFAULT NULL,
  `batchguid` varchar(256) DEFAULT NULL,
  `equipmentId` varchar(32) DEFAULT NULL,
  `tripGrade` bigint(20) NOT NULL,
  `travelTimeLength` decimal(5,2) NOT NULL,
  `travelKms` bigint(20) NOT NULL,
  `quality` bigint(20) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_start` (`start`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_start_end_driverId` (`driverId`,`start`,`end`) USING BTREE,
  KEY `idx_start_end_vehicleId` (`vehicleId`,`start`,`end`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventBehaviourModel`
--

LOCK TABLES `eventBehaviourModel` WRITE;
/*!40000 ALTER TABLE `eventBehaviourModel` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventBehaviourModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventDriverSectionConfirmation`
--

DROP TABLE IF EXISTS `eventDriverSectionConfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventDriverSectionConfirmation` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(128) NOT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `agentAlias` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` mediumtext,
  `serializedPrunedEvents` mediumtext,
  `metadata` varchar(8192) DEFAULT NULL,
  `filterTags` varchar(1024) DEFAULT NULL,
  `featureTags` varchar(1024) DEFAULT NULL,
  `batchguid` varchar(256) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `latitudeStart` double NOT NULL,
  `longitudeStart` double NOT NULL,
  `altitudeStart` double NOT NULL,
  `latitudeEnd` double NOT NULL,
  `longitudeEnd` double NOT NULL,
  `altitudeEnd` double NOT NULL,
  `sourceGeoZoneId` bigint(20) NOT NULL,
  `destinationGeoZoneId` bigint(20) NOT NULL,
  `sourceGeoZoneAlias` varchar(128) DEFAULT NULL,
  `destinationGeoZoneAlias` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_start` (`start`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_start_end_vehicleId` (`vehicleId`,`start`,`end`) USING BTREE,
  KEY `idx_start_end_driverId` (`driverId`,`start`,`end`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventDriverSectionConfirmation`
--

LOCK TABLES `eventDriverSectionConfirmation` WRITE;
/*!40000 ALTER TABLE `eventDriverSectionConfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventDriverSectionConfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventDrivingSection`
--

DROP TABLE IF EXISTS `eventDrivingSection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventDrivingSection` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(128) NOT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `agentAlias` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` mediumtext,
  `serializedPrunedEvents` mediumtext,
  `metadata` varchar(8192) DEFAULT NULL,
  `filterTags` varchar(1024) DEFAULT NULL,
  `featureTags` varchar(1024) DEFAULT NULL,
  `batchguid` varchar(256) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `startGranular` datetime NOT NULL,
  `endGranular` datetime NOT NULL,
  `latitudeStart` double NOT NULL,
  `longitudeStart` double NOT NULL,
  `altitudeStart` double NOT NULL,
  `latitudeEnd` double NOT NULL,
  `longitudeEnd` double NOT NULL,
  `altitudeEnd` double NOT NULL,
  `absDistance` double NOT NULL,
  `avgSpeed` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_start` (`startGranular`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_startG_endG_vehicle` (`vehicleId`,`startGranular`,`endGranular`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventDrivingSection`
--

LOCK TABLES `eventDrivingSection` WRITE;
/*!40000 ALTER TABLE `eventDrivingSection` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventDrivingSection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventFatigueLevel`
--

DROP TABLE IF EXISTS `eventFatigueLevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventFatigueLevel` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(128) NOT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `agentAlias` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` mediumtext,
  `serializedPrunedEvents` mediumtext,
  `metadata` varchar(8192) DEFAULT NULL,
  `filterTags` varchar(1024) DEFAULT NULL,
  `featureTags` varchar(1024) DEFAULT NULL,
  `batchguid` varchar(256) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `fatigueLevelScore` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_start` (`start`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_start_end_driverId` (`driverId`,`start`,`end`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventFatigueLevel`
--

LOCK TABLES `eventFatigueLevel` WRITE;
/*!40000 ALTER TABLE `eventFatigueLevel` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventFatigueLevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventFatigueModel`
--

DROP TABLE IF EXISTS `eventFatigueModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventFatigueModel` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(128) NOT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `agentAlias` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` mediumtext,
  `serializedPrunedEvents` mediumtext,
  `metadata` varchar(8192) DEFAULT NULL,
  `filterTags` varchar(1024) DEFAULT NULL,
  `featureTags` varchar(1024) DEFAULT NULL,
  `batchguid` varchar(256) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `fatigueScore` bigint(20) NOT NULL,
  `percentBelowRed` bigint(20) NOT NULL,
  `fs_contributor_1` varchar(128) NOT NULL,
  `fs_contributor_2` varchar(128) NOT NULL,
  `fs_contributor_3` varchar(128) NOT NULL,
  `gComparator` bigint(20) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_start` (`start`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_start_end_driverId` (`driverId`,`start`,`end`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventFatigueModel`
--

LOCK TABLES `eventFatigueModel` WRITE;
/*!40000 ALTER TABLE `eventFatigueModel` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventFatigueModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventGeoSample`
--

DROP TABLE IF EXISTS `eventGeoSample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventGeoSample` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(128) NOT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `agentAlias` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` mediumtext,
  `serializedPrunedEvents` mediumtext,
  `metadata` varchar(8192) DEFAULT NULL,
  `filterTags` varchar(1024) DEFAULT NULL,
  `featureTags` varchar(1024) DEFAULT NULL,
  `batchguid` varchar(256) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `startGranular` datetime NOT NULL,
  `endGranular` datetime NOT NULL,
  `latitudeStart` double NOT NULL,
  `longitudeStart` double NOT NULL,
  `altitudeStart` double NOT NULL,
  `latitudeEnd` double NOT NULL,
  `longitudeEnd` double NOT NULL,
  `altitudeEnd` double NOT NULL,
  `absDistance` double NOT NULL,
  `avgSpeed` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_start` (`startGranular`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_startG_endG_vehicle` (`vehicleId`,`startGranular`,`endGranular`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventGeoSample`
--

LOCK TABLES `eventGeoSample` WRITE;
/*!40000 ALTER TABLE `eventGeoSample` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventGeoSample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventGeoZoneCheckPoint`
--

DROP TABLE IF EXISTS `eventGeoZoneCheckPoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventGeoZoneCheckPoint` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(128) NOT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `agentAlias` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` mediumtext,
  `serializedPrunedEvents` mediumtext,
  `metadata` varchar(8192) DEFAULT NULL,
  `filterTags` varchar(1024) DEFAULT NULL,
  `featureTags` varchar(1024) DEFAULT NULL,
  `batchguid` varchar(256) DEFAULT NULL,
  `start` datetime NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `altitude` double NOT NULL,
  `geoZoneId` bigint(20) NOT NULL,
  `geoZoneAlias` varchar(128) DEFAULT NULL,
  `direction` varchar(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_start` (`start`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_start_end_vehicleId_geoZoneId` (`vehicleId`,`start`,`geoZoneId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventGeoZoneCheckPoint`
--

LOCK TABLES `eventGeoZoneCheckPoint` WRITE;
/*!40000 ALTER TABLE `eventGeoZoneCheckPoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventGeoZoneCheckPoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventGeoZoneSection`
--

DROP TABLE IF EXISTS `eventGeoZoneSection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventGeoZoneSection` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(128) NOT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `agentAlias` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` mediumtext,
  `serializedPrunedEvents` mediumtext,
  `metadata` varchar(8192) DEFAULT NULL,
  `filterTags` varchar(1024) DEFAULT NULL,
  `featureTags` varchar(1024) DEFAULT NULL,
  `batchguid` varchar(256) DEFAULT NULL,
  `movementType` varchar(64) NOT NULL,
  `start` datetime NOT NULL,
  `startGranular` datetime NOT NULL,
  `endGranular` datetime NOT NULL,
  `end` datetime NOT NULL,
  `sourceGeoZoneId` bigint(20) DEFAULT NULL,
  `destinationGeoZoneId` bigint(20) DEFAULT NULL,
  `sourceGeoZoneAlias` varchar(128) DEFAULT NULL,
  `destinationGeoZoneAlias` varchar(128) DEFAULT NULL,
  `sourceGeoZoneTags` varchar(256) DEFAULT NULL,
  `destinationGeoZoneTags` varchar(256) DEFAULT NULL,
  `latitudeStart` double NOT NULL,
  `longitudeStart` double NOT NULL,
  `altitudeStart` double NOT NULL,
  `latitudeEnd` double NOT NULL,
  `longitudeEnd` double NOT NULL,
  `altitudeEnd` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_start` (`start`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_start_vehicle_end` (`vehicleId`,`start`,`end`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventGeoZoneSection`
--

LOCK TABLES `eventGeoZoneSection` WRITE;
/*!40000 ALTER TABLE `eventGeoZoneSection` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventGeoZoneSection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventMDTCheckPoint`
--

DROP TABLE IF EXISTS `eventMDTCheckPoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventMDTCheckPoint` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(128) NOT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `agentAlias` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` mediumtext,
  `serializedPrunedEvents` mediumtext,
  `metadata` varchar(8192) DEFAULT NULL,
  `filterTags` varchar(1024) DEFAULT NULL,
  `featureTags` varchar(1024) DEFAULT NULL,
  `batchguid` varchar(256) DEFAULT NULL,
  `start` datetime NOT NULL,
  `movementType` varchar(128) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `altitude` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_start` (`start`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_start_driverId` (`start`,`driverId`) USING BTREE,
  KEY `idx_start_vehicleId` (`start`,`vehicleId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventMDTCheckPoint`
--

LOCK TABLES `eventMDTCheckPoint` WRITE;
/*!40000 ALTER TABLE `eventMDTCheckPoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventMDTCheckPoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventPositionUpdate`
--

DROP TABLE IF EXISTS `eventPositionUpdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventPositionUpdate` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(128) NOT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `agentAlias` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` mediumtext,
  `serializedPrunedEvents` mediumtext,
  `metadata` varchar(8192) DEFAULT NULL,
  `filterTags` varchar(1024) DEFAULT NULL,
  `featureTags` varchar(1024) DEFAULT NULL,
  `batchguid` varchar(256) DEFAULT NULL,
  `start` datetime NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `altitude` double NOT NULL,
  `geoZoneId` bigint(20) DEFAULT NULL,
  `geoZoneAlias` varchar(128) DEFAULT NULL,
  `speed` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_start` (`start`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_start_vehicle` (`vehicleId`,`start`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventPositionUpdate`
--

LOCK TABLES `eventPositionUpdate` WRITE;
/*!40000 ALTER TABLE `eventPositionUpdate` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventPositionUpdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventQueue`
--

DROP TABLE IF EXISTS `eventQueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventQueue` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dataSource` varchar(64) NOT NULL,
  `externalId` varchar(64) NOT NULL,
  `isHomologated` tinyint(1) NOT NULL,
  `isProcessed` tinyint(1) NOT NULL,
  `serializedEvent` mediumtext,
  `eventType` varchar(64) NOT NULL,
  `start` datetime NOT NULL,
  `state` smallint(6) NOT NULL DEFAULT '1',
  `batchguid` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventQueue`
--

LOCK TABLES `eventQueue` WRITE;
/*!40000 ALTER TABLE `eventQueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventQueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventRoadWarning`
--

DROP TABLE IF EXISTS `eventRoadWarning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventRoadWarning` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(128) NOT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `agentAlias` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` mediumtext,
  `serializedPrunedEvents` mediumtext,
  `metadata` varchar(8192) DEFAULT NULL,
  `filterTags` varchar(1024) DEFAULT NULL,
  `featureTags` varchar(1024) DEFAULT NULL,
  `batchguid` varchar(256) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `altitude` double NOT NULL,
  `alertName` varchar(128) NOT NULL,
  `value` double NOT NULL,
  `metricUnit` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_start` (`start`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_start_end_vehicleId` (`vehicleId`,`start`,`end`) USING BTREE,
  KEY `idx_start_end_driverId` (`driverId`,`start`,`end`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventRoadWarning`
--

LOCK TABLES `eventRoadWarning` WRITE;
/*!40000 ALTER TABLE `eventRoadWarning` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventRoadWarning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventSimulatedCasScene`
--

DROP TABLE IF EXISTS `eventSimulatedCasScene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventSimulatedCasScene` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(128) NOT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `agentAlias` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` mediumtext,
  `serializedPrunedEvents` mediumtext,
  `metadata` varchar(8192) DEFAULT NULL,
  `filterTags` varchar(1024) DEFAULT NULL,
  `featureTags` varchar(1024) DEFAULT NULL,
  `batchguid` varchar(256) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `alertAvg` double NOT NULL,
  `belowRedAvg` double NOT NULL,
  `sceneId` bigint(20) NOT NULL,
  `probability` double NOT NULL,
  `flvlDate` datetime NOT NULL,
  `gComparator` bigint(20) NOT NULL DEFAULT '-1',
  `fatigueScore` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_driverId_flvlDate` (`driverId`,`flvlDate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventSimulatedCasScene`
--

LOCK TABLES `eventSimulatedCasScene` WRITE;
/*!40000 ALTER TABLE `eventSimulatedCasScene` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventSimulatedCasScene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventTT`
--

DROP TABLE IF EXISTS `eventTT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventTT` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(128) NOT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `agentAlias` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` mediumtext,
  `serializedPrunedEvents` mediumtext,
  `metadata` varchar(8192) DEFAULT NULL,
  `filterTags` varchar(1024) DEFAULT NULL,
  `featureTags` varchar(1024) DEFAULT NULL,
  `batchguid` varchar(256) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `typeTTE` varchar(128) NOT NULL,
  `serializedData` mediumtext,
  `driverCode` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_start_end` (`start`,`end`) USING BTREE,
  KEY `idx_start_end_driverId` (`start`,`end`,`driverId`) USING BTREE,
  KEY `idx_start_end_vehicleId` (`start`,`end`,`vehicleId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventTT`
--

LOCK TABLES `eventTT` WRITE;
/*!40000 ALTER TABLE `eventTT` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventTT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventTrip`
--

DROP TABLE IF EXISTS `eventTrip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventTrip` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(128) NOT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `agentAlias` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` mediumtext,
  `serializedPrunedEvents` mediumtext,
  `metadata` varchar(8192) DEFAULT NULL,
  `filterTags` varchar(1024) DEFAULT NULL,
  `featureTags` varchar(1024) DEFAULT NULL,
  `batchguid` varchar(256) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `latitudeStart` double NOT NULL,
  `longitudeStart` double NOT NULL,
  `altitudeStart` double NOT NULL,
  `latitudeEnd` double NOT NULL,
  `longitudeEnd` double NOT NULL,
  `altitudeEnd` double NOT NULL,
  `absDistance` double NOT NULL,
  `avgSpeed` double NOT NULL,
  `standByHours` double NOT NULL,
  `drivenHours` double NOT NULL,
  `sourceGeoZoneId` bigint(20) DEFAULT NULL,
  `destinationGeoZoneId` bigint(20) DEFAULT NULL,
  `sourceGeoZoneAlias` varchar(128) DEFAULT NULL,
  `destinationGeoZoneAlias` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_start` (`start`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_start_end_driverId` (`driverId`,`start`,`end`) USING BTREE,
  KEY `idx_start_end_vehicleId` (`vehicleId`,`start`,`end`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventTrip`
--

LOCK TABLES `eventTrip` WRITE;
/*!40000 ALTER TABLE `eventTrip` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventTrip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventWaitingTime`
--

DROP TABLE IF EXISTS `eventWaitingTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventWaitingTime` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(128) NOT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `agentAlias` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` mediumtext,
  `serializedPrunedEvents` mediumtext,
  `metadata` varchar(8192) DEFAULT NULL,
  `filterTags` varchar(1024) DEFAULT NULL,
  `featureTags` varchar(1024) DEFAULT NULL,
  `batchguid` varchar(256) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `sourceGeoZoneId` bigint(20) DEFAULT NULL,
  `destinationGeoZoneId` bigint(20) DEFAULT NULL,
  `sourceGeoZoneAlias` varchar(128) DEFAULT NULL,
  `destinationGeoZoneAlias` varchar(128) DEFAULT NULL,
  `latitudeStart` double NOT NULL,
  `longitudeStart` double NOT NULL,
  `altitudeStart` double NOT NULL,
  `latitudeEnd` double NOT NULL,
  `longitudeEnd` double NOT NULL,
  `altitudeEnd` double NOT NULL,
  `waitingType` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_start` (`start`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_start_end_driverId` (`driverId`,`start`,`end`) USING BTREE,
  KEY `idx_start_end_vehicleId` (`vehicleId`,`start`,`end`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventWaitingTime`
--

LOCK TABLES `eventWaitingTime` WRITE;
/*!40000 ALTER TABLE `eventWaitingTime` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventWaitingTime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventWorkingShift`
--

DROP TABLE IF EXISTS `eventWorkingShift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventWorkingShift` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(128) NOT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `agentAlias` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` mediumtext,
  `serializedPrunedEvents` mediumtext,
  `metadata` varchar(8192) DEFAULT NULL,
  `filterTags` varchar(1024) DEFAULT NULL,
  `featureTags` varchar(1024) DEFAULT NULL,
  `batchguid` varchar(256) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `restTime` bigint(20) NOT NULL,
  `workingTime` bigint(20) NOT NULL,
  `startSunRise` varchar(64) NOT NULL,
  `drivenTimeSegments` mediumtext,
  `nonDrivenTimeSegments` mediumtext,
  `endSunRise` varchar(64) NOT NULL,
  `startSunSet` varchar(64) NOT NULL,
  `endSunSet` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_start` (`start`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_start_end_driverId` (`driverId`,`start`,`end`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventWorkingShift`
--

LOCK TABLES `eventWorkingShift` WRITE;
/*!40000 ALTER TABLE `eventWorkingShift` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventWorkingShift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventWorkingUnit`
--

DROP TABLE IF EXISTS `eventWorkingUnit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventWorkingUnit` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` varchar(128) NOT NULL,
  `vehicleId` bigint(20) DEFAULT NULL,
  `vehicleAlias` varchar(128) DEFAULT NULL,
  `driverId` bigint(20) DEFAULT NULL,
  `driverAlias` varchar(128) DEFAULT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `agentAlias` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` mediumtext,
  `serializedPrunedEvents` mediumtext,
  `metadata` varchar(8192) DEFAULT NULL,
  `filterTags` varchar(1024) DEFAULT NULL,
  `featureTags` varchar(1024) DEFAULT NULL,
  `batchguid` varchar(256) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `sourceGeoZoneId` bigint(20) DEFAULT NULL,
  `destinationGeoZoneId` bigint(20) DEFAULT NULL,
  `sourceGeoZoneAlias` varchar(128) DEFAULT NULL,
  `destinationGeoZoneAlias` varchar(128) DEFAULT NULL,
  `latitudeStart` double NOT NULL,
  `longitudeStart` double NOT NULL,
  `altitudeStart` double NOT NULL,
  `latitudeEnd` double NOT NULL,
  `longitudeEnd` double NOT NULL,
  `altitudeEnd` double NOT NULL,
  `workingType` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_start` (`start`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_start_end_driverId` (`driverId`,`start`,`end`) USING BTREE,
  KEY `idx_start_end_vehicleId` (`vehicleId`,`start`,`end`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventWorkingUnit`
--

LOCK TABLES `eventWorkingUnit` WRITE;
/*!40000 ALTER TABLE `eventWorkingUnit` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventWorkingUnit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formImage`
--

DROP TABLE IF EXISTS `formImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formImage` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image` mediumtext NOT NULL,
  `formSubmissionId` varchar(64) NOT NULL,
  `questionCode` varchar(64) NOT NULL,
  `imageIndex` smallint(6) NOT NULL,
  `state` smallint(6) NOT NULL DEFAULT '1',
  `filterTags` varchar(256) DEFAULT NULL,
  `featureTags` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formImage`
--

LOCK TABLES `formImage` WRITE;
/*!40000 ALTER TABLE `formImage` DISABLE KEYS */;
/*!40000 ALTER TABLE `formImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formSubmissionQuestions`
--

DROP TABLE IF EXISTS `formSubmissionQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formSubmissionQuestions` (
  `id` varchar(128) NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `start` datetime NOT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `eventProvider` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` varchar(16535) DEFAULT NULL,
  `serializedPrunedEvents` varchar(16535) DEFAULT NULL,
  `serializedDeepEvidence` varchar(16535) DEFAULT NULL,
  `metadata` varchar(8192) DEFAULT NULL,
  `formSubmissionId` varchar(128) NOT NULL,
  `label` varchar(256) NOT NULL,
  `value` varchar(64) NOT NULL,
  `type` varchar(64) NOT NULL,
  `groupCode` varchar(64) NOT NULL,
  `tags` varchar(64) NOT NULL,
  `properties` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `formTitle` varchar(64) NOT NULL,
  `grade` bigint(20) NOT NULL,
  `driverId` bigint(20) NOT NULL,
  `driverAlias` varchar(64) NOT NULL,
  `vehicleId` bigint(20) NOT NULL,
  `vehicleAlias` varchar(64) NOT NULL,
  `entityId` bigint(20) NOT NULL,
  `entityAlias` varchar(64) NOT NULL,
  `entityType` varchar(64) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `userAlias` varchar(64) NOT NULL,
  `severity` varchar(64) NOT NULL,
  `displayValue` varchar(64) NOT NULL,
  `questionIndex` bigint(20) NOT NULL,
  `filterTags` varchar(256) DEFAULT NULL,
  `featureTags` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formSubmissionQuestions`
--

LOCK TABLES `formSubmissionQuestions` WRITE;
/*!40000 ALTER TABLE `formSubmissionQuestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `formSubmissionQuestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formSubmissions`
--

DROP TABLE IF EXISTS `formSubmissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formSubmissions` (
  `id` varchar(128) NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `start` datetime NOT NULL,
  `reliabilityIndex` varchar(32) NOT NULL,
  `version` int(11) NOT NULL,
  `isPruned` tinyint(4) NOT NULL,
  `tenantId` bigint(20) NOT NULL,
  `eventProvider` varchar(64) NOT NULL,
  `eventSrc` varchar(64) NOT NULL,
  `eventKey` varchar(128) NOT NULL,
  `serializedEvidence` varchar(16535) DEFAULT NULL,
  `serializedPrunedEvents` varchar(16535) DEFAULT NULL,
  `serializedDeepEvidence` varchar(16535) DEFAULT NULL,
  `metadata` varchar(8192) DEFAULT NULL,
  `formTemplateId` varchar(64) NOT NULL,
  `datetime` datetime NOT NULL,
  `formTitle` varchar(64) NOT NULL,
  `severity` varchar(64) NOT NULL,
  `grade` bigint(20) NOT NULL,
  `driverId` bigint(20) NOT NULL,
  `driverAlias` varchar(64) NOT NULL,
  `vehicleId` bigint(20) NOT NULL,
  `vehicleAlias` varchar(64) NOT NULL,
  `entityId` bigint(20) NOT NULL,
  `entityAlias` varchar(64) NOT NULL,
  `entityType` varchar(64) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `userAlias` varchar(64) NOT NULL,
  `filterTags` varchar(256) DEFAULT NULL,
  `featureTags` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formSubmissions`
--

LOCK TABLES `formSubmissions` WRITE;
/*!40000 ALTER TABLE `formSubmissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `formSubmissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formTemplate`
--

DROP TABLE IF EXISTS `formTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formTemplate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `formTitle` varchar(64) NOT NULL,
  `formTemplateId` varchar(32) NOT NULL,
  `hiddenFlag` tinyint(1) NOT NULL,
  `metadata` varchar(64) NOT NULL,
  `creationDate` datetime NOT NULL,
  `state` smallint(6) NOT NULL DEFAULT '1',
  `filterTags` varchar(256) DEFAULT NULL,
  `featureTags` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_idx_key` (`formTitle`,`formTemplateId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formTemplate`
--

LOCK TABLES `formTemplate` WRITE;
/*!40000 ALTER TABLE `formTemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `formTemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formTemplateQuestion`
--

DROP TABLE IF EXISTS `formTemplateQuestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formTemplateQuestion` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `formTemplateId` varchar(64) NOT NULL,
  `groupCode` varchar(64) NOT NULL,
  `label` varchar(256) NOT NULL,
  `type` varchar(64) NOT NULL,
  `value` varchar(64) NOT NULL,
  `properties` varchar(63007) NOT NULL,
  `metadata` varchar(64) NOT NULL,
  `questionCode` varchar(64) NOT NULL,
  `state` smallint(6) NOT NULL DEFAULT '1',
  `filterTags` varchar(256) DEFAULT NULL,
  `featureTags` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formTemplateQuestion`
--

LOCK TABLES `formTemplateQuestion` WRITE;
/*!40000 ALTER TABLE `formTemplateQuestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `formTemplateQuestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geozone`
--

DROP TABLE IF EXISTS `geozone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geozone` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `state` smallint(6) NOT NULL DEFAULT '1',
  `alias` varchar(64) NOT NULL,
  `polygon` varchar(16000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_code` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geozone`
--

LOCK TABLES `geozone` WRITE;
/*!40000 ALTER TABLE `geozone` DISABLE KEYS */;
/*!40000 ALTER TABLE `geozone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geozoneTagHistory`
--

DROP TABLE IF EXISTS `geozoneTagHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geozoneTagHistory` (
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `tagsAlias` varchar(64) NOT NULL,
  `entityId` bigint(20) NOT NULL,
  PRIMARY KEY (`start`,`tagsAlias`,`entityId`),
  KEY `fk_geozone` (`entityId`),
  KEY `fk_geozone_tag` (`tagsAlias`),
  KEY `idx_start_end_tag_entity` (`start`,`end`,`tagsAlias`,`entityId`) USING BTREE,
  CONSTRAINT `geozoneTagHistory_ibfk_1` FOREIGN KEY (`entityId`) REFERENCES `geozone` (`id`),
  CONSTRAINT `geozoneTagHistory_ibfk_2` FOREIGN KEY (`tagsAlias`) REFERENCES `tag` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geozoneTagHistory`
--

LOCK TABLES `geozoneTagHistory` WRITE;
/*!40000 ALTER TABLE `geozoneTagHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `geozoneTagHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instances`
--

DROP TABLE IF EXISTS `instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instances` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` char(36) NOT NULL,
  `name` varchar(64) NOT NULL,
  `filenamePath` varchar(512) NOT NULL,
  `MD5` varchar(64) NOT NULL,
  `settings` varchar(8192) DEFAULT NULL,
  `tenantId` varchar(64) NOT NULL,
  `type` varchar(128) NOT NULL,
  `jarInternalAddr` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instances`
--

LOCK TABLES `instances` WRITE;
/*!40000 ALTER TABLE `instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instantCounters`
--

DROP TABLE IF EXISTS `instantCounters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instantCounters` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `source` varchar(128) NOT NULL,
  `metricName` varchar(128) NOT NULL,
  `lastUpdate` datetime NOT NULL,
  `metricUnit` varchar(32) NOT NULL,
  `lastValue` varchar(64) NOT NULL,
  PRIMARY KEY (`source`,`metricName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instantCounters`
--

LOCK TABLES `instantCounters` WRITE;
/*!40000 ALTER TABLE `instantCounters` DISABLE KEYS */;
/*!40000 ALTER TABLE `instantCounters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performanceCounters`
--

DROP TABLE IF EXISTS `performanceCounters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performanceCounters` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `source` varchar(128) NOT NULL,
  `metricName` varchar(128) NOT NULL,
  `metricUnit` varchar(32) NOT NULL,
  `dateTime` datetime NOT NULL,
  `granularity` varchar(24) NOT NULL,
  `qty` double NOT NULL,
  `sum` double NOT NULL,
  `average` double NOT NULL,
  `maximum` double DEFAULT NULL,
  `minimum` double DEFAULT NULL,
  PRIMARY KEY (`dateTime`,`granularity`,`source`,`metricName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performanceCounters`
--

LOCK TABLES `performanceCounters` WRITE;
/*!40000 ALTER TABLE `performanceCounters` DISABLE KEYS */;
/*!40000 ALTER TABLE `performanceCounters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `state` smallint(6) NOT NULL DEFAULT '1',
  `alias` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personTagHistory`
--

DROP TABLE IF EXISTS `personTagHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personTagHistory` (
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `tagsAlias` varchar(64) NOT NULL,
  `entityId` bigint(20) NOT NULL,
  PRIMARY KEY (`start`,`tagsAlias`,`entityId`),
  KEY `fk_person` (`entityId`),
  KEY `fk_person_tag` (`tagsAlias`),
  KEY `idx_start_end_tag_entity` (`start`,`end`,`tagsAlias`,`entityId`) USING BTREE,
  CONSTRAINT `personTagHistory_ibfk_1` FOREIGN KEY (`entityId`) REFERENCES `person` (`id`),
  CONSTRAINT `personTagHistory_ibfk_2` FOREIGN KEY (`tagsAlias`) REFERENCES `tag` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personTagHistory`
--

LOCK TABLES `personTagHistory` WRITE;
/*!40000 ALTER TABLE `personTagHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `personTagHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(64) NOT NULL,
  `description` varchar(128) NOT NULL,
  `state` smallint(6) NOT NULL DEFAULT '1',
  `filterTags` varchar(256) DEFAULT NULL,
  `featureTags` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rolename` (`roleName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alias` varchar(64) NOT NULL,
  `state` smallint(6) NOT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  `sys` smallint(6) NOT NULL,
  `assignable` smallint(6) NOT NULL,
  `searchable` smallint(6) NOT NULL,
  `multiSelect` smallint(6) NOT NULL,
  `path` varchar(256) DEFAULT NULL,
  `metadata` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_alias` (`alias`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unknowentity`
--

DROP TABLE IF EXISTS `unknowentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unknowentity` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entityType` varchar(32) DEFAULT NULL,
  `entityAlias` varchar(64) NOT NULL,
  `externalEntityId` varchar(64) NOT NULL,
  `dataSource` varchar(128) DEFAULT NULL,
  `isActivated` smallint(6) NOT NULL,
  `metadata` varchar(256) DEFAULT NULL,
  `state` smallint(6) NOT NULL DEFAULT '1',
  `filterTags` varchar(256) DEFAULT NULL,
  `featureTags` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_key` (`externalEntityId`,`entityType`,`dataSource`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unknowentity`
--

LOCK TABLES `unknowentity` WRITE;
/*!40000 ALTER TABLE `unknowentity` DISABLE KEYS */;
/*!40000 ALTER TABLE `unknowentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(64) NOT NULL,
  `firstName` varchar(64) NOT NULL,
  `lastName` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `state` smallint(6) NOT NULL DEFAULT '1',
  `filterTags` varchar(256) DEFAULT NULL,
  `featureTags` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`userName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  `state` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_user` (`userId`),
  KEY `fk_role` (`roleId`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `state` smallint(6) NOT NULL DEFAULT '1',
  `alias` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicleTagHistory`
--

DROP TABLE IF EXISTS `vehicleTagHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicleTagHistory` (
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `tagsAlias` varchar(64) NOT NULL,
  `entityId` bigint(20) NOT NULL,
  PRIMARY KEY (`start`,`tagsAlias`,`entityId`),
  KEY `fk_vehicle` (`entityId`),
  KEY `fk_vehicle_tag` (`tagsAlias`),
  KEY `idx_start_end_tag_entity` (`start`,`end`,`tagsAlias`,`entityId`) USING BTREE,
  CONSTRAINT `vehicleTagHistory_ibfk_1` FOREIGN KEY (`entityId`) REFERENCES `vehicle` (`id`),
  CONSTRAINT `vehicleTagHistory_ibfk_2` FOREIGN KEY (`tagsAlias`) REFERENCES `tag` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicleTagHistory`
--

LOCK TABLES `vehicleTagHistory` WRITE;
/*!40000 ALTER TABLE `vehicleTagHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicleTagHistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-04 18:33:12
