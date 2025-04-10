/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sky_survey_db
-- ------------------------------------------------------
-- Server version	11.7.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add question',7,'add_question'),
(26,'Can change question',7,'change_question'),
(27,'Can delete question',7,'delete_question'),
(28,'Can view question',7,'view_question'),
(29,'Can add option',8,'add_option'),
(30,'Can change option',8,'change_option'),
(31,'Can delete option',8,'delete_option'),
(32,'Can view option',8,'view_option'),
(33,'Can add response',9,'add_response'),
(34,'Can change response',9,'change_response'),
(35,'Can delete response',9,'delete_response'),
(36,'Can view response',9,'view_response'),
(37,'Can add certificate',10,'add_certificate'),
(38,'Can change certificate',10,'change_certificate'),
(39,'Can delete certificate',10,'delete_certificate'),
(40,'Can view certificate',10,'view_certificate'),
(41,'Can add response detail',11,'add_responsedetail'),
(42,'Can change response detail',11,'change_responsedetail'),
(43,'Can delete response detail',11,'delete_responsedetail'),
(44,'Can view response detail',11,'view_responsedetail');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES
(1,'pbkdf2_sha256$1000000$dT6JY1Pf4POlYr3adk1m7j$U4cGf8vgheqANEr+yooKhyL2rZ6zDaH77+fYiJQ2Uqc=','2025-04-05 08:17:01.835435',1,'oscarngombo','','','oscartinga@gmail.com',1,1,'2025-04-05 08:16:27.472582');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(1,'2025-04-05 08:26:42.777773','1','gender',1,'[{\"added\": {}}, {\"added\": {\"name\": \"option\", \"object\": \"Male\"}}, {\"added\": {\"name\": \"option\", \"object\": \"Female\"}}]',7,1),
(2,'2025-04-05 08:30:06.603138','2','full_name',1,'[{\"added\": {}}]',7,1),
(3,'2025-04-05 08:39:50.747684','1','Response 1',1,'[{\"added\": {}}]',9,1),
(4,'2025-04-05 08:39:58.947596','1','Response 1',3,'',9,1),
(5,'2025-04-05 08:40:04.694060','2','Response 2',1,'[{\"added\": {}}]',9,1),
(6,'2025-04-05 08:40:32.856372','1','ResponseDetail 1',1,'[{\"added\": {}}]',11,1),
(7,'2025-04-05 08:43:53.194239','2','ResponseDetail 2',1,'[{\"added\": {}}]',11,1),
(8,'2025-04-07 07:40:19.700763','3','programming_stack',1,'[{\"added\": {}}, {\"added\": {\"name\": \"option\", \"object\": \"REACT\"}}, {\"added\": {\"name\": \"option\", \"object\": \"ANGULAR\"}}, {\"added\": {\"name\": \"option\", \"object\": \"VUE\"}}]',7,1),
(9,'2025-04-07 07:41:12.605000','1','gender',2,'[{\"changed\": {\"fields\": [\"Type\", \"Multiple\"]}}, {\"added\": {\"name\": \"option\", \"object\": \"Other\"}}]',7,1),
(10,'2025-04-07 07:41:40.737159','2','full_name',2,'[]',7,1),
(11,'2025-04-07 07:43:05.566192','4','certificates',1,'[{\"added\": {}}]',7,1),
(12,'2025-04-07 08:43:26.229102','5','email',1,'[{\"added\": {}}]',7,1),
(13,'2025-04-09 14:40:22.011325','11','Response 11',3,'',9,1),
(14,'2025-04-09 14:40:22.011707','10','Response 10',3,'',9,1),
(15,'2025-04-09 14:40:22.011758','9','Response 9',3,'',9,1),
(16,'2025-04-09 14:40:22.011796','8','Response 8',3,'',9,1),
(17,'2025-04-09 14:40:22.011832','7','Response 7',3,'',9,1),
(18,'2025-04-09 14:40:22.011864','6','Response 6',3,'',9,1),
(19,'2025-04-09 14:40:22.011896','5','Response 5',3,'',9,1),
(20,'2025-04-09 14:40:22.011928','4','Response 4',3,'',9,1),
(21,'2025-04-09 14:40:22.011958','3','Response 3',3,'',9,1),
(22,'2025-04-09 14:40:22.011988','2','Response 2',3,'',9,1),
(23,'2025-04-09 14:41:00.981261','15','Response 15',3,'',9,1),
(24,'2025-04-09 14:41:00.981307','14','Response 14',3,'',9,1),
(25,'2025-04-09 14:41:00.981331','13','Response 13',3,'',9,1),
(26,'2025-04-09 14:41:00.981352','12','Response 12',3,'',9,1),
(27,'2025-04-09 14:41:39.996051','25','Response 25',3,'',9,1),
(28,'2025-04-09 14:41:39.996132','24','Response 24',3,'',9,1),
(29,'2025-04-09 14:41:39.996178','23','Response 23',3,'',9,1),
(30,'2025-04-09 14:41:39.996217','22','Response 22',3,'',9,1),
(31,'2025-04-09 14:41:39.996252','21','Response 21',3,'',9,1),
(32,'2025-04-09 14:41:39.996288','20','Response 20',3,'',9,1),
(33,'2025-04-09 14:41:39.996323','19','Response 19',3,'',9,1),
(34,'2025-04-09 14:41:39.996361','18','Response 18',3,'',9,1),
(35,'2025-04-09 14:41:39.996396','17','Response 17',3,'',9,1),
(36,'2025-04-09 14:42:59.138503','32','Response 32',3,'',9,1),
(37,'2025-04-09 14:42:59.138548','31','Response 31',3,'',9,1),
(38,'2025-04-09 14:42:59.138570','30','Response 30',3,'',9,1),
(39,'2025-04-09 14:42:59.138588','29','Response 29',3,'',9,1),
(40,'2025-04-09 14:44:30.021237','33','Response 33',3,'',9,1),
(41,'2025-04-09 14:45:57.009978','7','Flutter,Node JS, Python',1,'[{\"added\": {}}]',8,1),
(42,'2025-04-09 14:46:09.288126','7','Flutter',2,'[{\"changed\": {\"fields\": [\"Value\"]}}]',8,1),
(43,'2025-04-09 14:46:21.760777','8','Node JS',1,'[{\"added\": {}}]',8,1),
(44,'2025-04-09 14:46:30.336489','9','Python',1,'[{\"added\": {}}]',8,1),
(45,'2025-04-09 14:48:32.661870','10','JAVA',1,'[{\"added\": {}}]',8,1),
(46,'2025-04-09 14:48:45.263371','11','SQL',1,'[{\"added\": {}}]',8,1),
(47,'2025-04-09 14:48:57.169588','12','POSTGRES',1,'[{\"added\": {}}]',8,1),
(48,'2025-04-09 14:49:47.703748','13','Microsoft SQL Server',1,'[{\"added\": {}}]',8,1),
(49,'2025-04-09 14:50:09.616194','14','PHP',1,'[{\"added\": {}}]',8,1),
(50,'2025-04-09 14:50:27.719665','15','Rust',1,'[{\"added\": {}}]',8,1),
(51,'2025-04-09 14:50:44.495218','16','Go',1,'[{\"added\": {}}]',8,1),
(52,'2025-04-09 14:53:33.480047','40','Response 40',3,'',9,1),
(53,'2025-04-09 14:53:33.480121','39','Response 39',3,'',9,1),
(54,'2025-04-09 14:53:33.480169','38','Response 38',3,'',9,1),
(55,'2025-04-09 14:53:33.480214','36','Response 36',3,'',9,1),
(56,'2025-04-09 14:53:33.480255','35','Response 35',3,'',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session'),
(10,'survey','certificate'),
(8,'survey','option'),
(7,'survey','question'),
(9,'survey','response'),
(11,'survey','responsedetail');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2025-04-04 10:45:14.561373'),
(2,'auth','0001_initial','2025-04-04 10:45:21.273553'),
(3,'admin','0001_initial','2025-04-04 10:45:23.474808'),
(4,'admin','0002_logentry_remove_auto_add','2025-04-04 10:45:23.504866'),
(5,'admin','0003_logentry_add_action_flag_choices','2025-04-04 10:45:23.612906'),
(6,'contenttypes','0002_remove_content_type_name','2025-04-04 10:45:24.661960'),
(7,'auth','0002_alter_permission_name_max_length','2025-04-04 10:45:25.374530'),
(8,'auth','0003_alter_user_email_max_length','2025-04-04 10:45:25.984180'),
(9,'auth','0004_alter_user_username_opts','2025-04-04 10:45:26.023352'),
(10,'auth','0005_alter_user_last_login_null','2025-04-04 10:45:26.784242'),
(11,'auth','0006_require_contenttypes_0002','2025-04-04 10:45:26.886021'),
(12,'auth','0007_alter_validators_add_error_messages','2025-04-04 10:45:26.916664'),
(13,'auth','0008_alter_user_username_max_length','2025-04-04 10:45:27.451880'),
(14,'auth','0009_alter_user_last_name_max_length','2025-04-04 10:45:28.273231'),
(15,'auth','0010_alter_group_name_max_length','2025-04-04 10:45:28.585960'),
(16,'auth','0011_update_proxy_permissions','2025-04-04 10:45:28.626564'),
(17,'auth','0012_alter_user_first_name_max_length','2025-04-04 10:45:28.941129'),
(18,'sessions','0001_initial','2025-04-04 10:45:29.563011'),
(19,'survey','0001_initial','2025-04-05 07:56:22.316077');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('hai4evt793j9z8j3qt4dyfqg040c8mwb','.eJxVjDsOwjAQBe_iGlnO-pdQ0ucM0a53wQFkS3FSIe4OkVJA-2bmvdSE25qnrckyzazOqlOn340wPaTsgO9YblWnWtZlJr0r-qBNj5XleTncv4OMLX9rMeCMgwTYBw4uDmSN8XB1ggwhoJeePYERY4WIk4QYpeOBgrPWelDvD9EAN44:1u0yi5:h9Tl3GcH6cVFvD5Id7D_2rx7wHSqE5IQUD1jExPD4lE','2025-04-19 08:17:01.902349');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_certificate`
--

DROP TABLE IF EXISTS `survey_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_certificate` (
  `certificate_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `upload_date` datetime(6) NOT NULL,
  `respondent_id_id` int(11) NOT NULL,
  PRIMARY KEY (`certificate_id`),
  KEY `survey_certificate_respondent_id_id_fac4eb92_fk_survey_re` (`respondent_id_id`),
  CONSTRAINT `survey_certificate_respondent_id_id_fac4eb92_fk_survey_re` FOREIGN KEY (`respondent_id_id`) REFERENCES `survey_response` (`respondent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_certificate`
--

LOCK TABLES `survey_certificate` WRITE;
/*!40000 ALTER TABLE `survey_certificate` DISABLE KEYS */;
INSERT INTO `survey_certificate` VALUES
(2,'OSCART CV .pdf','C:\\Users\\OscarNgombo\\work\\interviews\\skyWorld\\simple-survey-api\\media\\OSCART CV .pdf','2025-04-08 11:07:16.330051',16),
(3,'1243615911669-11898701513-ticket.pdf','C:\\Users\\OscarNgombo\\work\\interviews\\skyWorld\\simple-survey-api\\media\\1243615911669-11898701513-ticket.pdf','2025-04-08 11:40:24.475616',26),
(4,'1243615911669-11898701513-ticket.pdf','C:\\Users\\OscarNgombo\\work\\interviews\\skyWorld\\simple-survey-api\\media\\1243615911669-11898701513-ticket.pdf','2025-04-08 11:41:41.276004',27),
(5,'FlutterCV.pdf','C:\\Users\\OscarNgombo\\work\\interviews\\skyWorld\\simple-survey-api\\media\\FlutterCV.pdf','2025-04-08 12:58:25.864706',28),
(8,'OSCART CV .pdf','C:\\Users\\OscarNgombo\\work\\interviews\\skyWorld\\simple-survey-api\\media\\OSCART CV .pdf','2025-04-09 12:30:45.074369',34),
(9,'FlutterCV.pdf','C:\\Users\\OscarNgombo\\work\\interviews\\skyWorld\\simple-survey-api\\media\\FlutterCV.pdf','2025-04-09 14:20:42.513267',41),
(10,'Statement_All_Transactions_20250201_20250216.pdf','C:\\Users\\OscarNgombo\\work\\interviews\\skyWorld\\simple-survey-api\\media\\Statement_All_Transactions_20250201_20250216.pdf','2025-04-09 14:26:36.008777',42),
(11,'1243615911669-11898701513-ticket.pdf','C:\\Users\\OscarNgombo\\work\\interviews\\skyWorld\\simple-survey-api\\media\\1243615911669-11898701513-ticket.pdf','2025-04-09 14:26:36.045038',42),
(12,'1243615911669-11898701513-ticket.pdf','C:\\Users\\OscarNgombo\\work\\interviews\\skyWorld\\simple-survey-api\\media\\1243615911669-11898701513-ticket.pdf','2025-04-09 14:52:16.717496',43),
(13,'Statement_All_Transactions_20250201_20250216.pdf','C:\\Users\\OscarNgombo\\work\\interviews\\skyWorld\\simple-survey-api\\media\\Statement_All_Transactions_20250201_20250216.pdf','2025-04-09 14:52:16.949831',43),
(14,'Statement_All_Transactions_20250201_20250216.pdf','C:\\Users\\OscarNgombo\\work\\interviews\\skyWorld\\simple-survey-api\\media\\Statement_All_Transactions_20250201_20250216.pdf','2025-04-09 15:05:34.666742',44),
(15,'1243615911669-11898701513-ticket.pdf','C:\\Users\\OscarNgombo\\work\\interviews\\skyWorld\\simple-survey-api\\media\\1243615911669-11898701513-ticket.pdf','2025-04-09 15:06:51.087163',45),
(16,'1243615911669-11898701513-ticket.pdf','C:\\Users\\OscarNgombo\\work\\interviews\\skyWorld\\simple-survey-api\\media\\1243615911669-11898701513-ticket.pdf','2025-04-09 16:04:22.415225',46);
/*!40000 ALTER TABLE `survey_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_option`
--

DROP TABLE IF EXISTS `survey_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `question_id_id` int(11) NOT NULL,
  PRIMARY KEY (`option_id`),
  KEY `survey_option_question_id_id_d17fe2ff_fk_survey_qu` (`question_id_id`),
  CONSTRAINT `survey_option_question_id_id_d17fe2ff_fk_survey_qu` FOREIGN KEY (`question_id_id`) REFERENCES `survey_question` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_option`
--

LOCK TABLES `survey_option` WRITE;
/*!40000 ALTER TABLE `survey_option` DISABLE KEYS */;
INSERT INTO `survey_option` VALUES
(1,'Male',1),
(2,'Female',1),
(3,'REACT',3),
(4,'ANGULAR',3),
(5,'VUE',3),
(6,'Other',1),
(7,'Flutter',3),
(8,'Node JS',3),
(9,'Python',3),
(10,'JAVA',3),
(11,'SQL',3),
(12,'POSTGRES',3),
(13,'Microsoft SQL Server',3),
(14,'PHP',3),
(15,'Rust',3),
(16,'Go',3);
/*!40000 ALTER TABLE `survey_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_question`
--

DROP TABLE IF EXISTS `survey_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `text` longtext NOT NULL,
  `type` varchar(50) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `description` longtext DEFAULT NULL,
  `multiple` tinyint(1) NOT NULL,
  `format` varchar(50) DEFAULT NULL,
  `max_file_size` int(11) DEFAULT NULL,
  `max_file_size_unit` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_question`
--

LOCK TABLES `survey_question` WRITE;
/*!40000 ALTER TABLE `survey_question` DISABLE KEYS */;
INSERT INTO `survey_question` VALUES
(1,'gender','What is your gender?','choice',1,'',0,NULL,NULL,NULL),
(2,'full_name','What is your full name?','short_text',1,'[Surname] [First Name] [Other Names]',0,NULL,NULL,NULL),
(3,'programming_stack','What programming stack are you familiar with?','choice',1,'You can select multiple',1,NULL,NULL,NULL),
(4,'certificates','Upload any of your certificates?','file',1,'You can upload multiple (.pdf)',1,'.pdf',1,'mb'),
(5,'email','What is your email?','short_text',1,'example@exxample.com',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `survey_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_response`
--

DROP TABLE IF EXISTS `survey_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_response` (
  `respondent_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_responded` datetime(6) NOT NULL,
  PRIMARY KEY (`respondent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_response`
--

LOCK TABLES `survey_response` WRITE;
/*!40000 ALTER TABLE `survey_response` DISABLE KEYS */;
INSERT INTO `survey_response` VALUES
(16,'2025-04-08 11:07:16.090448'),
(26,'2025-04-08 11:40:24.065719'),
(27,'2025-04-08 11:41:41.079544'),
(28,'2025-04-08 12:58:25.653752'),
(34,'2025-04-09 12:30:43.344502'),
(37,'2025-04-09 12:58:54.234639'),
(41,'2025-04-09 14:20:41.863142'),
(42,'2025-04-09 14:26:35.681546'),
(43,'2025-04-09 14:52:14.778844'),
(44,'2025-04-09 15:05:33.540845'),
(45,'2025-04-09 15:06:50.580234'),
(46,'2025-04-09 16:04:21.125435');
/*!40000 ALTER TABLE `survey_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_responsedetail`
--

DROP TABLE IF EXISTS `survey_responsedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_responsedetail` (
  `response_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` longtext NOT NULL,
  `question_id_id` int(11) NOT NULL,
  `response_id_id` int(11) NOT NULL,
  PRIMARY KEY (`response_detail_id`),
  KEY `survey_responsedetai_question_id_id_af5bac86_fk_survey_qu` (`question_id_id`),
  KEY `survey_responsedetai_response_id_id_8f21c2c1_fk_survey_re` (`response_id_id`),
  CONSTRAINT `survey_responsedetai_question_id_id_af5bac86_fk_survey_qu` FOREIGN KEY (`question_id_id`) REFERENCES `survey_question` (`question_id`),
  CONSTRAINT `survey_responsedetai_response_id_id_8f21c2c1_fk_survey_re` FOREIGN KEY (`response_id_id`) REFERENCES `survey_response` (`respondent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_responsedetail`
--

LOCK TABLES `survey_responsedetail` WRITE;
/*!40000 ALTER TABLE `survey_responsedetail` DISABLE KEYS */;
INSERT INTO `survey_responsedetail` VALUES
(23,'Male',1,16),
(24,'ose kalama ',2,16),
(25,'ANGULAR',3,16),
(26,'VUE',3,16),
(27,'ose@gmail.com',5,16),
(28,'Male',1,26),
(29,'oscar',2,26),
(30,'REACT',3,26),
(31,'ANGULAR',3,26),
(32,'VUE',3,26),
(33,'wapi@gmail.com',5,26),
(34,'Female',1,27),
(35,'lucy',2,27),
(36,'REACT',3,27),
(37,'ANGULAR',3,27),
(38,'VUE',3,27),
(39,'lucy@gmail.com',5,27),
(40,'Male',1,28),
(41,'Oscar',2,28),
(42,'REACT',3,28),
(43,'ANGULAR',3,28),
(44,'test@gmail.com',5,28),
(50,'Male',1,34),
(51,'Jackson Hayes Grier ',2,34),
(52,'REACT',3,34),
(53,'ANGULAR',3,34),
(54,'VUE',3,34),
(55,'weweee@gmial.com',5,34),
(64,'Jane Doe',2,37),
(65,'janedoe@gmail.com',5,37),
(66,'MALE',1,37),
(67,'REACT',3,37),
(68,'VUE',3,37),
(81,'Male',1,41),
(82,'Pius Magesho Ngombo ',2,41),
(83,'REACT',3,41),
(84,'ANGULAR',3,41),
(85,'cheki@gmail.com',5,41),
(86,'Male',1,42),
(87,'Dauglas Nganga',2,42),
(88,'VUE',3,42),
(89,'dauglas@gmail.com',5,42),
(90,'Female',1,43),
(91,'Lucy Ngugi Wanjiru',2,43),
(92,'PHP',3,43),
(93,'SQL',3,43),
(94,'Python',3,43),
(95,'Flutter',3,43),
(96,'ANGULAR',3,43),
(97,'LucyNgugi@gmail.com',5,43),
(98,'Female',1,44),
(99,'Karida Mercy Wamboi',2,44),
(100,'JAVA',3,44),
(101,'SQL',3,44),
(102,'Rust',3,44),
(103,'Wamboi@gmail.com',5,44),
(104,'Male',1,45),
(105,'Wamae Job Karisa',2,45),
(106,'REACT',3,45),
(107,'PHP',3,45),
(108,'Go',3,45),
(109,'job.karisa@gmail.com',5,45),
(110,'Male',1,46),
(111,'Eddy',2,46),
(112,'JAVA',3,46),
(113,'eddyokush@gmail.com',5,46);
/*!40000 ALTER TABLE `survey_responsedetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-04-10 17:04:57
