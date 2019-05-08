-- MySQL dump 10.16  Distrib 10.1.29-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: db_smartgames
-- ------------------------------------------------------
-- Server version	10.1.29-MariaDB

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
-- Table structure for table `tbl_estoque`
--

DROP TABLE IF EXISTS `tbl_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_estoque` (
  `registro` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_jogo` int(11) NOT NULL,
  `codigo_loja` int(11) NOT NULL,
  `estoque` int(11) NOT NULL,
  PRIMARY KEY (`registro`),
  KEY `codigo_jogo` (`codigo_jogo`),
  KEY `codigo_loja` (`codigo_loja`),
  CONSTRAINT `tbl_estoque_ibfk_1` FOREIGN KEY (`codigo_jogo`) REFERENCES `tbl_jogos` (`codigo`),
  CONSTRAINT `tbl_estoque_ibfk_2` FOREIGN KEY (`codigo_loja`) REFERENCES `tbl_lojas` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_estoque`
--

LOCK TABLES `tbl_estoque` WRITE;
/*!40000 ALTER TABLE `tbl_estoque` DISABLE KEYS */;
INSERT INTO `tbl_estoque` VALUES (1,1,1,50),(2,1,2,10),(3,1,3,120),(4,1,4,30),(5,1,5,0),(6,1,6,30),(7,2,1,50),(8,2,2,10),(9,2,3,0),(10,2,4,30),(11,2,5,0),(12,2,6,0),(13,3,1,10),(14,3,2,50),(15,3,3,0),(16,3,4,0),(17,3,5,0),(18,3,6,0),(19,4,1,5),(20,4,2,0),(21,4,3,60),(22,4,4,30),(23,4,5,25),(24,4,6,0),(25,5,1,15),(26,5,2,0),(27,5,3,0),(28,5,4,0),(29,5,5,25),(30,5,6,20),(31,6,1,15),(32,6,2,0),(33,6,3,0),(34,6,4,0),(35,6,5,3),(36,6,6,20);
/*!40000 ALTER TABLE `tbl_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_jogos`
--

DROP TABLE IF EXISTS `tbl_jogos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_jogos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `genero` varchar(20) NOT NULL,
  `classificacao_indicativa` varchar(40) NOT NULL,
  `idioma_audio` varchar(20) NOT NULL,
  `idioma_legenda` varchar(20) NOT NULL,
  `plataforma` varchar(20) NOT NULL,
  `marca` varchar(40) NOT NULL,
  `preco` decimal(6,2) NOT NULL,
  `codigo_barras` varchar(40) NOT NULL,
  `garantia` varchar(20) NOT NULL,
  `tipo_midia` varchar(20) NOT NULL,
  `endereco_imagem` varchar(40) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_jogos`
--

LOCK TABLES `tbl_jogos` WRITE;
/*!40000 ALTER TABLE `tbl_jogos` DISABLE KEYS */;
INSERT INTO `tbl_jogos` VALUES (1,'God of War','Ação/Aventura','Não recomendado para menores de 18 anos','Inglês/Português','Português','PlayStation 4','Playstation - Sony Brasil',148.72,'711719506119','3 meses','Blu-Ray','god_of_war.png'),(2,'Days Gone','Ação/Horror','Não recomendado para menores de 18 anos','Inglês/Português','Português','PlayStation 4','Playstation - Sony Brasil',175.12,'711719504788','3 meses','Blu-Ray','days_gone.png'),(3,'Mortal Kombat XI','Luta','Não recomendado para menores de 18 anos','Inglês','Português','PlayStation 4','WB Games',219.91,'7892110220224','3 meses','Blu-Ray','mortal_kombat.png'),(4,'Resident Evil 2','Survival Horror','Não recomendado para menores de 18 anos','Inglês','Português','PlayStation 4','Capcom',158.31,'7892110219549','3 meses','Blu-Ray','resident_evil.jpg'),(5,'Marvel\'s Spider-Man','Ação/Aventura','Não recomendado para menores de 12 anos','Inglês/Português','Português','PlayStation 4','Playstation - Sony Brasil',149.51,'711719506102','3 meses','Blu-Ray','spider_man.jpg'),(6,'Red Dead Redemption ','Ação/Aventura','Livre para todos os públicos','Inglês','Português','PlayStation 4','Rockstar',158.31,'710425478963','3 meses','Blu-Ray','red_dead_redemption.png');
/*!40000 ALTER TABLE `tbl_jogos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_lojas`
--

DROP TABLE IF EXISTS `tbl_lojas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_lojas` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `endereco` varchar(60) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `estado` varchar(60) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `cep` varchar(10) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_lojas`
--

LOCK TABLES `tbl_lojas` WRITE;
/*!40000 ALTER TABLE `tbl_lojas` DISABLE KEYS */;
INSERT INTO `tbl_lojas` VALUES (1,'SmartGames Morumbi','Av. Roque Petroni Jr, 1089 - Lojas 63C e 63D - Piso Térreo','Morumbi','São Paulo','SP','(11) 5181-3170','04707-000'),(2,'SmartGames Eldorado','Av. Rebouças, 3970 - Lojas 237 e 238 - Piso 1','Pinheiros','São Paulo','SP','(11) 3030-9750','05402-600'),(3,'SmartGames Interlagos','Av. Interlagos, 2255 - Loja 61 - Piso Térreo','Pinheiros','São Paulo','SP','(11) 5564-8780','04661-200'),(4,'SmartGames Mooca','Rua Capitão Pacheco e Chaves, 313 - Loja 2043 - Piso L2','Mooca','São Paulo','SP','(11) 2915-2200','03126-000'),(5,'SmartGames Santana','Av. Conselheiro Moreira de Barros, 2780 - Loja 3032 - Piso 3','Santana','São Paulo','SP','(11) 3122-6670','02430-001'),(6,'SmartGames Center Norte','Travessa Casalbuono, 120 - Loja 414 - Piso Térreo','Vila Guilherme','São Paulo','SP','(11) 2089-6250','02047-050');
/*!40000 ALTER TABLE `tbl_lojas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-05 13:20:18
