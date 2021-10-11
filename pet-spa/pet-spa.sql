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
-- Table structure for table `tbldiachi`
--

DROP TABLE IF EXISTS `tbldiachi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldiachi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sonha` varchar(255) DEFAULT NULL,
  `cumdancu` varchar(255) NOT NULL,
  `quanhuyen` varchar(255) NOT NULL,
  `tinhthanh` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldiachi`
--

LOCK TABLES `tbldiachi` WRITE;
/*!40000 ALTER TABLE `tbldiachi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldiachi` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldichvu`
--

LOCK TABLES `tbldichvu` WRITE;
/*!40000 ALTER TABLE `tbldichvu` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhoadon`
--

LOCK TABLES `tblhoadon` WRITE;
/*!40000 ALTER TABLE `tblhoadon` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhoadondichvu`
--

LOCK TABLES `tblhoadondichvu` WRITE;
/*!40000 ALTER TABLE `tblhoadondichvu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhoadondichvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhoten`
--

DROP TABLE IF EXISTS `tblhoten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblhoten` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ho` varchar(255) NOT NULL,
  `tendem` varchar(255) NOT NULL,
  `ten` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhoten`
--

LOCK TABLES `tblhoten` WRITE;
/*!40000 ALTER TABLE `tblhoten` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhoten` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblkhachhang`
--

LOCK TABLES `tblkhachhang` WRITE;
/*!40000 ALTER TABLE `tblkhachhang` DISABLE KEYS */;
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
  `ngayxoa` datetime NOT NULL,
  `tblKhachHangid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uqloaikhachhang` (`id`),
  KEY `fk_khachhang_lichhen` (`tblKhachHangid`),
  CONSTRAINT `fk_khachhang_lichhen` FOREIGN KEY (`tblKhachHangid`) REFERENCES `tblkhachhang` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllichhen`
--

LOCK TABLES `tbllichhen` WRITE;
/*!40000 ALTER TABLE `tbllichhen` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllichhendichvu`
--

LOCK TABLES `tbllichhendichvu` WRITE;
/*!40000 ALTER TABLE `tbllichhendichvu` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblloaikhachhang`
--

LOCK TABLES `tblloaikhachhang` WRITE;
/*!40000 ALTER TABLE `tblloaikhachhang` DISABLE KEYS */;
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
  `ngaytao` datetime DEFAULT NULL,
  `loaitaikhoan` enum('NV','QL','KH') DEFAULT 'KH',
  `tblDiaChiid` int NOT NULL,
  `tblHotenid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uqloaikhachhang` (`id`,`soCCCD`),
  KEY `fk_diachi` (`tblDiaChiid`),
  KEY `fk_hoten` (`tblHotenid`),
  CONSTRAINT `fk_diachi` FOREIGN KEY (`tblDiaChiid`) REFERENCES `tbldiachi` (`id`),
  CONSTRAINT `fk_hoten` FOREIGN KEY (`tblHotenid`) REFERENCES `tblhoten` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnguoidung`
--

LOCK TABLES `tblnguoidung` WRITE;
/*!40000 ALTER TABLE `tblnguoidung` DISABLE KEYS */;
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
  `ngayxoa` date DEFAULT NULL,
  `tblNguoiDungid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uqloaikhachhang` (`id`,`tblNguoiDungid`),
  KEY `fk_nguoidung` (`tblNguoiDungid`),
  CONSTRAINT `fk_nguoidung` FOREIGN KEY (`tblNguoiDungid`) REFERENCES `tblnguoidung` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnhanvien`
--

LOCK TABLES `tblnhanvien` WRITE;
/*!40000 ALTER TABLE `tblnhanvien` DISABLE KEYS */;
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

-- Dump completed on 2021-10-09 15:59:50
