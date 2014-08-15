-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: rollerdb
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Current Database: `rollerdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `rollerdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `rollerdb`;

--
-- Table structure for table `autoping`
--

DROP TABLE IF EXISTS `autoping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoping` (
  `id` varchar(48) NOT NULL,
  `websiteid` varchar(48) NOT NULL,
  `pingtargetid` varchar(48) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ap_websiteid_idx` (`websiteid`),
  KEY `ap_pingtid_idx` (`pingtargetid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoping`
--

LOCK TABLES `autoping` WRITE;
/*!40000 ALTER TABLE `autoping` DISABLE KEYS */;
/*!40000 ALTER TABLE `autoping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmark`
--

DROP TABLE IF EXISTS `bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmark` (
  `id` varchar(48) NOT NULL,
  `folderid` varchar(48) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '100',
  `image` varchar(255) DEFAULT NULL,
  `feedurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bm_folderid_idx` (`folderid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmark`
--

LOCK TABLES `bookmark` WRITE;
/*!40000 ALTER TABLE `bookmark` DISABLE KEYS */;
INSERT INTO `bookmark` VALUES ('51f46610-1374-4c76-a8b1-0daaca40e4d5','1b85c534-3f8c-4206-a971-a3a8b0cbb166','Apache Software Foundation','','http://apache.org',0,0,NULL,NULL),('a5c4c464-5657-463f-91e5-9d24796edf2d','1b85c534-3f8c-4206-a971-a3a8b0cbb166','Apache Roller Project','','http://roller.apache.org',0,0,NULL,NULL);
/*!40000 ALTER TABLE `bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entryattribute`
--

DROP TABLE IF EXISTS `entryattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entryattribute` (
  `id` varchar(48) NOT NULL,
  `entryid` varchar(48) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ea_name_uq` (`entryid`,`name`(40)),
  KEY `ea_entryid_idx` (`entryid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entryattribute`
--

LOCK TABLES `entryattribute` WRITE;
/*!40000 ALTER TABLE `entryattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `entryattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder` (
  `id` varchar(48) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `websiteid` varchar(48) NOT NULL,
  `parentid` varchar(48) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fo_websiteid_idx` (`websiteid`),
  KEY `fo_parentid_idx` (`parentid`),
  KEY `fo_path_idx` (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES ('1b85c534-3f8c-4206-a971-a3a8b0cbb166','root','root','e5459d4d-1ad6-4730-8127-85250f67f666',NULL,'/');
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folderassoc`
--

DROP TABLE IF EXISTS `folderassoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folderassoc` (
  `id` varchar(48) NOT NULL,
  `folderid` varchar(48) NOT NULL,
  `ancestorid` varchar(40) DEFAULT NULL,
  `relation` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fa_folderid_idx` (`folderid`),
  KEY `fa_ancestorid_idx` (`ancestorid`),
  KEY `fa_relation_idx` (`relation`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folderassoc`
--

LOCK TABLES `folderassoc` WRITE;
/*!40000 ALTER TABLE `folderassoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `folderassoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsfeed`
--

DROP TABLE IF EXISTS `newsfeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsfeed` (
  `id` varchar(48) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `websiteid` varchar(48) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nf_websiteid_idx` (`websiteid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsfeed`
--

LOCK TABLES `newsfeed` WRITE;
/*!40000 ALTER TABLE `newsfeed` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsfeed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pingcategory`
--

DROP TABLE IF EXISTS `pingcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pingcategory` (
  `id` varchar(48) NOT NULL,
  `autopingid` varchar(48) NOT NULL,
  `categoryid` varchar(48) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pc_autopingid_idx` (`autopingid`),
  KEY `pc_categoryid_idx` (`categoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pingcategory`
--

LOCK TABLES `pingcategory` WRITE;
/*!40000 ALTER TABLE `pingcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `pingcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pingqueueentry`
--

DROP TABLE IF EXISTS `pingqueueentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pingqueueentry` (
  `id` varchar(48) NOT NULL,
  `entrytime` datetime NOT NULL,
  `pingtargetid` varchar(48) NOT NULL,
  `websiteid` varchar(48) NOT NULL,
  `attempts` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pqe_entrytime_idx` (`entrytime`),
  KEY `pqe_pingtid_idx` (`pingtargetid`),
  KEY `pqe_websiteid_idx` (`websiteid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pingqueueentry`
--

LOCK TABLES `pingqueueentry` WRITE;
/*!40000 ALTER TABLE `pingqueueentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `pingqueueentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pingtarget`
--

DROP TABLE IF EXISTS `pingtarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pingtarget` (
  `id` varchar(48) NOT NULL,
  `name` varchar(255) NOT NULL,
  `pingurl` varchar(255) NOT NULL,
  `websiteid` varchar(48) DEFAULT NULL,
  `conditioncode` int(11) NOT NULL DEFAULT '0',
  `lastsuccess` datetime DEFAULT NULL,
  `autoenabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pt_websiteid_idx` (`websiteid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pingtarget`
--

LOCK TABLES `pingtarget` WRITE;
/*!40000 ALTER TABLE `pingtarget` DISABLE KEYS */;
INSERT INTO `pingtarget` VALUES ('d500f525-be62-407e-860b-9129e6bbdfce','Technorati','http://rpc.technorati.com/rpc/ping',NULL,0,NULL,0),('e17674e8-d421-4e3b-9bff-0020ac96935a','Weblogs.com','http://rpc.weblogs.com/RPC2',NULL,0,NULL,0),('8eab84a6-e214-4ff5-bbef-72b0bc57e32e','blo.gs','http://ping.blo.gs/',NULL,0,NULL,0),('68afa3bb-1ef6-452d-b9e6-60081e6bc300','java.blogs','http://javablogs.com/xmlrpc',NULL,0,NULL,0),('38c7d166-ee36-44d3-a4c4-8c62889bcb77','blogrolling.com','http://rpc.blogrolling.com/pinger/',NULL,0,NULL,0),('a2de9371-3433-4663-9349-7007bc711ebd','IceRocket','http://rpc.icerocket.com:10080/',NULL,0,NULL,0);
/*!40000 ALTER TABLE `pingtarget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rag_entry`
--

DROP TABLE IF EXISTS `rag_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rag_entry` (
  `id` varchar(48) NOT NULL,
  `subscription_id` varchar(48) NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `permalink` text NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `content` text,
  `categories` text,
  `published` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rage_sid_idx` (`subscription_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rag_entry`
--

LOCK TABLES `rag_entry` WRITE;
/*!40000 ALTER TABLE `rag_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `rag_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rag_group`
--

DROP TABLE IF EXISTS `rag_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rag_group` (
  `id` varchar(48) NOT NULL,
  `planet_id` varchar(48) NOT NULL,
  `handle` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `max_page_entries` int(11) DEFAULT '30',
  `max_feed_entries` int(11) DEFAULT '30',
  `cat_restriction` text,
  `group_page` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ragg_handle_uq` (`planet_id`,`handle`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rag_group`
--

LOCK TABLES `rag_group` WRITE;
/*!40000 ALTER TABLE `rag_group` DISABLE KEYS */;
INSERT INTO `rag_group` VALUES ('zzz_all_group_zzz','zzz_default_planet_zzz','all','Default Group',NULL,30,30,NULL,NULL);
/*!40000 ALTER TABLE `rag_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rag_group_subscription`
--

DROP TABLE IF EXISTS `rag_group_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rag_group_subscription` (
  `group_id` varchar(48) NOT NULL,
  `subscription_id` varchar(48) NOT NULL,
  KEY `raggs_gid_idx` (`group_id`),
  KEY `raggs_sid_idx` (`subscription_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rag_group_subscription`
--

LOCK TABLES `rag_group_subscription` WRITE;
/*!40000 ALTER TABLE `rag_group_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `rag_group_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rag_planet`
--

DROP TABLE IF EXISTS `rag_planet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rag_planet` (
  `id` varchar(48) NOT NULL,
  `handle` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ragp_handle_uq` (`handle`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rag_planet`
--

LOCK TABLES `rag_planet` WRITE;
/*!40000 ALTER TABLE `rag_planet` DISABLE KEYS */;
INSERT INTO `rag_planet` VALUES ('zzz_default_planet_zzz','default','Default Planet',NULL);
/*!40000 ALTER TABLE `rag_planet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rag_properties`
--

DROP TABLE IF EXISTS `rag_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rag_properties` (
  `name` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rag_properties`
--

LOCK TABLES `rag_properties` WRITE;
/*!40000 ALTER TABLE `rag_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `rag_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rag_subscription`
--

DROP TABLE IF EXISTS `rag_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rag_subscription` (
  `id` varchar(48) NOT NULL,
  `title` varchar(255) NOT NULL,
  `feed_url` varchar(255) NOT NULL,
  `site_url` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `inbound_links` int(11) DEFAULT '-1',
  `inbound_blogs` int(11) DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rags_feed_url_uq` (`feed_url`(100))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rag_subscription`
--

LOCK TABLES `rag_subscription` WRITE;
/*!40000 ALTER TABLE `rag_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `rag_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referer`
--

DROP TABLE IF EXISTS `referer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referer` (
  `id` varchar(48) NOT NULL,
  `websiteid` varchar(48) NOT NULL,
  `entryid` varchar(48) DEFAULT NULL,
  `datestr` varchar(10) DEFAULT NULL,
  `refurl` varchar(255) NOT NULL,
  `refpermalink` varchar(255) DEFAULT NULL,
  `reftime` datetime DEFAULT NULL,
  `requrl` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `excerpt` text,
  `dayhits` int(11) NOT NULL DEFAULT '0',
  `totalhits` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `duplicate` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ref_websiteid_idx` (`websiteid`),
  KEY `ref_entryid_idx` (`entryid`),
  KEY `ref_refurl_idx` (`refurl`(40)),
  KEY `ref_requrl_idx` (`requrl`(40)),
  KEY `ref_datestr_idx` (`datestr`),
  KEY `ref_refpermlnk_idx` (`refpermalink`(40)),
  KEY `ref_duplicate_idx` (`duplicate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referer`
--

LOCK TABLES `referer` WRITE;
/*!40000 ALTER TABLE `referer` DISABLE KEYS */;
INSERT INTO `referer` VALUES ('4c8bf755-5176-4979-a580-27f7d8e7f1c7','e5459d4d-1ad6-4730-8127-85250f67f666',NULL,NULL,'direct',NULL,NULL,'http://localhost:8080/roller/roller-ui/rendering/page/test',NULL,'',3,3,0,0),('295426ce-6c59-4088-81ec-01ecde7115f7','e5459d4d-1ad6-4730-8127-85250f67f666',NULL,NULL,'http://localhost:8080/roller/',NULL,NULL,'http://localhost:8080/roller/roller-ui/rendering/page/test',NULL,'',1,1,0,0),('4f2189f8-0767-4b4a-b93a-5aa667bbca34','e5459d4d-1ad6-4730-8127-85250f67f666',NULL,NULL,'http://localhost:8080/roller/',NULL,NULL,'http://localhost:8080/roller/roller-ui/rendering/page/test/page/basic-custom.css',NULL,'',3,3,0,0);
/*!40000 ALTER TABLE `referer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roller_audit_log`
--

DROP TABLE IF EXISTS `roller_audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roller_audit_log` (
  `id` varchar(48) NOT NULL,
  `user_id` varchar(48) NOT NULL,
  `object_id` varchar(48) DEFAULT NULL,
  `object_class` varchar(255) DEFAULT NULL,
  `comment_text` varchar(255) NOT NULL,
  `change_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roller_audit_log`
--

LOCK TABLES `roller_audit_log` WRITE;
/*!40000 ALTER TABLE `roller_audit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `roller_audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roller_comment`
--

DROP TABLE IF EXISTS `roller_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roller_comment` (
  `id` varchar(48) NOT NULL,
  `entryid` varchar(48) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `content` text,
  `posttime` datetime NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `remotehost` varchar(128) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `plugins` varchar(255) DEFAULT NULL,
  `contenttype` varchar(128) NOT NULL DEFAULT 'text/plain',
  PRIMARY KEY (`id`),
  KEY `co_entryid_idx` (`entryid`),
  KEY `co_status_idx` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roller_comment`
--

LOCK TABLES `roller_comment` WRITE;
/*!40000 ALTER TABLE `roller_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `roller_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roller_hitcounts`
--

DROP TABLE IF EXISTS `roller_hitcounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roller_hitcounts` (
  `id` varchar(48) NOT NULL,
  `websiteid` varchar(48) NOT NULL,
  `dailyhits` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rhc_websiteid_idx` (`websiteid`),
  KEY `rhc_dailyhits_idx` (`dailyhits`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roller_hitcounts`
--

LOCK TABLES `roller_hitcounts` WRITE;
/*!40000 ALTER TABLE `roller_hitcounts` DISABLE KEYS */;
INSERT INTO `roller_hitcounts` VALUES ('3738a79e-c058-46d4-9151-4b39d35309d5','e5459d4d-1ad6-4730-8127-85250f67f666',4);
/*!40000 ALTER TABLE `roller_hitcounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roller_mediafile`
--

DROP TABLE IF EXISTS `roller_mediafile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roller_mediafile` (
  `id` varchar(48) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `origpath` varchar(255) DEFAULT NULL,
  `content_type` varchar(50) NOT NULL,
  `copyright_text` varchar(1023) DEFAULT NULL,
  `directoryid` varchar(48) NOT NULL,
  `weblogid` varchar(48) NOT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `size_in_bytes` int(11) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  `anchor` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `roller_mediafiledir_id_fk` (`directoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roller_mediafile`
--

LOCK TABLES `roller_mediafile` WRITE;
/*!40000 ALTER TABLE `roller_mediafile` DISABLE KEYS */;
/*!40000 ALTER TABLE `roller_mediafile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roller_mediafiledir`
--

DROP TABLE IF EXISTS `roller_mediafiledir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roller_mediafiledir` (
  `id` varchar(48) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `websiteid` varchar(48) NOT NULL,
  `parentid` varchar(48) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mf_websiteid_fk` (`websiteid`),
  KEY `mf_parentid_fk` (`parentid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roller_mediafiledir`
--

LOCK TABLES `roller_mediafiledir` WRITE;
/*!40000 ALTER TABLE `roller_mediafiledir` DISABLE KEYS */;
INSERT INTO `roller_mediafiledir` VALUES ('1651ec73-391f-40b8-91d7-b6f99f4f79a2','root','root directory','e5459d4d-1ad6-4730-8127-85250f67f666',NULL,'/');
/*!40000 ALTER TABLE `roller_mediafiledir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roller_mediafiletag`
--

DROP TABLE IF EXISTS `roller_mediafiletag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roller_mediafiletag` (
  `id` varchar(48) NOT NULL,
  `mediafile_id` varchar(48) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roller_mediafile_id_tag_fk` (`mediafile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roller_mediafiletag`
--

LOCK TABLES `roller_mediafiletag` WRITE;
/*!40000 ALTER TABLE `roller_mediafiletag` DISABLE KEYS */;
/*!40000 ALTER TABLE `roller_mediafiletag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roller_oauthaccessor`
--

DROP TABLE IF EXISTS `roller_oauthaccessor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roller_oauthaccessor` (
  `consumerkey` varchar(48) NOT NULL,
  `requesttoken` varchar(48) DEFAULT NULL,
  `accesstoken` varchar(48) DEFAULT NULL,
  `tokensecret` varchar(48) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `username` varchar(48) DEFAULT NULL,
  `authorized` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`consumerkey`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roller_oauthaccessor`
--

LOCK TABLES `roller_oauthaccessor` WRITE;
/*!40000 ALTER TABLE `roller_oauthaccessor` DISABLE KEYS */;
/*!40000 ALTER TABLE `roller_oauthaccessor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roller_oauthconsumer`
--

DROP TABLE IF EXISTS `roller_oauthconsumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roller_oauthconsumer` (
  `consumerkey` varchar(48) NOT NULL,
  `consumersecret` varchar(48) NOT NULL,
  `username` varchar(48) DEFAULT NULL,
  PRIMARY KEY (`consumerkey`),
  KEY `oc_username_idx` (`username`(40)),
  KEY `oc_consumerkey_idx` (`consumerkey`(40))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roller_oauthconsumer`
--

LOCK TABLES `roller_oauthconsumer` WRITE;
/*!40000 ALTER TABLE `roller_oauthconsumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `roller_oauthconsumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roller_permission`
--

DROP TABLE IF EXISTS `roller_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roller_permission` (
  `id` varchar(48) NOT NULL,
  `username` varchar(255) NOT NULL,
  `actions` varchar(255) DEFAULT NULL,
  `objectid` varchar(48) DEFAULT NULL,
  `objecttype` varchar(255) DEFAULT NULL,
  `pending` tinyint(1) DEFAULT '1',
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roller_permission`
--

LOCK TABLES `roller_permission` WRITE;
/*!40000 ALTER TABLE `roller_permission` DISABLE KEYS */;
INSERT INTO `roller_permission` VALUES ('a59075ff-3554-4959-882e-6aa82919706e','admin','admin','test','Weblog',0,'2014-08-15 00:00:00');
/*!40000 ALTER TABLE `roller_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roller_properties`
--

DROP TABLE IF EXISTS `roller_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roller_properties` (
  `name` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roller_properties`
--

LOCK TABLES `roller_properties` WRITE;
/*!40000 ALTER TABLE `roller_properties` DISABLE KEYS */;
INSERT INTO `roller_properties` VALUES ('roller.database.version','501'),('uploads.types.forbid','exe'),('users.comments.plugins','HTMLSubset'),('site.linkbacks.enabled','false'),('site.trackbackVerification.enabled','false'),('users.comments.enabled','true'),('trackbacks.ignoreSpam.enabled','true'),('webservices.enableAtomPub','false'),('site.absoluteurl',''),('users.comments.htmlenabled','false'),('uploads.dir.maxsize','4.00'),('users.comments.emailnotify','false'),('spam.blacklist',''),('site.newsfeeds.styledFeeds','true'),('users.themes.path','/themes'),('comments.ignoreSpam.enabled','false'),('user.account.activation.enabled','false'),('site.shortName','Front Page'),('site.description','A default install of the Roller Weblogger open source blog server'),('uploads.enabled','true'),('pings.suspendPingProcessing','false'),('site.adminemail',''),('site.newsfeeds.defaultEntries','30'),('users.editor.pages','editor-text.jsp,editor-rte.jsp,editor-xinha.jsp'),('users.trackbacks.enabled','true'),('users.registration.url',''),('webservices.enableXmlRpc','false'),('themes.customtheme.allowed','true'),('site.allowUserWeblogCreation','true'),('site.frontpage.weblog.handle','test'),('site.name','Roller Site'),('uploads.file.maxsize','1.00'),('uploads.types.allowed',''),('user.account.activation.mail.from',''),('users.registration.enabled','false'),('users.moderation.required','false'),('site.frontpage.weblog.aggregated','false'),('webservices.atomPubAuth','basic'),('site.pages.maxEntries','30');
/*!40000 ALTER TABLE `roller_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roller_tasklock`
--

DROP TABLE IF EXISTS `roller_tasklock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roller_tasklock` (
  `id` varchar(48) NOT NULL,
  `name` varchar(255) NOT NULL,
  `islocked` tinyint(1) DEFAULT '0',
  `timeacquired` datetime DEFAULT NULL,
  `timeleased` int(11) DEFAULT NULL,
  `lastrun` datetime DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rtl_name_uq` (`name`(40)),
  KEY `rtl_taskname_idx` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roller_tasklock`
--

LOCK TABLES `roller_tasklock` WRITE;
/*!40000 ALTER TABLE `roller_tasklock` DISABLE KEYS */;
INSERT INTO `roller_tasklock` VALUES ('e20ecf1f-21c3-4870-abc6-7aa89a7f339d','ScheduledEntriesTask',0,'2014-08-15 10:15:00',0,'2014-08-15 10:15:00','defaultClientId'),('30fda2e2-eb0c-4b10-b02a-7bc395fe6b51','ResetHitCountsTask',0,'1970-01-01 00:00:00',0,'1970-01-01 00:00:00',NULL),('eb8e2b35-5cb3-4ea4-b627-cd89738408cf','TurnoverReferersTask',0,'1970-01-01 00:00:00',0,'1970-01-01 00:00:00',NULL),('f34f46a3-f16e-4eb7-bea1-490b64842f8b','PingQueueTask',0,'2014-08-15 10:11:00',0,'2014-08-15 10:11:00','defaultClientId');
/*!40000 ALTER TABLE `roller_tasklock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roller_userattribute`
--

DROP TABLE IF EXISTS `roller_userattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roller_userattribute` (
  `id` varchar(48) NOT NULL,
  `username` varchar(255) NOT NULL,
  `attrname` varchar(255) NOT NULL,
  `attrvalue` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ua_username_idx` (`username`(40)),
  KEY `ua_attrname_idx` (`attrname`(40)),
  KEY `ua_attrvalue_idx` (`attrvalue`(40))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roller_userattribute`
--

LOCK TABLES `roller_userattribute` WRITE;
/*!40000 ALTER TABLE `roller_userattribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `roller_userattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roller_weblogentrytag`
--

DROP TABLE IF EXISTS `roller_weblogentrytag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roller_weblogentrytag` (
  `id` varchar(48) NOT NULL,
  `entryid` varchar(48) NOT NULL,
  `websiteid` varchar(48) NOT NULL,
  `creator` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wet_entryid_idx` (`entryid`),
  KEY `wet_websiteid_idx` (`websiteid`),
  KEY `wet_creator_idx` (`creator`),
  KEY `wet_name_idx` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roller_weblogentrytag`
--

LOCK TABLES `roller_weblogentrytag` WRITE;
/*!40000 ALTER TABLE `roller_weblogentrytag` DISABLE KEYS */;
/*!40000 ALTER TABLE `roller_weblogentrytag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roller_weblogentrytagagg`
--

DROP TABLE IF EXISTS `roller_weblogentrytagagg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roller_weblogentrytagagg` (
  `id` varchar(48) NOT NULL,
  `websiteid` varchar(48) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `lastused` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `weta_websiteid_idx` (`websiteid`),
  KEY `weta_name_idx` (`name`),
  KEY `weta_lastused_idx` (`lastused`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roller_weblogentrytagagg`
--

LOCK TABLES `roller_weblogentrytagagg` WRITE;
/*!40000 ALTER TABLE `roller_weblogentrytagagg` DISABLE KEYS */;
/*!40000 ALTER TABLE `roller_weblogentrytagagg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rollerconfig`
--

DROP TABLE IF EXISTS `rollerconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rollerconfig` (
  `id` varchar(48) NOT NULL,
  `sitedescription` varchar(255) DEFAULT NULL,
  `sitename` varchar(255) DEFAULT NULL,
  `emailaddress` varchar(255) DEFAULT NULL,
  `absoluteurl` varchar(255) DEFAULT NULL,
  `adminusers` varchar(255) DEFAULT NULL,
  `encryptpasswords` tinyint(1) NOT NULL DEFAULT '1',
  `algorithm` varchar(10) DEFAULT NULL,
  `newuserallowed` tinyint(1) NOT NULL DEFAULT '0',
  `editorpages` varchar(255) DEFAULT NULL,
  `userthemes` varchar(255) NOT NULL,
  `indexdir` varchar(255) DEFAULT NULL,
  `memdebug` tinyint(1) NOT NULL DEFAULT '0',
  `autoformatcomments` tinyint(1) NOT NULL DEFAULT '0',
  `escapecommenthtml` tinyint(1) NOT NULL DEFAULT '1',
  `emailcomments` tinyint(1) NOT NULL DEFAULT '0',
  `enableaggregator` tinyint(1) NOT NULL DEFAULT '0',
  `enablelinkback` tinyint(1) NOT NULL DEFAULT '0',
  `rsscachetime` int(11) NOT NULL DEFAULT '3000',
  `rssusecache` tinyint(1) NOT NULL DEFAULT '1',
  `uploadallow` varchar(255) DEFAULT NULL,
  `uploadforbid` varchar(255) DEFAULT NULL,
  `uploadenabled` tinyint(1) NOT NULL DEFAULT '1',
  `uploaddir` varchar(255) NOT NULL,
  `uploadpath` varchar(255) NOT NULL,
  `uploadmaxdirmb` decimal(5,2) NOT NULL DEFAULT '4.00',
  `uploadmaxfilemb` decimal(5,2) NOT NULL DEFAULT '1.50',
  `dbversion` varchar(10) DEFAULT NULL,
  `refspamwords` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rollerconfig`
--

LOCK TABLES `rollerconfig` WRITE;
/*!40000 ALTER TABLE `rollerconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `rollerconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolleruser`
--

DROP TABLE IF EXISTS `rolleruser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolleruser` (
  `id` varchar(48) NOT NULL,
  `username` varchar(255) NOT NULL,
  `passphrase` varchar(255) NOT NULL,
  `screenname` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `emailaddress` varchar(255) NOT NULL,
  `activationcode` varchar(48) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `locale` varchar(20) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `isenabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ru_username_uq` (`username`(40))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolleruser`
--

LOCK TABLES `rolleruser` WRITE;
/*!40000 ALTER TABLE `rolleruser` DISABLE KEYS */;
INSERT INTO `rolleruser` VALUES ('2e51c705-a906-4624-8244-61793c14963c','admin','8b68618510800932e0d777c10ea04ca42228c710','admin','admin','admin@example.com','','2014-08-15 10:10:11','en_GB','Etc/UTC',1);
/*!40000 ALTER TABLE `rolleruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercookie`
--

DROP TABLE IF EXISTS `usercookie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usercookie` (
  `id` varchar(48) NOT NULL,
  `username` varchar(255) NOT NULL,
  `cookieid` varchar(100) NOT NULL,
  `datecreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uc_username_idx` (`username`(40)),
  KEY `uc_cookieid_idx` (`cookieid`(40))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercookie`
--

LOCK TABLES `usercookie` WRITE;
/*!40000 ALTER TABLE `usercookie` DISABLE KEYS */;
/*!40000 ALTER TABLE `usercookie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userrole` (
  `id` varchar(48) NOT NULL,
  `rolename` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ur_username_idx` (`username`(40))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES ('ab85ad33-370d-4c37-b722-eeaeb93e5a13','editor','admin'),('5b161811-ebf8-4d10-824d-4ee0b52b9e62','admin','admin');
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weblogcategory`
--

DROP TABLE IF EXISTS `weblogcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weblogcategory` (
  `id` varchar(48) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `websiteid` varchar(48) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parentid` varchar(48) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wc_websiteid_idx` (`websiteid`),
  KEY `ws_parentid_idx` (`parentid`),
  KEY `ws_path_idx` (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weblogcategory`
--

LOCK TABLES `weblogcategory` WRITE;
/*!40000 ALTER TABLE `weblogcategory` DISABLE KEYS */;
INSERT INTO `weblogcategory` VALUES ('ac36e290-1f7a-4074-8795-2bf32a54f2c7','root','root','e5459d4d-1ad6-4730-8127-85250f67f666',NULL,NULL,'/'),('c83c9462-bd48-45e2-9aa6-d9006596674a','General','General','e5459d4d-1ad6-4730-8127-85250f67f666',NULL,'ac36e290-1f7a-4074-8795-2bf32a54f2c7','/General'),('b74842b3-f6ba-4249-a3ec-617de1e5eaa1','Status','Status','e5459d4d-1ad6-4730-8127-85250f67f666',NULL,'ac36e290-1f7a-4074-8795-2bf32a54f2c7','/Status'),('bd6885a7-397f-45d0-a12e-f99fe0d7c077','Music','Music','e5459d4d-1ad6-4730-8127-85250f67f666',NULL,'ac36e290-1f7a-4074-8795-2bf32a54f2c7','/Music');
/*!40000 ALTER TABLE `weblogcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weblogcategoryassoc`
--

DROP TABLE IF EXISTS `weblogcategoryassoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weblogcategoryassoc` (
  `id` varchar(48) NOT NULL,
  `categoryid` varchar(48) NOT NULL,
  `ancestorid` varchar(40) DEFAULT NULL,
  `relation` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wca_categoryid_idx` (`categoryid`),
  KEY `wca_ancestorid_idx` (`ancestorid`),
  KEY `wca_relation_idx` (`relation`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weblogcategoryassoc`
--

LOCK TABLES `weblogcategoryassoc` WRITE;
/*!40000 ALTER TABLE `weblogcategoryassoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `weblogcategoryassoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weblogentry`
--

DROP TABLE IF EXISTS `weblogentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weblogentry` (
  `id` varchar(48) NOT NULL,
  `anchor` varchar(255) NOT NULL,
  `creator` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `pubtime` datetime DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  `websiteid` varchar(48) NOT NULL,
  `categoryid` varchar(48) NOT NULL,
  `publishentry` tinyint(1) NOT NULL DEFAULT '1',
  `link` varchar(255) DEFAULT NULL,
  `plugins` varchar(255) DEFAULT NULL,
  `allowcomments` tinyint(1) NOT NULL DEFAULT '0',
  `commentdays` int(11) NOT NULL DEFAULT '7',
  `rightToLeft` tinyint(1) NOT NULL DEFAULT '0',
  `pinnedtomain` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(20) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `summary` text,
  `content_type` varchar(48) DEFAULT NULL,
  `content_src` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `we_websiteid_idx` (`websiteid`),
  KEY `we_categoryid_idx` (`categoryid`),
  KEY `we_pinnedtom_idx` (`pinnedtomain`),
  KEY `we_creator_idx` (`creator`),
  KEY `we_status_idx` (`status`),
  KEY `we_locale_idx` (`locale`),
  KEY `we_combo1_idx` (`status`,`pubtime`,`websiteid`),
  KEY `we_combo2_idx` (`websiteid`,`pubtime`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weblogentry`
--

LOCK TABLES `weblogentry` WRITE;
/*!40000 ALTER TABLE `weblogentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `weblogentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webpage`
--

DROP TABLE IF EXISTS `webpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webpage` (
  `id` varchar(48) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `websiteid` varchar(48) NOT NULL,
  `template` text NOT NULL,
  `updatetime` datetime NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `navbar` tinyint(1) NOT NULL DEFAULT '0',
  `templatelang` varchar(20) NOT NULL,
  `decorator` varchar(255) DEFAULT NULL,
  `outputtype` varchar(48) DEFAULT NULL,
  `action` varchar(16) NOT NULL DEFAULT 'custom',
  PRIMARY KEY (`id`),
  KEY `wp_name_idx` (`name`(40)),
  KEY `wp_link_idx` (`link`(40)),
  KEY `wp_id_idx` (`websiteid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webpage`
--

LOCK TABLES `webpage` WRITE;
/*!40000 ALTER TABLE `webpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `webpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website`
--

DROP TABLE IF EXISTS `website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website` (
  `id` varchar(48) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `defaultpageid` varchar(48) DEFAULT '',
  `weblogdayid` varchar(48) NOT NULL,
  `ignorewords` text,
  `enablebloggerapi` tinyint(1) NOT NULL DEFAULT '0',
  `editorpage` varchar(255) DEFAULT NULL,
  `bloggercatid` varchar(48) DEFAULT NULL,
  `defaultcatid` varchar(48) DEFAULT NULL,
  `allowcomments` tinyint(1) NOT NULL DEFAULT '1',
  `emailcomments` tinyint(1) NOT NULL DEFAULT '0',
  `emailfromaddress` varchar(255) DEFAULT NULL,
  `emailaddress` varchar(255) NOT NULL,
  `editortheme` varchar(255) DEFAULT NULL,
  `locale` varchar(20) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `defaultplugins` varchar(255) DEFAULT NULL,
  `isenabled` tinyint(1) NOT NULL DEFAULT '1',
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `datecreated` datetime NOT NULL,
  `blacklist` text,
  `defaultallowcomments` tinyint(1) NOT NULL DEFAULT '1',
  `defaultcommentdays` int(11) NOT NULL DEFAULT '7',
  `commentmod` tinyint(1) NOT NULL DEFAULT '0',
  `displaycnt` int(11) NOT NULL DEFAULT '15',
  `lastmodified` datetime DEFAULT NULL,
  `pagemodels` varchar(255) DEFAULT NULL,
  `enablemultilang` tinyint(1) NOT NULL DEFAULT '0',
  `showalllangs` tinyint(1) NOT NULL DEFAULT '1',
  `customstylesheet` varchar(128) DEFAULT NULL,
  `about` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ws_handle_uq` (`handle`(40)),
  KEY `ws_isenabled_idx` (`isenabled`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website`
--

LOCK TABLES `website` WRITE;
/*!40000 ALTER TABLE `website` DISABLE KEYS */;
INSERT INTO `website` VALUES ('e5459d4d-1ad6-4730-8127-85250f67f666','Test','test','Test','admin','dummy','dummy',NULL,1,'editor-text.jsp','c83c9462-bd48-45e2-9aa6-d9006596674a','ac36e290-1f7a-4074-8795-2bf32a54f2c7',1,0,'admin@example.com','admin@example.com','basic','en_GB','Etc/UTC',NULL,1,1,'2014-08-15 10:10:48',NULL,1,0,0,15,'2014-08-15 10:10:48','',0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `website` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-15 10:15:37
