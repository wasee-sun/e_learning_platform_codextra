-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: codextr
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add instructor',8,'add_instructor'),(30,'Can change instructor',8,'change_instructor'),(31,'Can delete instructor',8,'delete_instructor'),(32,'Can view instructor',8,'view_instructor'),(33,'Can add student',9,'add_student'),(34,'Can change student',9,'change_student'),(35,'Can delete student',9,'delete_student'),(36,'Can view student',9,'view_student'),(37,'Can add category',10,'add_category'),(38,'Can change category',10,'change_category'),(39,'Can delete category',10,'delete_category'),(40,'Can view category',10,'view_category'),(41,'Can add course',11,'add_course'),(42,'Can change course',11,'change_course'),(43,'Can delete course',11,'delete_course'),(44,'Can view course',11,'view_course'),(45,'Can add course material',12,'add_coursematerial'),(46,'Can change course material',12,'change_coursematerial'),(47,'Can delete course material',12,'delete_coursematerial'),(48,'Can view course material',12,'view_coursematerial'),(49,'Can add cart',13,'add_cart'),(50,'Can change cart',13,'change_cart'),(51,'Can delete cart',13,'delete_cart'),(52,'Can view cart',13,'view_cart'),(53,'Can add digital_ wallet',14,'add_digital_wallet'),(54,'Can change digital_ wallet',14,'change_digital_wallet'),(55,'Can delete digital_ wallet',14,'delete_digital_wallet'),(56,'Can view digital_ wallet',14,'view_digital_wallet'),(57,'Can add transaction',15,'add_transaction'),(58,'Can change transaction',15,'change_transaction'),(59,'Can delete transaction',15,'delete_transaction'),(60,'Can view transaction',15,'view_transaction'),(61,'Can add enroll',16,'add_enroll'),(62,'Can change enroll',16,'change_enroll'),(63,'Can delete enroll',16,'delete_enroll'),(64,'Can view enroll',16,'view_enroll');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$1xtJmYdtPVAocP8SvTHXUW$12TMDmWbm7sH48leg3pHbJoO5wNwByJuevDi9U9ggB0=','2024-09-20 21:30:34.948125',1,'sun','','','sun@gmail.com',1,1,'2024-09-20 21:30:19.324511');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codextr_cart`
--

DROP TABLE IF EXISTS `codextr_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codextr_cart` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `s_user_name_id` varchar(150) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `codextr_cart_s_user_name_id_fa2967f8_fk_codextr_s` (`s_user_name_id`),
  CONSTRAINT `codextr_cart_s_user_name_id_fa2967f8_fk_codextr_s` FOREIGN KEY (`s_user_name_id`) REFERENCES `codextr_student` (`user_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codextr_cart`
--

LOCK TABLES `codextr_cart` WRITE;
/*!40000 ALTER TABLE `codextr_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `codextr_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codextr_category`
--

