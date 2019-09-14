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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelas`
--

LOCK TABLES `kelas` WRITE;
/*!40000 ALTER TABLE `kelas` DISABLE KEYS */;
INSERT INTO `kelas` VALUES (2,'andoird es edit',1,'<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">k Website di era ini sudah menjadi kebutuhan utama yang tidak bisa dilupakan. Beberapa sektor seperti pemerintahan, bisnis, atau edukasi menggunakan website sebagai alat untuk promosi, management, tukar informasi, dan lainnya. Bahkan saat ini tidak jarang satu orang memiliki websitenya sendiri.</p>\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">Website adalah halaman informasi yang bisa diakses oleh siapapun dari seluruh penjuru dunia dengan menggunakan koneksi internet. Per Januari 2019 terdapat 1.518.207.413 website yang aktif, berdasarkan survey dari Webcraft Webserver Survey.</p>\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">Di kelas ini Anda akan belajar tentang komponen-komponen dasar untuk membuat suatu website, antara lain:</p>\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">\n<li style=\"box-sizing: border-box;\">HTML</li>\n<li style=\"box-sizing: border-box;\">CSS</li>\n<li style=\"box-sizing: border-box;\">JavaScript</li>\n</ul>\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">Kelas ini sangat cocok bagi Anda yang masih pemula dan ingin mempelajari bagaimana menjadi developer web.</p>\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">Jika Anda ingin belajar di kelas ini, silakan baca blog untuk setting environmentnya terlebih dahulu, link ke&nbsp;<a style=\"box-sizing: border-box; text-decoration-line: none; background-color: transparent; color: #ff5483 !important;\" href=\"https://blog.dicoding.com/cara-membuat-browser-menjadi-lokal-web-server/\">blog</a>.<br style=\"box-sizing: border-box;\" /><br style=\"box-sizing: border-box;\" /></p>\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">Kelas ini berdasarkan pembelajaran yang ada di website Codepolitan. Kelas ini menggabungkan 2 kelas menjadi 1, yaitu kelas html css, dan kelas JavaScript.</p>','/kelas/images/KLS1567991126741.jpg',224444400,45003,'pemula',''),(6,'react native',2,'<p style=\"text-align: center;\"><em>lorem</em> ipsum <strong>seabrek</strong></p>','/kelas/images/KLS1568300181083.jpg',1200000,60,'menengah',''),(8,'kelas ketiga',3,'<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">Progressive Web Apps menyajikan pengalaman pengguna layaknya aplikasi native. PWA merupakan aplikasi web dengan beragam fitur web modern, seperti:&nbsp;</p>\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Mengubah sajian tampilan yang umumnya dibuka melalui halaman browser menjadi jendela aplikasi tersendiri.</p>\n</li>\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Menyajikan aplikasi web yang dapat diandalkan, cepat, dan menjaga ikatan dengan pengguna.</p>\n</li>\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Memungkinkan konten halaman diakses dalam mode offline, menampilkan pesan pemberitahuan, hingga akses ke hardware dari perangkat seperti halnya native app.</p>\n</li>\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Banyak perusahaan telah mengadopsi PWA. Developer dengan skill PWA lebih dilirik oleh perusahaan.&nbsp;</p>\n</li>\n</ul>\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">&nbsp;</p>\n<h4 dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Quicksand, sans-serif; line-height: 1.2; color: #3d3d3d; font-size: 1.5rem; background-color: #ffffff; font-weight: 300 !important;\">Beberapa keuntungan belajar di kelas ini:</h4>\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Sertifikat kelulusan kelas MPWA, diakui oleh para pelaku industri.</p>\n</li>\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Materi kelas ditulis tim expert developer dari Codepolitan.</p>\n</li>\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Di sini Anda belajar dengan didampingi expert reviewer yang membaca baris demi baris kode Anda. Reviewer akan membimbing dan memberi masukan pada project submission. Anda pun jadi tahu area mana dalam skill PWA Anda yang perlu ditingkatkan.</p>\n</li>\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Anda bisa belajar dengan fleksibel karena sepenuhnya online/daring tanpa tatap muka. Bisa belajar di mana pun dan kapan pun.</p>\n</li>\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Sebagai lulusan Dicoding Academy Anda berkesempatan memperoleh info lowongan pekerjaan dan kesempatan melamar kerja ke perusahaan via Dicoding Jobs.</p>\n</li>\n</ul>\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">&nbsp;</p>\n<h4 dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Quicksand, sans-serif; line-height: 1.2; color: #3d3d3d; font-size: 1.5rem; background-color: #ffffff; font-weight: 300 !important;\">Beberapa materi yang akan dipelajari di dalam kelas ini adalah:</h4>\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-weight: bold;\">Promises and fetch</span>, yaitu dua web API modern yang dapat kita gunakan untuk menulis blok kode dengan lebih mudah dan intuitif.</li>\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-weight: bold;\">Service worker</span>, yaitu JavaScript yang dijalankan oleh browser di latar belakang, yang terpisah dengan skrip lain di halaman web browser. Dengan menggunakan service worker, kita dapat memanfaatkan resource yang telah disimpan di dalam cache untuk ditampilkan bahkan dalam mode jaringan offline.</li>\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-weight: bold;\">Application shell</span>, atau biasa disingkat dengan app shell adalah kerangka antarmuka aplikasi yang dibangun oleh beberapa komponen halaman dan aset lainnya yang disimpan lebih dahulu di dalam cache sehingga dapat tampil secara instan saat aplikasi dibuka.</li>\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-weight: bold;\">Cache API</span>, yaitu cache yang dibuat oleh aplikasi menggunakan Cache API dan terpisah dari cache yang dikelola oleh browser. Cache jenis inilah yang dapat kita gunakan untuk menyimpan resource dan dapat ditampilkan dalam mode jaringan offline melalui service worker.</li>\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-weight: bold;\">Indexed DB</span>, yaitu sistem penyimpanan lokal berbasis NoSQL di browser. Kita dapat menyimpan data apapun di browser pengguna untuk keperluan aplikasi. Kamu dapat melakukan aksi pencarian, pembaharuan dan penghapusan data.</li>\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-weight: bold;\">Web Push</span>, yaitu web API yang dapat menerima pesan pemberitahuan dari server di belakang layar. Web push dapat dikombinasikan dengan sistem notifikasi yaitu pesan popup yang muncul di perangkat pengguna. Aplikasi PWA dapat menerima event push dan menampilkan pesan popup meskipun pengguna sedang tidak membuka aplikasi tersebut.</li>\n<li style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-weight: bold;\">Workbox</span>, yaitu koleksi librari dan tool yang dapat kita gunakan untuk meng-generate file service worker, precaching, routing dan runtime-caching. Workbox memudahkan kita dalam menulis kode PWA dengan sintaks yang lebih sederhana dan mudah dikelola.</li>\n</ul>\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">Serta&nbsp;<span style=\"box-sizing: border-box; font-weight: bold;\">3 tugas</span>&nbsp;berbasis proyek yang akan menantang Anda untuk membangun PWA Anda sendiri.</p>\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">&nbsp;</p>\n<h4 dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Quicksand, sans-serif; line-height: 1.2; color: #3d3d3d; font-size: 1.5rem; background-color: #ffffff; font-weight: 300 !important;\">Prasyarat Kelas:</h4>\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">Disarankan untuk menguasai bahasa pemrograman JavaScript dan dasar HTML dan CSS sebelum mengambil kelas \"Membangun Progressive Web Apps\". Jika belum, maka bisa mempelajari&nbsp;<span style=\"box-sizing: border-box; font-weight: bold;\">Web Fundamental</span>&nbsp;di&nbsp;<a style=\"box-sizing: border-box; text-decoration-line: none; background-color: transparent; color: #ff5483 !important;\" href=\"https://www.dicoding.com/academies/123\">https://www.dicoding.com/academies/123</a></li>\n</ul>\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\"><span style=\"box-sizing: border-box; font-weight: bold;\">&nbsp;</span></p>\n<h4 dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Quicksand, sans-serif; line-height: 1.2; color: #3d3d3d; font-size: 1.5rem; background-color: #ffffff; font-weight: 300 !important;\">Jika lulus dari kelas ini maka:</h4>\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Anda akan menguasai komponen-komponen penting dalam membangun progressive web app.</p>\n</li>\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Anda akan mampu membuat aplikasi web app bertemakan aplikasi sepak bola.</p>\n</li>\n</ul>\n<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">&nbsp;</p>\n<h4 style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0.5rem; font-family: Quicksand, sans-serif; line-height: 1.2; color: #3d3d3d; font-size: 1.5rem; background-color: #ffffff; font-weight: 300 !important;\">Kebutuhan untuk kelas ini:</h4>\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: #3d3d3d; font-family: Quicksand, sans-serif; font-size: 16px; background-color: #ffffff;\">\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Anda harus mandiri, berkomitmen, benar-benar punya rasa ingin tahu dan tertarik pada subjek.&nbsp;</p>\n</li>\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Anda harus gigih, temukan topik yang menarik, bermain-main dan mengotak-atik kode Anda.&nbsp;</p>\n</li>\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Sebaik apapun materi struktur kelas ini, tak akan berguna tanpa keseriusan Anda untuk belajar, berlatih, dan mencoba.&nbsp;</p>\n</li>\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Kelas ini terdiri dari 58 sub-materi. Setiap sub materi dirancang untuk selesai dipelajari rata-rata dalam 30-50 menit.&nbsp;</p>\n</li>\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Buku teks (print-out dari materi di web) tersedia untuk kelas ini. Tujuannya untuk membantu Anda belajar secara offline. Namun demikian, tanpa buku pun Anda tetap dapat belajar online dan lulus.&nbsp;</p>\n</li>\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Untuk menyelesaikan kelas ini, peserta diharuskan untuk mengerjakan 3 submission. Submission yang dikirimkan adalah :</p>\n<ul style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px;\">\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">First PWA, membuat aplikasi PWA sederhana dengan konten statis.</p>\n</li>\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem;\">Aplikasi Sepak Bola, membuat aplikasi PWA yang mengkonsumsi API terkait informasi sepak bola.</p>\n</li>\n<li dir=\"ltr\" style=\"box-sizing: border-box;\">PWA dengan Workbox, membuat aplikasi sepak bola seperti yang dibuat pada submission kedua tetapi dengan memanfaatkan library Workbox.</li>\n</ul>\n</li>\n</ul>','/kelas/images/KLS1568211927775.jpg',234,34,'menengah','siapa saja'),(9,'keleas keempat',1,'<p>sebuah deskripsi yang tidal panjang dan tidak pendek juga, ya sedang sedang lah</p>\n<p>&nbsp;</p>\n<p><code></code><span style=\"background-color: #1e1e1e; font-family: Consolas, \'Courier New\', monospace; font-size: 14px; white-space: pre; color: #808080;\">&lt;</span><span style=\"background-color: #1e1e1e; font-family: Consolas, \'Courier New\', monospace; font-size: 14px; white-space: pre; color: #569cd6;\">div</span><span style=\"background-color: #1e1e1e; color: #d4d4d4; font-family: Consolas, \'Courier New\', monospace; font-size: 14px; white-space: pre;\">&nbsp;</span><span style=\"background-color: #1e1e1e; font-family: Consolas, \'Courier New\', monospace; font-size: 14px; white-space: pre; color: #9cdcfe;\">className</span><span style=\"background-color: #1e1e1e; color: #d4d4d4; font-family: Consolas, \'Courier New\', monospace; font-size: 14px; white-space: pre;\">=</span><span style=\"background-color: #1e1e1e; font-family: Consolas, \'Courier New\', monospace; font-size: 14px; white-space: pre; color: #ce9178;\">\'dataContainer&nbsp;row\'</span><span style=\"background-color: #1e1e1e; font-family: Consolas, \'Courier New\', monospace; font-size: 14px; white-space: pre; color: #808080;\">&gt;</span></p>\n<div style=\"color: #d4d4d4; background-color: #1e1e1e; font-family: Consolas, \'Courier New\', monospace; font-size: 14px; line-height: 19px; white-space: pre;\">\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #808080;\">&lt;</span><span style=\"color: #4ec9b0;\">Table</span><span style=\"color: #808080;\">&gt;</span></div>\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #808080;\">&lt;</span><span style=\"color: #4ec9b0;\">TableHead</span><span style=\"color: #808080;\">&gt;</span></div>\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #808080;\">&lt;</span><span style=\"color: #4ec9b0;\">TableRow</span><span style=\"color: #808080;\">&gt;</span></div>\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #808080;\">&lt;</span><span style=\"color: #4ec9b0;\">TableCell</span>&nbsp;<span style=\"color: #9cdcfe;\">style</span>=<span style=\"color: #569cd6;\">{</span>{<span style=\"color: #9cdcfe;\">width:</span><span style=\"color: #ce9178;\">\'10%\'</span>}<span style=\"color: #569cd6;\">}</span><span style=\"color: #808080;\">&gt;</span>No<span style=\"color: #808080;\">&lt;/</span><span style=\"color: #4ec9b0;\">TableCell</span><span style=\"color: #808080;\">&gt;</span></div>\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #808080;\">&lt;</span><span style=\"color: #4ec9b0;\">TableCell</span><span style=\"color: #808080;\">&gt;</span>Kelas&nbsp;Name<span style=\"color: #808080;\">&lt;/</span><span style=\"color: #4ec9b0;\">TableCell</span><span style=\"color: #808080;\">&gt;</span></div>\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #808080;\">&lt;</span><span style=\"color: #4ec9b0;\">TableCell</span><span style=\"color: #808080;\">&gt;</span>Category<span style=\"color: #808080;\">&lt;/</span><span style=\"color: #4ec9b0;\">TableCell</span><span style=\"color: #808080;\">&gt;</span></div>\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #808080;\">&lt;</span><span style=\"color: #4ec9b0;\">TableCell</span><span style=\"color: #808080;\">&gt;</span>Descriptioin<span style=\"color: #808080;\">&lt;/</span><span style=\"color: #4ec9b0;\">TableCell</span><span style=\"color: #808080;\">&gt;</span></div>\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #808080;\">&lt;</span><span style=\"color: #4ec9b0;\">TableCell</span><span style=\"color: #808080;\">&gt;</span>Kelas&nbsp;Duration<span style=\"color: #808080;\">&lt;/</span><span style=\"color: #4ec9b0;\">TableCell</span><span style=\"color: #808080;\">&gt;</span></div>\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #808080;\">&lt;</span><span style=\"color: #4ec9b0;\">TableCell</span><span style=\"color: #808080;\">&gt;</span>Price<span style=\"color: #808080;\">&lt;/</span><span style=\"color: #4ec9b0;\">TableCell</span><span style=\"color: #808080;\">&gt;</span></div>\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #808080;\">&lt;</span><span style=\"color: #4ec9b0;\">TableCell</span><span style=\"color: #808080;\">&gt;</span>Level<span style=\"color: #808080;\">&lt;/</span><span style=\"color: #4ec9b0;\">TableCell</span><span style=\"color: #808080;\">&gt;</span></div>\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #808080;\">&lt;</span><span style=\"color: #4ec9b0;\">TableCell</span><span style=\"color: #808080;\">&gt;</span>Penyusun<span style=\"color: #808080;\">&lt;/</span><span style=\"color: #4ec9b0;\">TableCell</span><span style=\"color: #808080;\">&gt;</span></div>\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #808080;\">&lt;</span><span style=\"color: #4ec9b0;\">TableCell</span><span style=\"color: #808080;\">&gt;</span>Image<span style=\"color: #808080;\">&lt;/</span><span style=\"color: #4ec9b0;\">TableCell</span><span style=\"color: #808080;\">&gt;</span></div>\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #808080;\">&lt;</span><span style=\"color: #4ec9b0;\">TableCell</span>&nbsp;<span style=\"color: #9cdcfe;\">colSpan</span>=<span style=\"color: #ce9178;\">\'2\'</span><span style=\"color: #808080;\">&gt;</span>Action<span style=\"color: #808080;\">&lt;/</span><span style=\"color: #4ec9b0;\">TableCell</span><span style=\"color: #808080;\">&gt;</span></div>\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #808080;\">&lt;/</span><span style=\"color: #4ec9b0;\">TableRow</span><span style=\"color: #808080;\">&gt;</span></div>\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #808080;\">&lt;/</span><span style=\"color: #4ec9b0;\">TableHead</span><span style=\"color: #808080;\">&gt;</span></div>\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #808080;\">&lt;</span><span style=\"color: #4ec9b0;\">TableBody</span><span style=\"color: #808080;\">&gt;</span></div>\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #569cd6;\">{this</span>.<span style=\"color: #dcdcaa;\">renderData</span>()<span style=\"color: #569cd6;\">}</span></div>\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #808080;\">&lt;/</span><span style=\"color: #4ec9b0;\">TableBody</span><span style=\"color: #808080;\">&gt;</span></div>\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #808080;\">&lt;/</span><span style=\"color: #4ec9b0;\">Table</span><span style=\"color: #808080;\">&gt;</span></div>\n<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: #808080;\">&lt;/</span><span style=\"color: #569cd6;\">div</span><span style=\"color: #808080;\">&gt;</span></div>\n</div>','/kelas/images/KLS1568211957301.jpg',34,56,'mahir',''),(10,'kelas kelima',2,NULL,'/kelas/images/KLS1568211989703.jpg',56,56,'mahir','kayanya sih dia');
/*!40000 ALTER TABLE `kelas` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langganan`
--

