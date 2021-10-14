-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pet_spa
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `tbldichvu`
--

DROP TABLE IF EXISTS `tbldichvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldichvu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) NOT NULL,
  `giaca` bigint NOT NULL,
  `gioihan` int DEFAULT NULL,
  `mota` varchar(255) DEFAULT NULL,
  `ngaytao` datetime NOT NULL,
  `ngayxoa` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldichvu`
--

LOCK TABLES `tbldichvu` WRITE;
/*!40000 ALTER TABLE `tbldichvu` DISABLE KEYS */;
INSERT INTO `tbldichvu` VALUES (10,'cắt tỉa ',300000,12,'abc','2021-12-10 10:04:30',NULL),(11,'mát-xa ',500000,5,'abc','2021-12-10 11:04:30',NULL),(12,'tắm',100000,5,'abc','2021-12-10 11:04:30',NULL);
/*!40000 ALTER TABLE `tbldichvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhoadon`
--

DROP TABLE IF EXISTS `tblhoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblhoadon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `thanhtien` bigint NOT NULL,
  `ngaytao` datetime NOT NULL,
  `mota` varchar(255) DEFAULT NULL,
  `tblKhachHangid` int DEFAULT NULL,
  `tblNhanVienid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uqloaikhachhang` (`id`),
  KEY `fk_nhanvien_hoadon` (`tblNhanVienid`),
  KEY `fk_khachhang_hoadon` (`tblKhachHangid`),
  CONSTRAINT `fk_khachhang_hoadon` FOREIGN KEY (`tblKhachHangid`) REFERENCES `tblkhachhang` (`id`),
  CONSTRAINT `fk_nhanvien_hoadon` FOREIGN KEY (`tblNhanVienid`) REFERENCES `tblnhanvien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhoadon`
--

LOCK TABLES `tblhoadon` WRITE;
/*!40000 ALTER TABLE `tblhoadon` DISABLE KEYS */;
INSERT INTO `tblhoadon` VALUES (1,400000,'2021-10-10 16:21:08',NULL,1,1);
/*!40000 ALTER TABLE `tblhoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhoadondichvu`
--

DROP TABLE IF EXISTS `tblhoadondichvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblhoadondichvu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `soluong` int NOT NULL,
  `tblHoaDonid` int NOT NULL,
  `tblDichVuid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uqloaikhachhang` (`id`),
  KEY `fk_hddv_hoadon` (`tblHoaDonid`),
  KEY `fk_hddv_dichvu` (`tblDichVuid`),
  CONSTRAINT `fk_hddv_dichvu` FOREIGN KEY (`tblDichVuid`) REFERENCES `tbldichvu` (`id`),
  CONSTRAINT `fk_hddv_hoadon` FOREIGN KEY (`tblHoaDonid`) REFERENCES `tblhoadon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhoadondichvu`
--

LOCK TABLES `tblhoadondichvu` WRITE;
/*!40000 ALTER TABLE `tblhoadondichvu` DISABLE KEYS */;
INSERT INTO `tblhoadondichvu` VALUES (2,1,1,11),(3,1,1,12);
/*!40000 ALTER TABLE `tblhoadondichvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblkhachhang`
--

DROP TABLE IF EXISTS `tblkhachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblkhachhang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tichluy` int NOT NULL,
  `tblNguoiDungid` int NOT NULL,
  `tblLoaiKhachHangid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uqloaikhachhang` (`id`,`tblNguoiDungid`),
  KEY `fk_nguoidung_kh` (`tblNguoiDungid`),
  KEY `fk_loaikhachhang` (`tblLoaiKhachHangid`),
  CONSTRAINT `fk_loaikhachhang` FOREIGN KEY (`tblLoaiKhachHangid`) REFERENCES `tblloaikhachhang` (`id`),
  CONSTRAINT `fk_nguoidung_kh` FOREIGN KEY (`tblNguoiDungid`) REFERENCES `tblnguoidung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblkhachhang`
--

LOCK TABLES `tblkhachhang` WRITE;
/*!40000 ALTER TABLE `tblkhachhang` DISABLE KEYS */;
INSERT INTO `tblkhachhang` VALUES (1,900000,3,4);
/*!40000 ALTER TABLE `tblkhachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllichhen`
--

DROP TABLE IF EXISTS `tbllichhen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbllichhen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `thoigianhen` datetime NOT NULL,
  `giadukien` bigint NOT NULL,
  `ngayxoa` datetime DEFAULT NULL,
  `tblKhachHangid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uqloaikhachhang` (`id`),
  KEY `fk_khachhang_lichhen` (`tblKhachHangid`),
  CONSTRAINT `fk_khachhang_lichhen` FOREIGN KEY (`tblKhachHangid`) REFERENCES `tblkhachhang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllichhen`
--

LOCK TABLES `tbllichhen` WRITE;
/*!40000 ALTER TABLE `tbllichhen` DISABLE KEYS */;
INSERT INTO `tbllichhen` VALUES (1,'2021-10-10 16:21:08',400000,NULL,1);
/*!40000 ALTER TABLE `tbllichhen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllichhendichvu`
--

DROP TABLE IF EXISTS `tbllichhendichvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbllichhendichvu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `soluong` int NOT NULL,
  `tblLichHenid` int NOT NULL,
  `tblDichVuid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uqloaikhachhang` (`id`),
  KEY `fk_lhdv_lichhen` (`tblLichHenid`),
  KEY `fk_lhdv_dichvu` (`tblDichVuid`),
  CONSTRAINT `fk_lhdv_dichvu` FOREIGN KEY (`tblDichVuid`) REFERENCES `tbldichvu` (`id`),
  CONSTRAINT `fk_lhdv_lichhen` FOREIGN KEY (`tblLichHenid`) REFERENCES `tbllichhen` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllichhendichvu`
--

LOCK TABLES `tbllichhendichvu` WRITE;
/*!40000 ALTER TABLE `tbllichhendichvu` DISABLE KEYS */;
INSERT INTO `tbllichhendichvu` VALUES (2,2,1,11),(3,1,1,10);
/*!40000 ALTER TABLE `tbllichhendichvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblloaikhachhang`
--

DROP TABLE IF EXISTS `tblloaikhachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblloaikhachhang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loai` varchar(255) NOT NULL,
  `khuyenmai` float NOT NULL,
  `dinhmuc` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uqloaikhachhang` (`id`,`loai`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblloaikhachhang`
--

LOCK TABLES `tblloaikhachhang` WRITE;
/*!40000 ALTER TABLE `tblloaikhachhang` DISABLE KEYS */;
INSERT INTO `tblloaikhachhang` VALUES (1,'đồng',2.5,10000000),(2,'bạc',5,30000000),(3,'vàng',10,60000000),(4,'thường',0,60000000);
/*!40000 ALTER TABLE `tblloaikhachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnguoidung`
--

DROP TABLE IF EXISTS `tblnguoidung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblnguoidung` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tendangnhap` varchar(255) NOT NULL,
  `matkhau` varchar(255) NOT NULL,
  `soCCCD` varchar(13) NOT NULL,
  `ngaysinh` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sdt` varchar(10) NOT NULL,
  `loaitaikhoan` enum('NV','QL','KH') DEFAULT 'KH',
  `ho` varchar(255) DEFAULT NULL,
  `tendem` varchar(255) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `sonha` varchar(255) DEFAULT NULL,
  `cumdancu` varchar(255) DEFAULT NULL,
  `xaphuong` varchar(255) DEFAULT NULL,
  `quanhuyen` varchar(255) DEFAULT NULL,
  `tinhthanh` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uqloaikhachhang` (`id`,`soCCCD`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnguoidung`
--

LOCK TABLES `tblnguoidung` WRITE;
/*!40000 ALTER TABLE `tblnguoidung` DISABLE KEYS */;
INSERT INTO `tblnguoidung` VALUES (1,'hiendv','123456','0001200012314','2001-10-10','hi@gmail.com','0912345678','QL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'thienhathanhkhong','123456','0001200012314','2001-10-10','hi@gmail.com','0912345678','NV',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'thanhanhthaibao','123456','0001200012314','2001-10-10','hi@gmail.com','0912345678','KH',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tblnguoidung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnhanvien`
--

DROP TABLE IF EXISTS `tblnhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblnhanvien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tblNguoiDungid` int NOT NULL,
  `ngaytao` datetime DEFAULT NULL,
  `ngayxoa` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uqloaikhachhang` (`id`,`tblNguoiDungid`),
  KEY `fk_nguoidung` (`tblNguoiDungid`),
  CONSTRAINT `fk_nguoidung` FOREIGN KEY (`tblNguoiDungid`) REFERENCES `tblnguoidung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnhanvien`
--

LOCK TABLES `tblnhanvien` WRITE;
/*!40000 ALTER TABLE `tblnhanvien` DISABLE KEYS */;
INSERT INTO `tblnhanvien` VALUES (1,2,'2021-10-10 16:21:08',NULL);
/*!40000 ALTER TABLE `tblnhanvien` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-14 19:45:57