DROP TABLE IF EXISTS `codextr_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codextr_category` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(100) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codextr_category`
--

LOCK TABLES `codextr_category` WRITE;
/*!40000 ALTER TABLE `codextr_category` DISABLE KEYS */;
INSERT INTO `codextr_category` VALUES (1,'Data Science'),(2,'Cyber Security'),(3,'Generative AI'),(4,'Web Development'),(5,'DevOps'),(6,'Machine Learning');
/*!40000 ALTER TABLE `codextr_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codextr_course`
--

DROP TABLE IF EXISTS `codextr_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codextr_course` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL,
  `course_img` varchar(100) DEFAULT NULL,
  `difficulty` varchar(15) NOT NULL,
  `price` double NOT NULL,
  `description` varchar(500) NOT NULL,
  `slug` varchar(300) NOT NULL,
  `cat_id_id` int NOT NULL,
  `inst_user_name_id` varchar(150) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `codextr_course_cat_id_id_a3f4f772_fk_codextr_category_cat_id` (`cat_id_id`),
  KEY `codextr_course_inst_user_name_id_6fd3c22a_fk_codextr_i` (`inst_user_name_id`),
  KEY `codextr_course_slug_cc112455` (`slug`),
  CONSTRAINT `codextr_course_cat_id_id_a3f4f772_fk_codextr_category_cat_id` FOREIGN KEY (`cat_id_id`) REFERENCES `codextr_category` (`cat_id`),
  CONSTRAINT `codextr_course_inst_user_name_id_6fd3c22a_fk_codextr_i` FOREIGN KEY (`inst_user_name_id`) REFERENCES `codextr_instructor` (`user_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codextr_course`
--

LOCK TABLES `codextr_course` WRITE;
/*!40000 ALTER TABLE `codextr_course` DISABLE KEYS */;
INSERT INTO `codextr_course` VALUES (1,'Devops Fundamentals','course_images/DevOps_Fundamentals.png','beginner',12.99,'Step by step Practical course to Automate Continuous Integration/Delivery process with Ansible,Jenkins,GIT,Docker on AWS','devops-fundamentals',5,'ava'),(2,'DevOps MasterClass','course_images/DevOps_Masterclass.png','advanced',14.99,'DevOps with Jenkins Terraform GIT Docker Maven Kubernetes Ansible Automation Docker Swarm, DevOps Real world Exercises','devops-masterclass',5,'ava'),(3,'Cybersecurity for Everyone','course_images/Cs_Beginner.png','beginner',10.99,'This course teaches basic online safety, protecting personal data, and avoiding threats like phishing and malware. It\'s ideal for beginners seeking to improve digital security.','cybersecurity-for-everyone',2,'daniel'),(4,'Data Science and Big Data Analytics','course_images/data_beg.png','beginner',0,'Define and explain key concepts involved in data analytics including big data, big data analysis, and data ecosystems.','data-science-and-big-data-analytics',1,'david'),(5,'Machine Learning A-Z','course_images/ml_ad.png','advanced',17.99,'Learn to create Machine Learning Algorithms in Python and R from two Data Science experts. Code templates included.','machine-learning-a-z',6,'david'),(6,'Generative AI for Beginners','course_images/gen_beg.png','beginner',11.99,'Generative AI Made Easy: Start Your Generative AI Journey, Learn ChatGPT, LLM, Prompt engineering, Create GenAI Chatbot','generative-ai-for-beginners',3,'grace'),(7,'Complete Generative AI Course With Langchain and Huggingface','course_images/gen_ad.png','advanced',17.99,'Complete Guide to Building, Deploying, and Optimizing Generative AI with Langchain and Huggingface','complete-generative-ai-course-with-langchain-and-huggingface',3,'grace'),(8,'Fundamentals of Web Development','course_images/wd_int.png','intermediate',14.99,'Learn to build web applications using HTML, CSS, Bootstrap, Javascript, jQuery, Python 3, and Django!','fundamentals-of-web-development',4,'emily'),(9,'Full Stack Web Development','course_images/web_ad.png','advanced',17.99,'Cloud Computing | Web Apps | Linux | Web Servers | DBMS | LAMP Stack | HTML | CSS | JavaScript | PHP | + More','full-stack-web-development',4,'emily');
/*!40000 ALTER TABLE `codextr_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codextr_coursematerial`
--

DROP TABLE IF EXISTS `codextr_coursematerial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codextr_coursematerial` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `section_no` int NOT NULL,
  `section_name` varchar(100) NOT NULL,
  `m_type` varchar(5) NOT NULL,
  `m_title` varchar(100) NOT NULL,
  `file_loc` varchar(100) NOT NULL,
  `duration` double DEFAULT NULL,
  `slug` varchar(300) NOT NULL,
  `course_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_course_material` (`course_id_id`,`section_no`,`m_title`),
  KEY `codextr_coursematerial_slug_57238a26` (`slug`),
  CONSTRAINT `codextr_coursemateri_course_id_id_a6d87780_fk_codextr_c` FOREIGN KEY (`course_id_id`) REFERENCES `codextr_course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codextr_coursematerial`
--

LOCK TABLES `codextr_coursematerial` WRITE;
/*!40000 ALTER TABLE `codextr_coursematerial` DISABLE KEYS */;
INSERT INTO `codextr_coursematerial` VALUES (1,1,'Welcome to the course','video','Machine Learning Demo - Get Exited','videos/002_Machine_Learning_Demo_-_Get_Excited.mp4',4.45,'machine-learning-demo-get-exited',5),(2,1,'Welcome to the course','pdf','Get all the Datasets, Codes and Slides Here','pdfs/Get_all_the_Datasets_Codes_and_Slides_Here.pdf',NULL,'get-all-the-datasets-codes-and-slides-here',5),(3,2,'Data Preprocessing','video','The Machine Learning Process','videos/002_The_Machine_Learning_process.mp4',1.31,'the-machine-learning-process',5),(4,2,'Data Preprocessing','video','Splitting the data into a Training and Test set','videos/003_Splitting_the_data_into_a_Training_and_Test_set.mp4',2.02,'splitting-the-data-into-a-training-and-test-set',5),(5,2,'Data Preprocessing','video','Feature Scaling','videos/004_Feature_Scaling.mp4',6.27,'feature-scaling',5),(6,3,'Data Preprocessing in Python','video','Importing the Libraries','videos\\003_Importing_the_Libraries.mp4',3.34,'importing-the-libraries',5),(7,3,'Data Preprocessing in Python','video','Importing the Dataset - Step 1','videos/004_Importing_the_Dataset_-_Step_1.mp4',5.13,'importing-the-dataset-step-1',5),(8,3,'Data Preprocessing in Python','video','Importing the Dataset - Step 2','videos/005_Importing_the_Dataset_-_Step_2.mp4',4.42,'importing-the-dataset-step-2',5),(9,4,'Simple Linear Regression','video','Simple Linear Regression Intuition','videos/001_Simple_Linear_Regression_Intuition.mp4',2.22,'simple-linear-regression-intuition',5),(10,4,'Simple Linear Regression','video','Ordinary Least Squares','videos/002_Ordinary_Least_Squares.mp4',3.17,'ordinary-least-squares',5),(11,5,'Multiple Linear Regression','video','Multiple Linear Regression Intuition','videos\\002_Multiple_Linear_Regression_Intuition.mp4',2.26,'multiple-linear-regression-intuition',5),(12,5,'Multiple Linear Regression','video','Assumptions of Linear Regression','videos/003_Assumptions_of_Linear_Regression.mp4',4.46,'assumptions-of-linear-regression',5),(13,6,'Polynomial Regression','video','Polynomial Regression Intuition','videos/001_Polynomial_Regression_Intuition.mp4',5.09,'polynomial-regression-intuition',5),(14,6,'Polynomial Regression','video','Polynomial Regression in Python - Step 1','videos/002_Polynomial_Regression_in_Python_-_Step_1a.mp4',4.36,'polynomial-regression-in-python-step-1',5),(15,6,'Polynomial Regression','video','Polynomial Regression in Python - Step 2','videos/004_Polynomial_Regression_in_Python_-_Step_2a.mp4',5.55,'polynomial-regression-in-python-step-2',5),(16,7,'Support Vector Regression (SVR)','video','SVR Intuition','videos/001_SVR_Intuition_Updated.mp4',8.09,'svr-intuition',5),(17,7,'Support Vector Regression (SVR)','video','Heads-up on Non-Linear SVR','videos/002_Heads-up_on_non-linear_SVR.mp4',3.57,'heads-up-on-non-linear-svr',5),(18,1,'Introduction To DevOps','video','What is DevOps?','videos\\What_is_DevOps____Introduction_To_DevOps___Devops_For_Beginners___DevOps_Tutorial_RCixq8X.mp4',4.4,'what-is-devops',1),(19,2,'Git Installation On Windows','video','How To Install Git on Windows 10','videos/Git_Installation_On_Windows___How_To_Install_Git_on_Windows_10___Git_Installation_GmLnBZA.mp4',6.4,'how-to-install-git-on-windows-10',1),(20,3,'What Is Maven?','video','What Is Maven And How It Works?','videos\\What_Is_Maven____What_Is_Maven_And_How_It_Works____Maven_Tutorial_For_Beginners___j5y9G3a.mp4',6.15,'what-is-maven-and-how-it-works',1),(21,1,'Introduction','video','Introduction to the Masterclass','videos\\1__Introduction.mp4',6.46,'introduction-to-the-masterclass',2),(22,2,'Continuous Development','video','Continuous Development','videos/3__Continuous_Development.mp4',9.58,'continuous-development',2),(23,3,'Continuous Testing','video','Continuous Testing','videos\\4__Continuous_Testing.mp4',4.06,'continuous-testing',2),(24,1,'Introduction To Cybersecurity','video','What Is Cyber Security | How It Works?','videos\\What_Is_Cyber_Security___How_It_Works.mp4',7.06,'what-is-cyber-security-how-it-works',3),(25,2,'Firewalls and Network Security','video','What Is Firewall?','videos\\videoplayback.mp4',5.38,'what-is-firewall',3),(26,3,'Phishing Attack','video','What Is A Phishing Attack?','videos/What_Is_A_Phishing_Attack.mp4',6.47,'what-is-a-phishing-attack',3),(27,1,'Big Data and its Sources','video','Big Data and its Sources Explained','videos/videoplayback_1.mp4',6.16,'big-data-and-its-sources-explained',4),(28,2,'Big Data Applications','video','Big Data Applications Explained with Example','videos/videoplayback_2.mp4',10.27,'big-data-applications-explained-with-example',4),(29,3,'Data Collection and Primary Data','video','What is Data Collection and Primary Data Explained','videos\\videoplayback_3.mp4',7.04,'what-is-data-collection-and-primary-data-explained',4),(30,1,'Introduction to Generative AI','video','Introduction to Generative AI','videos/Introduction_to_a_New_playlist__Generative_AI.mp4',1.49,'introduction-to-generative-ai',6),(31,2,'Difference between AI and Generative AI','video','Difference between AI and Generative AI','videos/What_is_Generative_AI___Difference_between_AI_and_Generative_AI___AI_v_s_ML_v_s_D_GSiDHNp.mp4',5.5,'difference-between-ai-and-generative-ai',6),(32,3,'Syntactic structures | Multimodal AI','video','Bayesian Networks | RNNs with Milestones & Examples','videos\\Bayesian_networks___RNNs_with_milestones_examples.mp4',10.17,'bayesian-networks-rnns-with-milestones-examples',6),(33,1,'Introduction to LLM and Generative AI','video','Introduction to LLM and Generative AI','videos\\videoplayback_9Kr8xV5.mp4',11.09,'introduction-to-llm-and-generative-ai',7),(34,2,'LangChain','video','What is LangChain and Its application','videos\\videoplayback_1_z9VRNtT.mp4',11.47,'what-is-langchain-and-its-application',7),(35,3,'Hugging Face','video','What is Hugging Face?','videos\\Welcome_to_the_Hugging_Face_course.mp4',4.32,'what-is-hugging-face',7),(36,1,'Introduction to Web Development','video','Understanding the Web','videos\\Introduction_to_Web_Development____Understanding_the_Web____Part_2.mp4',4.19,'understanding-the-web',8),(37,2,'Basic HTML Elements','video','Basic HTML Elements','videos\\Introduction_to_HTML____Basic_HTML_Elements____Part_2.mp4',10.27,'basic-html-elements',8),(38,3,'Advanced HTML Elements','video','Advanced HTML Elements','videos/Introduction_to_HTML____Advanced_HTML_Elements____Part_3.mp4',13.01,'advanced-html-elements',8),(39,1,'Welcome to the course','video','Introduction to Web Development','videos/Introduction_to_Web_Development___Full_Stack_Web_Development_Tutorial.mp4',7.58,'introduction-to-web-development',9),(40,2,'What is an IDE?','video','Installing an IDE','videos/2._What_is_an_IDE____Installing_an_IDE___Full_Stack_Web_Development_Tutorial.mp4',5.37,'installing-an-ide',9),(41,3,'Building Your First Website','video','Learn HTML','videos\\3._Building_Your_First_Website___Learn_HTML___Full_stack_web_development_Tutorial_Course.mp4',12.47,'learn-html',9);
/*!40000 ALTER TABLE `codextr_coursematerial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codextr_digital_wallet`
--

DROP TABLE IF EXISTS `codextr_digital_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codextr_digital_wallet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `card_name` varchar(100) NOT NULL,
  `card_no` int NOT NULL,
  `exp_date` date NOT NULL,
  `cvc` int NOT NULL,
  `c_balance` double NOT NULL,
  `s_user_name_id` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codextr_digital_wall_s_user_name_id_f3c1b279_fk_codextr_s` (`s_user_name_id`),
  CONSTRAINT `codextr_digital_wall_s_user_name_id_f3c1b279_fk_codextr_s` FOREIGN KEY (`s_user_name_id`) REFERENCES `codextr_student` (`user_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codextr_digital_wallet`
--

LOCK TABLES `codextr_digital_wallet` WRITE;
/*!40000 ALTER TABLE `codextr_digital_wallet` DISABLE KEYS */;
INSERT INTO `codextr_digital_wallet` VALUES (1,'Emma Johnson',987654321,'2025-01-12',456,110,'emma'),(2,'John Smith',567343352,'2026-01-09',123,95,'john'),(3,'James Brown',112233445,'2027-01-06',789,75,'james'),(4,'Lily Davis',551235789,'2026-01-11',321,60,'lily'),(5,'Michael Wilson',875428724,'2025-01-07',654,105,'michael'),(6,'Sophia Miller',443322111,'2027-01-05',987,90,'sophia');
/*!40000 ALTER TABLE `codextr_digital_wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codextr_enroll`
--

DROP TABLE IF EXISTS `codextr_enroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codextr_enroll` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rating_no` int NOT NULL,
  `description` varchar(500) NOT NULL,
  `course_id_id` int NOT NULL,
  `order_id_id` int NOT NULL,
  `s_user_name_id` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codextr_enroll_course_id_id_3be9b32a_fk_codextr_course_course_id` (`course_id_id`),
  KEY `codextr_enroll_order_id_id_15382e18_fk_codextr_cart_order_id` (`order_id_id`),
  KEY `codextr_enroll_s_user_name_id_8555dad8_fk_codextr_s` (`s_user_name_id`),
  CONSTRAINT `codextr_enroll_course_id_id_3be9b32a_fk_codextr_course_course_id` FOREIGN KEY (`course_id_id`) REFERENCES `codextr_course` (`course_id`),
  CONSTRAINT `codextr_enroll_order_id_id_15382e18_fk_codextr_cart_order_id` FOREIGN KEY (`order_id_id`) REFERENCES `codextr_cart` (`order_id`),
  CONSTRAINT `codextr_enroll_s_user_name_id_8555dad8_fk_codextr_s` FOREIGN KEY (`s_user_name_id`) REFERENCES `codextr_student` (`user_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codextr_enroll`
--

LOCK TABLES `codextr_enroll` WRITE;
/*!40000 ALTER TABLE `codextr_enroll` DISABLE KEYS */;
/*!40000 ALTER TABLE `codextr_enroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codextr_instructor`
--

DROP TABLE IF EXISTS `codextr_instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codextr_instructor` (
  `user_ptr_id` varchar(150) NOT NULL,
  `bank_account` int NOT NULL,
  `routing_no` int NOT NULL,
  PRIMARY KEY (`user_ptr_id`),
  CONSTRAINT `codextr_instructor_user_ptr_id_5794b385_fk_codextr_user_username` FOREIGN KEY (`user_ptr_id`) REFERENCES `codextr_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codextr_instructor`
--

LOCK TABLES `codextr_instructor` WRITE;
/*!40000 ALTER TABLE `codextr_instructor` DISABLE KEYS */;
INSERT INTO `codextr_instructor` VALUES ('ava',566778899,61000104),('daniel',1122334455,11000138),('david',1234567890,21000021),('emily',198765432,31000503),('grace',987654321,22000046);
/*!40000 ALTER TABLE `codextr_instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codextr_student`
--

DROP TABLE IF EXISTS `codextr_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codextr_student` (
  `user_ptr_id` varchar(150) NOT NULL,
  `level` int NOT NULL,
  PRIMARY KEY (`user_ptr_id`),
  CONSTRAINT `codextr_student_user_ptr_id_70d66775_fk_codextr_user_username` FOREIGN KEY (`user_ptr_id`) REFERENCES `codextr_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codextr_student`
--

LOCK TABLES `codextr_student` WRITE;
/*!40000 ALTER TABLE `codextr_student` DISABLE KEYS */;
INSERT INTO `codextr_student` VALUES ('emma',1),('james',2),('john',0),('lily',0),('michael',1),('sophia',2);
/*!40000 ALTER TABLE `codextr_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codextr_transaction`
--

DROP TABLE IF EXISTS `codextr_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codextr_transaction` (
  `t_id` int NOT NULL AUTO_INCREMENT,
  `t_date` date NOT NULL,
  `course_id_id` int NOT NULL,
  `order_id_id` int NOT NULL,
  PRIMARY KEY (`t_id`),
  KEY `codextr_transaction_course_id_id_7f8791ef_fk_codextr_c` (`course_id_id`),
  KEY `codextr_transaction_order_id_id_1d8c8839_fk_codextr_c` (`order_id_id`),
  CONSTRAINT `codextr_transaction_course_id_id_7f8791ef_fk_codextr_c` FOREIGN KEY (`course_id_id`) REFERENCES `codextr_course` (`course_id`),
  CONSTRAINT `codextr_transaction_order_id_id_1d8c8839_fk_codextr_c` FOREIGN KEY (`order_id_id`) REFERENCES `codextr_cart` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codextr_transaction`
