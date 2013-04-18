-- MySQL dump 10.13  Distrib 5.1.61, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ucb
-- ------------------------------------------------------
-- Server version	5.1.61-0ubuntu0.11.10.1

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
-- Table structure for table `announcements_announcement`
--

DROP TABLE IF EXISTS `announcements_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements_announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `creator_id` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `site_wide` tinyint(1) NOT NULL,
  `members_only` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `announcements_announcement_f97a5119` (`creator_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements_announcement`
--

LOCK TABLES `announcements_announcement` WRITE;
/*!40000 ALTER TABLE `announcements_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Tagger');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,136),(2,1,137),(3,1,138),(4,1,139),(5,1,140),(6,1,141),(7,1,142),(8,1,143),(9,1,144),(10,1,145),(11,1,146),(12,1,147),(13,1,148),(14,1,149),(15,1,150),(16,1,151),(17,1,152),(18,1,153);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add content type',6,'add_contenttype'),(17,'Can change content type',6,'change_contenttype'),(18,'Can delete content type',6,'delete_contenttype'),(19,'Can add session',7,'add_session'),(20,'Can change session',7,'change_session'),(21,'Can delete session',7,'delete_session'),(22,'Can add site',8,'add_site'),(23,'Can change site',8,'change_site'),(24,'Can delete site',8,'delete_site'),(25,'Can add message',9,'add_message'),(26,'Can change message',9,'change_message'),(27,'Can delete message',9,'delete_message'),(28,'Can add don\'t send entry',10,'add_dontsendentry'),(29,'Can change don\'t send entry',10,'change_dontsendentry'),(30,'Can delete don\'t send entry',10,'delete_dontsendentry'),(31,'Can add message log',11,'add_messagelog'),(32,'Can change message log',11,'change_messagelog'),(33,'Can delete message log',11,'delete_messagelog'),(34,'Can add email address',12,'add_emailaddress'),(35,'Can change email address',12,'change_emailaddress'),(36,'Can delete email address',12,'delete_emailaddress'),(37,'Can add email confirmation',13,'add_emailconfirmation'),(38,'Can change email confirmation',13,'change_emailconfirmation'),(39,'Can delete email confirmation',13,'delete_emailconfirmation'),(40,'Can add announcement',14,'add_announcement'),(41,'Can change announcement',14,'change_announcement'),(42,'Can delete announcement',14,'delete_announcement'),(43,'Can add registration profile',15,'add_registrationprofile'),(44,'Can change registration profile',15,'change_registrationprofile'),(45,'Can delete registration profile',15,'delete_registrationprofile'),(46,'Can add nonce',16,'add_nonce'),(47,'Can change nonce',16,'change_nonce'),(48,'Can delete nonce',16,'delete_nonce'),(49,'Can add consumer',17,'add_consumer'),(50,'Can change consumer',17,'change_consumer'),(51,'Can delete consumer',17,'delete_consumer'),(52,'Can add token',18,'add_token'),(53,'Can change token',18,'change_token'),(54,'Can delete token',18,'delete_token'),(55,'Can add migration history',19,'add_migrationhistory'),(56,'Can change migration history',19,'change_migrationhistory'),(57,'Can delete migration history',19,'delete_migrationhistory'),(58,'Can add account',20,'add_account'),(59,'Can change account',20,'change_account'),(60,'Can delete account',20,'delete_account'),(61,'Can add password reset',21,'add_passwordreset'),(62,'Can change password reset',21,'change_passwordreset'),(63,'Can delete password reset',21,'delete_passwordreset'),(64,'Can add signup code',22,'add_signupcode'),(65,'Can change signup code',22,'change_signupcode'),(66,'Can delete signup code',22,'delete_signupcode'),(67,'Can add signup code result',23,'add_signupcoderesult'),(68,'Can change signup code result',23,'change_signupcoderesult'),(69,'Can delete signup code result',23,'delete_signupcoderesult'),(70,'Can add profile',24,'add_profile'),(71,'Can change profile',24,'change_profile'),(72,'Can delete profile',24,'delete_profile'),(73,'Can add nonce',25,'add_nonce'),(74,'Can change nonce',25,'change_nonce'),(75,'Can delete nonce',25,'delete_nonce'),(76,'Can add association',26,'add_association'),(77,'Can change association',26,'change_association'),(78,'Can delete association',26,'delete_association'),(79,'Can add user openid association',27,'add_useropenidassociation'),(80,'Can change user openid association',27,'change_useropenidassociation'),(81,'Can delete user openid association',27,'delete_useropenidassociation'),(82,'Can add HIT',28,'add_hit'),(83,'Can change HIT',28,'change_hit'),(84,'Can delete HIT',28,'delete_hit'),(85,'Can add assignment',29,'add_assignment'),(86,'Can change assignment',29,'change_assignment'),(87,'Can delete assignment',29,'delete_assignment'),(88,'Can add Key-Value Pair',30,'add_keyvalue'),(89,'Can change Key-Value Pair',30,'change_keyvalue'),(90,'Can delete Key-Value Pair',30,'delete_keyvalue'),(91,'Can add association tag',31,'add_associationtag'),(92,'Can change association tag',31,'change_associationtag'),(93,'Can delete association tag',31,'delete_associationtag'),(94,'Can add association',32,'add_association'),(95,'Can change association',32,'change_association'),(96,'Can delete association',32,'delete_association'),(97,'Can add story template',33,'add_storytemplate'),(98,'Can change story template',33,'change_storytemplate'),(99,'Can delete story template',33,'delete_storytemplate'),(100,'Can add story',34,'add_story'),(101,'Can change story',34,'change_story'),(102,'Can delete story',34,'delete_story'),(103,'Can add offering story',35,'add_offeringstory'),(104,'Can change offering story',35,'change_offeringstory'),(105,'Can delete offering story',35,'delete_offeringstory'),(106,'Can add learner story',36,'add_learnerstory'),(107,'Can change learner story',36,'change_learnerstory'),(108,'Can delete learner story',36,'delete_learnerstory'),(109,'Can add learner worker test',37,'add_learnerworkertest'),(110,'Can change learner worker test',37,'change_learnerworkertest'),(111,'Can delete learner worker test',37,'delete_learnerworkertest'),(112,'Can add learner worker test offering pair',38,'add_learnerworkertestofferingpair'),(113,'Can change learner worker test offering pair',38,'change_learnerworkertestofferingpair'),(114,'Can delete learner worker test offering pair',38,'delete_learnerworkertestofferingpair'),(115,'Can add notice type',39,'add_noticetype'),(116,'Can change notice type',39,'change_noticetype'),(117,'Can delete notice type',39,'delete_noticetype'),(118,'Can add notice setting',40,'add_noticesetting'),(119,'Can change notice setting',40,'change_noticesetting'),(120,'Can delete notice setting',40,'delete_noticesetting'),(121,'Can add notice',41,'add_notice'),(122,'Can change notice',41,'change_notice'),(123,'Can delete notice',41,'delete_notice'),(124,'Can add notice queue batch',42,'add_noticequeuebatch'),(125,'Can change notice queue batch',42,'change_noticequeuebatch'),(126,'Can delete notice queue batch',42,'delete_noticequeuebatch'),(127,'Can add observed item',43,'add_observeditem'),(128,'Can change observed item',43,'change_observeditem'),(129,'Can delete observed item',43,'delete_observeditem'),(130,'Can add item',45,'add_item'),(131,'Can add supplier',44,'add_supplier'),(132,'Can change item',45,'change_item'),(142,'Can add affinity tag',48,'add_affinitytag'),(144,'Can change affinity tag',48,'change_affinitytag'),(146,'Can delete affinity tag',48,'delete_affinitytag'),(143,'Can add affinity tagged item',49,'add_affinitytaggeditem'),(145,'Can change affinity tagged item',49,'change_affinitytaggeditem'),(147,'Can delete affinity tagged item',49,'delete_affinitytaggeditem'),(134,'Can delete item',45,'delete_item'),(148,'Can add requirement tag',50,'add_requirementtag'),(150,'Can change requirement tag',50,'change_requirementtag'),(152,'Can delete requirement tag',50,'delete_requirementtag'),(149,'Can add requirement tagged item',51,'add_requirementtaggeditem'),(151,'Can change requirement tagged item',51,'change_requirementtaggeditem'),(153,'Can delete requirement tagged item',51,'delete_requirementtaggeditem'),(133,'Can change supplier',44,'change_supplier'),(135,'Can delete supplier',44,'delete_supplier'),(136,'Can add Tag',46,'add_tag'),(138,'Can change Tag',46,'change_tag'),(140,'Can delete Tag',46,'delete_tag'),(137,'Can add Tagged Item',47,'add_taggeditem'),(139,'Can change Tagged Item',47,'change_taggeditem'),(141,'Can delete Tagged Item',47,'delete_taggeditem'),(154,'Can add api access',52,'add_apiaccess'),(156,'Can change api access',52,'change_apiaccess'),(158,'Can delete api access',52,'delete_apiaccess'),(155,'Can add api key',53,'add_apikey'),(157,'Can change api key',53,'change_apikey'),(159,'Can delete api key',53,'delete_apikey');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'mike','','','mike@onearmedman.com','pbkdf2_sha256$10000$Xe16mxu2wONS$aBKieIX59DYG982IJzn7HF0buaFsz1KFiz04bK1AtoA=',1,1,1,'2012-06-25 09:31:03','2012-03-24 08:53:58'),(2,'mike2','','','amazon@onearmedman.com','pbkdf2_sha256$10000$vYt2UvoTrpP6$L+X5XO61Stnrjl9xJPUb7SIBTwJcT/NzZidhp5mDW3A=',0,1,0,'2012-04-01 22:21:47','2012-04-01 22:19:49'),(3,'amazon','','','amazon@onearmedman.com','pbkdf2_sha256$10000$INLUZfRE3Dza$u42aTG9A5FIMwcuJ42nEuS4ZCvz4HRfIVjwbGDJRnI0=',0,1,0,'2012-05-10 09:39:13','2012-05-10 09:39:13'),(4,'tester1','','','mike+tester1@onearmedman.com','pbkdf2_sha256$10000$3DZlAPdveWTm$XPnvm9ReSWSyUfp6Sh5gF5cIIZgiSsn7yvzh+KDKv1w=',0,1,0,'2012-06-25 08:26:53','2012-06-25 08:26:53'),(5,'don','Don','Burton','don@learningedgelabs.com','pbkdf2_sha256$10000$7AW6b9Mv0Axr$ML4U3cQUyisUJ1aEaCMvJSG1iKxHedxuPqDkBgn4/BY=',1,1,1,'2012-06-25 08:29:21','2012-06-25 08:29:21'),(6,'matt','Matt','Wallaert','matt@learningedgelabs.com','pbkdf2_sha256$10000$EiGigk7HBs3e$QIGnEpYfVb/dYadmLIqyK4FQnUmgo0DqpXc15TT0OO4=',1,1,1,'2012-06-27 09:17:17','2012-06-25 08:29:50'),(7,'tester2','','','mike+tester2@onearmedman.com','pbkdf2_sha256$10000$pqvvVTePAZSt$S0ISoS8Vx8Ma06OkwL1EIYlPgafkm62tePSOx3Ge4kU=',0,0,0,'2012-06-25 09:29:40','2012-06-25 09:29:40'),(8,'adam','Adam','Sticklor','adam@learningedgelabs.com','pbkdf2_sha256$10000$gJoVTFXfesgc$d5eV+QNF+ZmgPGgkwdQHTI8RYlwBHgX0lpg8bmgt6MQ=',0,1,0,'2012-07-09 16:47:54','2012-06-25 09:44:56'),(9,'annie','Annie','Liu','annie@learningedgelabs.com','pbkdf2_sha256$10000$N1R7fLxcRSrb$265nrjXdZOgIRbM5TGZPyBYNA0LNHcwTjfSbkCegmZ4=',0,1,0,'2012-07-07 21:58:32','2012-06-25 09:45:03');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,9,1),(2,8,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (36,6,152),(35,6,150),(34,6,148),(33,6,146),(32,6,144),(31,6,142),(30,6,12),(29,6,11),(28,6,10),(27,6,9),(26,6,8),(25,6,7);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=184 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (5,'2012-05-01 19:55:49',1,50,'1','engineering',2,'Changed canonical and level.'),(4,'2012-04-24 21:13:38',1,48,'2','biology',2,'Changed canonical.'),(3,'2012-04-24 19:35:54',1,48,'12','electronics',2,'Changed canonical.'),(2,'2012-04-01 22:11:46',1,4,'2','mike2',3,''),(1,'2012-04-01 22:11:18',1,8,'1','ucb.onearmedman.com',2,'Changed domain and name.'),(6,'2012-06-25 07:33:44',1,48,'1','equipment',3,''),(7,'2012-06-25 07:33:44',1,48,'2','biology',3,''),(8,'2012-06-25 07:33:44',1,48,'3','bugs',3,''),(9,'2012-06-25 07:33:44',1,48,'4','',3,''),(10,'2012-06-25 07:33:44',1,48,'5','fun',3,''),(11,'2012-06-25 07:33:44',1,48,'6','Physical World/Natural World',3,''),(12,'2012-06-25 07:33:44',1,48,'7','Materials/Cool Stuff',3,''),(13,'2012-06-25 07:33:44',1,48,'8','Solids/Materials',3,''),(14,'2012-06-25 07:33:44',1,48,'9','Liquids',3,''),(15,'2012-06-25 07:33:44',1,48,'10','Gases',3,''),(16,'2012-06-25 07:33:44',1,48,'11','Earth & Space',3,''),(17,'2012-06-25 07:33:44',1,48,'12','Earth',3,''),(18,'2012-06-25 07:33:44',1,48,'13','Space/Universe',3,''),(19,'2012-06-25 07:33:44',1,48,'14','Living World',3,''),(20,'2012-06-25 07:33:44',1,48,'15','Plants',3,''),(21,'2012-06-25 07:33:44',1,48,'16','Animals',3,''),(22,'2012-06-25 07:33:44',1,48,'17','Insects/Bugs',3,''),(23,'2012-06-25 07:33:44',1,48,'18','Fish',3,''),(24,'2012-06-25 07:33:44',1,48,'19','Birds',3,''),(25,'2012-06-25 07:33:44',1,48,'20','Mammals',3,''),(26,'2012-06-25 07:33:44',1,48,'21','Foodchains and Animal Ecosystems',3,''),(27,'2012-06-25 07:33:44',1,48,'22','Human World',3,''),(28,'2012-06-25 07:33:44',1,48,'23','Personal',3,''),(29,'2012-06-25 07:33:44',1,48,'24','Physical Health',3,''),(30,'2012-06-25 07:33:44',1,48,'25','Nutrition',3,''),(31,'2012-06-25 07:33:44',1,48,'26','Fitness',3,''),(32,'2012-06-25 07:33:44',1,48,'27','Mental Health',3,''),(33,'2012-06-25 07:33:44',1,48,'28','Spiritual Health',3,''),(34,'2012-06-25 07:33:44',1,48,'29','Social Areas/Interests',3,''),(35,'2012-06-25 07:33:44',1,48,'30','Family',3,''),(36,'2012-06-25 07:33:44',1,48,'31','Friends/ Peers',3,''),(37,'2012-06-25 07:33:44',1,48,'32','Community',3,''),(38,'2012-06-25 07:33:44',1,48,'33','Science',3,''),(39,'2012-06-25 07:33:44',1,48,'34','Physical Science',3,''),(40,'2012-06-25 07:33:44',1,48,'35','Physics',3,''),(41,'2012-06-25 07:33:44',1,48,'36','Chemistry',3,''),(42,'2012-06-25 07:33:44',1,48,'37','Other Physical Sciences',3,''),(43,'2012-06-25 07:33:44',1,48,'38','Life Sciences',3,''),(44,'2012-06-25 07:33:44',1,48,'39','Biological Sciences',3,''),(45,'2012-06-25 07:33:44',1,48,'40','Agriculture & Food Science',3,''),(46,'2012-06-25 07:33:44',1,48,'41','Marine Biology',3,''),(47,'2012-06-25 07:33:44',1,48,'42','Zoology',3,''),(48,'2012-06-25 07:33:44',1,48,'43','Human Sciences (eg genetics & genomics)',3,''),(49,'2012-06-25 07:33:44',1,48,'44','Ecology & Conservation Sciences',3,''),(50,'2012-06-25 07:33:44',1,48,'45','Medical Science',3,''),(51,'2012-06-25 07:33:44',1,48,'46','Earth and Space Sciences',3,''),(52,'2012-06-25 07:33:44',1,48,'47','Astronomy',3,''),(53,'2012-06-25 07:33:44',1,48,'48','Atmospheric science',3,''),(54,'2012-06-25 07:33:44',1,48,'49','Environmental science',3,''),(55,'2012-06-25 07:33:44',1,48,'50','Geoscience & hydrological science',3,''),(56,'2012-06-25 07:33:44',1,48,'51','Navigation/Cartography',3,''),(57,'2012-06-25 07:33:44',1,48,'52','Geography',3,''),(58,'2012-06-25 07:33:44',1,48,'53','Geology',3,''),(59,'2012-06-25 07:33:44',1,48,'54','Oceanography',3,''),(60,'2012-06-25 07:33:44',1,48,'55','Seismology & Volcanism',3,''),(61,'2012-06-25 07:33:44',1,48,'56','Technology & Engineering',3,''),(62,'2012-06-25 07:33:44',1,48,'57','Natural World Engineering',3,''),(63,'2012-06-25 07:33:44',1,48,'58','Agricultural engineering',3,''),(64,'2012-06-25 07:33:44',1,48,'59','Chemical engineering',3,''),(65,'2012-06-25 07:33:44',1,48,'60','Environmental engineering',3,''),(66,'2012-06-25 07:33:44',1,48,'61','Materials engineering',3,''),(67,'2012-06-25 07:33:44',1,48,'62','Mining and geological engineering',3,''),(68,'2012-06-25 07:33:44',1,48,'63','Nuclear engineering',3,''),(69,'2012-06-25 07:33:44',1,48,'64','Petroleum engineering',3,''),(70,'2012-06-25 07:33:44',1,48,'65','Machine/Systems Engineers',3,''),(71,'2012-06-25 07:33:44',1,48,'66','Acoustics & Sound',3,''),(72,'2012-06-25 07:33:44',1,48,'67','Aerospace, Areonautics, & Astronautics engineering',3,''),(73,'2012-06-25 07:33:44',1,48,'68','Airplanes',3,''),(74,'2012-06-25 07:33:44',1,48,'69','Rockets/Spacecraft',3,''),(75,'2012-06-25 07:33:44',1,48,'70','Personal craft/Ultralight/Jetpacks',3,''),(76,'2012-06-25 07:33:44',1,48,'71','Civil engineering',3,''),(77,'2012-06-25 07:33:44',1,48,'72','Bridges',3,''),(78,'2012-06-25 07:33:44',1,48,'73','Dams & Reservoirs',3,''),(79,'2012-06-25 07:33:44',1,48,'74','Flood Control',3,''),(80,'2012-06-25 07:33:44',1,48,'75','Transportion Systems',3,''),(81,'2012-06-25 07:33:44',1,48,'76','Bridges, Highway & Traffic',3,''),(82,'2012-06-25 07:33:44',1,48,'77','Railways/trains/subways/magnetic/hi speed',3,''),(83,'2012-06-25 07:33:44',1,48,'78','Waterways/Canals/etc',3,''),(84,'2012-06-25 07:33:44',1,48,'79','Electronics & Computer engineering',3,''),(85,'2012-06-25 07:33:44',1,48,'80','Electronics',3,''),(86,'2012-06-25 07:33:44',1,48,'81','Computers',3,''),(87,'2012-06-25 07:33:44',1,48,'82','Robots',3,''),(88,'2012-06-25 07:33:44',1,48,'83','Software/Programming/Data/Digital Media',3,''),(89,'2012-06-25 07:33:44',1,48,'84','Programming:',3,''),(90,'2012-06-25 07:33:44',1,48,'85','CAD-CAM',3,''),(91,'2012-06-25 07:33:44',1,48,'86','Programming Languages',3,''),(92,'2012-06-25 07:33:44',1,48,'87','Computer Graphics',3,''),(93,'2012-06-25 07:33:44',1,48,'88','User Experience and User Interface',3,''),(94,'2012-06-25 07:33:44',1,48,'89','Software:',3,''),(95,'2012-06-25 07:33:44',1,48,'90','Desktop Applications',3,''),(96,'2012-06-25 07:33:44',1,48,'91','Web Applications',3,''),(97,'2012-06-25 07:33:44',1,48,'92','Mobile Applications',3,''),(98,'2012-06-25 07:33:44',1,48,'93','Enterprise Applications',3,''),(99,'2012-06-25 07:33:44',1,48,'94','Data:',3,''),(100,'2012-06-25 07:33:44',1,48,'95','Data Modeling',3,''),(101,'2012-06-25 07:33:44',1,48,'96','Data Processing',3,''),(102,'2012-06-25 07:33:44',1,48,'97','Data Transmission',3,''),(103,'2012-06-25 07:33:44',1,48,'98','Data Management',3,''),(104,'2012-06-25 07:33:44',1,48,'99','Digital Media:',3,''),(105,'2012-06-25 07:33:44',1,48,'100','Video & Animation',3,''),(106,'2012-06-25 07:33:44',1,48,'101','Desktop Publishing',3,''),(107,'2012-06-25 07:33:44',1,48,'102','Augmented Reality',3,''),(108,'2012-06-25 07:33:44',1,48,'103','VideoGames',3,''),(109,'2012-06-25 07:33:44',1,48,'104','Interactive Multimedia',3,''),(110,'2012-06-25 07:33:44',1,48,'105','Virtual Worlds',3,''),(111,'2012-06-25 07:33:44',1,48,'106','Networking:',3,''),(112,'2012-06-25 07:33:44',1,48,'107','Industrial design and engineering',3,''),(113,'2012-06-25 07:33:44',1,48,'108','Marine engineering & Naval architects',3,''),(114,'2012-06-25 07:33:44',1,48,'109','Mechanical Engineering',3,''),(115,'2012-06-25 07:33:44',1,48,'110','Automotive engineering',3,''),(116,'2012-06-25 07:33:44',1,48,'111','Households Appliances',3,''),(117,'2012-06-25 07:33:44',1,48,'112','Machines & Tools',3,''),(118,'2012-06-25 07:33:44',1,48,'113','Thermodynaimcs',3,''),(119,'2012-06-25 07:33:44',1,48,'114','Life & Bio Engineers',3,''),(120,'2012-06-25 07:33:44',1,48,'115','Biomedical engineering',3,''),(121,'2012-06-25 07:33:44',1,48,'116','Genetic engineering',3,''),(122,'2012-06-25 07:33:44',1,48,'117',' Health & Medicine',3,''),(123,'2012-06-25 07:33:44',1,48,'118','Design, Media, Arts',3,''),(124,'2012-06-25 07:33:44',1,48,'119','Product Design',3,''),(125,'2012-06-25 07:33:44',1,48,'120','Film',3,''),(126,'2012-06-25 07:33:44',1,48,'121','Television',3,''),(127,'2012-06-25 07:33:44',1,48,'122','Music',3,''),(128,'2012-06-25 07:33:44',1,48,'123','Interactive Media',3,''),(129,'2012-06-25 07:33:44',1,48,'124','Advertising PR',3,''),(130,'2012-06-25 07:33:44',1,48,'125','Publishing ',3,''),(131,'2012-06-25 07:33:44',1,48,'126','Theatre',3,''),(132,'2012-06-25 07:33:44',1,48,'127','Art',3,''),(133,'2012-06-25 07:33:44',1,48,'128','Fashion',3,''),(134,'2012-06-25 07:33:44',1,48,'129','Entrepreneurship, Business, Management',3,''),(135,'2012-06-25 07:33:44',1,48,'130','Product',3,''),(136,'2012-06-25 07:33:44',1,48,'131','Services',3,''),(137,'2012-06-25 07:33:44',1,48,'132','Architecture, Construction, Building & Fixing',3,''),(138,'2012-06-25 07:33:44',1,48,'133','Travel, Adventure, Hospitality',3,''),(139,'2012-06-25 07:33:44',1,48,'134','Sports & Entertainment',3,''),(140,'2012-06-25 07:33:44',1,48,'135','Cooking & Food',3,''),(141,'2012-06-25 07:33:44',1,48,'136','Finance and Investing',3,''),(142,'2012-06-25 07:33:44',1,48,'137','Government & Public Admin',3,''),(143,'2012-06-25 07:33:44',1,48,'138','Law, Police, Fire, Public Safety, Military & Intelligence Services',3,''),(144,'2012-06-25 07:33:44',1,48,'139','Human & Social Services',3,''),(145,'2012-06-25 07:33:44',1,48,'140','Education & Training',3,''),(146,'2012-06-25 07:33:44',1,48,'141','Geoscience &amp; hydrological science',3,''),(147,'2012-06-25 07:33:44',1,48,'142','dinosaurs',3,''),(148,'2012-06-25 07:34:00',1,50,'1','engineering',3,''),(149,'2012-06-25 07:34:00',1,50,'2','',3,''),(150,'2012-06-25 07:34:00',1,50,'3','Solids/Materials',3,''),(151,'2012-06-25 07:34:00',1,50,'4','Liquids',3,''),(152,'2012-06-25 07:34:00',1,50,'5','Gases',3,''),(153,'2012-06-25 07:34:00',1,50,'6','Earth & Space',3,''),(154,'2012-06-25 07:34:00',1,50,'7','Earth',3,''),(155,'2012-06-25 07:34:00',1,50,'8','Space/Universe',3,''),(156,'2012-06-25 07:34:00',1,50,'9','Computers0',3,''),(157,'2012-06-25 07:34:00',1,50,'10','Computers1',3,''),(158,'2012-06-25 07:34:00',1,50,'11','Computers2',3,''),(159,'2012-06-25 07:34:00',1,50,'12','Computers3',3,''),(160,'2012-06-25 07:34:00',1,50,'13','Computers4',3,''),(161,'2012-06-25 07:34:00',1,50,'14','Computer5',3,''),(162,'2012-06-25 07:34:00',1,50,'15','Mobile Devices, Tablets, Smartphones',3,''),(163,'2012-06-25 07:34:00',1,50,'16','Consumer Electronics, SmartTVs, Videogame consoles',3,''),(164,'2012-06-25 07:34:00',1,50,'17','Software/Programming/Data/Digital Media',3,''),(165,'2012-06-25 07:34:00',1,50,'18','Software Tools/ Programming:',3,''),(166,'2012-06-25 07:34:00',1,50,'19','CAD-CAM',3,''),(167,'2012-06-25 07:34:00',1,50,'20','Programming Languages',3,''),(168,'2012-06-25 07:34:00',1,50,'21','Media Creation Tools',3,''),(169,'2012-06-25 08:28:32',1,4,'4','tester1',2,'Changed password and is_active.'),(170,'2012-06-25 08:29:21',1,4,'5','don',1,''),(171,'2012-06-25 08:29:39',1,4,'5','don',2,'Changed password, first_name, last_name, is_staff and is_superuser.'),(172,'2012-06-25 08:29:50',1,4,'6','matt',1,''),(173,'2012-06-25 09:32:35',1,4,'6','matt',2,'Changed password, is_staff and user_permissions.'),(174,'2012-06-25 09:44:56',6,4,'8','adam',1,''),(175,'2012-06-25 09:45:03',6,4,'9','annie',1,''),(176,'2012-06-25 09:45:39',6,4,'9','annie',2,'Changed password, first_name, last_name and email.'),(177,'2012-06-25 09:45:57',6,4,'8','adam',2,'Changed password, first_name, last_name and email.'),(178,'2012-06-25 09:46:39',6,4,'6','matt',2,'Changed password, first_name, last_name and email.'),(179,'2012-06-25 09:46:55',6,4,'5','don',2,'Changed password and email.'),(180,'2012-06-25 09:47:02',6,4,'6','matt',2,'Changed password and is_superuser.'),(181,'2012-06-25 09:48:43',6,3,'1','Tagger',1,''),(182,'2012-06-25 09:49:01',6,4,'9','annie',2,'Changed password and groups.'),(183,'2012-06-25 09:49:09',6,4,'8','adam',2,'Changed password and groups.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (28,'HIT','djurk','hit'),(30,'Key-Value Pair','djurk','keyvalue'),(46,'Tag','taggit','tag'),(47,'Tagged Item','taggit','taggeditem'),(20,'account','account','account'),(48,'affinity tag','tagger','affinitytag'),(49,'affinity tagged item','tagger','affinitytaggeditem'),(14,'announcement','announcements','announcement'),(52,'api access','tastypie','apiaccess'),(53,'api key','tastypie','apikey'),(29,'assignment','djurk','assignment'),(26,'association','django_openid','association'),(32,'association','learnoffer','association'),(31,'association tag','learnoffer','associationtag'),(17,'consumer','piston','consumer'),(6,'content type','contenttypes','contenttype'),(10,'don\'t send entry','mailer','dontsendentry'),(12,'email address','emailconfirmation','emailaddress'),(13,'email confirmation','emailconfirmation','emailconfirmation'),(3,'group','auth','group'),(45,'item','tagger','item'),(36,'learner story','learnoffer','learnerstory'),(37,'learner worker test','learnoffer','learnerworkertest'),(38,'learner worker test offering pair','learnoffer','learnerworkertestofferingpair'),(1,'log entry','admin','logentry'),(9,'message','mailer','message'),(11,'message log','mailer','messagelog'),(19,'migration history','south','migrationhistory'),(16,'nonce','piston','nonce'),(25,'nonce','django_openid','nonce'),(41,'notice','notification','notice'),(42,'notice queue batch','notification','noticequeuebatch'),(40,'notice setting','notification','noticesetting'),(39,'notice type','notification','noticetype'),(43,'observed item','notification','observeditem'),(35,'offering story','learnoffer','offeringstory'),(21,'password reset','account','passwordreset'),(2,'permission','auth','permission'),(24,'profile','profiles','profile'),(15,'registration profile','registration','registrationprofile'),(50,'requirement tag','tagger','requirementtag'),(51,'requirement tagged item','tagger','requirementtaggeditem'),(7,'session','sessions','session'),(22,'signup code','signup_codes','signupcode'),(23,'signup code result','signup_codes','signupcoderesult'),(8,'site','sites','site'),(34,'story','learnoffer','story'),(33,'story template','learnoffer','storytemplate'),(44,'supplier','tagger','supplier'),(18,'token','piston','token'),(4,'user','auth','user'),(27,'user openid association','django_openid','useropenidassociation');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_openid_association`
--

DROP TABLE IF EXISTS `django_openid_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` longtext NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` longtext NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_openid_association`
--

LOCK TABLES `django_openid_association` WRITE;
/*!40000 ALTER TABLE `django_openid_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_openid_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_openid_nonce`
--

DROP TABLE IF EXISTS `django_openid_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_openid_nonce`
--

LOCK TABLES `django_openid_nonce` WRITE;
/*!40000 ALTER TABLE `django_openid_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_openid_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_openid_useropenidassociation`
--

DROP TABLE IF EXISTS `django_openid_useropenidassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_useropenidassociation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_openid_useropenidassociation_fbfc09f1` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_openid_useropenidassociation`
--

LOCK TABLES `django_openid_useropenidassociation` WRITE;
/*!40000 ALTER TABLE `django_openid_useropenidassociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_openid_useropenidassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('f35ffcf0e25911474725d6112ac5bc3f','Yzc2OGUwMTUxZjQ5NDU0YWVhMWNkYTQ3ZjU5NzQ4NTFkYWJiOTIxNDqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZFUSX2F1dGhfdXNlcl9iYWNrZW5kcQJVNnBpbmF4LmFwcHMuYWNjb3VudC5hdXRo\nX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n','2012-04-09 12:21:06'),('82fac5afbe39b2c4f99b30c57f2651e0','NjJiYjc5YWI2Y2Y3ZTExZDIwMTc5ODZjNGM3YjlmMjg1MWZjNjA2ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZFU2cGluYXguYXBwcy5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRp\nb25CYWNrZW5kVQ1fYXV0aF91c2VyX2lkSwFVD19zZXNzaW9uX2V4cGlyeUqArxsAdS4=\n','2012-04-22 22:23:55'),('7151931079c1a383d9fc5413cb0df5f4','ODljNDQ1NjI1ZjdjN2E2YmJlOTM2YTc3MWFiY2UyY2M4YWYyMTM5YzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZFU2cGluYXguYXBwcy5hY2NvdW50LmF1dGhfYmFja2VuZHMuQXV0aGVudGljYXRp\nb25CYWNrZW5kVQ1fYXV0aF91c2VyX2lkSwF1Lg==\n','2012-05-15 19:55:49'),('c2d71f178a40daa8af2ad39141e6c026','YjFmYmU5NGE4MDdjNDc3NDQyZTY5MjEzM2JkNjIzY2UyZjIxYWZkNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-05-24 09:49:44'),('1f2d2d28ef93e39f58f5632a088ae1a5','YjFmYmU5NGE4MDdjNDc3NDQyZTY5MjEzM2JkNjIzY2UyZjIxYWZkNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-06-08 16:57:42'),('d37bede062e7c3c7eb8f7c97011c33e0','YjFmYmU5NGE4MDdjNDc3NDQyZTY5MjEzM2JkNjIzY2UyZjIxYWZkNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-06-27 20:31:17'),('2667775ce8959d380557ee6b9032114e','NWM3NWEzNTNlNjU5ODVjYzNlZWJhZjA3Y2EyNmVhMWRjMTE3MmRjMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9h\ndXRoX3VzZXJfaWSKAQZ1Lg==\n','2012-07-11 09:34:58'),('7ad94c2d30e8b1c2c3bb8a407d78ba81','MmVhYjQ2NGRjZjdmNjU1ZTc4ZmMzODk5MDExZTdmNTE4NjQ3NThmYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9h\ndXRoX3VzZXJfaWSKAQF1Lg==\n','2012-07-09 08:29:50'),('7b9fbfadf3a8a92209a2cf105a098db3','MmVhYjQ2NGRjZjdmNjU1ZTc4ZmMzODk5MDExZTdmNTE4NjQ3NThmYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9h\ndXRoX3VzZXJfaWSKAQF1Lg==\n','2012-07-09 09:32:35'),('22c1d3a7392048c50a7d1e0b8c909edf','NWM3NWEzNTNlNjU5ODVjYzNlZWJhZjA3Y2EyNmVhMWRjMTE3MmRjMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9h\ndXRoX3VzZXJfaWSKAQZ1Lg==\n','2012-07-09 09:49:10'),('fafb0f4da1f163171052bc55b5613634','MWYyYzJmMjA4YTI1MzA4YjI1ZGVlZGIyYzNmNWFkYzg1M2Q5MmQ5YTqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2012-07-10 11:05:49'),('4c6b828eb039620c613a3dcfc0e4344b','MmIyNTgyMjE2ZWIxYTNiYWQxMGIzNzkxYjBjNTdkZDk0ODQyNDkxNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQl1Lg==\n','2012-07-19 10:23:51'),('81e717baefca7a8dc1d1bdc856e8b7c4','NDlkYzdmYjEzMjFmNWQxZjc1MjJhZjZjZDAxMmMzODA4YjhiMjVlZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQh1Lg==\n','2012-07-19 10:23:15'),('ce588dfacc8d68206b5e1c73a19b9851','N2QyNDk0OGViNDljOWVmYmYwYmNiNDY5OTIyMWYyNGZjNGY0MTY1ZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-07-23 23:07:48'),('ced5c8486e82960d02db331f35f93e89','MmIyNTgyMjE2ZWIxYTNiYWQxMGIzNzkxYjBjNTdkZDk0ODQyNDkxNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQl1Lg==\n','2012-07-19 21:52:30'),('1217bf7ad99504c6160107a0718fea85','MmIyNTgyMjE2ZWIxYTNiYWQxMGIzNzkxYjBjNTdkZDk0ODQyNDkxNDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQl1Lg==\n','2012-07-21 21:58:32'),('928b3cbaf9bc69e94e996f16a03974a4','NDlkYzdmYjEzMjFmNWQxZjc1MjJhZjZjZDAxMmMzODA4YjhiMjVlZDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQh1Lg==\n','2012-07-23 16:47:54');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djurk_assignment`
--

DROP TABLE IF EXISTS `djurk_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djurk_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mturk_id` varchar(255) DEFAULT NULL,
  `worker_id` varchar(255) DEFAULT NULL,
  `hit_id` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `auto_approval_time` datetime DEFAULT NULL,
  `accept_time` datetime DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  `approval_time` datetime DEFAULT NULL,
  `rejection_time` datetime DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `requester_feedback` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mturk_id` (`mturk_id`),
  KEY `djurk_assignment_93d952b8` (`hit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djurk_assignment`
--

LOCK TABLES `djurk_assignment` WRITE;
/*!40000 ALTER TABLE `djurk_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `djurk_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djurk_hit`
--

DROP TABLE IF EXISTS `djurk_hit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djurk_hit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mturk_id` varchar(255) DEFAULT NULL,
  `hit_type_id` varchar(255) DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `keywords` longtext,
  `status` varchar(1) DEFAULT NULL,
  `reward` decimal(5,3) DEFAULT NULL,
  `lifetime_in_seconds` int(10) unsigned DEFAULT NULL,
  `assignment_duration_in_seconds` int(10) unsigned DEFAULT NULL,
  `max_assignments` int(10) unsigned DEFAULT '1',
  `auto_approval_delay_in_seconds` int(10) unsigned DEFAULT NULL,
  `requester_annotation` longtext,
  `number_of_similar_hits` int(10) unsigned DEFAULT NULL,
  `review_status` varchar(1) DEFAULT NULL,
  `number_of_assignments_pending` int(10) unsigned DEFAULT NULL,
  `number_of_assignments_available` int(10) unsigned DEFAULT NULL,
  `number_of_assignments_completed` int(10) unsigned DEFAULT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `content_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mturk_id` (`mturk_id`),
  KEY `djurk_hit_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djurk_hit`
--

LOCK TABLES `djurk_hit` WRITE;
/*!40000 ALTER TABLE `djurk_hit` DISABLE KEYS */;
/*!40000 ALTER TABLE `djurk_hit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djurk_keyvalue`
--

DROP TABLE IF EXISTS `djurk_keyvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djurk_keyvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` longtext,
  `assignment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `djurk_keyvalue_482b57ab` (`assignment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djurk_keyvalue`
--

LOCK TABLES `djurk_keyvalue` WRITE;
/*!40000 ALTER TABLE `djurk_keyvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `djurk_keyvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailconfirmation_emailaddress`
--

DROP TABLE IF EXISTS `emailconfirmation_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailconfirmation_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` varchar(75) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`email`),
  KEY `emailconfirmation_emailaddress_fbfc09f1` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailconfirmation_emailaddress`
--

LOCK TABLES `emailconfirmation_emailaddress` WRITE;
/*!40000 ALTER TABLE `emailconfirmation_emailaddress` DISABLE KEYS */;
INSERT INTO `emailconfirmation_emailaddress` VALUES (1,1,'mike@onearmedman.com',1,1),(2,2,'amazon@onearmedman.com',0,0);
/*!40000 ALTER TABLE `emailconfirmation_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailconfirmation_emailconfirmation`
--

DROP TABLE IF EXISTS `emailconfirmation_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailconfirmation_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_address_id` int(11) NOT NULL,
  `sent` datetime NOT NULL,
  `confirmation_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emailconfirmation_emailconfirmation_1df9fea4` (`email_address_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailconfirmation_emailconfirmation`
--

LOCK TABLES `emailconfirmation_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `emailconfirmation_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailconfirmation_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learnoffer_association`
--

DROP TABLE IF EXISTS `learnoffer_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learnoffer_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learnoffer_association_3747b463` (`tag_id`),
  KEY `learnoffer_association_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learnoffer_association`
--

LOCK TABLES `learnoffer_association` WRITE;
/*!40000 ALTER TABLE `learnoffer_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `learnoffer_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learnoffer_associationtag`
--

DROP TABLE IF EXISTS `learnoffer_associationtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learnoffer_associationtag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rght` int(10) unsigned NOT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learnoffer_associationtag_a951d5d6` (`slug`),
  KEY `learnoffer_associationtag_63f17a16` (`parent_id`),
  KEY `learnoffer_associationtag_42b06ff6` (`lft`),
  KEY `learnoffer_associationtag_91543e5a` (`rght`),
  KEY `learnoffer_associationtag_efd07f28` (`tree_id`),
  KEY `learnoffer_associationtag_2a8f42e8` (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learnoffer_associationtag`
--

LOCK TABLES `learnoffer_associationtag` WRITE;
/*!40000 ALTER TABLE `learnoffer_associationtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `learnoffer_associationtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learnoffer_learnerstory`
--

DROP TABLE IF EXISTS `learnoffer_learnerstory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learnoffer_learnerstory` (
  `story_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`story_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learnoffer_learnerstory`
--

LOCK TABLES `learnoffer_learnerstory` WRITE;
/*!40000 ALTER TABLE `learnoffer_learnerstory` DISABLE KEYS */;
/*!40000 ALTER TABLE `learnoffer_learnerstory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learnoffer_learnerworkertest`
--

DROP TABLE IF EXISTS `learnoffer_learnerworkertest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learnoffer_learnerworkertest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `background_story_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learnoffer_learnerworkertest_bab09b2a` (`background_story_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learnoffer_learnerworkertest`
--

LOCK TABLES `learnoffer_learnerworkertest` WRITE;
/*!40000 ALTER TABLE `learnoffer_learnerworkertest` DISABLE KEYS */;
/*!40000 ALTER TABLE `learnoffer_learnerworkertest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learnoffer_learnerworkertestofferingpair`
--

DROP TABLE IF EXISTS `learnoffer_learnerworkertestofferingpair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learnoffer_learnerworkertestofferingpair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `story_id` int(11) NOT NULL,
  `other_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learnoffer_learnerworkertestofferingpair_f5ae222e` (`story_id`),
  KEY `learnoffer_learnerworkertestofferingpair_c5c16025` (`other_id`),
  KEY `learnoffer_learnerworkertestofferingpair_a88de8dc` (`test_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learnoffer_learnerworkertestofferingpair`
--

LOCK TABLES `learnoffer_learnerworkertestofferingpair` WRITE;
/*!40000 ALTER TABLE `learnoffer_learnerworkertestofferingpair` DISABLE KEYS */;
/*!40000 ALTER TABLE `learnoffer_learnerworkertestofferingpair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learnoffer_offeringstory`
--

DROP TABLE IF EXISTS `learnoffer_offeringstory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learnoffer_offeringstory` (
  `story_ptr_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`story_ptr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learnoffer_offeringstory`
--

LOCK TABLES `learnoffer_offeringstory` WRITE;
/*!40000 ALTER TABLE `learnoffer_offeringstory` DISABLE KEYS */;
/*!40000 ALTER TABLE `learnoffer_offeringstory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learnoffer_story`
--

DROP TABLE IF EXISTS `learnoffer_story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learnoffer_story` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learnoffer_story_a951d5d6` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learnoffer_story`
--

LOCK TABLES `learnoffer_story` WRITE;
/*!40000 ALTER TABLE `learnoffer_story` DISABLE KEYS */;
/*!40000 ALTER TABLE `learnoffer_story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learnoffer_story_templates`
--

DROP TABLE IF EXISTS `learnoffer_story_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learnoffer_story_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `story_id` int(11) NOT NULL,
  `storytemplate_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `learnoffer_story_templates_story_id_2ed0dec35ae9f450_uniq` (`story_id`,`storytemplate_id`),
  KEY `learnoffer_story_templates_f5ae222e` (`story_id`),
  KEY `learnoffer_story_templates_8760a72c` (`storytemplate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learnoffer_story_templates`
--

LOCK TABLES `learnoffer_story_templates` WRITE;
/*!40000 ALTER TABLE `learnoffer_story_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `learnoffer_story_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learnoffer_storytemplate`
--

DROP TABLE IF EXISTS `learnoffer_storytemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learnoffer_storytemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `root_tag_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learnoffer_storytemplate_5d5ac215` (`root_tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learnoffer_storytemplate`
--

LOCK TABLES `learnoffer_storytemplate` WRITE;
/*!40000 ALTER TABLE `learnoffer_storytemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `learnoffer_storytemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailer_dontsendentry`
--

DROP TABLE IF EXISTS `mailer_dontsendentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailer_dontsendentry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_address` varchar(50) NOT NULL,
  `when_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailer_dontsendentry`
--

LOCK TABLES `mailer_dontsendentry` WRITE;
/*!40000 ALTER TABLE `mailer_dontsendentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailer_dontsendentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailer_message`
--

DROP TABLE IF EXISTS `mailer_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailer_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_address` varchar(50) NOT NULL,
  `from_address` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message_body` longtext NOT NULL,
  `when_added` datetime NOT NULL,
  `priority` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailer_message`
--

LOCK TABLES `mailer_message` WRITE;
/*!40000 ALTER TABLE `mailer_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailer_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailer_messagelog`
--

DROP TABLE IF EXISTS `mailer_messagelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailer_messagelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_address` varchar(50) NOT NULL,
  `from_address` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message_body` longtext NOT NULL,
  `when_added` datetime NOT NULL,
  `priority` varchar(1) NOT NULL,
  `when_attempted` datetime NOT NULL,
  `result` varchar(1) NOT NULL,
  `log_message` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailer_messagelog`
--

LOCK TABLES `mailer_messagelog` WRITE;
/*!40000 ALTER TABLE `mailer_messagelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailer_messagelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_notice`
--

DROP TABLE IF EXISTS `notification_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipient_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `message` longtext NOT NULL,
  `notice_type_id` int(11) NOT NULL,
  `added` datetime NOT NULL,
  `unseen` tinyint(1) NOT NULL,
  `archived` tinyint(1) NOT NULL,
  `on_site` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_notice_fcd09624` (`recipient_id`),
  KEY `notification_notice_901f59e9` (`sender_id`),
  KEY `notification_notice_f28cbfcc` (`notice_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_notice`
--

LOCK TABLES `notification_notice` WRITE;
/*!40000 ALTER TABLE `notification_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_noticequeuebatch`
--

DROP TABLE IF EXISTS `notification_noticequeuebatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_noticequeuebatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pickled_data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_noticequeuebatch`
--

LOCK TABLES `notification_noticequeuebatch` WRITE;
/*!40000 ALTER TABLE `notification_noticequeuebatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_noticequeuebatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_noticesetting`
--

DROP TABLE IF EXISTS `notification_noticesetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_noticesetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `notice_type_id` int(11) NOT NULL,
  `medium` varchar(1) NOT NULL,
  `send` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`notice_type_id`,`medium`),
  KEY `notification_noticesetting_fbfc09f1` (`user_id`),
  KEY `notification_noticesetting_f28cbfcc` (`notice_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_noticesetting`
--

LOCK TABLES `notification_noticesetting` WRITE;
/*!40000 ALTER TABLE `notification_noticesetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_noticesetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_noticetype`
--

DROP TABLE IF EXISTS `notification_noticetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_noticetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(40) NOT NULL,
  `display` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `default` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_noticetype`
--

LOCK TABLES `notification_noticetype` WRITE;
/*!40000 ALTER TABLE `notification_noticetype` DISABLE KEYS */;
INSERT INTO `notification_noticetype` VALUES (1,'announcement','Announcement','you have received an announcement',2);
/*!40000 ALTER TABLE `notification_noticetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_observeditem`
--

DROP TABLE IF EXISTS `notification_observeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_observeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `notice_type_id` int(11) NOT NULL,
  `added` datetime NOT NULL,
  `signal` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_observeditem_fbfc09f1` (`user_id`),
  KEY `notification_observeditem_e4470c6e` (`content_type_id`),
  KEY `notification_observeditem_f28cbfcc` (`notice_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_observeditem`
--

LOCK TABLES `notification_observeditem` WRITE;
/*!40000 ALTER TABLE `notification_observeditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_observeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_registrationprofile`
--

DROP TABLE IF EXISTS `registration_registrationprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_registrationprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `activation_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_registrationprofile`
--

LOCK TABLES `registration_registrationprofile` WRITE;
/*!40000 ALTER TABLE `registration_registrationprofile` DISABLE KEYS */;
INSERT INTO `registration_registrationprofile` VALUES (1,4,'6d54f0aaa1e931f34b4372299e05749012be7560'),(2,7,'13a763967f788ea4383570e10c75064fe306bf84');
/*!40000 ALTER TABLE `registration_registrationprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'djurk','0001_initial','2012-03-24 12:54:17'),(2,'learnoffer','0001_initial','2012-03-24 12:54:34'),(3,'learnoffer','0002_auto__add_associationtag__add_story__add_learnerstory__add_offeringsto','2012-03-24 12:54:34'),(4,'learnoffer','0003_auto__add_field_offeringstory_image','2012-03-24 12:54:34'),(5,'learnoffer','0004_auto__add_field_storytemplate_root_tag','2012-03-24 12:54:34'),(6,'learnoffer','0005_auto__add_learnerworkertest__add_learnerworkertestofferingpair','2012-03-24 12:54:34'),(7,'learnoffer','0006_auto__add_field_associationtag_created__add_field_associationtag_modif','2012-03-24 12:54:34'),(8,'learnoffer','0007_auto__del_field_story_template','2012-03-24 12:54:34'),(9,'tagger','0001_initial','2012-04-01 18:56:32'),(10,'tagger','0002_auto__add_affinitytaggeditem__add_affinitytag','2012-04-24 23:24:10'),(11,'tagger','0003_auto__chg_field_affinitytaggeditem_tag','2012-04-24 23:34:45'),(12,'tagger','0004_auto__del_affinitytaggeditem__del_affinitytag','2012-04-25 01:12:12'),(13,'tagger','0005_auto__add_affinitytaggeditem__add_affinitytag','2012-04-25 01:12:42'),(14,'tagger','0006_auto__add_requirementtaggeditem__add_requirementtag','2012-05-01 03:22:30'),(15,'tagger','0007_auto__add_field_requirementtaggeditem_level__del_field_requirementtag_','2012-05-08 14:57:22'),(16,'tastypie','0001_initial','2012-05-09 16:01:08'),(17,'tagger','0008_auto__add_field_affinitytag_description__add_field_requirementtag_desc','2012-06-14 00:43:50'),(18,'tagger','0009_auto__add_field_requirementtaggeditem_user__add_field_affinitytaggedit','2012-06-25 12:17:19');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagger_affinitytag`
--

DROP TABLE IF EXISTS `tagger_affinitytag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagger_affinitytag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `canonical` tinyint(1) NOT NULL DEFAULT '0',
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=357 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagger_affinitytag`
--

LOCK TABLES `tagger_affinitytag` WRITE;
/*!40000 ALTER TABLE `tagger_affinitytag` DISABLE KEYS */;
INSERT INTO `tagger_affinitytag` VALUES (153,'Multiple Media','multiple-media',1,'YOURCHILD enjoys picture books, TV/movies, or any screen with visual and multiple media'),(152,'Flood Control','flood-control',1,''),(151,'Interactive Media','interactive-media',1,''),(150,'Programming:','programming',1,''),(149,'Team management','team-management',1,'YOURCHILD can get the most out of each individual on the team. For example, if selecting a sports team HE/SHE can put the right person in the right position'),(148,'Gases','gases',1,'YOURCHILD enjoys exploring or playing with helium balloons, air tunnels, the wind, campfires or other ethereal forces.'),(147,'Nuclear engineering','nuclear-engineering',1,''),(146,'Physical World/Natural World','physical-worldnatural-world',1,'YOURCHILD enjoys being outdoors & in nature-- for example, going on hikes, getting in streams & rivers, jumping in lakes, playing in the sand'),(145,'Visual & Spatial Ordering','visual-spatial-ordering',1,'YOURCHILD has a good sense of direction.'),(144,'Practical Problem-Solving','practical-problem-solving',1,'YOURCHILD is good at coming up with practical solutions to problems.'),(143,'Marine engineering & Naval architects','marine-engineering-naval-architects',1,''),(192,'Law, Police, Fire, Public Safety, Military & Intelligence Services','law-police-fire-public-safety-military-intelligence-services',1,''),(191,'Natural World Engineering','natural-world-engineering',1,'YOURCHILD likes to create things in the natural world. For example, making elaborate sand castles, mud designs, forts from sticks, etc.'),(190,'Thermodynaimcs','thermodynaimcs',1,''),(189,'Intake Controls','intake-controls',1,'YOURCHILD  sometimes has difficulty managing the daily deluge of data. HE/SHE becomes bogged down and cannot easily transition to the next relevant topic or activity. (N)'),(188,'Short Term Memory','short-term-memory',1,'YOURCHILD is good at short-term memory. He can register new information like a phone number, use it to dial and then forget it.'),(187,'Planning','planning',1,'YOURCHILD enjoys making a plan by figuring out the steps to complete a task or project. \n'),(186,'Government & Public Admin','government-public-admin',1,''),(185,'Entrepreneurship, Business, Management','entrepreneurship-business-management',1,''),(184,'Self Control','self-control',1,'YOURCHILD can keep HIS/HER emotions in check and not let them disrupt focus'),(183,'Railways/trains/subways/magnetic/hi speed','railwaystrainssubwaysmagnetichi-speed',1,''),(182,'Art','art',1,''),(181,'Astronomy','astronomy',1,''),(180,'Human World','human-world',1,'YOURCHILD loves being with other people and exploring and playing in groups'),(179,'CAD-CAM','cad-cam',1,''),(178,'Physical Science','physical-science',1,'YOURCHILD enjoys physical science and physical science projects like building erupting volcanoes or chemistry experiments'),(177,'Fitness','fitness',1,'YOURCHILD really enjoys physical exercise and figuring out what is best for HIS/HER body'),(176,'Spatial Awareness & Perception','spatial-awareness-perception',1,'YOURCHILD is alert to and can quickly identify all sorts of shapes and objects in books or in his surroundings'),(175,'Product Design','product-design',1,''),(174,'VideoGames','videogames',1,''),(173,'Fine Motor','fine-motor',1,'YOURCHILD likes to work with HIS/HER hands and has great finger control like when threading a needle.'),(172,'Television','television',1,''),(171,'Receptive','receptive',1,'YOURCHILD likes to think out loud.'),(170,'Life & Bio Engineers','life-bio-engineers',1,''),(169,'Publishing ','publishing',1,''),(168,'Achievement Drive','achievement-drive',1,'YOURCHILD strives to improve or meet high standards for his performance'),(167,'Making Music','making-music',1,'YOURCHILD enjoys making music, playing the piano or other instrument'),(166,'Agricultural engineering','agricultural-engineering',1,''),(165,'Medical Science','medical-science',1,''),(164,'Data Transmission','data-transmission',1,''),(163,'Services','services',1,''),(162,'Chemical engineering','chemical-engineering',1,''),(161,'Design, Media, Arts','design-media-arts',1,''),(160,'Fashion','fashion',1,''),(159,'Robots','robots',1,'YOURCHILD enjoys exploring, playing with, building a robot or remote control device, car, or plane?'),(158,'Software/Programming/Data/Digital Media','softwareprogrammingdatadigital-media',1,''),(156,' Health & Medicine','health-medicine',1,''),(157,'Sensory Integration & Motor Planning','sensory-integration-motor-planning',1,'YOURCHILD has fluid body movement & control and excels at sports'),(155,'Machine/Systems Engineers','machinesystems-engineers',1,'YOURCHILD enjoys exploring and tinkering with machines and gadgets. For example, HE/SHE seems fascinated by mechanical stuff like cars, planes or electronic stuff like computers, smartphones'),(154,'Influenccing','influenccing',1,'YOURCHILD can persuade his playdate/ friend to do the activity HE/SHE wants'),(193,'Materials engineering','materials-engineering',1,''),(194,'Education & Training','education-training',1,''),(195,'Web Applications','web-applications',1,''),(196,'Data Modeling','data-modeling',1,''),(197,'Mining and geological engineering','mining-and-geological-engineering',1,''),(198,'Sports & Entertainment','sports-entertainment',1,''),(199,'Understanding others','understanding-others',1,'YOURCHILD is interested in why people do the things they do.'),(200,'Transportion Systems','transportion-systems',1,''),(201,'Genetic engineering','genetic-engineering',1,''),(202,'Logical & Sequential Ordering','logical-sequential-ordering',1,'YOURCHILD is good at mathematical problems and using numbers.'),(203,'Active Working Memory','active-working-memory',1,'YOURCHILD has a good working memory. HE/SHE can keep a conversation going for a long time, holding on and coming back to important parts of the conversation and relating it to prior knowledge.'),(204,'Households Appliances','households-appliances',1,''),(205,'Data Processing','data-processing',1,''),(206,'Data Management','data-management',1,''),(207,'Developing Explanations & Solutions','developing-explanations-solutions',1,'YOURCHILD enjoys designing and creating things or coming up with interesting explanations for how things happened.'),(208,'Interactive Multimedia','interactive-multimedia',1,''),(209,'Advertising PR','advertising-pr',1,''),(210,'Solids/Materials','solidsmaterials',1,'YOURCHILD loves exploring, playing and building with blocks, legos, rocks, sand or any physical material\"'),(211,'Aerospace, Areonautics, & Astronautics engineering','aerospace-areonautics-astronautics-engineering',1,''),(212,'World of People','world-of-people',1,'YOURCHILD loves learning and talking about family, friends and all about people or things people do '),(213,'Geoscience & hydrological science','geoscience-hydrological-science',1,''),(214,'Experimenting','experimenting',1,'YOURCHILD enjoys testing ideas and analyzing what has worked out, what has not and why.'),(215,'Internal Standards','internal-standards',1,'YOURCHILD can apply his own internal standards for HIS/HER performance or behavior'),(216,'Mobile Applications','mobile-applications',1,''),(217,'Critical /Analytical Thinking','critical-analytical-thinking',1,'YOURCHILD enjoys carving ideas up into their basic elements and parts. HE/SHE can find a compelling way of organizing any topic or problem.'),(218,'Insects/Bugs','insectsbugs',1,'YOURCHILD enjoys catching butterflies/firefles, creating an ant farm, or collecting beetles?'),(219,'Biomedical engineering','biomedical-engineering',1,''),(220,'Sequential Memory','sequential-memory',1,'YOURCHILD can easily remember phone numbers or other numbers.'),(221,'Plants','plants',1,'YOURCHILD can recognize and name different types of trees, flowers and plants.'),(222,'Rockets/Spacecraft','rocketsspacecraft',1,''),(223,'Acoustics & Sound','acoustics-sound',1,''),(224,'Self Regualtion','self-regualtion',1,'YOURCHILD can stay on task and can follow through on his goal'),(225,'Social Reasoning','social-reasoning',1,'YOURCHILD enjoys social events like parties.'),(226,'Navigation/Cartography','navigationcartography',1,''),(227,'Metacognitive Reasoning','metacognitive-reasoning',1,'YOURCHILD has an amazing ability to think about HIS/HER thinking, sometimes called \"mindfulness\". HE/SHE seems amazingly wise and mature for his age.'),(228,'Self Direction','self-direction',1,'YOURCHILD needs to see something in it for HIM/HER before S/HE wants to learn something.'),(229,'Social Areas/Interests','social-areasinterests',1,'YOURCHILD  is a social butterfly. HE/SHE really enjoys time with family, friends and her local community groups'),(230,'Interaction Skills','interaction-skills',1,'YOURCHILD gravitates toward other people and enjoys interacting with them'),(231,'Reading Text','reading-text',1,'YOURCHILD loves reading books'),(232,'Predicitng/ Developing Hypothesis','predicitng-developing-hypothesis',1,'YOURCHILD enjoys making predictions about the outcome of actions or developing hypothesis about the possible solutions to a problem '),(233,'Biological Sciences','biological-sciences',1,'YOURCHILD enjoys studying the types of birds, mammals and you could see him enjoying dissecting frogs, bugs or other animals.'),(234,'Materials/Cool Stuff','materialscool-stuff',1,'YOURCHILD is particularly interested in natural objects-- for example, hunting for seashells and sea glass along the shore or finding different types of rocks on a hike.'),(235,'Chemistry','chemistry',1,''),(236,'Electronics & Computer engineering','electronics-computer-engineering',1,''),(237,'Mental Health','mental-health',1,'YOURCHILD seems fascinated by HIS/HER mind and mental abilities. For example, HE/SHE wants to actively challenge HIM/HERself and manage HIS/HER learning in lots of areas outside of school'),(238,'Listening Orally','listening-orally',1,'YOURCHILD learns well from listening to others.'),(239,'Physical Health','physical-health',1,'YOURCHILD seems fascinated by HIS/HER physical health. For example, HE/SHE wants to understand nutrition and what foods to eat and what kind of exercise to do'),(240,'Causation','causation',1,'YOURCHILD is good at figuring out what has caused a sequence of events to occur by relying upon a case base of similar situations'),(241,'Group/ Team Skills','group-team-skills',1,'YOURCHILD enjoys games involving other people.'),(242,'Self Awareness','self-awareness',1,'YOURCHILD is observant, often sees things that others miss.'),(243,'World of Things/Objects','world-of-thingsobjects',1,'YOURCHILD loves learning and talking about objects, gadgets and cool stuff '),(244,'Asking Questions','asking-questions',1,'YOURCHILD enjoys following his/her curiosity and asking questions about the world. For example, why are there seasons? What do bees do, Why did a structure collapse? How is electric power generated?'),(245,'Theatre','theatre',1,''),(246,'Zoology','zoology',1,'YOURCHILD likes zoos, petting farms, exploring and studying the animals'),(247,'Birds','birds',1,'YOURCHILD enjoys birds. HE/SHE can recognize and name different types of birds.'),(248,'Self Confidence','self-confidence',1,'YOURCHILD has a strong sense of HIS/HER self worth and capabilities'),(249,'Bridges','bridges',1,''),(250,'Diagnosis','diagnosis',1,'YOURCHILD  is good at making a diagnosis of a complex situation by identifying relevant factors and seeking causal explanations\n'),(251,'Self Concept','self-concept',1,'YOURCHILD knows HIM/HERself  and HIS/HER strengths and limits well.'),(252,'Writing','writing',1,'YOURCHILD enjoys writing things down'),(253,'Creating Multiple Media','creating-multiple-media',1,'YOURCHILD enjoys creating stuff on the computer whether drawings, graphics, images or complete interactive stories and games or even programming'),(254,'Personal/Emotional Reasoning','personalemotional-reasoning',1,'YOURCHILD enjoys working on HIS/HER own'),(255,'Learning to Learn','learning-to-learn',1,'YOURCHILD is good at learners to extend and master their own capacities for learning. HE/SHE is explicit and '),(256,'Music','music',1,''),(257,'Fish','fish',1,'YOURCHILD enjoys all sorts of fish. For example, HE/SHE can recognize and name different types of aquarium fish (clown fish), or sport fish (rainbow trout) or others.'),(258,'Networking','networking',1,''),(259,'Environmental engineering','environmental-engineering',1,''),(260,'Higher Order Thinking','higher-order-thinking',1,'YOURCHILD is knows how to think things through. HE/SHE is both a creative and critical thinker who can solve problems'),(261,'Desktop Publishing','desktop-publishing',1,''),(262,'Nutrition','nutrition',1,'YOURCHILD really enjoys figuring out a healthy diet and the right balance of things to eat'),(263,'Computer Graphics','computer-graphics',1,''),(264,'Mechanical Engineering','mechanical-engineering',1,''),(265,'Geology','geology',1,''),(266,'Mammals','mammals',1,'YOURCHILD enjoys dogs, cats, hamsters and all sorts of pets and mammals'),(267,'Airplanes','airplanes',1,''),(268,'Personal Responsibility','personal-responsibility',1,'YOURCHILD takes responsibility for HIS/HER personal performance and is not prone to excuses and blaming others.'),(269,'Desktop Applications','desktop-applications',1,''),(270,'Atmospheric science','atmospheric-science',1,''),(271,'Friends/ Peers','friends-peers',1,'YOURCHILD really enjoys spending time with her friends. If allowed, HE/SHE might spend all her time on the phone, texting or being with them.'),(272,'Video & Animation','video-animation',1,''),(273,'Judgment','judgment',1,'YOURCHILD is good at using evidence to determine what is true or false, right or wrong.'),(274,'Physical Reasoning','physical-reasoning',1,'YOURCHILD  likes to think through problems while moving around like on a walk or run.'),(275,'Output Controls','output-controls',1,'YOURCHILD rarely loses it, blurting out or does things without thinking first'),(276,'Spiritual Health','spiritual-health',1,'YOURCHILD explores and enjoys spiritual practices such as meditation. '),(277,'Science','science',1,'YOURCHILD enjoys doing science or science projects'),(278,'Earth & Space','earth-space',1,'YOURCHILD enjoys anything to do with earth & space. For example, while hiking wants to understand rock formations and where rivers come from and go or using a telescope to watch the night sky, '),(279,'Dams & Reservoirs','dams-reservoirs',1,''),(280,'Creative/Generative Thinking','creativegenerative-thinking',1,'YOURCHILD can easily come up with novel and interesting ideas. HE/SHE can free-associate, free up HIS/HER mind to go off on original tangents.'),(281,'Investigating','investigating',1,'YOURCHILD is good at following step by step detailed instructions; or making a plan for a work project?'),(282,'Space/Universe','spaceuniverse',1,'YOURCHILD enjoys watching the night sky & stars, exploring at a Planetarium or playing with the planets, solar systems, galaxies, and the final frontier of space & universe '),(283,'Mental Energy Controls','mental-energy-controls',1,'YOURCHILD sometimes seems to just run out of gas when doing mental work. HE/SHE becomes real tired or bored and cannot finish HIS/HER work. (N)'),(284,'Marine Biology','marine-biology',1,'YOURCHILD enjoys aquariums, exploring different types of fish and sea creatures or more formal study of marine animals.'),(285,'Family','family',1,'YOURCHILD really likes to just stay at home and share family time with mom, dad, siblings'),(286,'Willpower/ Self Mastery','willpower-self-mastery',1,'YOURCHILD is good at saying No when HE/SHE needs to, and Yes when HE/SHE needs to say yes and has the ability to distinguish what really matters.'),(287,'Cooking & Food','cooking-food',1,''),(288,'Agriculture & Food Science','agriculture-food-science',1,'YOURCHILD enjoys planting seeds, gardening, preparing foods and exploring why somethings grow well or poorly.'),(289,'Initiative','initiative',1,'YOURCHILD demonstrates a readiness to act on opportunities'),(290,'Machines & Tools','machines-tools',1,''),(291,'Earth and Space Sciences','earth-and-space-sciences',1,''),(292,'Gross Motor','gross-motor',1,'YOURCHILD has a good sense of balance and likes to move around a lot.'),(293,'Thinking/Cognitive Reasoning','thinkingcognitive-reasoning',1,'YOURCHILD enjoys logic problems, puzzles and anything to do with thinking and problem solviing. '),(294,'Speaking','speaking',1,'YOURCHILD can use lots of different words to express HIM/HERself.'),(295,'Architecture, Construction, Building & Fixing','architecture-construction-building-fixing',1,''),(296,'Digital Media:','digital-media',1,''),(297,'Finance and Investing','finance-and-investing',1,''),(298,'Mindsight','mindsight',1,'YOURCHILD is good at managing his awareness of what\'s happening inside his mind-- his inside world of thoughts, emotions, intuitions.'),(299,'Oceanography','oceanography',1,''),(300,'Spatial Output & Mgmt','spatial-output-mgmt',1,'YOURCHILD can make accurate representations, sketches, drawings of objects and things or organizes their closet and room in an orderly way'),(301,'User Experience and User Interface','user-experience-and-user-interface',1,''),(302,'Personal','personal',1,'YOURCHILD really enjoys taking care of and thinking about HIM/HERself'),(303,'Language/ Communication','language-communication',1,''),(304,'Waterwayorderly way\"','waterwayorderly-way',1,''),(305,'Waterways/Canals/etc','waterwayscanalsetc',1,''),(306,'Emotional Awarenss','emotional-awarenss',1,'YOURCHILD  is a keen observer of HIS/HER own emotions and their effects'),(307,'Living World','living-world',1,'YOURCHILD enjoys being at zoos, farms, botanical gardens, watching birds or anything to do with pets and living things'),(308,'Data:','data',1,''),(309,'Collaboration and cooperation','collaboration-and-cooperation',1,'YOURCHILD finds it easy to work with others toward shared goals\n'),(310,'Animals','animals',1,'YOURCHILD loves pets, petting zoos, wildlife and anything to do with animals'),(311,'Electronics','electronics',1,''),(312,'Political Awareness','political-awareness',1,'YOURCHILD can read a groups shifting currents of who is on whose side and the power relationships'),(313,'Product','product',1,''),(314,'Technology & Engineering','technology-engineering',1,''),(315,'Environmental science','environmental-science',1,''),(316,'Human & Social Services','human-social-services',1,''),(317,'Enterprise Applications','enterprise-applications',1,''),(318,'Liquids','liquids',1,'YOURCHILD enjoys exploring or playing with water, bubbles, funnels, fountains or any fluids. For example it is tough to get them out of the bathtub or pool)'),(319,'Conflict Mgmt/ Negotiation','conflict-mgmt-negotiation',1,'YOURCHILD can sort out arguments between friends.'),(320,'Bridges, Highway & Traffic','bridges-highway-traffic',1,''),(321,'Foodchains and Animal Ecosystems','foodchains-and-animal-ecosystems',1,'YOURCHILD enjoys understanding about ecosystems and foodchains. For example, HE/SHE can be fascinated by how sharks eat big fish who eat smaller fish who eat even smaller animals like plankton and such.'),(322,'Empathy','empathy',1,'YOURCHILD is sensitive to the moods and feelings of others'),(323,'Service Orientation','service-orientation',1,'YOURCHILD enjoys anticipating, recognizing and meeting others needs'),(324,'Seismology & Volcanism','seismology-volcanism',1,''),(325,'Automotive engineering','automotive-engineering',1,''),(326,'Modeling/ Designing','modeling-designing',1,'YOURCHILD enjoys thinking about represent ions of a system or event. For example, he likes contemplating the natural water cycle thinking through how the water evaporation forom a lake/ocean cycles  to the clouds, then through rain on land, then through the watershed of streams and rivers back to the lake/ocean.'),(327,'Computers','computers',1,''),(328,'Other Physical Sciences','other-physical-sciences',1,''),(329,'Optimism','optimism',1,'YOURCHILD pursues goals despite obstacles and setbacks'),(330,'Civil engineering','civil-engineering',1,''),(331,'Sequential Output & Mgmt','sequential-output-mgmt',1,'YOURCHILD likes to make lists.'),(332,'Human Sciences (eg genetics & genomics)','human-sciences-eg-genetics-genomics',1,'YOURCHILD seems particularly drawn to the study of humans. For example, anatomy, heredity or where babies come from and why they are different'),(333,'Evaluating','evaluating',1,'YOURCHILD  enjoys identifying strengths, weaknesses and limitations of an argument or explanation'),(334,'Body Language/ Gesturing','body-language-gesturing',1,'YOURCHILD enjoys using lots of different facial expressions, gestures and body language to express HIM/HERself.'),(335,'Physics','physics',1,''),(336,'Industrial design and engineering','industrial-design-and-engineering',1,''),(337,'Task Orientation','task-orientation',1,'YOURCHILD is good at initiating and completing a task'),(338,'Life Sciences','life-sciences',1,'YOURCHILD enjoys natural history museums, exploring and playing with animals and is fascinated by how living things work. '),(339,'Personal craft/Ultralight/Jetpacks','personal-craftultralightjetpacks',1,''),(340,'Travel, Adventure, Hospitality','travel-adventure-hospitality',1,''),(341,'Programming Languages','programming-languages',1,''),(342,'Ecology & Conservation Sciences','ecology-conservation-sciences',1,''),(343,'Intentionality','intentionality',1,'YOURCHILD can maintain one\'s intentions and keep their eye on the desired end result'),(344,'Attention Control System','attention-control-system',1,'YOURCHILD has good control of HIS/HER attention. HE/SHE rarely looks off in a blank stare nor tunes in and out like a flickering candle.'),(345,'Community','community',1,'YOURCHILD enjoys and is very active and involved with different groups in the community from sports teams and school groups to neighborhood and church groups'),(346,'Spatial Memory','spatial-memory',1,'YOURCHILD can picture scenes in HIS/HER head when remembering things.'),(347,'Basic Mental Processes','basic-mental-processes',1,'YOURCHILD has good intuition and can quickly recognize situations and respond in appropriate ways.'),(348,'Long Term Memory','long-term-memory',1,'YOURCHILD seems to excel at long term memory. HE/SHE easily stores information or experiences and then can access them at will when needed.'),(349,'Augmented Reality','augmented-reality',1,''),(350,'Software:','software',1,''),(351,'Earth','earth',1,'YOURCHILD enjoys finding out about the earth. For example, how the weather works, why are there volcanoes, eathquakes or tsunamis.'),(352,'Virtual Worlds','virtual-worlds',1,''),(353,'Expressive','expressive',1,''),(354,'Petroleum engineering','petroleum-engineering',1,''),(355,'Film','film',1,''),(356,'Geography','geography',1,'');
/*!40000 ALTER TABLE `tagger_affinitytag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagger_affinitytaggeditem`
--

DROP TABLE IF EXISTS `tagger_affinitytaggeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagger_affinitytaggeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `user_id` int(11),
  PRIMARY KEY (`id`),
  KEY `tagger_affinitytaggeditem_829e37fd` (`object_id`),
  KEY `tagger_affinitytaggeditem_e4470c6e` (`content_type_id`),
  KEY `tagger_affinitytaggeditem_3747b463` (`tag_id`),
  KEY `tagger_affinitytaggeditem_fbfc09f1` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagger_affinitytaggeditem`
--

LOCK TABLES `tagger_affinitytaggeditem` WRITE;
/*!40000 ALTER TABLE `tagger_affinitytaggeditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagger_affinitytaggeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagger_item`
--

DROP TABLE IF EXISTS `tagger_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagger_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL DEFAULT '2012-05-09 12:20:19',
  `modified` datetime NOT NULL DEFAULT '2012-05-09 12:20:19',
  `source_id` varchar(256) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagger_item_6ad0ca34` (`supplier_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1245 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagger_item`
--

LOCK TABLES `tagger_item` WRITE;
/*!40000 ALTER TABLE `tagger_item` DISABLE KEYS */;
INSERT INTO `tagger_item` VALUES (313,'2012-05-08 20:20:46','2012-05-08 20:20:46','B003A7CIUK',1),(312,'2012-05-08 20:20:46','2012-05-08 20:20:46','B000VKPS9W',1),(311,'2012-05-08 20:20:46','2012-05-08 20:20:46','B003A763S8',1),(310,'2012-05-08 20:20:46','2012-05-08 20:20:46','B001YIQ0NS',1),(309,'2012-05-08 20:20:34','2012-05-08 20:20:34','B000BHKQ60',1),(308,'2012-05-08 20:20:34','2012-05-08 20:20:34','B002WJTEAO',1),(307,'2012-05-08 20:20:34','2012-05-08 20:20:34','B003J0M92U',1),(306,'2012-05-08 20:20:34','2012-05-08 20:20:34','B003TJAEV4',1),(305,'2012-05-08 20:20:34','2012-05-08 20:20:34','B001YITDG4',1),(304,'2012-05-08 20:20:34','2012-05-08 20:20:34','B005C66UM4',1),(303,'2012-05-08 20:20:26','2012-05-08 20:20:26','B002P3496G',1),(302,'2012-05-08 20:20:26','2012-05-08 20:20:26','B00534O0YA',1),(301,'2012-05-08 20:20:26','2012-05-08 20:20:26','B001QJLDXM',1),(300,'2012-05-08 20:20:26','2012-05-08 20:20:26','B002W83OB0',1),(299,'2012-05-08 20:20:26','2012-05-08 20:20:26','B003VWL91I',1),(298,'2012-05-08 20:20:17','2012-05-08 20:20:17','B002RXAQKM',1),(297,'2012-05-08 20:20:17','2012-05-08 20:20:17','B001YIN6SU',1),(296,'2012-05-08 20:20:17','2012-05-08 20:20:17','B003TJAEVE',1),(295,'2012-05-08 20:20:17','2012-05-08 20:20:17','B004P6V2G6',1),(294,'2012-05-08 20:19:42','2012-05-08 20:19:42','B00283X9AA',1),(372,'2012-05-15 15:57:49','2012-05-15 15:57:49','B0035DU59U',1),(292,'2012-05-08 20:19:42','2012-05-08 20:19:42','B001RZOVZC',1),(291,'2012-05-08 20:19:42','2012-05-08 20:19:42','B001RZH302',1),(290,'2012-05-08 20:19:42','2012-05-08 20:19:42','B002T8I3CS',1),(289,'2012-05-08 20:19:42','2012-05-08 20:19:42','B001RZH2ZI',1),(288,'2012-05-08 19:44:53','2012-05-08 19:44:53','B007IMF9E0',1),(287,'2012-05-08 19:44:53','2012-05-08 19:44:53','B005HHCYE6',1),(286,'2012-05-08 19:44:53','2012-05-08 19:44:53','B005HI4DBC',1),(285,'2012-05-08 19:44:52','2012-05-08 19:44:52','B005HHHLJ4',1),(284,'2012-05-08 19:44:52','2012-05-08 19:44:52','B005HI4KXS',1),(283,'2012-05-08 19:44:52','2012-05-08 19:44:52','B000OVEPHO',1),(361,'2012-05-15 15:57:46','2012-05-15 15:57:46','B003NE4PB0',1),(281,'2012-05-08 19:44:48','2012-05-08 19:44:48','B003660EXI',1),(280,'2012-05-08 19:44:48','2012-05-08 19:44:48','B0013ROXI4',1),(279,'2012-05-08 19:44:44','2012-05-08 19:44:44','B0057B766I',1),(278,'2012-05-08 19:44:44','2012-05-08 19:44:44','B004CYMZ44',1),(277,'2012-05-08 19:44:44','2012-05-08 19:44:44','B00004WJU1',1),(276,'2012-05-08 19:44:44','2012-05-08 19:44:44','B004T1WEE6',1),(275,'2012-05-08 19:44:39','2012-05-08 19:44:39','B0039YOFDC',1),(562,'2012-05-18 13:38:00','2012-05-18 13:38:00','B00265IGQM',1),(273,'2012-05-08 19:44:35','2012-05-08 19:44:35','B0002379UO',1),(272,'2012-05-08 19:44:35','2012-05-08 19:44:35','B000FZZ3RU',1),(367,'2012-05-15 15:57:48','2012-05-15 15:57:48','B001EMV3F4',1),(270,'2012-05-08 19:44:35','2012-05-08 19:44:35','B004V91T7Y',1),(269,'2012-05-08 19:44:35','2012-05-08 19:44:35','B000XAHGI6',1),(268,'2012-05-08 19:44:30','2012-05-08 19:44:30','B0073XT166',1),(267,'2012-05-08 19:44:30','2012-05-08 19:44:30','B003A4YAE0',1),(266,'2012-05-08 19:44:30','2012-05-08 19:44:30','B00126ON6I',1),(265,'2012-05-08 19:44:30','2012-05-08 19:44:30','B000HQG1Q4',1),(264,'2012-05-08 19:44:30','2012-05-08 19:44:30','B003JCB5X2',1),(263,'2012-05-08 19:44:30','2012-05-08 19:44:30','B0000XMTEC',1),(262,'2012-05-08 19:44:30','2012-05-08 19:44:30','B0043FBBC4',1),(261,'2012-05-08 19:44:25','2012-05-08 19:44:25','B000IG4FCU',1),(260,'2012-05-08 19:44:25','2012-05-08 19:44:25','B003BK59Y8',1),(259,'2012-05-08 19:44:25','2012-05-08 19:44:25','B000GKY9I8',1),(258,'2012-05-08 19:44:25','2012-05-08 19:44:25','B004AFRKUO',1),(257,'2012-05-08 19:44:25','2012-05-08 19:44:25','B000P0SYPS',1),(256,'2012-05-08 19:44:25','2012-05-08 19:44:25','B000CNPAAA',1),(255,'2012-05-08 19:44:21','2012-05-08 19:44:21','B00062RV18',1),(511,'2012-05-18 13:30:57','2012-05-18 13:30:57','B007FIALHM',1),(253,'2012-05-08 19:44:17','2012-05-08 19:44:17','B0016CY1ME',1),(252,'2012-05-08 19:44:17','2012-05-08 19:44:17','B0054G6ZT0',1),(251,'2012-05-08 19:44:12','2012-05-08 19:44:12','B000EDMELG',1),(250,'2012-05-08 19:43:36','2012-05-08 19:43:36','B007D97ZHC',1),(364,'2012-05-15 15:57:47','2012-05-15 15:57:47','B003GDDVPE',1),(247,'2012-05-08 19:39:59','2012-05-08 19:39:59','B001RK37P2',1),(246,'2012-05-08 19:39:58','2012-05-08 19:39:58','B003VWJLM2',1),(245,'2012-05-08 19:39:50','2012-05-08 19:39:50','B0055E75S6',1),(244,'2012-05-08 19:39:50','2012-05-08 19:39:50','B0042Z210Q',1),(243,'2012-05-08 19:39:50','2012-05-08 19:39:50','B0055E4EVW',1),(242,'2012-05-08 19:39:50','2012-05-08 19:39:50','B0047LSZKK',1),(374,'2012-05-15 15:57:50','2012-05-15 15:57:50','B000QMII88',1),(240,'2012-05-08 19:39:28','2012-05-08 19:39:28','B0013ERI4I',1),(239,'2012-05-08 19:39:28','2012-05-08 19:39:28','B004DJ3B1Y',1),(238,'2012-05-08 19:39:28','2012-05-08 19:39:28','B000SSMW14',1),(237,'2012-05-08 19:39:28','2012-05-08 19:39:28','B005KBPBJ4',1),(236,'2012-05-08 19:39:28','2012-05-08 19:39:28','B003ZE4BUS',1),(235,'2012-05-08 19:39:23','2012-05-08 19:39:23','B0052U7J3E',1),(234,'2012-05-08 19:39:23','2012-05-08 19:39:23','B001DW2AIO',1),(233,'2012-05-08 19:39:23','2012-05-08 19:39:23','B004F0Q7EE',1),(232,'2012-05-08 19:39:23','2012-05-08 19:39:23','B0013NAIH8',1),(231,'2012-05-08 19:39:23','2012-05-08 19:39:23','B000H6FM9G',1),(230,'2012-05-08 19:39:18','2012-05-08 19:39:18','B006586JDI',1),(229,'2012-05-08 19:39:18','2012-05-08 19:39:18','B005JECY0Q',1),(228,'2012-05-08 19:39:18','2012-05-08 19:39:18','B000TK6PYQ',1),(227,'2012-05-08 19:39:18','2012-05-08 19:39:18','B000ELT03S',1),(226,'2012-05-08 19:39:18','2012-05-08 19:39:18','B003WRJCZ2',1),(225,'2012-05-08 19:39:18','2012-05-08 19:39:18','B001VIZ8KW',1),(224,'2012-05-08 19:39:11','2012-05-08 19:39:11','B00178TDM0',1),(223,'2012-05-08 19:39:11','2012-05-08 19:39:11','B00178T4X8',1),(222,'2012-05-08 19:39:11','2012-05-08 19:39:11','B000PFLPWW',1),(221,'2012-05-08 19:39:06','2012-05-08 19:39:06','B005UP9RF4',1),(220,'2012-05-08 19:39:06','2012-05-08 19:39:06','B003661ZNG',1),(219,'2012-05-08 19:39:06','2012-05-08 19:39:06','B004SQQCHC',1),(218,'2012-05-08 19:39:06','2012-05-08 19:39:06','B005HYNLLE',1),(217,'2012-05-08 19:39:01','2012-05-08 19:39:01','B000Z4JSXQ',1),(216,'2012-05-08 19:39:01','2012-05-08 19:39:01','B005KBMCL4',1),(215,'2012-05-08 19:38:57','2012-05-08 19:38:57','B0014JXQUC',1),(214,'2012-05-08 19:38:57','2012-05-08 19:38:57','B002DHGV88',1),(213,'2012-05-08 19:38:57','2012-05-08 19:38:57','B00112UQRS',1),(212,'2012-05-08 19:38:57','2012-05-08 19:38:57','B000P9MI7O',1),(211,'2012-05-08 19:38:57','2012-05-08 19:38:57','B000F8XHEI',1),(210,'2012-05-08 19:38:57','2012-05-08 19:38:57','B000F8XDHO',1),(209,'2012-05-08 19:38:52','2012-05-08 19:38:52','B000XKGX30',1),(208,'2012-05-08 19:38:52','2012-05-08 19:38:52','B002CALXHA',1),(207,'2012-05-08 19:38:52','2012-05-08 19:38:52','B002DHGV3I',1),(206,'2012-05-08 19:38:48','2012-05-08 19:38:48','B000BQ7D58',1),(205,'2012-05-08 19:38:48','2012-05-08 19:38:48','B004XMNJO0',1),(204,'2012-05-08 19:38:48','2012-05-08 19:38:48','B002X3762M',1),(203,'2012-05-08 19:38:48','2012-05-08 19:38:48','B000W7NP8U',1),(202,'2012-05-08 19:38:42','2012-05-08 19:38:42','B002CF5WCM',1),(201,'2012-05-08 19:38:42','2012-05-08 19:38:42','B003TUC6RS',1),(387,'2012-05-18 13:22:11','2012-05-18 13:22:11','B0041VHPXE',1),(380,'2012-05-18 13:21:16','2012-05-18 13:21:16','B003IWTHOC',1),(366,'2012-05-15 15:57:47','2012-05-15 15:57:47','B004QNRPZK',1),(197,'2012-05-08 17:43:13','2012-05-08 17:43:13','B003DKJEAG',1),(382,'2012-05-18 13:22:10','2012-05-18 13:22:10','B001QXKL36',1),(373,'2012-05-15 15:57:50','2012-05-15 15:57:50','B00467RQEG',1),(193,'2012-05-08 17:43:13','2012-05-08 17:43:13','B001K2DITM',1),(192,'2012-05-08 17:42:55','2012-05-08 17:42:55','B003DKJEB0',1),(365,'2012-05-15 15:57:47','2012-05-15 15:57:47','B000OZGUT6',1),(189,'2012-05-08 17:42:55','2012-05-08 17:42:55','B002PNWCBA',1),(513,'2012-05-18 13:30:58','2012-05-18 13:30:58','B005QDTBJ2',1),(187,'2012-05-08 17:42:55','2012-05-08 17:42:55','B003DKJEDI',1),(186,'2012-05-08 17:42:55','2012-05-08 17:42:55','B003DKJEBU',1),(185,'2012-05-08 17:42:54','2012-05-08 17:42:54','B003DKJEDS',1),(184,'2012-05-08 17:38:31','2012-05-08 17:38:31','B003DKJEC4',1),(183,'2012-05-08 17:38:31','2012-05-08 17:38:31','B003DKJEAQ',1),(182,'2012-05-08 17:38:31','2012-05-08 17:38:31','B0000683A4',1),(181,'2012-05-08 17:38:31','2012-05-08 17:38:31','B003DKJED8',1),(180,'2012-05-08 17:38:31','2012-05-08 17:38:31','B001TG20S4',1),(179,'2012-05-08 17:38:31','2012-05-08 17:38:31','B003DKJEBK',1),(178,'2012-05-08 17:37:59','2012-05-08 17:37:59','B005DSRZ3O',1),(177,'2012-05-08 17:37:59','2012-05-08 17:37:59','B002HI9KW2',1),(176,'2012-05-08 17:37:59','2012-05-08 17:37:59','B000GI0SCG',1),(175,'2012-05-08 17:37:59','2012-05-08 17:37:59','B003DA4VHC',1),(174,'2012-05-08 17:37:59','2012-05-08 17:37:59','B0013993C8',1),(173,'2012-05-08 17:37:59','2012-05-08 17:37:59','B006X0T2IM',1),(172,'2012-05-08 17:37:59','2012-05-08 17:37:59','B003DA4VMW',1),(171,'2012-05-08 17:37:59','2012-05-08 17:37:59','B003DA4VS6',1),(170,'2012-05-08 17:37:59','2012-05-08 17:37:59','B0009VKY5Q',1),(169,'2012-05-08 17:37:54','2012-05-08 17:37:54','B004UME208',1),(168,'2012-05-08 17:37:54','2012-05-08 17:37:54','B003DA4VK4',1),(167,'2012-05-08 17:37:54','2012-05-08 17:37:54','B00149WXEC',1),(166,'2012-05-08 17:37:54','2012-05-08 17:37:54','B0039KM5Z6',1),(165,'2012-05-08 17:37:54','2012-05-08 17:37:54','B004LTD2SS',1),(164,'2012-05-08 17:37:54','2012-05-08 17:37:54','B00192CC8Q',1),(163,'2012-05-08 17:37:54','2012-05-08 17:37:54','B000066HU0',1),(162,'2012-05-08 17:37:54','2012-05-08 17:37:54','B002W80CLK',1),(161,'2012-05-08 17:37:54','2012-05-08 17:37:54','B001BSNZBG',1),(160,'2012-05-08 17:37:49','2012-05-08 17:37:49','B000P942LO',1),(159,'2012-05-08 17:37:49','2012-05-08 17:37:49','B003DA4VO0',1),(158,'2012-05-08 17:37:48','2012-05-08 17:37:48','B005O0XVTS',1),(157,'2012-05-08 17:37:48','2012-05-08 17:37:48','B003G6WCJW',1),(156,'2012-05-08 17:37:48','2012-05-08 17:37:48','B0019IEW5G',1),(155,'2012-05-08 17:37:48','2012-05-08 17:37:48','B003BYM7VM',1),(154,'2012-05-08 17:37:48','2012-05-08 17:37:48','B003G6Q3LK',1),(153,'2012-05-08 17:37:48','2012-05-08 17:37:48','B003TJAEUK',1),(519,'2012-05-18 13:34:23','2012-05-18 13:34:23','B000F8T5TO',1),(151,'2012-05-08 17:37:42','2012-05-08 17:37:42','B00004W5ZB',1),(150,'2012-05-08 17:37:42','2012-05-08 17:37:42','B003DA4VPE',1),(149,'2012-05-08 17:37:42','2012-05-08 17:37:42','B003DA4VEU',1),(148,'2012-05-08 17:37:42','2012-05-08 17:37:42','B000GHVHH2',1),(147,'2012-05-08 17:37:42','2012-05-08 17:37:42','B0039KM3SK',1),(146,'2012-05-08 17:37:42','2012-05-08 17:37:42','B004UU3QZM',1),(145,'2012-05-08 17:37:37','2012-05-08 17:37:37','B005I6DGNY',1),(144,'2012-05-08 17:37:37','2012-05-08 17:37:37','B00149RAKY',1),(143,'2012-05-08 17:37:37','2012-05-08 17:37:37','B002HHQ8Y6',1),(142,'2012-05-08 17:37:37','2012-05-08 17:37:37','B000Q7FP0C',1),(141,'2012-05-08 17:37:37','2012-05-08 17:37:37','B0000632R8',1),(140,'2012-05-08 17:37:37','2012-05-08 17:37:37','B000BXHP86',1),(139,'2012-05-08 17:37:37','2012-05-08 17:37:37','B003G6S7R8',1),(138,'2012-05-08 17:37:32','2012-05-08 17:37:32','B001RIHAYS',1),(137,'2012-05-08 17:37:32','2012-05-08 17:37:32','B00123965Y',1),(136,'2012-05-08 17:37:32','2012-05-08 17:37:32','B000Q7964S',1),(135,'2012-05-08 17:37:32','2012-05-08 17:37:32','B001CRCW24',1),(134,'2012-05-08 17:37:32','2012-05-08 17:37:32','B00026G6H8',1),(133,'2012-05-08 17:37:32','2012-05-08 17:37:32','B001AZ9RKS',1),(132,'2012-05-08 17:37:32','2012-05-08 17:37:32','B002UM70KE',1),(131,'2012-05-08 17:37:27','2012-05-08 17:37:27','B005J5D576',1),(130,'2012-05-08 17:37:27','2012-05-08 17:37:27','B002Y7KQ10',1),(129,'2012-05-08 17:37:27','2012-05-08 17:37:27','B001L7R2IE',1),(128,'2012-05-08 17:37:27','2012-05-08 17:37:27','B000VD6DE8',1),(127,'2012-05-08 17:37:27','2012-05-08 17:37:27','B002P3850W',1),(126,'2012-05-08 17:37:27','2012-05-08 17:37:27','B0012NJ7TO',1),(125,'2012-05-08 17:37:20','2012-05-08 17:37:20','B0002VJYSQ',1),(124,'2012-05-08 17:37:20','2012-05-08 17:37:20','B001F6CHJ0',1),(123,'2012-05-08 17:37:20','2012-05-08 17:37:20','B000099Z8M',1),(122,'2012-05-08 17:37:20','2012-05-08 17:37:20','1932855785',1),(121,'2012-05-08 17:37:20','2012-05-08 17:37:20','B003BYKP7U',1),(120,'2012-05-08 17:37:20','2012-05-08 17:37:20','B00344W5KW',1),(119,'2012-05-08 17:37:20','2012-05-08 17:37:20','B004YJSD0M',1),(118,'2012-05-08 17:37:10','2012-05-08 17:37:10','B0010KO3MK',1),(117,'2012-05-08 17:37:10','2012-05-08 17:37:10','B000099Z95',1),(116,'2012-05-08 17:37:10','2012-05-08 17:37:10','B000066HU1',1),(115,'2012-05-08 17:37:10','2012-05-08 17:37:10','B000OAEHUA',1),(114,'2012-05-08 17:37:10','2012-05-08 17:37:10','B001CZUO6C',1),(113,'2012-05-08 17:37:10','2012-05-08 17:37:10','B002SVU7QG',1),(112,'2012-05-08 17:37:10','2012-05-08 17:37:10','B001ALT6BM',1),(111,'2012-05-08 17:36:59','2012-05-08 17:36:59','B0010ZI3UI',1),(110,'2012-05-08 17:36:59','2012-05-08 17:36:59','B000W6OS96',1),(109,'2012-05-08 17:36:59','2012-05-08 17:36:59','B0055E8620',1),(108,'2012-05-08 17:36:59','2012-05-08 17:36:59','B001YIT1YI',1),(107,'2012-05-08 17:36:59','2012-05-08 17:36:59','B00000ISC5',1),(106,'2012-05-08 17:36:59','2012-05-08 17:36:59','B0037YIY2M',1),(105,'2012-05-08 17:36:59','2012-05-08 17:36:59','B001DTD0H2',1),(104,'2012-05-08 17:36:32','2012-05-08 17:36:32','B004LJ0WIQ',1),(103,'2012-05-08 17:36:32','2012-05-08 17:36:32','B002ER471U',1),(102,'2012-05-08 17:36:32','2012-05-08 17:36:32','B000F8MGR2',1),(101,'2012-05-08 17:36:31','2012-05-08 17:36:31','B003U2O5SS',1),(100,'2012-05-08 17:36:31','2012-05-08 17:36:31','B000NX0HVQ',1),(99,'2012-05-08 17:36:31','2012-05-08 17:36:31','B001234XPC',1),(98,'2012-05-08 17:36:31','2012-05-08 17:36:31','B00139B3NU',1),(97,'2012-05-08 17:36:26','2012-05-08 17:36:26','B004A2UZAO',1),(96,'2012-05-08 17:36:26','2012-05-08 17:36:26','B000NNPZJK',1),(95,'2012-05-08 17:36:26','2012-05-08 17:36:26','B0015ZEJ2E',1),(94,'2012-05-08 17:36:26','2012-05-08 17:36:26','B007I2G7G4',1),(93,'2012-05-08 17:36:26','2012-05-08 17:36:26','B000F8VB2I',1),(92,'2012-05-08 17:36:26','2012-05-08 17:36:26','B000ZK6BVC',1),(91,'2012-05-08 17:36:26','2012-05-08 17:36:26','B005IY4B2G',1),(90,'2012-05-08 17:36:26','2012-05-08 17:36:26','B000GYWXM8',1),(89,'2012-05-08 17:36:21','2012-05-08 17:36:21','B000NTMF10',1),(88,'2012-05-08 17:36:21','2012-05-08 17:36:21','B000FA6APE',1),(87,'2012-05-08 17:36:21','2012-05-08 17:36:21','B00000IT4T',1),(86,'2012-05-08 17:36:21','2012-05-08 17:36:21','B000F8XF6S',1),(85,'2012-05-08 17:36:21','2012-05-08 17:36:21','B005JAE052',1),(84,'2012-05-08 17:36:21','2012-05-08 17:36:21','B0006FSEOI',1),(83,'2012-05-08 17:36:21','2012-05-08 17:36:21','B004K0DSB4',1),(82,'2012-05-08 17:36:21','2012-05-08 17:36:21','B001GRVJW4',1),(81,'2012-05-08 17:36:21','2012-05-08 17:36:21','B00265K9T4',1),(80,'2012-05-08 17:36:21','2012-05-08 17:36:21','B000FGKI1K',1),(79,'2012-05-08 17:36:16','2012-05-08 17:36:16','B000VE6U0O',1),(78,'2012-05-08 17:36:16','2012-05-08 17:36:16','B00275SWJC',1),(77,'2012-05-08 17:36:16','2012-05-08 17:36:16','B0033UWMK0',1),(76,'2012-05-08 17:36:16','2012-05-08 17:36:16','B003CSYUNU',1),(75,'2012-05-08 17:36:16','2012-05-08 17:36:16','B000EJWANM',1),(74,'2012-05-08 17:36:16','2012-05-08 17:36:16','B000VLE2KW',1),(73,'2012-05-08 17:36:11','2012-05-08 17:36:11','B001239654',1),(72,'2012-05-08 17:36:11','2012-05-08 17:36:11','B000NP7PD2',1),(71,'2012-05-08 17:36:11','2012-05-08 17:36:11','B002755DAS',1),(370,'2012-05-15 15:57:49','2012-05-15 15:57:49','B000YJMHLC',1),(69,'2012-05-08 17:36:11','2012-05-08 17:36:11','B001PNEDS6',1),(68,'2012-05-08 17:36:11','2012-05-08 17:36:11','B0006OHMU6',1),(67,'2012-05-08 17:36:11','2012-05-08 17:36:11','B002WJE2MY',1),(66,'2012-05-08 17:36:05','2012-05-08 17:36:06','B002N6S7KO',1),(65,'2012-05-08 17:36:05','2012-05-08 17:36:05','B00123965O',1),(64,'2012-05-08 17:36:05','2012-05-08 17:36:05','B00006654A',1),(63,'2012-05-08 17:36:05','2012-05-08 17:36:05','B003G6C8ZU',1),(62,'2012-05-08 17:36:05','2012-05-08 17:36:05','B000F6F8CY',1),(61,'2012-05-08 17:36:00','2012-05-08 17:36:00','B0016P9B4Y',1),(60,'2012-05-08 17:36:00','2012-05-08 17:36:00','1886978034',1),(59,'2012-05-08 17:36:00','2012-05-08 17:36:00','B00188VTNK',1),(58,'2012-05-08 17:36:00','2012-05-08 17:36:00','B0009XS9KQ',1),(57,'2012-05-08 17:36:00','2012-05-08 17:36:00','B0019N4ECM',1),(56,'2012-05-08 17:36:00','2012-05-08 17:36:00','B000EP1PLO',1),(375,'2012-05-15 15:57:50','2012-05-15 15:57:50','B000OAHSME',1),(54,'2012-05-08 17:36:00','2012-05-08 17:36:00','B000MLL740',1),(53,'2012-05-08 17:36:00','2012-05-08 17:36:00','B000ZUBWDY',1),(362,'2012-05-15 15:57:46','2012-05-15 15:57:46','B0026KAPJ8',1),(51,'2012-05-08 17:35:55','2012-05-08 17:35:55','B001TG6SSC',1),(50,'2012-05-08 17:34:45','2012-05-08 17:34:45','B00261VM76',1),(49,'2012-05-08 17:34:45','2012-05-08 17:34:45','B000BUW7E6',1),(48,'2012-05-08 17:34:45','2012-05-08 17:34:45','B0042KTTGK',1),(47,'2012-05-08 17:30:44','2012-05-08 17:30:44','B0035EQDTU',1),(46,'2012-05-08 17:30:44','2012-05-08 17:30:44','B000ALGY6I',1),(45,'2012-05-08 17:30:44','2012-05-08 17:30:44','B000X48HEY',1),(44,'2012-05-08 17:30:44','2012-05-08 17:30:44','B000H6F4W6',1),(43,'2012-04-21 10:11:52','2012-04-21 10:11:52','B000QXE9I0',1),(42,'2012-04-21 09:45:47','2012-04-21 09:45:47','B003JO3JU2',1),(41,'2012-04-21 09:35:20','2012-04-21 09:35:20','B005IYB7AU',1),(40,'2012-04-21 09:25:01','2012-04-21 09:25:01','B003N2O9K4',1),(39,'2012-04-21 09:23:41','2012-04-21 09:23:41','B000QX3NYG',1),(38,'2012-04-21 08:54:58','2012-04-21 08:54:58','B000WWV4MY',1),(37,'2012-04-20 08:11:05','2012-04-20 08:11:05','B004FEXUP4',1),(36,'2012-04-20 08:08:17','2012-04-20 08:08:17','B000CBSMJI',1),(35,'2012-04-16 09:11:32','2012-04-16 09:11:32','B002EWWW9O',1),(34,'2012-04-01 23:00:11','2012-04-01 23:00:11','B004AR4VQ8',1),(360,'2012-05-15 15:57:46','2012-05-15 15:57:46','B000GYZ2IK',1),(32,'2012-04-01 22:58:28','2012-04-01 22:58:28','1603801065',1),(31,'2012-04-01 22:57:56','2012-04-01 22:57:56','B005NAJX14',1),(30,'2012-04-01 22:56:48','2012-04-01 22:56:48','B004QF0A1Y',1),(29,'2012-04-01 22:56:22','2012-04-01 22:56:22','B0014YNGCK',1),(28,'2012-04-01 22:56:04','2012-04-01 22:56:04','B00004YURW',1),(27,'2012-04-01 22:55:37','2012-04-01 22:55:37','B000NOU54O',1),(26,'2012-04-01 22:55:21','2012-04-01 22:55:21','B001PPCWO6',1),(25,'2012-04-01 22:55:08','2012-04-01 22:55:08','B0002HABZU',1),(24,'2012-04-01 22:49:58','2012-04-01 22:49:58','B001TG20R0',1),(23,'2012-04-01 22:49:25','2012-04-01 22:49:25','B003LM1R24',1),(22,'2012-04-01 22:48:44','2012-04-01 22:48:44','B003HET7OG',1),(21,'2012-04-01 22:46:13','2012-04-01 22:46:13','B004BRC894',1),(20,'2012-04-01 22:45:38','2012-04-01 22:45:38','B001JJW3W4',1),(19,'2012-04-01 22:39:36','2012-04-01 22:39:36','B000FMNZBY',1),(18,'2012-04-01 22:39:20','2012-04-01 22:39:20','B003VKO584',1),(17,'2012-04-01 22:39:06','2012-04-01 22:39:06','B000IXMP6Q',1),(16,'2012-04-01 22:38:50','2012-04-01 22:38:50','B0015YHTOU',1),(15,'2012-04-01 22:38:30','2012-04-01 22:38:30','B00008BFZH',1),(14,'2012-04-01 22:38:04','2012-04-01 22:38:04','B003DKJEBA',1),(13,'2012-04-01 22:37:39','2012-04-01 22:37:39','B003GY5HA0',1),(12,'2012-04-01 22:37:22','2012-04-01 22:37:22','B000OCP19Y',1),(11,'2012-04-01 22:37:05','2012-04-01 22:37:05','B001T8OFQM',1),(10,'2012-04-01 22:36:50','2012-04-01 22:36:50','B0007KK0V2',1),(9,'2012-04-01 22:36:36','2012-04-01 22:36:36','B000BUXZG0',1),(8,'2012-04-01 15:28:13','2012-04-01 15:28:13','B004LL2FN4',1),(7,'2012-04-01 15:27:52','2012-04-01 15:27:52','B001RED0EG',1),(6,'2012-04-01 15:27:28','2012-04-01 15:27:28','B0034N7OZO',1),(5,'2012-04-01 15:26:52','2012-04-01 15:26:52','1580625576',1),(4,'2012-04-01 15:22:15','2012-04-01 15:22:15','B000E0DYOU',1),(3,'2012-04-01 15:14:21','2012-04-01 15:14:21','B003EIK136',1),(2,'2012-04-01 15:07:47','2012-04-01 15:07:47','B0037W5Y2W',1),(1,'2012-04-01 15:02:18','2012-04-01 15:02:18','B000BURAP2',1),(510,'2012-05-18 13:30:57','2012-05-18 13:30:57','B0015K8J66',1),(369,'2012-05-15 15:57:48','2012-05-15 15:57:48','B0017Q2FTU',1),(316,'2012-05-10 15:52:02','2012-05-10 15:52:02','B001TK6Y5A',1),(426,'2012-05-18 13:27:22','2012-05-18 13:27:22','B000URMUKG',1),(368,'2012-05-15 15:57:48','2012-05-15 15:57:48','B004K5H004',1),(319,'2012-05-10 15:52:03','2012-05-10 15:52:03','B000EG8ICC',1),(320,'2012-05-10 15:52:03','2012-05-10 15:52:03','B004EFTSXC',1),(321,'2012-05-10 15:52:03','2012-05-10 15:52:03','0974889121',1),(389,'2012-05-18 13:22:11','2012-05-18 13:22:11','B0016BZIKE',1),(381,'2012-05-18 13:21:16','2012-05-18 13:21:16','B001A48MS2',1),(326,'2012-05-11 13:21:20','2012-05-11 13:21:20','B004ZAKOGG',1),(363,'2012-05-15 15:57:47','2012-05-15 15:57:47','B0042ST76O',1),(328,'2012-05-11 13:21:20','2012-05-11 13:21:20','B0006PKZ54',1),(376,'2012-05-15 15:57:50','2012-05-15 15:57:50','B001AZ2IFE',1),(378,'2012-05-18 13:21:13','2012-05-18 13:21:13','B000ZKBN24',1),(377,'2012-05-15 15:57:50','2012-05-15 15:57:50','B004JK26AE',1),(333,'2012-05-11 13:30:15','2012-05-11 13:30:15','B00064XG60',1),(334,'2012-05-11 13:30:15','2012-05-11 13:30:15','B000IG8EZO',1),(379,'2012-05-18 13:21:13','2012-05-18 13:21:13','B003UCV19O',1),(336,'2012-05-11 13:30:15','2012-05-11 13:30:15','B000UEL05U',1),(522,'2012-05-18 13:34:23','2012-05-18 13:34:23','B004FT81BC',1),(338,'2012-05-11 13:34:03','2012-05-11 13:34:03','B005HI49DO',1),(339,'2012-05-11 13:34:03','2012-05-11 13:34:03','B002J9R9E0',1),(340,'2012-05-11 13:34:03','2012-05-11 13:34:03','B005HI4SX0',1),(341,'2012-05-11 13:34:03','2012-05-11 13:34:03','B005HI3X0Y',1),(594,'2012-05-18 13:41:34','2012-05-18 13:41:34','B003BWQ4M2',1),(343,'2012-05-11 13:35:10','2012-05-11 13:35:10','B0024W76O0',1),(344,'2012-05-11 13:35:10','2012-05-11 13:35:10','B0049MOIVM',1),(345,'2012-05-11 14:43:23','2012-05-11 14:43:23','B000NNXOEI',1),(346,'2012-05-11 14:43:23','2012-05-11 14:43:23','B002LHCQ16',1),(347,'2012-05-11 14:43:23','2012-05-11 14:43:23','B0072NBU7U',1),(564,'2012-05-18 13:38:00','2012-05-18 13:38:00','B00265CQ2M',1),(349,'2012-05-11 14:43:23','2012-05-11 14:43:23','B0052T8V0U',1),(350,'2012-05-11 14:52:41','2012-05-11 14:52:42','B0044AH7C6',1),(351,'2012-05-11 14:53:13','2012-05-11 14:53:13','B000TK0PEW',1),(352,'2012-05-11 14:53:13','2012-05-11 14:53:13','B004IR9U8Y',1),(353,'2012-05-11 14:53:13','2012-05-11 14:53:13','B002A2ANKS',1),(354,'2012-05-11 14:54:51','2012-05-11 14:54:51','B001RTS56O',1),(355,'2012-05-11 14:54:51','2012-05-11 14:54:51','B000CBR45G',1),(356,'2012-05-11 14:54:51','2012-05-11 14:54:51','B001C28HWS',1),(357,'2012-05-11 14:59:59','2012-05-11 14:59:59','B005FYCBR6',1),(371,'2012-05-15 15:57:49','2012-05-15 15:57:49','B004BIHQDG',1),(359,'2012-05-11 15:56:08','2012-05-11 15:56:08','B000FGEZ1E',1),(390,'2012-05-18 13:22:11','2012-05-18 13:22:11','B00126P1NW',1),(514,'2012-05-18 13:30:58','2012-05-18 13:30:58','B001AMC4NS',1),(392,'2012-05-18 13:22:12','2012-05-18 13:22:12','B004SHAR1S',1),(515,'2012-05-18 13:30:58','2012-05-18 13:30:58','B0017S0GTY',1),(395,'2012-05-18 13:22:12','2012-05-18 13:22:12','B000HI0WRG',1),(495,'2012-05-18 13:30:56','2012-05-18 13:30:56','B0016CAKVU',1),(398,'2012-05-18 13:22:13','2012-05-18 13:22:13','B004GMDKRI',1),(516,'2012-05-18 13:30:58','2012-05-18 13:30:58','B0017S2JRQ',1),(400,'2012-05-18 13:22:13','2012-05-18 13:22:13','B003L8GPSO',1),(517,'2012-05-18 13:30:58','2012-05-18 13:30:58','B0017S2JR6',1),(402,'2012-05-18 13:22:13','2012-05-18 13:22:13','B000JSGM6O',1),(403,'2012-05-18 13:22:14','2012-05-18 13:22:14','B0044OD6P4',1),(518,'2012-05-18 13:30:58','2012-05-18 13:30:58','B0017RYWK4',1),(417,'2012-05-18 13:27:21','2012-05-18 13:27:21','B0069FC404',1),(406,'2012-05-18 13:22:14','2012-05-18 13:22:14','B000EY15TW',1),(407,'2012-05-18 13:22:14','2012-05-18 13:22:14','B005VS9I22',1),(408,'2012-05-18 13:22:15','2012-05-18 13:22:15','B006YC5UCG',1),(409,'2012-05-18 13:22:15','2012-05-18 13:22:15','B001RU6DRQ',1),(524,'2012-05-18 13:34:24','2012-05-18 13:34:24','B001PFA4Q4',1),(411,'2012-05-18 13:22:15','2012-05-18 13:22:15','B006U4MDVO',1),(415,'2012-05-18 13:27:21','2012-05-18 13:27:21','B004E2RCUQ',1),(414,'2012-05-18 13:26:54','2012-05-18 13:26:54','B004T80NDI',1),(509,'2012-05-18 13:30:57','2012-05-18 13:30:57','B000N8OYF6',1),(508,'2012-05-18 13:30:57','2012-05-18 13:30:57','B001SH1GKC',1),(507,'2012-05-18 13:30:57','2012-05-18 13:30:57','B001R4RAKG',1),(433,'2012-05-18 13:27:22','2012-05-18 13:27:22','B001TQEZAK',1),(506,'2012-05-18 13:30:57','2012-05-18 13:30:57','1878383779',1),(505,'2012-05-18 13:30:56','2012-05-18 13:30:56','B000QD9PG6',1),(504,'2012-05-18 13:30:56','2012-05-18 13:30:56','B00658B2VW',1),(437,'2012-05-18 13:27:23','2012-05-18 13:27:23','B001OFMS3W',1),(503,'2012-05-18 13:30:56','2012-05-18 13:30:56','B000T1J498',1),(502,'2012-05-18 13:30:56','2012-05-18 13:30:56','B000PGSCYU',1),(501,'2012-05-18 13:30:56','2012-05-18 13:30:56','B000F8X94G',1),(500,'2012-05-18 13:30:56','2012-05-18 13:30:56','B001PF76KQ',1),(499,'2012-05-18 13:30:56','2012-05-18 13:30:56','B001TG6SV4',1),(498,'2012-05-18 13:30:56','2012-05-18 13:30:56','158356862X',1),(497,'2012-05-18 13:30:56','2012-05-18 13:30:56','B003ZVGSB6',1),(496,'2012-05-18 13:30:56','2012-05-18 13:30:56','B000JZ8A1M',1),(494,'2012-05-18 13:30:56','2012-05-18 13:30:56','B000F8XEAA',1),(447,'2012-05-18 13:27:25','2012-05-18 13:27:25','B004QNVJVQ',1),(493,'2012-05-18 13:30:55','2012-05-18 13:30:55','B001NZVVX6',1),(492,'2012-05-18 13:30:55','2012-05-18 13:30:55','B000XKO5TO',1),(491,'2012-05-18 13:30:55','2012-05-18 13:30:55','B000F8VC6I',1),(490,'2012-05-18 13:30:54','2012-05-18 13:30:54','B00417ILRM',1),(489,'2012-05-18 13:30:54','2012-05-18 13:30:54','B00069ATQ0',1),(521,'2012-05-18 13:34:23','2012-05-18 13:34:23','B002N6XKJM',1),(487,'2012-05-18 13:30:54','2012-05-18 13:30:54','B000NWGPA4',1),(486,'2012-05-18 13:30:54','2012-05-18 13:30:54','B000X295RO',1),(523,'2012-05-18 13:34:23','2012-05-18 13:34:23','B0079DISA0',1),(484,'2012-05-18 13:30:53','2012-05-18 13:30:53','B004ULQ2RA',1),(483,'2012-05-18 13:30:53','2012-05-18 13:30:53','B001PF36SW',1),(482,'2012-05-18 13:30:53','2012-05-18 13:30:53','B004NTZSG0',1),(481,'2012-05-18 13:30:53','2012-05-18 13:30:53','B000QD5IX0',1),(480,'2012-05-18 13:30:52','2012-05-18 13:30:53','B002JWR4BK',1),(637,'2012-05-18 13:45:38','2012-05-18 13:45:38','B0053YQLPQ',1),(478,'2012-05-18 13:30:52','2012-05-18 13:30:52','B001RV1NTS',1),(477,'2012-05-18 13:30:52','2012-05-18 13:30:52','B0033UWMLO',1),(476,'2012-05-18 13:30:52','2012-05-18 13:30:52','B006O0160S',1),(475,'2012-05-18 13:30:52','2012-05-18 13:30:52','B00481YMNI',1),(474,'2012-05-18 13:30:52','2012-05-18 13:30:52','B001RUVPF6',1),(473,'2012-05-18 13:30:52','2012-05-18 13:30:52','B000FA3RJ6',1),(472,'2012-05-18 13:30:52','2012-05-18 13:30:52','B000F8V86W',1),(471,'2012-05-18 13:30:52','2012-05-18 13:30:52','B0033UWMMI',1),(525,'2012-05-18 13:34:24','2012-05-18 13:34:24','B001ALPJFY',1),(526,'2012-05-18 13:34:24','2012-05-18 13:34:24','B003B9MAHI',1),(527,'2012-05-18 13:34:24','2012-05-18 13:34:24','B00000IS5U',1),(528,'2012-05-18 13:34:24','2012-05-18 13:34:24','B0079DI3CI',1),(529,'2012-05-18 13:34:24','2012-05-18 13:34:24','B003SBIPMS',1),(530,'2012-05-18 13:34:24','2012-05-18 13:34:24','B004P8IPVY',1),(531,'2012-05-18 13:34:24','2012-05-18 13:34:24','B0079DL8UM',1),(532,'2012-05-18 13:34:24','2012-05-18 13:34:24','B001A41FKO',1),(533,'2012-05-18 13:34:25','2012-05-18 13:34:25','B000KWIL6S',1),(534,'2012-05-18 13:34:25','2012-05-18 13:34:25','B000Z9HFQ8',1),(535,'2012-05-18 13:34:25','2012-05-18 13:34:25','B0079DK53S',1),(536,'2012-05-18 13:34:25','2012-05-18 13:34:25','B0079DJIW2',1),(537,'2012-05-18 13:34:26','2012-05-18 13:34:26','B004CHQ2ZO',1),(538,'2012-05-18 13:34:26','2012-05-18 13:34:26','B0079DKU06',1),(539,'2012-05-18 13:34:26','2012-05-18 13:34:26','B000KWKXC8',1),(540,'2012-05-18 13:34:26','2012-05-18 13:34:26','B0035EQDRW',1),(541,'2012-05-18 13:34:26','2012-05-18 13:34:26','B0079DLOII',1),(542,'2012-05-18 13:34:26','2012-05-18 13:34:26','B000239E1G',1),(543,'2012-05-18 13:34:26','2012-05-18 13:34:26','B001PF36SM',1),(544,'2012-05-18 13:34:27','2012-05-18 13:34:27','B001A47XUA',1),(545,'2012-05-18 13:34:27','2012-05-18 13:34:27','B0079DIPEE',1),(606,'2012-05-18 13:41:37','2012-05-18 13:41:37','B0049HTTWU',1),(547,'2012-05-18 13:34:27','2012-05-18 13:34:27','B002Z9K1NU',1),(548,'2012-05-18 13:34:27','2012-05-18 13:34:27','B0079DIBIO',1),(549,'2012-05-18 13:34:27','2012-05-18 13:34:27','B0079DHTSM',1),(550,'2012-05-18 13:34:27','2012-05-18 13:34:27','B0079DKI4Y',1),(551,'2012-05-18 13:34:28','2012-05-18 13:34:28','B000Z9C5P4',1),(552,'2012-05-18 13:34:28','2012-05-18 13:34:28','B0079DINGY',1),(561,'2012-05-18 13:37:59','2012-05-18 13:37:59','B007ZETAGY',1),(554,'2012-05-18 13:34:29','2012-05-18 13:34:29','B004K08RDS',1),(555,'2012-05-18 13:34:29','2012-05-18 13:34:29','B001A41E4G',1),(556,'2012-05-18 13:34:29','2012-05-18 13:34:29','B000QTQ1M6',1),(560,'2012-05-18 13:37:59','2012-05-18 13:37:59','B005QRPHFK',1),(558,'2012-05-18 13:34:30','2012-05-18 13:34:30','B0079DL082',1),(559,'2012-05-18 13:34:30','2012-05-18 13:34:30','B0079DH8BK',1),(565,'2012-05-18 13:38:01','2012-05-18 13:38:01','B004JYQ9Z8',1),(566,'2012-05-18 13:38:01','2012-05-18 13:38:01','B0016PDVI6',1),(567,'2012-05-18 13:38:01','2012-05-18 13:38:01','B00579ROC6',1),(605,'2012-05-18 13:41:37','2012-05-18 13:41:37','B002FKR2MM',1),(569,'2012-05-18 13:38:01','2012-05-18 13:38:01','B007BRZNN4',1),(969,'2012-05-18 14:11:47','2012-05-18 14:11:47','B001TG6SR8',1),(604,'2012-05-18 13:41:36','2012-05-18 13:41:36','B001JT6QA4',1),(572,'2012-05-18 13:38:02','2012-05-18 13:38:02','B000VDJUU2',1),(573,'2012-05-18 13:38:02','2012-05-18 13:38:02','B0016PAZ5S',1),(574,'2012-05-18 13:38:02','2012-05-18 13:38:02','B004JYOXA6',1),(967,'2012-05-18 14:11:47','2012-05-18 14:11:47','B00187Y528',1),(576,'2012-05-18 13:38:02','2012-05-18 13:38:02','B005GUS4AM',1),(577,'2012-05-18 13:38:03','2012-05-18 13:38:03','B00114LXK0',1),(603,'2012-05-18 13:41:36','2012-05-18 13:41:36','B00290LSQE',1),(602,'2012-05-18 13:41:36','2012-05-18 13:41:36','B000URHMT0',1),(601,'2012-05-18 13:41:36','2012-05-18 13:41:36','B001D7LHUQ',1),(600,'2012-05-18 13:41:35','2012-05-18 13:41:35','B000FA6M3Y',1),(599,'2012-05-18 13:41:35','2012-05-18 13:41:35','B001ND8M5I',1),(598,'2012-05-18 13:41:35','2012-05-18 13:41:35','B000GYWYU4',1),(597,'2012-05-18 13:41:35','2012-05-18 13:41:35','B000OKNM42',1),(596,'2012-05-18 13:41:34','2012-05-18 13:41:34','B005FSWADW',1),(595,'2012-05-18 13:41:34','2012-05-18 13:41:34','B003CMOFB8',1),(587,'2012-05-18 13:38:04','2012-05-18 13:38:04','B000MT444C',1),(588,'2012-05-18 13:38:05','2012-05-18 13:38:05','B004OZPL4C',1),(593,'2012-05-18 13:41:33','2012-05-18 13:41:33','B000NZRLWC',1),(592,'2012-05-18 13:41:33','2012-05-18 13:41:33','B000FS4LX4',1),(591,'2012-05-18 13:38:05','2012-05-18 13:38:05','B007NZ7KIU',1),(607,'2012-05-18 13:41:37','2012-05-18 13:41:37','B005U58W0K',1),(608,'2012-05-18 13:41:38','2012-05-18 13:41:38','B001TGAYU0',1),(609,'2012-05-18 13:41:38','2012-05-18 13:41:38','B005GVA12A',1),(610,'2012-05-18 13:41:38','2012-05-18 13:41:38','B005GUQBUM',1),(611,'2012-05-18 13:41:38','2012-05-18 13:41:38','B0013D8R9Y',1),(612,'2012-05-18 13:41:38','2012-05-18 13:41:38','B005FTWGR6',1),(613,'2012-05-18 13:41:38','2012-05-18 13:41:38','B000TSSIVQ',1),(618,'2012-05-18 13:43:26','2012-05-18 13:43:26','B0035EQDRM',1),(615,'2012-05-18 13:41:39','2012-05-18 13:41:39','B007V7UC6W',1),(616,'2012-05-18 13:41:39','2012-05-18 13:41:39','B001A38Q8Y',1),(617,'2012-05-18 13:41:39','2012-05-18 13:41:39','B001TM0SDW',1),(638,'2012-05-18 13:45:39','2012-05-18 13:45:39','B004S3HSNW',1),(620,'2012-05-18 13:43:26','2012-05-18 13:43:26','B0032YYHK0',1),(621,'2012-05-18 13:43:27','2012-05-18 13:43:27','B002958UZQ',1),(622,'2012-05-18 13:43:27','2012-05-18 13:43:27','B003NE4P6U',1),(623,'2012-05-18 13:43:28','2012-05-18 13:43:28','B003E24LII',1),(636,'2012-05-18 13:45:38','2012-05-18 13:45:38','B0035Y5J2W',1),(625,'2012-05-18 13:43:29','2012-05-18 13:43:29','B00290NBQ4',1),(626,'2012-05-18 13:43:29','2012-05-18 13:43:29','B003NE4P7E',1),(627,'2012-05-18 13:43:29','2012-05-18 13:43:29','B000CBSN0Q',1),(635,'2012-05-18 13:45:38','2012-05-18 13:45:38','B003IZYIL6',1),(634,'2012-05-18 13:45:37','2012-05-18 13:45:37','B003IZX3RG',1),(630,'2012-05-18 13:43:30','2012-05-18 13:43:30','B00004W4SN',1),(631,'2012-05-18 13:43:30','2012-05-18 13:43:30','B0013NYVSU',1),(632,'2012-05-18 13:43:31','2012-05-18 13:43:31','B003KE36H2',1),(633,'2012-05-18 13:43:31','2012-05-18 13:43:31','B0017I0D9M',1),(645,'2012-05-18 13:46:43','2012-05-18 13:46:43','B005HBMP0K',1),(640,'2012-05-18 13:45:40','2012-05-18 13:45:40','B003XK2ZR0',1),(641,'2012-05-18 13:45:40','2012-05-18 13:45:40','B005G6U9X6',1),(642,'2012-05-18 13:45:41','2012-05-18 13:45:41','B003OKUG4S',1),(643,'2012-05-18 13:45:42','2012-05-18 13:45:42','B003ZTMXTO',1),(644,'2012-05-18 13:45:42','2012-05-18 13:45:42','B001LY72SC',1),(646,'2012-05-18 13:46:53','2012-05-18 13:46:53','B0010NQ4SS',1),(647,'2012-05-18 13:46:54','2012-05-18 13:46:54','B001SS31SG',1),(648,'2012-05-18 13:46:54','2012-05-18 13:46:54','B000URFTEA',1),(649,'2012-05-18 13:46:54','2012-05-18 13:46:54','B000R13CDO',1),(650,'2012-05-18 13:46:55','2012-05-18 13:46:55','B004DJ1DIC',1),(651,'2012-05-18 13:46:55','2012-05-18 13:46:55','B004RBSWXA',1),(652,'2012-05-18 13:46:56','2012-05-18 13:46:56','B0017QA5QA',1),(653,'2012-05-18 13:46:56','2012-05-18 13:46:56','B0017H55A0',1),(681,'2012-05-18 13:49:25','2012-05-18 13:49:25','B0062OL192',1),(680,'2012-05-18 13:49:24','2012-05-18 13:49:24','B000PCRP2O',1),(656,'2012-05-18 13:47:47','2012-05-18 13:47:47','B00439I1AU',1),(657,'2012-05-18 13:47:48','2012-05-18 13:47:48','B00481CNES',1),(679,'2012-05-18 13:49:24','2012-05-18 13:49:24','B00301NCOW',1),(724,'2012-05-18 13:52:01','2012-05-18 13:52:01','B002RQEHVS',1),(660,'2012-05-18 13:47:49','2012-05-18 13:47:49','B002L303K6',1),(661,'2012-05-18 13:47:49','2012-05-18 13:47:49','B000U6FUVI',1),(662,'2012-05-18 13:47:49','2012-05-18 13:47:49','B00200JX2O',1),(663,'2012-05-18 13:47:49','2012-05-18 13:47:49','B0049BFH6I',1),(664,'2012-05-18 13:47:49','2012-05-18 13:47:49','B002P383KY',1),(665,'2012-05-18 13:47:50','2012-05-18 13:47:50','B0073XSON2',1),(666,'2012-05-18 13:47:50','2012-05-18 13:47:50','B0049UHM80',1),(667,'2012-05-18 13:47:50','2012-05-18 13:47:50','B0010F4PSC',1),(668,'2012-05-18 13:47:51','2012-05-18 13:47:51','B0006O7I2I',1),(669,'2012-05-18 13:47:51','2012-05-18 13:47:51','B0014A2ICS',1),(670,'2012-05-18 13:47:51','2012-05-18 13:47:51','B006WV2MBQ',1),(671,'2012-05-18 13:47:51','2012-05-18 13:47:51','B0042SUY2U',1),(672,'2012-05-18 13:47:51','2012-05-18 13:47:51','B002RSG31I',1),(673,'2012-05-18 13:47:51','2012-05-18 13:47:51','B007H1Y9M0',1),(674,'2012-05-18 13:47:51','2012-05-18 13:47:51','B00020QJJE',1),(675,'2012-05-18 13:47:51','2012-05-18 13:47:51','B0057M108M',1),(677,'2012-05-18 13:49:24','2012-05-18 13:49:24','B003BDKGPW',1),(682,'2012-05-18 13:49:25','2012-05-18 13:49:25','B000PCRQ5A',1),(683,'2012-05-18 13:49:25','2012-05-18 13:49:25','B001C4SWW6',1),(684,'2012-05-18 13:49:25','2012-05-18 13:49:25','B003U6H1Q2',1),(723,'2012-05-18 13:52:01','2012-05-18 13:52:01','B002RQEHTA',1),(722,'2012-05-18 13:52:01','2012-05-18 13:52:01','B002RQEI0I',1),(687,'2012-05-18 13:49:25','2012-05-18 13:49:25','B00024M5WA',1),(721,'2012-05-18 13:51:18','2012-05-18 13:51:18','B004YJXO8S',1),(689,'2012-05-18 13:49:26','2012-05-18 13:49:26','B0006IGSLG',1),(690,'2012-05-18 13:49:26','2012-05-18 13:49:26','B000VNQB40',1),(691,'2012-05-18 13:49:26','2012-05-18 13:49:26','B004HV6ZAM',1),(720,'2012-05-18 13:51:18','2012-05-18 13:51:18','B000K170L6',1),(693,'2012-05-18 13:49:27','2012-05-18 13:49:27','B00026G6I2',1),(719,'2012-05-18 13:51:18','2012-05-18 13:51:18','B003HX78Y8',1),(695,'2012-05-18 13:49:27','2012-05-18 13:49:27','B001C4IX5W',1),(696,'2012-05-18 13:49:27','2012-05-18 13:49:27','B007MRJJWY',1),(697,'2012-05-18 13:49:27','2012-05-18 13:49:27','B000PBP8LA',1),(698,'2012-05-18 13:49:27','2012-05-18 13:49:27','B0009Z3K26',1),(699,'2012-05-18 13:49:27','2012-05-18 13:49:27','B0032Z1S4M',1),(700,'2012-05-18 13:49:27','2012-05-18 13:49:27','B001COXLC2',1),(701,'2012-05-18 13:49:27','2012-05-18 13:49:27','B003DW98B4',1),(702,'2012-05-18 13:49:27','2012-05-18 13:49:27','B001KVAI3W',1),(703,'2012-05-18 13:49:27','2012-05-18 13:49:27','B000PE382S',1),(704,'2012-05-18 13:49:29','2012-05-18 13:49:29','B0032Z1PXG',1),(705,'2012-05-18 13:49:29','2012-05-18 13:49:29','B004C2V83U',1),(706,'2012-05-18 13:49:29','2012-05-18 13:49:29','B001GN72DS',1),(707,'2012-05-18 13:49:29','2012-05-18 13:49:29','B003DXFR9U',1),(708,'2012-05-18 13:49:29','2012-05-18 13:49:29','B000Z9A69G',1),(709,'2012-05-18 13:49:29','2012-05-18 13:49:29','B004PA0JP2',1),(710,'2012-05-18 13:49:29','2012-05-18 13:49:29','B000VZI5HY',1),(711,'2012-05-18 13:49:29','2012-05-18 13:49:29','B001CD47DU',1),(712,'2012-05-18 13:49:29','2012-05-18 13:49:29','B006Z2HVEU',1),(713,'2012-05-18 13:49:30','2012-05-18 13:49:30','B005JEJWFG',1),(714,'2012-05-18 13:49:30','2012-05-18 13:49:30','B000GGTBDA',1),(715,'2012-05-18 13:49:31','2012-05-18 13:49:31','B007MRADBK',1),(716,'2012-05-18 13:49:31','2012-05-18 13:49:31','B002C2WBJW',1),(717,'2012-05-18 13:49:31','2012-05-18 13:49:31','B0043ROF5C',1),(718,'2012-05-18 13:49:31','2012-05-18 13:49:31','B000Y8580K',1),(725,'2012-05-18 13:52:01','2012-05-18 13:52:01','B002RQ5EJW',1),(726,'2012-05-18 13:52:02','2012-05-18 13:52:02','B00331WYCK',1),(727,'2012-05-18 13:52:02','2012-05-18 13:52:02','B003IWXDGA',1),(728,'2012-05-18 13:52:02','2012-05-18 13:52:02','B003A781SS',1),(729,'2012-05-18 13:52:02','2012-05-18 13:52:02','B003A7I1Q0',1),(730,'2012-05-18 13:52:02','2012-05-18 13:52:02','B000VKRCDM',1),(731,'2012-05-18 13:53:26','2012-05-18 13:53:26','B0035EQDS6',1),(732,'2012-05-18 13:53:26','2012-05-18 13:53:26','B003HMZM8S',1),(733,'2012-05-18 13:53:26','2012-05-18 13:53:26','B004DJ1CU6',1),(734,'2012-05-18 13:53:26','2012-05-18 13:53:26','B0012OELR6',1),(735,'2012-05-18 13:53:26','2012-05-18 13:53:26','B003TJAEUA',1),(736,'2012-05-18 13:53:26','2012-05-18 13:53:26','B003BYIOEQ',1),(737,'2012-05-18 13:53:26','2012-05-18 13:53:26','B000IG8F1M',1),(738,'2012-05-18 13:53:26','2012-05-18 13:53:26','B0012OELRG',1),(739,'2012-05-18 13:53:26','2012-05-18 13:53:27','B000GA95WI',1),(740,'2012-05-18 13:53:27','2012-05-18 13:53:27','B0012OI6DG',1),(741,'2012-05-18 13:53:27','2012-05-18 13:53:27','B0035YCJGG',1),(742,'2012-05-18 13:53:27','2012-05-18 13:53:27','B002N739Q0',1),(743,'2012-05-18 13:53:27','2012-05-18 13:53:27','B002LSXK6U',1),(744,'2012-05-18 13:53:27','2012-05-18 13:53:27','B0035YCFQA',1),(745,'2012-05-18 13:53:27','2012-05-18 13:53:27','B000BPLDBE',1),(746,'2012-05-18 13:53:27','2012-05-18 13:53:27','B000F8VABU',1),(747,'2012-05-18 13:53:27','2012-05-18 13:53:27','B000GL1BVA',1),(748,'2012-05-18 13:53:27','2012-05-18 13:53:27','B000TR0R6Q',1),(749,'2012-05-18 13:53:28','2012-05-18 13:53:28','B004ATJSOG',1),(750,'2012-05-18 13:53:28','2012-05-18 13:53:28','B000TQVDI8',1),(751,'2012-05-18 13:53:29','2012-05-18 13:53:29','B0035YCIS0',1),(752,'2012-05-18 13:53:29','2012-05-18 13:53:29','B000EGAMQM',1),(753,'2012-05-18 13:53:29','2012-05-18 13:53:29','B004DJ51U8',1),(754,'2012-05-18 13:53:29','2012-05-18 13:53:29','B002IAP22G',1),(755,'2012-05-18 13:53:29','2012-05-18 13:53:29','B004YRETSO',1),(756,'2012-05-18 13:53:29','2012-05-18 13:53:29','B003BYM74Y',1),(757,'2012-05-18 13:53:30','2012-05-18 13:53:30','B0032ELRRQ',1),(758,'2012-05-18 13:53:30','2012-05-18 13:53:30','B0012WF7LW',1),(759,'2012-05-18 13:53:30','2012-05-18 13:53:30','B003G6ODMG',1),(760,'2012-05-18 13:53:30','2012-05-18 13:53:30','B001A47XHI',1),(761,'2012-05-18 13:53:30','2012-05-18 13:53:30','B000NPDYAK',1),(762,'2012-05-18 13:53:30','2012-05-18 13:53:30','B001L7MANG',1),(763,'2012-05-18 13:53:30','2012-05-18 13:53:30','B000URL2NC',1),(764,'2012-05-18 13:53:30','2012-05-18 13:53:30','B005GWFT44',1),(765,'2012-05-18 13:53:31','2012-05-18 13:53:31','B00004W1DG',1),(766,'2012-05-18 13:53:31','2012-05-18 13:53:31','B000W7961U',1),(781,'2012-05-18 13:55:53','2012-05-18 13:55:53','B000PFXX4U',1),(768,'2012-05-18 13:53:31','2012-05-18 13:53:31','B0035YCGGE',1),(769,'2012-05-18 13:53:31','2012-05-18 13:53:31','B0012OGF4S',1),(770,'2012-05-18 13:53:31','2012-05-18 13:53:31','B004TMVWP2',1),(771,'2012-05-18 13:53:31','2012-05-18 13:53:31','B000MWRLVW',1),(772,'2012-05-18 13:53:31','2012-05-18 13:53:31','B001TH79DY',1),(773,'2012-05-18 13:53:31','2012-05-18 13:53:31','B005GWGM9K',1),(774,'2012-05-18 13:53:32','2012-05-18 13:53:32','B003U6H1RQ',1),(775,'2012-05-18 13:53:32','2012-05-18 13:53:32','B000JRBKW6',1),(776,'2012-05-18 13:53:32','2012-05-18 13:53:32','B001UXRJ00',1),(777,'2012-05-18 13:53:32','2012-05-18 13:53:32','B0012OKBJ8',1),(778,'2012-05-18 13:53:32','2012-05-18 13:53:32','B0019BCNP4',1),(779,'2012-05-18 13:53:32','2012-05-18 13:53:32','B000QCBE2K',1),(780,'2012-05-18 13:53:32','2012-05-18 13:53:32','B00006699A',1),(782,'2012-05-18 13:55:53','2012-05-18 13:55:53','B000MNEFHE',1),(937,'2012-05-18 14:06:21','2012-05-18 14:06:21','B001JPCY8Q',1),(936,'2012-05-18 14:06:21','2012-05-18 14:06:21','B001EXMBMW',1),(974,'2012-05-18 14:11:48','2012-05-18 14:11:48','B00377CXB2',1),(934,'2012-05-18 14:06:21','2012-05-18 14:06:21','B0012OGF5C',1),(933,'2012-05-18 14:06:21','2012-05-18 14:06:21','B0009XS9OW',1),(932,'2012-05-18 14:06:21','2012-05-18 14:06:21','B000BVLBD8',1),(931,'2012-05-18 14:06:21','2012-05-18 14:06:21','B002V7YBNC',1),(930,'2012-05-18 14:06:20','2012-05-18 14:06:20','B00261QAVY',1),(929,'2012-05-18 14:06:20','2012-05-18 14:06:20','B00261RO50',1),(928,'2012-05-18 14:06:20','2012-05-18 14:06:20','B0049KOC74',1),(927,'2012-05-18 14:06:20','2012-05-18 14:06:20','B000931TNA',1),(926,'2012-05-18 14:06:19','2012-05-18 14:06:19','B003M8HEQK',1),(925,'2012-05-18 14:06:19','2012-05-18 14:06:19','B0009XS9P6',1),(924,'2012-05-18 14:06:19','2012-05-18 14:06:19','B0009XS9PG',1),(975,'2012-05-18 14:11:49','2012-05-18 14:11:49','B003DPWEXU',1),(921,'2012-05-18 14:06:19','2012-05-18 14:06:19','B002PLNSRY',1),(920,'2012-05-18 14:06:19','2012-05-18 14:06:19','B0033UWMKA',1),(918,'2012-05-18 14:05:29','2012-05-18 14:05:29','B000KMVK8E',1),(919,'2012-05-18 14:06:19','2012-05-18 14:06:19','B000ODAIOG',1),(915,'2012-05-18 14:04:18','2012-05-18 14:04:18','B0074B4VKI',1),(914,'2012-05-18 14:03:34','2012-05-18 14:03:34','B001A47UGC',1),(913,'2012-05-18 14:03:30','2012-05-18 14:03:30','B000S5PLVA',1),(912,'2012-05-18 14:03:30','2012-05-18 14:03:30','B002YQWQNW',1),(911,'2012-05-18 14:03:30','2012-05-18 14:03:30','B0000AR44V',1),(808,'2012-05-18 13:55:55','2012-05-18 13:55:55','B0069PM9DG',1),(910,'2012-05-18 14:02:40','2012-05-18 14:02:40','B005HON37G',1),(909,'2012-05-18 14:02:40','2012-05-18 14:02:40','B0042SSV1G',1),(908,'2012-05-18 14:02:40','2012-05-18 14:02:40','B0042SZ8P8',1),(812,'2012-05-18 13:55:56','2012-05-18 13:55:56','B0042SUMZO',1),(903,'2012-05-18 14:00:43','2012-05-18 14:00:43','B001DYMCTE',1),(902,'2012-05-18 14:00:43','2012-05-18 14:00:43','B001DYKD4K',1),(901,'2012-05-18 14:00:43','2012-05-18 14:00:43','B001DYKDQS',1),(904,'2012-05-18 14:02:40','2012-05-18 14:02:40','B000F8R7U8',1),(817,'2012-05-18 13:55:56','2012-05-18 13:55:56','B000SADP36',1),(899,'2012-05-18 14:00:43','2012-05-18 14:00:43','B001DYKDTK',1),(898,'2012-05-18 14:00:43','2012-05-18 14:00:43','B001DYMCHG',1),(897,'2012-05-18 14:00:43','2012-05-18 14:00:43','B001DYKDNG',1),(896,'2012-05-18 14:00:43','2012-05-18 14:00:43','B001DYQEAC',1),(895,'2012-05-18 14:00:42','2012-05-18 14:00:42','B0042ST46C',1),(894,'2012-05-18 14:00:42','2012-05-18 14:00:42','B001LODQQ4',1),(905,'2012-05-18 14:02:40','2012-05-18 14:02:40','B005LH6GM8',1),(892,'2012-05-18 14:00:42','2012-05-18 14:00:42','B000VUWRQ4',1),(891,'2012-05-18 14:00:42','2012-05-18 14:00:42','B003TJAEUU',1),(890,'2012-05-18 14:00:42','2012-05-18 14:00:42','B004OZGRRC',1),(889,'2012-05-18 14:00:42','2012-05-18 14:00:42','B001DYMCOE',1),(888,'2012-05-18 14:00:42','2012-05-18 14:00:42','B001DYO94A',1),(830,'2012-05-18 13:55:57','2012-05-18 13:55:57','B001YJRNAG',1),(887,'2012-05-18 14:00:42','2012-05-18 14:00:42','B001DYMBOK',1),(832,'2012-05-18 13:55:57','2012-05-18 13:55:57','B0042SUUOC',1),(833,'2012-05-18 13:55:57','2012-05-18 13:55:57','B001G51OUI',1),(886,'2012-05-18 14:00:41','2012-05-18 14:00:41','B001DYKCUA',1),(885,'2012-05-18 14:00:41','2012-05-18 14:00:41','B001DYQEG6',1),(906,'2012-05-18 14:02:40','2012-05-18 14:02:40','B005HKRYXO',1),(838,'2012-05-18 13:55:57','2012-05-18 13:55:57','B0042SR4PA',1),(882,'2012-05-18 14:00:40','2012-05-18 14:00:40','B0042SWKYK',1),(881,'2012-05-18 14:00:40','2012-05-18 14:00:40','B002HTYLUC',1),(841,'2012-05-18 13:55:58','2012-05-18 13:55:58','B000SDXOIY',1),(842,'2012-05-18 13:55:58','2012-05-18 13:55:58','B001DXJ1BC',1),(880,'2012-05-18 14:00:40','2012-05-18 14:00:40','B005HYQLIE',1),(879,'2012-05-18 14:00:40','2012-05-18 14:00:40','B002BZNHVG',1),(878,'2012-05-18 14:00:40','2012-05-18 14:00:40','B000VUWQ2O',1),(877,'2012-05-18 14:00:39','2012-05-18 14:00:39','B001CMW800',1),(876,'2012-05-18 14:00:39','2012-05-18 14:00:39','B000TVOKDI',1),(875,'2012-05-18 14:00:39','2012-05-18 14:00:39','B005HONCUO',1),(874,'2012-05-18 14:00:39','2012-05-18 14:00:39','B000OKKZLU',1),(873,'2012-05-18 14:00:39','2012-05-18 14:00:39','B000UDUQ7Y',1),(872,'2012-05-18 14:00:39','2012-05-18 14:00:39','B003UHRFQM',1),(871,'2012-05-18 14:00:39','2012-05-18 14:00:39','B005GUQGHA',1),(870,'2012-05-18 14:00:38','2012-05-18 14:00:38','0837480280',1),(869,'2012-05-18 14:00:38','2012-05-18 14:00:38','B001BO6R9W',1),(868,'2012-05-18 14:00:38','2012-05-18 14:00:38','B0014GHDYA',1),(867,'2012-05-18 14:00:38','2012-05-18 14:00:38','B0081GIP2U',1),(866,'2012-05-18 14:00:38','2012-05-18 14:00:38','B000FA3YRG',1),(865,'2012-05-18 14:00:37','2012-05-18 14:00:37','B003PD4MZS',1),(864,'2012-05-18 14:00:37','2012-05-18 14:00:37','B005GUQBK2',1),(907,'2012-05-18 14:02:40','2012-05-18 14:02:40','B0042SR2ZM',1),(862,'2012-05-18 14:00:37','2012-05-18 14:00:37','B000IXPZKY',1),(938,'2012-05-18 14:06:21','2012-05-18 14:06:21','B0014NL2V8',1),(939,'2012-05-18 14:06:22','2012-05-18 14:06:22','B001D6HOEK',1),(940,'2012-05-18 14:06:22','2012-05-18 14:06:22','B0014C2UG0',1),(992,'2012-05-18 14:14:35','2012-05-18 14:14:35','B000W3JBO6',1),(942,'2012-05-18 14:06:22','2012-05-18 14:06:22','B001D6LIGU',1),(1078,'2012-05-18 14:25:38','2012-05-18 14:25:38','B0033UWMKK',1),(971,'2012-05-18 14:11:48','2012-05-18 14:11:48','B004KO5PM0',1),(945,'2012-05-18 14:06:22','2012-05-18 14:06:22','B001K27IOI',1),(1044,'2012-05-18 14:17:58','2012-05-18 14:17:58','B000C1FORG',1),(947,'2012-05-18 14:06:22','2012-05-18 14:06:22','B0014NOW4C',1),(995,'2012-05-18 14:14:35','2012-05-18 14:14:35','B000F8X8ZQ',1),(949,'2012-05-18 14:06:23','2012-05-18 14:06:23','B0025UGXMC',1),(950,'2012-05-18 14:06:23','2012-05-18 14:06:23','B003P8QIFK',1),(951,'2012-05-18 14:06:23','2012-05-18 14:06:23','B0009XS9Q0',1),(952,'2012-05-18 14:06:24','2012-05-18 14:06:24','B0049VNI0K',1),(953,'2012-05-18 14:06:24','2012-05-18 14:06:24','B001D6NFK2',1),(954,'2012-05-18 14:06:24','2012-05-18 14:06:24','B004ET09CC',1),(955,'2012-05-18 14:06:24','2012-05-18 14:06:24','B001D6OWHC',1),(956,'2012-05-18 14:06:24','2012-05-18 14:06:24','B003V5PXIA',1),(957,'2012-05-18 14:06:25','2012-05-18 14:06:25','B0012OI6J0',1),(958,'2012-05-18 14:06:25','2012-05-18 14:06:25','B001D6HXLE',1),(959,'2012-05-18 14:06:25','2012-05-18 14:06:25','B003WSG97K',1),(960,'2012-05-18 14:06:25','2012-05-18 14:06:25','B0014NLCIQ',1),(961,'2012-05-18 14:06:25','2012-05-18 14:06:25','B0014NDXTW',1),(962,'2012-05-18 14:06:25','2012-05-18 14:06:25','B001JPDZ9S',1),(963,'2012-05-18 14:06:25','2012-05-18 14:06:25','B0014NI2NO',1),(964,'2012-05-18 14:06:25','2012-05-18 14:06:25','B0014NL03S',1),(965,'2012-05-18 14:06:25','2012-05-18 14:06:25','B0014NDYTQ',1),(966,'2012-05-18 14:06:25','2012-05-18 14:06:25','B001D6N4W6',1),(976,'2012-05-18 14:11:49','2012-05-18 14:11:49','B004N98MJU',1),(977,'2012-05-18 14:11:49','2012-05-18 14:11:49','B00159L2CK',1),(978,'2012-05-18 14:11:49','2012-05-18 14:11:49','B003VSDP1Y',1),(979,'2012-05-18 14:11:49','2012-05-18 14:11:49','B0006NGVA4',1),(991,'2012-05-18 14:14:35','2012-05-18 14:14:35','B0007LQGQ4',1),(981,'2012-05-18 14:11:49','2012-05-18 14:11:49','B00377B1YM',1),(982,'2012-05-18 14:11:50','2012-05-18 14:11:50','B004MTOQKU',1),(983,'2012-05-18 14:11:50','2012-05-18 14:11:50','B000FS69RA',1),(984,'2012-05-18 14:11:50','2012-05-18 14:11:50','B003VSBD86',1),(985,'2012-05-18 14:11:50','2012-05-18 14:11:50','B003VSF77Y',1),(986,'2012-05-18 14:11:51','2012-05-18 14:11:51','B0006HJSV4',1),(990,'2012-05-18 14:14:02','2012-05-18 14:14:02','B003A7ACWG',1),(989,'2012-05-18 14:14:02','2012-05-18 14:14:02','B003A7BNRY',1),(996,'2012-05-18 14:14:35','2012-05-18 14:14:35','B00290MZV6',1),(997,'2012-05-18 14:14:35','2012-05-18 14:14:35','B000NNQ3ZU',1),(1043,'2012-05-18 14:17:58','2012-05-18 14:17:58','B0035BS70Q',1),(1042,'2012-05-18 14:17:58','2012-05-18 14:17:58','B000YUYX5E',1),(1000,'2012-05-18 14:14:36','2012-05-18 14:14:36','B0006U7V0G',1),(1001,'2012-05-18 14:14:37','2012-05-18 14:14:37','B004K9CBUE',1),(1002,'2012-05-18 14:14:37','2012-05-18 14:14:37','B000TK0L8M',1),(1003,'2012-05-18 14:14:37','2012-05-18 14:14:37','B0042ST868',1),(1004,'2012-05-18 14:14:37','2012-05-18 14:14:37','B000MD6LJY',1),(1005,'2012-05-18 14:14:37','2012-05-18 14:14:37','B000GL1EFI',1),(1041,'2012-05-18 14:17:58','2012-05-18 14:17:58','B004WY3UXO',1),(1007,'2012-05-18 14:14:37','2012-05-18 14:14:37','B0017NVPGC',1),(1008,'2012-05-18 14:14:37','2012-05-18 14:14:37','B004ZAKOTS',1),(1040,'2012-05-18 14:17:57','2012-05-18 14:17:57','B00008WFWQ',1),(1039,'2012-05-18 14:17:57','2012-05-18 14:17:57','B000UU4KSS',1),(1038,'2012-05-18 14:17:57','2012-05-18 14:17:57','B00494HTBG',1),(1012,'2012-05-18 14:14:38','2012-05-18 14:14:38','B001G95S6K',1),(1013,'2012-05-18 14:14:38','2012-05-18 14:14:38','B0062TOMK2',1),(1014,'2012-05-18 14:14:38','2012-05-18 14:14:38','B00290H6RY',1),(1037,'2012-05-18 14:17:57','2012-05-18 14:17:57','B0029YL2Z2',1),(1079,'2012-05-18 14:25:38','2012-05-18 14:25:38','B002E842KA',1),(1017,'2012-05-18 14:14:39','2012-05-18 14:14:39','B004Z1P8M0',1),(1018,'2012-05-18 14:14:39','2012-05-18 14:14:39','B000F8TB0W',1),(1035,'2012-05-18 14:17:57','2012-05-18 14:17:57','B0062TP1D4',1),(1020,'2012-05-18 14:14:39','2012-05-18 14:14:39','B002JP7COG',1),(1080,'2012-05-18 14:25:38','2012-05-18 14:25:38','B00361VIO2',1),(1022,'2012-05-18 14:14:40','2012-05-18 14:14:40','B000VNXXUK',1),(1023,'2012-05-18 14:14:40','2012-05-18 14:14:40','B001C5N982',1),(1024,'2012-05-18 14:14:40','2012-05-18 14:14:40','B0031SGNY0',1),(1081,'2012-05-18 14:25:39','2012-05-18 14:25:39','B000EJZRV4',1),(1032,'2012-05-18 14:17:57','2012-05-18 14:17:57','B002QUPAMK',1),(1082,'2012-05-18 14:25:39','2012-05-18 14:25:39','B00123CO44',1),(1028,'2012-05-18 14:14:40','2012-05-18 14:14:40','B000ZJUT3O',1),(1029,'2012-05-18 14:14:40','2012-05-18 14:14:40','B002LFTNCI',1),(1030,'2012-05-18 14:14:40','2012-05-18 14:14:40','B0017R5MS0',1),(1046,'2012-05-18 14:17:59','2012-05-18 14:17:59','B000Y3HRQ8',1),(1047,'2012-05-18 14:17:59','2012-05-18 14:17:59','B0042ST4J4',1),(1077,'2012-05-18 14:25:38','2012-05-18 14:25:38','B00021UJZI',1),(1076,'2012-05-18 14:25:38','2012-05-18 14:25:38','B000RGPIZO',1),(1075,'2012-05-18 14:25:37','2012-05-18 14:25:37','B000VNKQGO',1),(1051,'2012-05-18 14:17:59','2012-05-18 14:17:59','B004Y5F9LM',1),(1052,'2012-05-18 14:17:59','2012-05-18 14:17:59','B002DRUK6W',1),(1053,'2012-05-18 14:18:00','2012-05-18 14:18:00','B004K4OCEC',1),(1074,'2012-05-18 14:25:37','2012-05-18 14:25:37','B000F5YYK2',1),(1073,'2012-05-18 14:25:37','2012-05-18 14:25:37','B000F6RWPU',1),(1072,'2012-05-18 14:25:37','2012-05-18 14:25:37','B000Z9FT0M',1),(1071,'2012-05-18 14:25:37','2012-05-18 14:25:37','B001AYSAC0',1),(1058,'2012-05-18 14:18:01','2012-05-18 14:18:01','B0026JSFU0',1),(1070,'2012-05-18 14:25:37','2012-05-18 14:25:37','B0038I6R2Q',1),(1069,'2012-05-18 14:25:37','2012-05-18 14:25:37','B000N5T8KA',1),(1068,'2012-05-18 14:25:37','2012-05-18 14:25:37','B003VD36LI',1),(1067,'2012-05-18 14:25:37','2012-05-18 14:25:37','B000UV5E4G',1),(1066,'2012-05-18 14:25:37','2012-05-18 14:25:37','B000IXPZKE',1),(1065,'2012-05-18 14:25:37','2012-05-18 14:25:37','B0028RIW4Y',1),(1083,'2012-05-18 14:25:39','2012-05-18 14:25:39','B00005K2SY',1),(1084,'2012-05-18 14:25:39','2012-05-18 14:25:39','B0042L29KW',1),(1085,'2012-05-18 14:25:39','2012-05-18 14:25:39','B000O94QV6',1),(1086,'2012-05-18 14:25:39','2012-05-18 14:25:39','B004C34D5O',1),(1087,'2012-05-18 14:25:39','2012-05-18 14:25:39','B0002AHQWS',1),(1088,'2012-05-18 14:25:39','2012-05-18 14:25:39','B0002HABZK',1),(1089,'2012-05-18 14:25:40','2012-05-18 14:25:40','B000GG65MA',1),(1090,'2012-05-18 14:25:40','2012-05-18 14:25:40','B003CXRMCG',1),(1091,'2012-05-18 14:25:40','2012-05-18 14:25:40','B000PGQI64',1),(1092,'2012-05-18 14:25:40','2012-05-18 14:25:40','B001TG5OGO',1),(1093,'2012-05-18 14:25:41','2012-05-18 14:25:41','B002QXA43W',1),(1094,'2012-05-18 14:25:41','2012-05-18 14:25:41','B000SSVKN0',1),(1095,'2012-05-18 14:25:41','2012-05-18 14:25:41','B005N2RWO2',1),(1096,'2012-05-18 14:25:41','2012-05-18 14:25:41','B0001VJQ0S',1),(1097,'2012-05-18 14:25:41','2012-05-18 14:25:41','B006LLCAXM',1),(1098,'2012-05-18 14:25:41','2012-05-18 14:25:41','B004080576',1),(1099,'2012-05-18 14:25:41','2012-05-18 14:25:41','B000KDWVLI',1),(1100,'2012-05-18 14:25:42','2012-05-18 14:25:42','B002UB8HYI',1),(1101,'2012-05-18 14:25:42','2012-05-18 14:25:42','B000HX1EK0',1),(1102,'2012-05-18 14:25:42','2012-05-18 14:25:42','B0043ANEEW',1),(1103,'2012-05-18 14:25:42','2012-05-18 14:25:42','B001237246',1),(1104,'2012-05-18 14:27:06','2012-05-18 14:27:06','B0006O8DQ8',1),(1105,'2012-05-18 14:27:07','2012-05-18 14:27:07','B000TFBO7Y',1),(1106,'2012-05-18 14:27:07','2012-05-18 14:27:07','B000G3G1OK',1),(1107,'2012-05-18 14:27:08','2012-05-18 14:27:08','B0002IXIIG',1),(1108,'2012-05-18 14:27:08','2012-05-18 14:27:08','B004IJL062',1),(1109,'2012-05-18 14:27:08','2012-05-18 14:27:08','B000QCY9DQ',1),(1110,'2012-05-18 14:27:08','2012-05-18 14:27:08','B000TF9QLU',1),(1111,'2012-05-18 14:27:09','2012-05-18 14:27:09','B006C70RQ2',1),(1112,'2012-05-18 14:27:09','2012-05-18 14:27:09','B004I5CH7M',1),(1113,'2012-05-18 14:27:09','2012-05-18 14:27:09','B000TZR8J2',1),(1114,'2012-05-18 14:27:09','2012-05-18 14:27:09','B000GKWG4M',1),(1115,'2012-05-18 14:27:09','2012-05-18 14:27:09','B00002JQ75',1),(1116,'2012-05-18 14:27:10','2012-05-18 14:27:10','B00007B8M6',1),(1117,'2012-05-18 14:27:10','2012-05-18 14:27:10','B002MR05HM',1),(1118,'2012-05-18 14:27:10','2012-05-18 14:27:10','B00450URUY',1),(1119,'2012-05-18 14:27:10','2012-05-18 14:27:10','B0064H6F8E',1),(1120,'2012-05-18 14:27:10','2012-05-18 14:27:10','B0016LVJ70',1),(1121,'2012-05-18 14:27:10','2012-05-18 14:27:10','B004K9I2SO',1),(1122,'2012-05-18 14:27:10','2012-05-18 14:27:10','B0016M16W2',1),(1123,'2012-05-18 14:27:59','2012-05-18 14:27:59','B0015KET5Q',1),(1124,'2012-05-18 14:27:59','2012-05-18 14:27:59','B0035EQDRC',1),(1125,'2012-05-18 14:27:59','2012-05-18 14:27:59','B000QD2VDU',1),(1126,'2012-05-18 14:27:59','2012-05-18 14:27:59','B0019N4OSG',1),(1127,'2012-05-18 14:27:59','2012-05-18 14:27:59','B004DJ511M',1),(1128,'2012-05-18 14:28:00','2012-05-18 14:28:00','B001BRB1OK',1),(1129,'2012-05-18 14:28:00','2012-05-18 14:28:00','B000OKJ5QG',1),(1150,'2012-05-18 14:28:57','2012-05-18 14:28:57','B002HWNLQO',1),(1131,'2012-05-18 14:28:00','2012-05-18 14:28:00','B001RTS56Y',1),(1132,'2012-05-18 14:28:01','2012-05-18 14:28:01','B004J4NO10',1),(1133,'2012-05-18 14:28:01','2012-05-18 14:28:01','B001RUXK2C',1),(1134,'2012-05-18 14:28:01','2012-05-18 14:28:01','B000NNO00K',1),(1135,'2012-05-18 14:28:01','2012-05-18 14:28:01','B001RURS8O',1),(1136,'2012-05-18 14:28:02','2012-05-18 14:28:02','B0050PECXG',1),(1137,'2012-05-18 14:28:02','2012-05-18 14:28:02','B001UXXVIY',1),(1138,'2012-05-18 14:28:03','2012-05-18 14:28:03','B002VC2RHO',1),(1139,'2012-05-18 14:28:03','2012-05-18 14:28:03','B004NH37H4',1),(1140,'2012-05-18 14:28:03','2012-05-18 14:28:03','B000NWD3IQ',1),(1141,'2012-05-18 14:28:03','2012-05-18 14:28:03','B00139HWEY',1),(1142,'2012-05-18 14:28:03','2012-05-18 14:28:03','B001SH1GMK',1),(1143,'2012-05-18 14:28:03','2012-05-18 14:28:03','B004DJ6602',1),(1144,'2012-05-18 14:28:04','2012-05-18 14:28:04','B0062TO00O',1),(1145,'2012-05-18 14:28:04','2012-05-18 14:28:04','B007FIBWLQ',1),(1146,'2012-05-18 14:28:05','2012-05-18 14:28:05','B000QE2HK6',1),(1147,'2012-05-18 14:28:06','2012-05-18 14:28:06','B001SRYI0M',1),(1148,'2012-05-18 14:28:06','2012-05-18 14:28:06','B000HZTQC6',1),(1149,'2012-05-18 14:28:06','2012-05-18 14:28:06','B000EG6F0Y',1),(1151,'2012-05-18 14:28:57','2012-05-18 14:28:57','B002HWTNNO',1),(1152,'2012-05-18 14:28:57','2012-05-18 14:28:57','B0032QBVXO',1),(1153,'2012-05-18 14:28:57','2012-05-18 14:28:57','B002HWP84W',1),(1154,'2012-05-18 14:28:57','2012-05-18 14:28:57','B002HWTNQQ',1),(1155,'2012-05-18 14:28:57','2012-05-18 14:28:57','B000JCNCEK',1),(1156,'2012-05-18 14:28:57','2012-05-18 14:28:57','B005GUQH10',1),(1157,'2012-05-18 14:28:57','2012-05-18 14:28:57','B001ALT6BC',1),(1158,'2012-05-18 14:28:57','2012-05-18 14:28:57','B002UZ35RI',1),(1159,'2012-05-18 14:28:57','2012-05-18 14:28:57','B0069YNL84',1),(1160,'2012-05-18 14:28:57','2012-05-18 14:28:57','B005Q0KLFI',1),(1161,'2012-05-18 14:28:58','2012-05-18 14:28:58','B005Q0M0KC',1),(1162,'2012-05-18 14:28:58','2012-05-18 14:28:58','B004UNFSYG',1),(1163,'2012-05-18 14:28:58','2012-05-18 14:28:58','B0021H0DZW',1),(1164,'2012-05-18 14:28:58','2012-05-18 14:28:58','B003HMESRY',1),(1165,'2012-05-18 14:28:58','2012-05-18 14:28:58','B00212JH2M',1),(1166,'2012-05-18 14:28:58','2012-05-18 14:28:58','B002USKBUE',1),(1167,'2012-05-18 14:28:58','2012-05-18 14:28:58','B0015GSGCC',1),(1168,'2012-05-18 14:28:58','2012-05-18 14:28:58','B0013KGAZ0',1),(1169,'2012-05-18 14:28:58','2012-05-18 14:28:58','B002UZ56ZW',1),(1170,'2012-05-18 14:28:59','2012-05-18 14:28:59','B004GY5P06',1),(1171,'2012-05-18 14:28:59','2012-05-18 14:28:59','B005N08P68',1),(1172,'2012-05-18 14:28:59','2012-05-18 14:28:59','B006FC9GDO',1),(1173,'2012-05-18 14:28:59','2012-05-18 14:28:59','B004UN9YLY',1),(1174,'2012-05-18 14:28:59','2012-05-18 14:28:59','B006ATLC5M',1),(1175,'2012-05-18 14:28:59','2012-05-18 14:28:59','B0042ST17Y',1),(1176,'2012-05-18 14:28:59','2012-05-18 14:28:59','B006K3F0TW',1),(1177,'2012-05-18 14:28:59','2012-05-18 14:28:59','B005N1OA8O',1),(1178,'2012-05-18 14:29:00','2012-05-18 14:29:00','B005N075WI',1),(1179,'2012-05-18 14:29:00','2012-05-18 14:29:00','B002WTRVAE',1),(1180,'2012-05-18 14:29:00','2012-05-18 14:29:00','B005O13QH4',1),(1181,'2012-05-18 14:29:00','2012-05-18 14:29:00','B005P0ET7A',1),(1182,'2012-05-18 14:29:00','2012-05-18 14:29:00','B005NJ1DBS',1),(1183,'2012-05-18 14:29:00','2012-05-18 14:29:00','B004UMS1NC',1),(1184,'2012-05-18 14:29:00','2012-05-18 14:29:00','B005O10VHM',1),(1185,'2012-05-18 14:29:00','2012-05-18 14:29:00','B005O15QIQ',1),(1186,'2012-05-18 14:29:01','2012-05-18 14:29:01','B005N08PE0',1),(1187,'2012-05-18 14:29:36','2012-05-18 14:29:36','B0016PBH9Q',1),(1188,'2012-05-18 14:29:36','2012-05-18 14:29:36','B000NDPQCQ',1),(1189,'2012-05-18 14:29:37','2012-05-18 14:29:37','B002RBEHKY',1),(1190,'2012-05-18 14:29:37','2012-05-18 14:29:37','B000AS206O',1),(1191,'2012-05-18 14:29:37','2012-05-18 14:29:37','B001ALPJG8',1),(1192,'2012-05-18 14:29:37','2012-05-18 14:29:37','B001D21SUK',1),(1193,'2012-05-18 14:29:37','2012-05-18 14:29:37','B00200JX42',1),(1194,'2012-05-18 14:29:37','2012-05-18 14:29:37','B000PRLS4U',1),(1195,'2012-05-18 14:29:38','2012-05-18 14:29:38','B000HIV072',1),(1196,'2012-05-18 14:29:38','2012-05-18 14:29:38','B001D6KHCQ',1),(1197,'2012-05-18 14:29:38','2012-05-18 14:29:38','B000MLL79U',1),(1198,'2012-05-18 14:29:38','2012-05-18 14:29:38','B002PK0WRY',1),(1199,'2012-05-18 14:29:39','2012-05-18 14:29:39','B003GDCIRQ',1),(1200,'2012-05-18 14:29:39','2012-05-18 14:29:39','B0082D9DZU',1),(1201,'2012-05-18 14:29:39','2012-05-18 14:29:39','B000GKU7BG',1),(1202,'2012-05-18 14:29:39','2012-05-18 14:29:39','B003VS77LS',1),(1203,'2012-05-18 14:29:39','2012-05-18 14:29:39','B000NDU1IA',1),(1204,'2012-05-18 14:29:39','2012-05-18 14:29:39','B003A4XEVU',1),(1205,'2012-05-18 14:29:39','2012-05-18 14:29:39','B00261TKHU',1),(1206,'2012-05-18 14:29:40','2012-05-18 14:29:40','B000MLGCM2',1),(1207,'2012-05-18 14:29:40','2012-05-18 14:29:40','B000RZYCJI',1),(1209,'2012-05-18 14:30:57','2012-05-18 14:30:57','B00004UDWU',1),(1210,'2012-05-18 14:30:57','2012-05-18 14:30:57','B003JTJ1Q8',1),(1242,'2012-05-18 14:33:16','2012-05-18 14:33:16','B003AHIDWC',1),(1212,'2012-05-18 14:30:58','2012-05-18 14:30:58','B0051SL4XS',1),(1213,'2012-05-18 14:30:58','2012-05-18 14:30:58','B004VV8790',1),(1214,'2012-05-18 14:30:58','2012-05-18 14:30:58','B004VM4VDK',1),(1215,'2012-05-18 14:30:59','2012-05-18 14:30:59','B002ZUD49M',1),(1241,'2012-05-18 14:33:16','2012-05-18 14:33:16','B003AHCXAU',1),(1240,'2012-05-18 14:33:10','2012-05-18 14:33:10','B001RZMVGS',1),(1218,'2012-05-18 14:31:00','2012-05-18 14:31:00','B004QNRYF6',1),(1219,'2012-05-18 14:31:00','2012-05-18 14:31:00','B000TS03T6',1),(1220,'2012-05-18 14:31:00','2012-05-18 14:31:00','B00243UDBW',1),(1221,'2012-05-18 14:31:00','2012-05-18 14:31:00','B004MZSXP8',1),(1222,'2012-05-18 14:31:01','2012-05-18 14:31:01','B004VV89VG',1),(1223,'2012-05-18 14:31:01','2012-05-18 14:31:01','B001OS6KC4',1),(1239,'2012-05-18 14:32:41','2012-05-18 14:32:41','B005ITYB80',1),(1238,'2012-05-18 14:32:41','2012-05-18 14:32:41','B00439I19G',1),(1226,'2012-05-18 14:31:02','2012-05-18 14:31:02','B004VV879U',1),(1227,'2012-05-18 14:31:02','2012-05-18 14:31:02','B000VANWAE',1),(1228,'2012-05-18 14:31:02','2012-05-18 14:31:02','B004VV8826',1),(1229,'2012-05-18 14:31:03','2012-05-18 14:31:03','B003UC29AO',1),(1230,'2012-05-18 14:31:03','2012-05-18 14:31:03','B004HGDUNC',1),(1231,'2012-05-18 14:31:03','2012-05-18 14:31:03','B004VV8ABA',1),(1232,'2012-05-18 14:31:03','2012-05-18 14:31:03','B004VV88VC',1),(1233,'2012-05-18 14:31:03','2012-05-18 14:31:03','B004VV89MA',1),(1234,'2012-05-18 14:31:03','2012-05-18 14:31:03','B004VV894S',1),(1235,'2012-05-18 14:31:03','2012-05-18 14:31:03','B000VJ0S1G',1),(1236,'2012-05-18 14:31:03','2012-05-18 14:31:03','B004VV86MI',1),(1237,'2012-05-18 14:31:03','2012-05-18 14:31:03','B004VV89W0',1),(1243,'2012-05-18 14:33:16','2012-05-18 14:33:16','B003AHK8JI',1),(1244,'2012-05-18 14:33:17','2012-05-18 14:33:17','B000VKTEM4',1);
/*!40000 ALTER TABLE `tagger_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagger_requirementtag`
--

DROP TABLE IF EXISTS `tagger_requirementtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagger_requirementtag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `canonical` tinyint(1) NOT NULL DEFAULT '0',
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=179 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagger_requirementtag`
--

LOCK TABLES `tagger_requirementtag` WRITE;
/*!40000 ALTER TABLE `tagger_requirementtag` DISABLE KEYS */;
INSERT INTO `tagger_requirementtag` VALUES (27,'Gases','gases',1,'YOURCHILD enjoys exploring or playing with helium balloons, air tunnels, the wind, campfires or other ethereal forces.'),(26,'Nuclear engineering','nuclear-engineering',1,''),(25,'Physical World/Natural World','physical-worldnatural-world',1,'YOURCHILD enjoys being outdoors & in nature-- for example, going on hikes, getting in streams & rivers, jumping in lakes, playing in the sand'),(24,'Visual & Spatial Ordering','visual-spatial-ordering',1,'YOURCHILD has a good sense of direction.'),(23,'Practical Problem-Solving','practical-problem-solving',1,'YOURCHILD is good at coming up with practical solutions to problems.'),(22,'Marine engineering & Naval architects','marine-engineering-naval-architects',1,''),(28,'Team management','team-management',1,'YOURCHILD can get the most out of each individual on the team. For example, if selecting a sports team HE/SHE can put the right person in the right position'),(29,'Programming:','programming',1,''),(30,'Interactive Media','interactive-media',1,''),(31,'Flood Control','flood-control',1,''),(32,'Multiple Media','multiple-media',1,'YOURCHILD enjoys picture books, TV/movies, or any screen with visual and multiple media'),(33,'Influenccing','influenccing',1,'YOURCHILD can persuade his playdate/ friend to do the activity HE/SHE wants'),(34,'Machine/Systems Engineers','machinesystems-engineers',1,'YOURCHILD enjoys exploring and tinkering with machines and gadgets. For example, HE/SHE seems fascinated by mechanical stuff like cars, planes or electronic stuff like computers, smartphones'),(35,' Health & Medicine','health-medicine',1,''),(36,'Sensory Integration & Motor Planning','sensory-integration-motor-planning',1,'YOURCHILD has fluid body movement & control and excels at sports'),(37,'Software/Programming/Data/Digital Media','softwareprogrammingdatadigital-media',1,''),(38,'Robots','robots',1,'YOURCHILD enjoys exploring, playing with, building a robot or remote control device, car, or plane?'),(39,'Fashion','fashion',1,''),(40,'Design, Media, Arts','design-media-arts',1,''),(41,'Chemical engineering','chemical-engineering',1,''),(42,'Services','services',1,''),(43,'Data Transmission','data-transmission',1,''),(44,'Medical Science','medical-science',1,''),(45,'Agricultural engineering','agricultural-engineering',1,''),(46,'Making Music','making-music',1,'YOURCHILD enjoys making music, playing the piano or other instrument'),(47,'Achievement Drive','achievement-drive',1,'YOURCHILD strives to improve or meet high standards for his performance'),(48,'Publishing ','publishing',1,''),(49,'Life & Bio Engineers','life-bio-engineers',1,''),(50,'Receptive','receptive',1,'YOURCHILD likes to think out loud.'),(51,'Television','television',1,''),(52,'Fine Motor','fine-motor',1,'YOURCHILD likes to work with HIS/HER hands and has great finger control like when threading a needle.'),(53,'VideoGames','videogames',1,''),(54,'Product Design','product-design',1,''),(55,'Spatial Awareness & Perception','spatial-awareness-perception',1,'YOURCHILD is alert to and can quickly identify all sorts of shapes and objects in books or in his surroundings'),(56,'Fitness','fitness',1,'YOURCHILD really enjoys physical exercise and figuring out what is best for HIS/HER body'),(57,'Physical Science','physical-science',1,'YOURCHILD enjoys physical science and physical science projects like building erupting volcanoes or chemistry experiments'),(58,'CAD-CAM','cad-cam',1,''),(59,'Human World','human-world',1,'YOURCHILD loves being with other people and exploring and playing in groups'),(60,'Astronomy','astronomy',1,''),(61,'Art','art',1,''),(62,'Railways/trains/subways/magnetic/hi speed','railwaystrainssubwaysmagnetichi-speed',1,''),(63,'Self Control','self-control',1,'YOURCHILD can keep HIS/HER emotions in check and not let them disrupt focus'),(64,'Entrepreneurship, Business, Management','entrepreneurship-business-management',1,''),(65,'Government & Public Admin','government-public-admin',1,''),(66,'Planning','planning',1,'YOURCHILD enjoys making a plan by figuring out the steps to complete a task or project. \n'),(67,'Short Term Memory','short-term-memory',1,'YOURCHILD is good at short-term memory. He can register new information like a phone number, use it to dial and then forget it.'),(68,'Intake Controls','intake-controls',1,'YOURCHILD  sometimes has difficulty managing the daily deluge of data. HE/SHE becomes bogged down and cannot easily transition to the next relevant topic or activity. (N)'),(69,'Thermodynaimcs','thermodynaimcs',1,''),(70,'Natural World Engineering','natural-world-engineering',1,'YOURCHILD likes to create things in the natural world. For example, making elaborate sand castles, mud designs, forts from sticks, etc.'),(71,'Law, Police, Fire, Public Safety, Military & Intelligence Services','law-police-fire-public-safety-military-intelligence-services',1,''),(72,'Materials engineering','materials-engineering',1,''),(73,'Education & Training','education-training',1,''),(74,'Web Applications','web-applications',1,''),(75,'Data Modeling','data-modeling',1,''),(76,'Mining and geological engineering','mining-and-geological-engineering',1,''),(77,'Sports & Entertainment','sports-entertainment',1,''),(78,'Understanding others','understanding-others',1,'YOURCHILD is interested in why people do the things they do.'),(79,'Transportion Systems','transportion-systems',1,''),(80,'Genetic engineering','genetic-engineering',1,''),(81,'Logical & Sequential Ordering','logical-sequential-ordering',1,'YOURCHILD is good at mathematical problems and using numbers.'),(82,'Active Working Memory','active-working-memory',1,'YOURCHILD has a good working memory. HE/SHE can keep a conversation going for a long time, holding on and coming back to important parts of the conversation and relating it to prior knowledge.'),(83,'Households Appliances','households-appliances',1,''),(84,'Data Processing','data-processing',1,''),(85,'Data Management','data-management',1,''),(86,'Developing Explanations & Solutions','developing-explanations-solutions',1,'YOURCHILD enjoys designing and creating things or coming up with interesting explanations for how things happened.'),(87,'Interactive Multimedia','interactive-multimedia',1,''),(88,'Advertising PR','advertising-pr',1,''),(89,'Solids/Materials','solidsmaterials',1,'YOURCHILD loves exploring, playing and building with blocks, legos, rocks, sand or any physical material\"'),(90,'Aerospace, Areonautics, & Astronautics engineering','aerospace-areonautics-astronautics-engineering',1,''),(91,'World of People','world-of-people',1,'YOURCHILD loves learning and talking about family, friends and all about people or things people do '),(92,'Geoscience & hydrological science','geoscience-hydrological-science',1,''),(93,'Experimenting','experimenting',1,'YOURCHILD enjoys testing ideas and analyzing what has worked out, what has not and why.'),(94,'Internal Standards','internal-standards',1,'YOURCHILD can apply his own internal standards for HIS/HER performance or behavior'),(95,'Mobile Applications','mobile-applications',1,''),(96,'Critical /Analytical Thinking','critical-analytical-thinking',1,'YOURCHILD enjoys carving ideas up into their basic elements and parts. HE/SHE can find a compelling way of organizing any topic or problem.'),(97,'Insects/Bugs','insectsbugs',1,'YOURCHILD enjoys catching butterflies/firefles, creating an ant farm, or collecting beetles?'),(98,'Biomedical engineering','biomedical-engineering',1,''),(99,'Sequential Memory','sequential-memory',1,'YOURCHILD can easily remember phone numbers or other numbers.'),(100,'Plants','plants',1,'YOURCHILD can recognize and name different types of trees, flowers and plants.'),(101,'Rockets/Spacecraft','rocketsspacecraft',1,''),(102,'Acoustics & Sound','acoustics-sound',1,''),(103,'Self Regualtion','self-regualtion',1,'YOURCHILD can stay on task and can follow through on his goal'),(104,'Social Reasoning','social-reasoning',1,'YOURCHILD enjoys social events like parties.'),(105,'Navigation/Cartography','navigationcartography',1,''),(106,'Metacognitive Reasoning','metacognitive-reasoning',1,'YOURCHILD has an amazing ability to think about HIS/HER thinking, sometimes called \"mindfulness\". HE/SHE seems amazingly wise and mature for his age.'),(107,'Self Direction','self-direction',1,'YOURCHILD needs to see something in it for HIM/HER before S/HE wants to learn something.'),(108,'Social Areas/Interests','social-areasinterests',1,'YOURCHILD  is a social butterfly. HE/SHE really enjoys time with family, friends and her local community groups'),(109,'Interaction Skills','interaction-skills',1,'YOURCHILD gravitates toward other people and enjoys interacting with them'),(110,'Reading Text','reading-text',1,'YOURCHILD loves reading books'),(111,'Predicitng/ Developing Hypothesis','predicitng-developing-hypothesis',1,'YOURCHILD enjoys making predictions about the outcome of actions or developing hypothesis about the possible solutions to a problem '),(112,'Biological Sciences','biological-sciences',1,'YOURCHILD enjoys studying the types of birds, mammals and you could see him enjoying dissecting frogs, bugs or other animals.'),(113,'Materials/Cool Stuff','materialscool-stuff',1,'YOURCHILD is particularly interested in natural objects-- for example, hunting for seashells and sea glass along the shore or finding different types of rocks on a hike.'),(114,'Chemistry','chemistry',1,''),(115,'Electronics & Computer engineering','electronics-computer-engineering',1,''),(116,'Mental Health','mental-health',1,'YOURCHILD seems fascinated by HIS/HER mind and mental abilities. For example, HE/SHE wants to actively challenge HIM/HERself and manage HIS/HER learning in lots of areas outside of school'),(117,'Listening Orally','listening-orally',1,'YOURCHILD learns well from listening to others.'),(118,'Physical Health','physical-health',1,'YOURCHILD seems fascinated by HIS/HER physical health. For example, HE/SHE wants to understand nutrition and what foods to eat and what kind of exercise to do'),(119,'Causation','causation',1,'YOURCHILD is good at figuring out what has caused a sequence of events to occur by relying upon a case base of similar situations'),(120,'Group/ Team Skills','group-team-skills',1,'YOURCHILD enjoys games involving other people.'),(121,'Self Awareness','self-awareness',1,'YOURCHILD is observant, often sees things that others miss.'),(122,'World of Things/Objects','world-of-thingsobjects',1,'YOURCHILD loves learning and talking about objects, gadgets and cool stuff '),(123,'Asking Questions','asking-questions',1,'YOURCHILD enjoys following his/her curiosity and asking questions about the world. For example, why are there seasons? What do bees do, Why did a structure collapse? How is electric power generated?'),(124,'Theatre','theatre',1,''),(125,'Zoology','zoology',1,'YOURCHILD likes zoos, petting farms, exploring and studying the animals'),(126,'Birds','birds',1,'YOURCHILD enjoys birds. HE/SHE can recognize and name different types of birds.'),(127,'Self Confidence','self-confidence',1,'YOURCHILD has a strong sense of HIS/HER self worth and capabilities'),(128,'Bridges','bridges',1,''),(129,'Diagnosis','diagnosis',1,'YOURCHILD  is good at making a diagnosis of a complex situation by identifying relevant factors and seeking causal explanations\n'),(130,'Self Concept','self-concept',1,'YOURCHILD knows HIM/HERself  and HIS/HER strengths and limits well.'),(131,'Writing','writing',1,'YOURCHILD enjoys writing things down'),(132,'Creating Multiple Media','creating-multiple-media',1,'YOURCHILD enjoys creating stuff on the computer whether drawings, graphics, images or complete interactive stories and games or even programming'),(133,'Personal/Emotional Reasoning','personalemotional-reasoning',1,'YOURCHILD enjoys working on HIS/HER own'),(134,'Learning to Learn','learning-to-learn',1,'YOURCHILD is good at learners to extend and master their own capacities for learning. HE/SHE is explicit and '),(135,'Music','music',1,''),(136,'Fish','fish',1,'YOURCHILD enjoys all sorts of fish. For example, HE/SHE can recognize and name different types of aquarium fish (clown fish), or sport fish (rainbow trout) or others.'),(137,'Networking:','networking',1,''),(138,'Environmental engineering','environmental-engineering',1,''),(139,'Higher Order Thinking','higher-order-thinking',1,'YOURCHILD is knows how to think things through. HE/SHE is both a creative and critical thinker who can solve problems'),(140,'Desktop Publishing','desktop-publishing',1,''),(141,'Nutrition','nutrition',1,'YOURCHILD really enjoys figuring out a healthy diet and the right balance of things to eat'),(142,'Computer Graphics','computer-graphics',1,''),(143,'Mechanical Engineering','mechanical-engineering',1,''),(144,'Geology','geology',1,''),(145,'Mammals','mammals',1,'YOURCHILD enjoys dogs, cats, hamsters and all sorts of pets and mammals'),(146,'Airplanes','airplanes',1,''),(147,'Personal Responsibility','personal-responsibility',1,'YOURCHILD takes responsibility for HIS/HER personal performance and is not prone to excuses and blaming others.'),(148,'Desktop Applications','desktop-applications',1,''),(149,'Atmospheric science','atmospheric-science',1,''),(150,'Friends/ Peers','friends-peers',1,'YOURCHILD really enjoys spending time with her friends. If allowed, HE/SHE might spend all her time on the phone, texting or being with them.'),(151,'Video & Animation','video-animation',1,''),(152,'Judgment','judgment',1,'YOURCHILD is good at using evidence to determine what is true or false, right or wrong.'),(153,'Physical Reasoning','physical-reasoning',1,'YOURCHILD  likes to think through problems while moving around like on a walk or run.'),(154,'Output Controls','output-controls',1,'YOURCHILD rarely loses it, blurting out or does things without thinking first'),(155,'Spiritual Health','spiritual-health',1,'YOURCHILD explores and enjoys spiritual practices such as meditation. '),(156,'Science','science',1,'YOURCHILD enjoys doing science or science projects'),(157,'Earth & Space','earth-space',1,'YOURCHILD enjoys anything to do with earth & space. For example, while hiking wants to understand rock formations and where rivers come from and go or using a telescope to watch the night sky, '),(158,'Dams & Reservoirs','dams-reservoirs',1,''),(159,'Creative/Generative Thinking','creativegenerative-thinking',1,'YOURCHILD can easily come up with novel and interesting ideas. HE/SHE can free-associate, free up HIS/HER mind to go off on original tangents.'),(160,'Investigating','investigating',1,'YOURCHILD is good at following step by step detailed instructions; or making a plan for a work project?'),(161,'Space/Universe','spaceuniverse',1,'YOURCHILD enjoys watching the night sky & stars, exploring at a Planetarium or playing with the planets, solar systems, galaxies, and the final frontier of space & universe '),(162,'Mental Energy Controls','mental-energy-controls',1,'YOURCHILD sometimes seems to just run out of gas when doing mental work. HE/SHE becomes real tired or bored and cannot finish HIS/HER work. (N)'),(163,'Marine Biology','marine-biology',1,'YOURCHILD enjoys aquariums, exploring different types of fish and sea creatures or more formal study of marine animals.'),(164,'Family','family',1,'YOURCHILD really likes to just stay at home and share family time with mom, dad, siblings'),(165,'Willpower/ Self Mastery','willpower-self-mastery',1,'YOURCHILD is good at saying No when HE/SHE needs to, and Yes when HE/SHE needs to say yes and has the ability to distinguish what really matters.'),(166,'Cooking & Food','cooking-food',1,''),(167,'Agriculture & Food Science','agriculture-food-science',1,'YOURCHILD enjoys planting seeds, gardening, preparing foods and exploring why somethings grow well or poorly.'),(168,'Initiative','initiative',1,'YOURCHILD demonstrates a readiness to act on opportunities'),(169,'Machines & Tools','machines-tools',1,''),(170,'Earth and Space Sciences','earth-and-space-sciences',1,''),(171,'Gross Motor','gross-motor',1,'YOURCHILD has a good sense of balance and likes to move around a lot.'),(172,'Thinking/Cognitive Reasoning','thinkingcognitive-reasoning',1,'YOURCHILD enjoys logic problems, puzzles and anything to do with thinking and problem solviing. '),(173,'Speaking','speaking',1,'YOURCHILD can use lots of different words to express HIM/HERself.'),(174,'Architecture, Construction, Building & Fixing','architecture-construction-building-fixing',1,''),(175,'Digital Media:','digital-media',1,''),(176,'Finance and Investing','finance-and-investing',1,''),(177,'Mindsight','mindsight',1,'YOURCHILD is good at managing his awareness of what\'s happening inside his mind-- his inside world of thoughts, emotions, intuitions.'),(178,'Oceanography','oceanography',1,'');
/*!40000 ALTER TABLE `tagger_requirementtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagger_requirementtaggeditem`
--

DROP TABLE IF EXISTS `tagger_requirementtaggeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagger_requirementtaggeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `user_id` int(11),
  PRIMARY KEY (`id`),
  KEY `tagger_requirementtaggeditem_829e37fd` (`object_id`),
  KEY `tagger_requirementtaggeditem_e4470c6e` (`content_type_id`),
  KEY `tagger_requirementtaggeditem_3747b463` (`tag_id`),
  KEY `tagger_requirementtaggeditem_fbfc09f1` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagger_requirementtaggeditem`
--

LOCK TABLES `tagger_requirementtaggeditem` WRITE;
/*!40000 ALTER TABLE `tagger_requirementtaggeditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagger_requirementtaggeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagger_supplier`
--

DROP TABLE IF EXISTS `tagger_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagger_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL DEFAULT '2012-05-09 12:20:19',
  `modified` datetime NOT NULL DEFAULT '2012-05-09 12:20:19',
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagger_supplier`
--

LOCK TABLES `tagger_supplier` WRITE;
/*!40000 ALTER TABLE `tagger_supplier` DISABLE KEYS */;
INSERT INTO `tagger_supplier` VALUES (1,'2012-04-01 15:02:18','2012-04-01 15:02:18','Amazon');
/*!40000 ALTER TABLE `tagger_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_tag`
--

DROP TABLE IF EXISTS `taggit_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggit_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_tag`
--

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;
INSERT INTO `taggit_tag` VALUES (1,'',''),(2,'BASIC','basic'),(3,'Science','science'),(4,'Biology','biology'),(5,'Robotics','robotics'),(6,'environment','environment'),(7,'solar power','solar-power'),(8,'battery','battery'),(9,'electronics','electronics'),(10,'learning','learning'),(11,'battery','battery_1'),(12,'electronics','electronics_1'),(13,'learning','learning_1');
/*!40000 ALTER TABLE `taggit_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_taggeditem`
--

DROP TABLE IF EXISTS `taggit_taggeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggit_taggeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taggit_taggeditem_3747b463` (`tag_id`),
  KEY `taggit_taggeditem_829e37fd` (`object_id`),
  KEY `taggit_taggeditem_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_taggeditem`
--

LOCK TABLES `taggit_taggeditem` WRITE;
/*!40000 ALTER TABLE `taggit_taggeditem` DISABLE KEYS */;
INSERT INTO `taggit_taggeditem` VALUES (1,1,35,45),(2,2,35,45),(3,2,27,45),(4,3,27,45),(5,4,27,45),(6,3,35,45),(7,5,35,45),(8,6,37,45),(9,7,37,45);
/*!40000 ALTER TABLE `taggit_taggeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastypie_apiaccess`
--

DROP TABLE IF EXISTS `tastypie_apiaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastypie_apiaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `request_method` varchar(10) NOT NULL DEFAULT '',
  `accessed` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastypie_apiaccess`
--

LOCK TABLES `tastypie_apiaccess` WRITE;
/*!40000 ALTER TABLE `tastypie_apiaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `tastypie_apiaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastypie_apikey`
--

DROP TABLE IF EXISTS `tastypie_apikey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastypie_apikey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(256) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '2012-05-09 12:20:19',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastypie_apikey`
--

LOCK TABLES `tastypie_apikey` WRITE;
/*!40000 ALTER TABLE `tastypie_apikey` DISABLE KEYS */;
/*!40000 ALTER TABLE `tastypie_apikey` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-09-05 11:24:01