LOCK TABLES `langganan` WRITE;
/*!40000 ALTER TABLE `langganan` DISABLE KEYS */;
INSERT INTO `langganan` VALUES (1,2,2,'2019-09-14 12:12:16','2019-10-14 12:12:16','active');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materi`
--

LOCK TABLES `materi` WRITE;
/*!40000 ALTER TABLE `materi` DISABLE KEYS */;
/*!40000 ALTER TABLE `materi` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','admin');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'QLS001',1,NULL,1,'2019-09-14 00:00:00','0'),(2,'QLS301909141017',1,500793,1,'2019-09-14 00:00:00','verified'),(3,'QLS301909141107',1,500523,1,'2019-09-14 00:00:00','verified'),(4,'QLS901909140927',2,900236,2,'2019-09-14 00:00:00','verified'),(5,'QLS90190914143',2,900143,2,'2019-09-14 00:00:00','Unverified');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'hisbu','9140f2e472ade88804c781b154232829104777e8d6d1d86e7a7e6409d5b556d1','Ahmad','Hisbullah','pria','lab.hisbu@gmail.com','087878630126','bsd',1,0,NULL,NULL,NULL,'/user/images/USR1567883951102.jpg'),(2,'hisbu4','0303b6c3d96d6529b24152530405d220befaf6fd90fcf2c7bf37cc11402751f9','','','','hisbu@yahoo.com','','',3,0,'2019-09-04 16:55:05',NULL,NULL,'/user/images/USR1567884385998.jpg'),(5,'qiandra','9140f2e472ade88804c781b154232829104777e8d6d1d86e7a7e6409d5b556d1','','','','hisbu@qyans.com','','',3,1,'2019-09-07 12:54:50',NULL,NULL,'/user/images/USR1567880419108.jpg'),(6,'Ahmad','9140f2e472ade88804c781b154232829104777e8d6d1d86e7a7e6409d5b556d1','','','','hisbu.4@gmail.com','','',3,1,'2019-09-08 06:04:20',NULL,NULL,'/user/images/USR1567898515714.jpg');
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

-- Dump completed on 2019-09-14 12:15:00