--

LOCK TABLES `codextr_transaction` WRITE;
/*!40000 ALTER TABLE `codextr_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `codextr_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codextr_user`
--

DROP TABLE IF EXISTS `codextr_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codextr_user` (
  `username` varchar(150) NOT NULL,
  `password` varchar(128) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codextr_user`
--

LOCK TABLES `codextr_user` WRITE;
/*!40000 ALTER TABLE `codextr_user` DISABLE KEYS */;
INSERT INTO `codextr_user` VALUES ('ava','djangoava','Ava','Harris','ava.harris@example.com'),('daniel','djangodaniel','Daniel','Thomas','daniel.thomas@example.com'),('david','djangodavid','David','Anderson','david.anderson@example.com'),('emily','djangoemily','Emily','Roberts','emily.roberts@example.com'),('emma','djangoemma','Emma','Johnson','emma.johnson@example.com'),('grace','djangograce','Grace','Taylor','grace.taylor@example.com'),('james','djangojames','James','Brown','james.brown@example.com'),('john','djangojohn','John','Smith','john.smith@example.com'),('lily','djangolily','Lily','Davis','lily.davis@example.com'),('michael','djangomichael','Michael','Wilson','michael.wilson@example.com'),('sophia','djangosophia','Sophia','Miller','sophia.miller@example.com');
/*!40000 ALTER TABLE `codextr_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-09-20 21:31:38.847077','emma','Emma Johnson',1,'[{\"added\": {}}]',9,1),(2,'2024-09-20 21:36:50.994188','james','James Brown',1,'[{\"added\": {}}]',9,1),(3,'2024-09-20 21:37:18.897361','john','John Smith',1,'[{\"added\": {}}]',9,1),(4,'2024-09-20 21:37:53.733793','lily','Lily Davis',1,'[{\"added\": {}}]',9,1),(5,'2024-09-20 21:38:16.996206','michael','Michael Wilson',1,'[{\"added\": {}}]',9,1),(6,'2024-09-20 21:38:41.568907','sophia','Sophia Miller',1,'[{\"added\": {}}]',9,1),(7,'2024-09-20 21:39:29.455900','ava','Ava Harris',1,'[{\"added\": {}}]',8,1),(8,'2024-09-20 21:40:10.923814','daniel','Daniel Thomas',1,'[{\"added\": {}}]',8,1),(9,'2024-09-20 21:40:49.959969','david','David Anderson',1,'[{\"added\": {}}]',8,1),(10,'2024-09-20 21:41:22.245764','emily','Emily Roberts',1,'[{\"added\": {}}]',8,1),(11,'2024-09-20 21:41:57.442773','grace','Grace Taylor',1,'[{\"added\": {}}]',8,1),(12,'2024-09-20 21:42:51.480538','1','Emma Johnson',1,'[{\"added\": {}}]',14,1),(13,'2024-09-20 21:42:56.523935','1','Emma Johnson',2,'[]',14,1),(14,'2024-09-20 21:44:15.490489','2','John Smith',1,'[{\"added\": {}}]',14,1),(15,'2024-09-20 21:44:43.254867','3','James Brown',1,'[{\"added\": {}}]',14,1),(16,'2024-09-20 21:44:49.759819','3','James Brown',2,'[]',14,1),(17,'2024-09-20 21:45:12.045815','4','Lily Davis',1,'[{\"added\": {}}]',14,1),(18,'2024-09-20 21:45:37.560674','5','Michael Wilson',1,'[{\"added\": {}}]',14,1),(19,'2024-09-20 21:46:00.728052','6','Sophia Miller',1,'[{\"added\": {}}]',14,1),(20,'2024-09-20 21:46:36.910513','1','Data Science',1,'[{\"added\": {}}]',10,1),(21,'2024-09-20 21:46:41.496168','2','Cyber Security',1,'[{\"added\": {}}]',10,1),(22,'2024-09-20 21:46:46.517947','3','Generative AI',1,'[{\"added\": {}}]',10,1),(23,'2024-09-20 21:46:50.542668','4','Web Development',1,'[{\"added\": {}}]',10,1),(24,'2024-09-20 21:46:56.160173','5','DevOps',1,'[{\"added\": {}}]',10,1),(25,'2024-09-20 21:46:58.890457','6','Machine Learning',1,'[{\"added\": {}}]',10,1),(26,'2024-09-20 21:49:04.984793','1','Devops Fundamentals',1,'[{\"added\": {}}]',11,1),(27,'2024-09-20 21:49:18.046377','1','Devops Fundamentals',2,'[]',11,1),(28,'2024-09-20 21:50:02.936066','2','DevOps MasterClass',1,'[{\"added\": {}}]',11,1),(29,'2024-09-20 21:50:37.027966','3','Cybersecurity for Everyone',1,'[{\"added\": {}}]',11,1),(30,'2024-09-20 21:52:08.603099','4','Data Science and Big Data Analytics',1,'[{\"added\": {}}]',11,1),(31,'2024-09-20 21:52:14.372788','3','Cybersecurity for Everyone',2,'[]',11,1),(32,'2024-09-20 21:53:07.500783','5','Machine Learning A-Z',1,'[{\"added\": {}}]',11,1),(33,'2024-09-20 21:53:21.695211','4','Data Science and Big Data Analytics',2,'[]',11,1),(34,'2024-09-20 21:54:00.732283','6','Generative AI for Beginners',1,'[{\"added\": {}}]',11,1),(35,'2024-09-20 21:54:39.068033','7','Complete Generative AI Course With Langchain and Huggingface',1,'[{\"added\": {}}]',11,1),(36,'2024-09-20 21:55:17.662546','8','Fundamentals of Web Development',1,'[{\"added\": {}}]',11,1),(37,'2024-09-20 21:55:57.137433','9','Full Stack Web Development',1,'[{\"added\": {}}]',11,1),(38,'2024-09-20 21:56:25.777101','9','Full Stack Web Development',2,'[{\"changed\": {\"fields\": [\"Course img\"]}}]',11,1),(39,'2024-09-20 21:56:34.646238','8','Fundamentals of Web Development',2,'[{\"changed\": {\"fields\": [\"Course img\"]}}]',11,1),(40,'2024-09-20 21:56:49.486364','7','Complete Generative AI Course With Langchain and Huggingface',2,'[{\"changed\": {\"fields\": [\"Course img\"]}}]',11,1),(41,'2024-09-20 21:57:01.994995','6','Generative AI for Beginners',2,'[{\"changed\": {\"fields\": [\"Course img\"]}}]',11,1),(42,'2024-09-20 21:57:12.573919','5','Machine Learning A-Z',2,'[{\"changed\": {\"fields\": [\"Course img\"]}}]',11,1),(43,'2024-09-20 21:57:27.412608','4','Data Science and Big Data Analytics',2,'[{\"changed\": {\"fields\": [\"Course img\"]}}]',11,1),(44,'2024-09-20 21:57:40.116078','3','Cybersecurity for Everyone',2,'[{\"changed\": {\"fields\": [\"Course img\"]}}]',11,1),(45,'2024-09-20 21:57:53.747214','2','DevOps MasterClass',2,'[]',11,1),(46,'2024-09-20 21:57:56.549364','1','Devops Fundamentals',2,'[]',11,1),(47,'2024-09-20 22:00:07.449778','1','Machine Learning Demo - Get Exited',1,'[{\"added\": {}}]',12,1),(48,'2024-09-20 22:02:48.533575','2','Get all the Datasets, Codes and Slides Here',1,'[{\"added\": {}}]',12,1),(49,'2024-09-20 22:04:41.809379','3','The Machine Learning Process',1,'[{\"added\": {}}]',12,1),(50,'2024-09-20 22:05:46.061530','4','Splitting the data into a Training and Test set',1,'[{\"added\": {}}]',12,1),(51,'2024-09-20 22:37:00.019704','5','Feature Scaling',1,'[{\"added\": {}}]',12,1),(52,'2024-09-20 22:38:14.507123','6','Importing the Libraries',1,'[{\"added\": {}}]',12,1),(53,'2024-09-20 22:39:07.624338','7','Importing the Dataset - Step 1',1,'[{\"added\": {}}]',12,1),(54,'2024-09-20 22:39:10.749038','6','Importing the Libraries',2,'[]',12,1),(55,'2024-09-20 22:40:18.213064','8','Importing the Dataset - Step 2',1,'[{\"added\": {}}]',12,1),(56,'2024-09-20 22:40:52.534762','9','Simple Linear Regression Intuition',1,'[{\"added\": {}}]',12,1),(57,'2024-09-20 22:42:04.349956','10','Ordinary Least Squares',1,'[{\"added\": {}}]',12,1),(58,'2024-09-20 22:42:37.562572','11','Multiple Linear Regression Intuition',1,'[{\"added\": {}}]',12,1),(59,'2024-09-20 22:43:16.484689','12','Assumptions of Linear Regression',1,'[{\"added\": {}}]',12,1),(60,'2024-09-20 22:43:51.481474','13','Polynomial Regression Intuition',1,'[{\"added\": {}}]',12,1),(61,'2024-09-20 22:44:30.763336','14','Polynomial Regression in Python - Step 1',1,'[{\"added\": {}}]',12,1),(62,'2024-09-20 22:45:02.777390','15','Polynomial Regression in Python - Step 2',1,'[{\"added\": {}}]',12,1),(63,'2024-09-20 22:45:43.989627','16','SVR Intuition',1,'[{\"added\": {}}]',12,1),(64,'2024-09-20 22:46:16.685454','17','Heads-up on Non-Linear SVR',1,'[{\"added\": {}}]',12,1),(65,'2024-09-20 22:47:42.466092','18','What is DevOps?',1,'[{\"added\": {}}]',12,1),(66,'2024-09-20 22:48:13.802599','19','How To Install Git on Windows 10',1,'[{\"added\": {}}]',12,1),(67,'2024-09-20 22:48:17.099284','18','What is DevOps?',2,'[]',12,1),(68,'2024-09-20 22:48:54.413549','20','What Is Maven And How It Works?',1,'[{\"added\": {}}]',12,1),(69,'2024-09-20 22:49:44.300245','21','Introduction to the Masterclass',1,'[{\"added\": {}}]',12,1),(70,'2024-09-20 22:50:22.864051','22','Continuous Development',1,'[{\"added\": {}}]',12,1),(71,'2024-09-20 22:50:51.222696','23','Continuous Testing',1,'[{\"added\": {}}]',12,1),(72,'2024-09-20 22:51:34.859168','24','What Is Cyber Security | How It Works?',1,'[{\"added\": {}}]',12,1),(73,'2024-09-20 22:52:09.724447','25','What Is Firewall?',1,'[{\"added\": {}}]',12,1),(74,'2024-09-20 22:52:43.101858','26','What Is A Phishing Attack?',1,'[{\"added\": {}}]',12,1),(75,'2024-09-20 22:52:47.574971','25','What Is Firewall?',2,'[{\"changed\": {\"fields\": [\"M type\"]}}]',12,1),(76,'2024-09-20 22:52:51.476072','24','What Is Cyber Security | How It Works?',2,'[{\"changed\": {\"fields\": [\"M type\"]}}]',12,1),(77,'2024-09-20 22:52:54.153583','23','Continuous Testing',2,'[]',12,1),(78,'2024-09-20 22:52:56.464343','21','Introduction to the Masterclass',2,'[]',12,1),(79,'2024-09-20 22:52:58.675190','20','What Is Maven And How It Works?',2,'[]',12,1),(80,'2024-09-20 22:53:31.765043','11','Multiple Linear Regression Intuition',2,'[{\"changed\": {\"fields\": [\"M type\"]}}]',12,1),(81,'2024-09-20 23:01:41.126614','27','Big Data and its Sources Explained',1,'[{\"added\": {}}]',12,1),(82,'2024-09-20 23:02:14.858290','28','Big Data Applications Explained with Example',1,'[{\"added\": {}}]',12,1),(83,'2024-09-20 23:02:53.327663','29','What is Data Collection and Primary Data Explained',1,'[{\"added\": {}}]',12,1),(84,'2024-09-20 23:03:19.638471','29','What is Data Collection and Primary Data Explained',2,'[{\"changed\": {\"fields\": [\"Course id\"]}}]',12,1),(85,'2024-09-20 23:04:41.336338','30','Introduction to Generative AI',1,'[{\"added\": {}}]',12,1),(86,'2024-09-20 23:05:18.992859','31','Difference between AI and Generative AI',1,'[{\"added\": {}}]',12,1),(87,'2024-09-20 23:05:49.186430','32','Bayesian Networks | RNNs with Milestones & Examples',1,'[{\"added\": {}}]',12,1),(88,'2024-09-20 23:06:44.175426','33','Introduction to LLM and Generative AI',1,'[{\"added\": {}}]',12,1),(89,'2024-09-20 23:07:27.354221','34','What is LangChain and Its application',1,'[{\"added\": {}}]',12,1),(90,'2024-09-20 23:07:30.619135','33','Introduction to LLM and Generative AI',2,'[]',12,1),(91,'2024-09-20 23:07:34.545139','32','Bayesian Networks | RNNs with Milestones & Examples',2,'[]',12,1),(92,'2024-09-20 23:07:38.064702','34','What is LangChain and Its application',2,'[{\"changed\": {\"fields\": [\"M type\"]}}]',12,1),(93,'2024-09-20 23:08:27.046778','35','What is Hugging Face?',1,'[{\"added\": {}}]',12,1),(94,'2024-09-20 23:10:49.765580','36','Understanding the Web',1,'[{\"added\": {}}]',12,1),(95,'2024-09-20 23:11:20.733469','37','Basic HTML Elements',1,'[{\"added\": {}}]',12,1),(96,'2024-09-20 23:11:45.564172','38','Advanced HTML Elements',1,'[{\"added\": {}}]',12,1),(97,'2024-09-20 23:11:54.789325','37','Basic HTML Elements',2,'[]',12,1),(98,'2024-09-20 23:11:57.315941','36','Understanding the Web',2,'[]',12,1),(99,'2024-09-20 23:11:59.348726','35','What is Hugging Face?',2,'[]',12,1),(100,'2024-09-20 23:13:03.878642','39','Introduction to Web Development',1,'[{\"added\": {}}]',12,1),(101,'2024-09-20 23:13:36.609554','40','Installing an IDE',1,'[{\"added\": {}}]',12,1),(102,'2024-09-20 23:14:05.124762','41','Learn HTML',1,'[{\"added\": {}}]',12,1),(103,'2024-09-20 23:15:20.008483','6','Importing the Libraries',2,'[{\"changed\": {\"fields\": [\"Section no\"]}}]',12,1),(104,'2024-09-20 23:20:23.449972','41','Learn HTML',2,'[{\"changed\": {\"fields\": [\"M type\"]}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(13,'codextr','cart'),(10,'codextr','category'),(11,'codextr','course'),(12,'codextr','coursematerial'),(14,'codextr','digital_wallet'),(16,'codextr','enroll'),(8,'codextr','instructor'),(9,'codextr','student'),(15,'codextr','transaction'),(7,'codextr','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-09-20 21:26:30.844917'),(2,'auth','0001_initial','2024-09-20 21:26:31.527536'),(3,'admin','0001_initial','2024-09-20 21:26:31.697612'),(4,'admin','0002_logentry_remove_auto_add','2024-09-20 21:26:31.697612'),(5,'admin','0003_logentry_add_action_flag_choices','2024-09-20 21:26:31.716502'),(6,'contenttypes','0002_remove_content_type_name','2024-09-20 21:26:31.799121'),(7,'auth','0002_alter_permission_name_max_length','2024-09-20 21:26:31.887426'),(8,'auth','0003_alter_user_email_max_length','2024-09-20 21:26:31.913617'),(9,'auth','0004_alter_user_username_opts','2024-09-20 21:26:31.922609'),(10,'auth','0005_alter_user_last_login_null','2024-09-20 21:26:31.984051'),(11,'auth','0006_require_contenttypes_0002','2024-09-20 21:26:31.988479'),(12,'auth','0007_alter_validators_add_error_messages','2024-09-20 21:26:31.996348'),(13,'auth','0008_alter_user_username_max_length','2024-09-20 21:26:32.070112'),(14,'auth','0009_alter_user_last_name_max_length','2024-09-20 21:26:32.142296'),(15,'auth','0010_alter_group_name_max_length','2024-09-20 21:26:32.160760'),(16,'auth','0011_update_proxy_permissions','2024-09-20 21:26:32.174790'),(17,'auth','0012_alter_user_first_name_max_length','2024-09-20 21:26:32.252888'),(18,'sessions','0001_initial','2024-09-20 21:26:32.293907'),(19,'codextr','0001_initial','2024-09-20 21:29:41.400585'),(20,'codextr','0002_category','2024-09-20 21:32:26.482175'),(21,'codextr','0003_course','2024-09-20 21:32:46.932572'),(22,'codextr','0004_coursematerial','2024-09-20 21:34:38.811801'),(23,'codextr','0005_cart','2024-09-20 21:34:52.206041'),(24,'codextr','0006_digital_wallet','2024-09-20 21:35:03.435289'),(25,'codextr','0007_transaction','2024-09-20 21:35:12.485861'),(26,'codextr','0008_enroll','2024-09-20 21:35:22.959322');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('cg5ifx486z82wg31nod02ptvlhcv5hmv','.eJxVjDsOwjAQBe_iGllef-KFkp4zRGvvggPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFidFKjD75YoP6RugO9Ub03nVpd5SnpT9E67vjSW53l3_w4K9fKtEQUgWOAYDeTE1rFhEYfXxMcYgkWS6L31zhocKA-E4MSjZSNgKKn3B88NN18:1srlD0:0rcZaDx_mxbzIsdF9T8tUxgRo1nkRd7AGEvKijXsnrY','2024-10-04 21:30:34.952588');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-21 12:10:15
