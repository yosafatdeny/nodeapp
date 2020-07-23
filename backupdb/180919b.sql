-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dbqelas
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `belajar`
--

DROP TABLE IF EXISTS `belajar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `belajar` (
  `modulId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belajar`
--

LOCK TABLES `belajar` WRITE;
/*!40000 ALTER TABLE `belajar` DISABLE KEYS */;
INSERT INTO `belajar` VALUES (1,1),(2,1),(3,1),(1,2),(10,1),(4,5),(12,1),(36,1),(37,1),(38,1),(39,1),(32,1),(33,1),(23,1),(24,1),(12,7),(13,7),(14,7),(36,7),(40,7),(37,7),(39,7),(41,7),(42,7),(15,7),(16,7),(38,7);
/*!40000 ALTER TABLE `belajar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kelasId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,2,2),(2,6,2),(3,9,3);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `idCategory` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Website'),(2,'Mobile'),(3,'Desktop'),(4,'System');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelas`
--

DROP TABLE IF EXISTS `kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kelas` (
  `idKelas` int(11) NOT NULL AUTO_INCREMENT,
  `kelasName` varchar(64) NOT NULL,
  `catId` int(11) NOT NULL,
  `description` mediumtext,
  `image` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `kelasDuration` int(11) NOT NULL,
  `level` varchar(45) NOT NULL,
  `penyusun` varchar(45) NOT NULL,
  PRIMARY KEY (`idKelas`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelas`
--

LOCK TABLES `kelas` WRITE;
/*!40000 ALTER TABLE `kelas` DISABLE KEYS */;
INSERT INTO `kelas` VALUES (12,'Dasar Pemrograman dengan Javascript',1,'<p>Kelas ini akan membahas dasar-dasar pemrograman javascript yang sangat diperlukan untuk developer pemula.</p>','/kelas/images/KLS1568691942250.jpg',1200000,30,'pemula',''),(13,'REST API',1,'','/kelas/images/KLS1568709846184.png',0,0,'pemula','Ahmad Hisbullah'),(14,'MEMBUAT SISTEM LOGIN LENGKAP MENGGUNAKAN CODEIGNITER 3',1,'','/kelas/images/KLS1568713073539.jpg',0,0,'menengah','Ahmad Hisbullah'),(15,' Membuat aplikasi ReactJS yang terintegrasi dengan Firebase',1,'','/kelas/images/KLS1568713449285.png',0,0,'menengah','Ahmad Hisbullah');
/*!40000 ALTER TABLE `kelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelasku`
--

DROP TABLE IF EXISTS `kelasku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kelasku` (
  `kelasId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelasku`
--

LOCK TABLES `kelasku` WRITE;
/*!40000 ALTER TABLE `kelasku` DISABLE KEYS */;
INSERT INTO `kelasku` VALUES (1000,1000),(15,1),(14,1),(13,1),(12,7),(15,7);
/*!40000 ALTER TABLE `kelasku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konfirmasi`
--

DROP TABLE IF EXISTS `konfirmasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `konfirmasi` (
  `idkonfirmasi` int(11) NOT NULL AUTO_INCREMENT,
  `invoice` varchar(45) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `noRek` varchar(45) NOT NULL,
  `nominal` int(11) NOT NULL,
  `bank` varchar(45) NOT NULL,
  `tanggal` datetime DEFAULT NULL,
  `image` varchar(200) NOT NULL,
  `status` varchar(45) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`idkonfirmasi`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konfirmasi`
--

LOCK TABLES `konfirmasi` WRITE;
/*!40000 ALTER TABLE `konfirmasi` DISABLE KEYS */;
INSERT INTO `konfirmasi` VALUES (1,'QLS90190914143','hisbu','877888',500234,'bca','2019-09-13 00:00:00','/konfirmasi/image/ing.jpg','verified',2),(2,'QLS60190915174','wqw','344',4342,'mandiri',NULL,'/konfirmasi/images/KONF1568591621775.jpg','unverified',1),(3,'QLS60190915659','hisbu','8908989009',90000,'bca','2019-09-11 00:00:00','/konfirmasi/images/KONF1568593305298.png','unverified',1),(4,'QLS60190915659','asdas','345435',435,'mandiri','2019-09-20 00:00:00','/konfirmasi/images/KONF1568594024223.jpg','unverified',1),(5,'QLS30190916320','hisbu','50888',500000,'Bank BCA','2019-09-16 00:00:00','/konfirmasi/images/KONF1568597577140.jpg','verified',1),(6,'QLS60190916704','aa','aa',4454,'Bank BCA','2019-09-12 00:00:00','/konfirmasi/images/KONF1568609688352.jpg','verified',1),(7,'QLS60190918217','qiandra','9898989',90000,'Bank BCA','2019-09-18 00:00:00','/konfirmasi/images/KONF1568818293259.jpg','verified',7);
/*!40000 ALTER TABLE `konfirmasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langganan`
--

DROP TABLE IF EXISTS `langganan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `langganan` (
  `idLangganan` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `paketId` int(11) NOT NULL,
  `awalLangganan` datetime NOT NULL,
  `akhirLangganan` datetime NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`idLangganan`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langganan`
--

LOCK TABLES `langganan` WRITE;
/*!40000 ALTER TABLE `langganan` DISABLE KEYS */;
INSERT INTO `langganan` VALUES (1,2,2,'2019-09-14 12:12:16','2019-10-14 12:12:16','active'),(2,2,2,'2019-09-15 09:20:47','2019-11-14 09:20:47','expired'),(3,2,2,'2019-09-15 09:21:43','2019-11-14 09:21:43','expired'),(4,1,1,'2019-09-16 08:48:42','2019-10-16 08:48:42','active'),(5,1,2,'2019-09-16 11:55:08','2019-11-15 11:55:08','expired'),(6,7,2,'2019-09-18 09:52:33','2019-11-17 09:52:33','active');
/*!40000 ALTER TABLE `langganan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materi`
--

DROP TABLE IF EXISTS `materi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materi` (
  `idMateri` int(11) NOT NULL AUTO_INCREMENT,
  `materiName` varchar(100) NOT NULL,
  `kelasId` int(11) NOT NULL,
  `kelasName` varchar(64) NOT NULL,
  `type` varchar(45) NOT NULL,
  `materiText` varchar(100) NOT NULL,
  `materiVideo` varchar(100) NOT NULL,
  `duration` int(11) NOT NULL,
  PRIMARY KEY (`idMateri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materi`
--

LOCK TABLES `materi` WRITE;
/*!40000 ALTER TABLE `materi` DISABLE KEYS */;
/*!40000 ALTER TABLE `materi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modul`
--

DROP TABLE IF EXISTS `modul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modul` (
  `idmodul` int(11) NOT NULL AUTO_INCREMENT,
  `idkelas` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext,
  `video` varchar(45) DEFAULT NULL,
  `isDeleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmodul`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modul`
--

LOCK TABLES `modul` WRITE;
/*!40000 ALTER TABLE `modul` DISABLE KEYS */;
INSERT INTO `modul` VALUES (1,2,'modul pertama','disini isinya text','ini buat link piedonya',0),(2,2,'modul kedua','sama aja','ini juga sama',0),(3,6,'mudol pertama','buat content juga','link piedo',0),(4,6,'menjadi modul kedua','content disini','disini buat video',0),(5,6,'menjadi modul kedua','content disini','disini buat video',0),(6,8,'modul pertama kelas ke delapan - ini juga','content disini','video saja yang dirubah',1),(7,8,'menjadi modul satu- ini mau di delete lagi','content disini','disini buat video',1),(8,8,'menjadi modul dua','content disini','disini buat video',1),(9,9,'zzzzzz','<p>zzzzzzz</p>','zzzzzzzzz',1),(10,2,'dsadsad','<p>dsadsa</p>','dsadsa',0),(11,2,'adffggferrewr','<p>erewrewgfdgfdg</p>','ewerewrerwe',0),(12,12,'Dasar Pemrograman dengan Javascript : INTRO','<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">Website di era ini sudah menjadi kebutuhan utama yang tidak bisa dilupakan. Beberapa sektor seperti pemerintahan, bisnis, atau edukasi menggunakan website sebagai alat untuk promosi, management, tukar informasi, dan lainnya. Bahkan saat ini tidak jarang satu orang memiliki websitenya sendiri.</p>\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">Website adalah halaman informasi yang bisa diakses oleh siapapun dari seluruh penjuru dunia dengan menggunakan koneksi internet. Per Januari 2019 terdapat 1.518.207.413 website yang aktif, berdasarkan survey dari Webcraft Webserver Survey.</p>\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">Di kelas ini Anda akan belajar tentang komponen-komponen dasar untuk membuat suatu website, antara lain:</p>\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">\n<li style=\"box-sizing: border-box;\">HTML</li>\n<li style=\"box-sizing: border-box;\">CSS</li>\n<li style=\"box-sizing: border-box;\">JavaScript</li>\n</ul>\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">Kelas ini sangat cocok bagi Anda yang masih pemula dan ingin mempelajari bagaimana menjadi developer web.</p>\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">Jika Anda ingin belajar di kelas ini, silakan baca blog untuk setting environmentnya terlebih dahulu, link ke&nbsp;<a style=\"box-sizing: border-box; text-decoration-line: none; background-color: transparent; color: #ff5483 !important;\" href=\"https://blog.dicoding.com/cara-membuat-browser-menjadi-lokal-web-server/\">blog</a>.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /></p>\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">Kelas ini berdasarkan pembelajaran yang ada di website Codepolitan. Kelas ini menggabungkan 2 kelas menjadi 1, yaitu kelas html css, dan kelas JavaScript.</p>','RUTV_5m4VeI',0),(13,12,'APA ITU PEMROGRAMAN?','','Ncrlg9kTC6U',0),(14,12,'BAHASA PEMROGRAMAN','','dugL0oYx0w0',0),(15,12,'COMPILER VS. INTERPRETER','','gCBysZKiU3Y',0),(16,12,'KENAPA BELAJAR JAVASCRIPT?','','6UhT1lmV9DE',0),(17,12,'SEJARAH JAVASCRIPT','','G4LEU-NtQUg',0),(18,12,'LINGKUNGAN PENGEMBANGAN JAVASCRIPT','','h7zwbfS5CVU',0),(19,12,'NILAI DAN TIPE DATA PADA JAVASCRIPT','','1FAnrYu7LCM',0),(20,12,'TIPE DATA PADA JAVASCRIPT : ANGKA','','oPlEq7fewIg',0),(21,12,'OPERATOR PADA JAVASCRIPT : Aritmatika, Penugasan & Perbandingan','','_XSeF00qNWE',0),(22,12,'TIPE DATA PADA JAVASCRIPT : STRING','','ud322_5-M3s',0),(23,13,'REST API #1 APA ITU API ?','','vQJJ_K1JbEA',0),(24,13,'REST API #2 REST dan HTTP','','dtpm5wwXEIY',0),(25,13,'REST API #3 APA ITU JSON?','','EluVFXu4GOU',0),(26,13,'REST API #4 BEKERJA DENGAN JSON','','UNjknizL2EI',0),(27,13,'REST API #5 APA ITU PUBLIC API ?','','TvOFqREy7A8',0),(28,13,'REST API #6 YOUTUBE & INSTAGRAM API (menggunakan cURL)','','-BmTKA1xCm8',0),(29,13,'REST API #7 MEMBUAT REST SERVER (menggunakan CodeIgniter)','','cb3-Cm3Al3c',0),(30,13,'REST API #8 AUTENTIKASI REST SERVER','','VGmHzSEf2Sk',0),(31,13,'REST API #9 MEMBUAT REST CLIENT (Selesai)','','O9PZgYjJ6ik',0),(32,14,'#1 INTRO - Membuat Sistem Login Lengkap dengan CODEIGNITER 3','','8ROgaHfLRq0',0),(33,14,'#2 PERSIAPAN - Membuat Sistem Login Lengkap dengan CODEIGNITER 3','','cZKLecON8tA',0),(34,14,'#3 USER REGISTRATION - Membuat Sistem Login Lengkap dengan CODEIGNITER 3','','InxCCPlKCrk',0),(35,14,'#4 LOGIN - Membuat Sistem Login Lengkap dengan CODEIGNITER 3','','RIllkdVKHV4',0),(36,15,'#1 ReactJS-Firebase','','8T20v0HK7pM',0),(37,15,'Integrasi Firebase dengan Project ReactJS (Atomic Design)','','guIeDEND3F4',0),(38,15,'Proses Registrasi / Sign Up menggunakan Firebase','','y6ye4QzK77c',0),(39,15,'Setup Redux Pada Project','','b0_q5U9YfpE',0),(40,15,'Setup Redux Thunk Pada Project','','frwlr7uh0io',0),(41,15,'Setup Redux Thunk Pada Project lanjutan','','LOoUOJsSFSY',0),(42,15,'Login dengan menggunakan Firebase','','ps6ws_VUlZA',0);
/*!40000 ALTER TABLE `modul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paket`
--

DROP TABLE IF EXISTS `paket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paket` (
  `idpaket` int(11) NOT NULL AUTO_INCREMENT,
  `durasi` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`idpaket`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paket`
--

LOCK TABLES `paket` WRITE;
/*!40000 ALTER TABLE `paket` DISABLE KEYS */;
INSERT INTO `paket` VALUES (1,30,500000),(2,60,900000),(3,90,1200000),(4,180,2250000),(5,365,4200000);
/*!40000 ALTER TABLE `paket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(10) NOT NULL,
  `note` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'superadmin','superadmin'),(2,'admin','admin'),(3,'user','user');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `idtransaction` int(11) NOT NULL AUTO_INCREMENT,
  `invoice` varchar(45) NOT NULL,
  `paketId` int(11) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`idtransaction`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'QLS001',1,NULL,1,'2019-09-14 00:00:00','0'),(2,'QLS301909141017',1,500793,1,'2019-09-14 00:00:00','verified'),(3,'QLS301909141107',1,500523,1,'2019-09-14 00:00:00','verified'),(4,'QLS901909140927',2,900236,2,'2019-09-14 00:00:00','verified'),(5,'QLS90190914143',2,900143,2,'2019-09-14 00:00:00','verified'),(6,'QLS180190915923',3,2250923,2,'2019-09-15 11:18:57','Unverified'),(7,'QLS180190915172',3,2250172,2,'2019-09-15 11:24:04','Unverified'),(8,'QLS60190915973',2,900973,1,'2019-09-15 03:22:53','Unverified'),(9,'QLS60190915659',2,900659,1,'2019-09-15 03:26:48','Unverified'),(10,'QLS60190915174',2,900174,1,'2019-09-15 03:38:22','Unverified'),(11,'QLS30190916320',1,500320,1,'2019-09-16 08:31:39','verified'),(12,'QLS60190916704',2,900704,1,'2019-09-16 11:54:24','verified'),(13,'QLS60190916748',2,900748,1,'2019-09-16 12:17:59','Unverified'),(14,'QLS60190918217',2,900217,7,'2019-09-18 08:47:21','verified');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(14) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `roleId` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `lastUpdate` datetime DEFAULT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'hisbu','9140f2e472ade88804c781b154232829104777e8d6d1d86e7a7e6409d5b556d1','Ahmad','Hisbullah','pria','lab.hisbu@gmail.com','087878630126','bsd',1,0,NULL,NULL,NULL,'/user/images/USR1567883951102.jpg'),(2,'hisbu4','0303b6c3d96d6529b24152530405d220befaf6fd90fcf2c7bf37cc11402751f9','','','','hisbu@yahoo.com','','',3,0,'2019-09-04 16:55:05',NULL,NULL,'/user/images/USR1567884385998.jpg'),(5,'qiandra','9140f2e472ade88804c781b154232829104777e8d6d1d86e7a7e6409d5b556d1','','','','hisbu@qyans.com','','',3,1,'2019-09-07 12:54:50',NULL,NULL,'/user/images/USR1567880419108.jpg'),(6,'Ahmad','9140f2e472ade88804c781b154232829104777e8d6d1d86e7a7e6409d5b556d1','','','','hisbu.4@gmail.com','','',3,1,'2019-09-08 06:04:20',NULL,NULL,'/user/images/USR1567898515714.jpg'),(7,'alea','0303b6c3d96d6529b24152530405d220befaf6fd90fcf2c7bf37cc11402751f9','Qiandra','Alea','Perempuan','user1@qyans.com','09898976879','bsd',3,1,'2019-09-18 20:22:29',NULL,NULL,'/user/images/USR1568813251627.png');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-18 23:28:00
