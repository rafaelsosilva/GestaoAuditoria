CREATE DATABASE  IF NOT EXISTS `GADEV` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `GADEV`;
-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: 15.229.117.46    Database: GADEV
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `TBL_APONTAMENTO`
--

DROP TABLE IF EXISTS `TBL_APONTAMENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_APONTAMENTO` (
  `ID_APONTAMENTO` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO_APONTAMENTO` varchar(100) NOT NULL,
  `DATA_REGISTRO` varchar(100) NOT NULL,
  `RISCO` varchar(100) NOT NULL,
  `STATUS` varchar(100) NOT NULL,
  `ID_PLANO_ACAO` int NOT NULL,
  PRIMARY KEY (`ID_APONTAMENTO`),
  KEY `ID_PLANO_ACAO` (`ID_PLANO_ACAO`),
  CONSTRAINT `TBL_APONTAMENTO_ibfk_1` FOREIGN KEY (`ID_PLANO_ACAO`) REFERENCES `TBL_PLANO_ACAO` (`ID_PLANO_ACAO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_APONTAMENTO`
--

LOCK TABLES `TBL_APONTAMENTO` WRITE;
/*!40000 ALTER TABLE `TBL_APONTAMENTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_APONTAMENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_AREA`
--

DROP TABLE IF EXISTS `TBL_AREA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_AREA` (
  `ID_AREA` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO_AREA` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_AREA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_AREA`
--

LOCK TABLES `TBL_AREA` WRITE;
/*!40000 ALTER TABLE `TBL_AREA` DISABLE KEYS */;
INSERT INTO `TBL_AREA` VALUES (1,'AUDITORIA');
/*!40000 ALTER TABLE `TBL_AREA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_AUDITORIA`
--

DROP TABLE IF EXISTS `TBL_AUDITORIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_AUDITORIA` (
  `ID_AUDITORIA` int NOT NULL AUTO_INCREMENT,
  `NOME_AUDITORIA` varchar(100) NOT NULL,
  `DATA_INICIO` varchar(100) DEFAULT NULL,
  `DATA_FIM` varchar(100) DEFAULT NULL,
  `ANO` varchar(100) NOT NULL,
  `ID_RESPONSAVEL` int NOT NULL,
  PRIMARY KEY (`ID_AUDITORIA`),
  KEY `ID_RESPONSAVEL` (`ID_RESPONSAVEL`),
  CONSTRAINT `TBL_AUDITORIA_ibfk_1` FOREIGN KEY (`ID_RESPONSAVEL`) REFERENCES `TBL_COLABORADOR` (`ID_COLABORADOR`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_AUDITORIA`
--

LOCK TABLES `TBL_AUDITORIA` WRITE;
/*!40000 ALTER TABLE `TBL_AUDITORIA` DISABLE KEYS */;
INSERT INTO `TBL_AUDITORIA` VALUES (1,'GESTAO DE IDENTIDADE E ACESSOS','01/01/2024','01/04/2024','2024',2),(2,'DEVSECOPS','01/01/2024','01/04/2024','2024',2);
/*!40000 ALTER TABLE `TBL_AUDITORIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_AUDITORIA_APONTAMENTO`
--

DROP TABLE IF EXISTS `TBL_AUDITORIA_APONTAMENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_AUDITORIA_APONTAMENTO` (
  `ID_AUDITORIA_APONTAMENTO` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID_AUDITORIA_APONTAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_AUDITORIA_APONTAMENTO`
--

LOCK TABLES `TBL_AUDITORIA_APONTAMENTO` WRITE;
/*!40000 ALTER TABLE `TBL_AUDITORIA_APONTAMENTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_AUDITORIA_APONTAMENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_AUDITORIA_CHECKPOINT`
--

DROP TABLE IF EXISTS `TBL_AUDITORIA_CHECKPOINT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_AUDITORIA_CHECKPOINT` (
  `ID_AUDITORIA_CHECKPOINT` int NOT NULL AUTO_INCREMENT,
  `ID_AUDITORIA` int NOT NULL,
  `ID_CHECKPOINT` int NOT NULL,
  PRIMARY KEY (`ID_AUDITORIA_CHECKPOINT`),
  KEY `ID_AUDITORIA` (`ID_AUDITORIA`),
  KEY `ID_CHECKPOINT` (`ID_CHECKPOINT`),
  CONSTRAINT `TBL_AUDITORIA_CHECKPOINT_ibfk_1` FOREIGN KEY (`ID_AUDITORIA`) REFERENCES `TBL_AUDITORIA` (`ID_AUDITORIA`),
  CONSTRAINT `TBL_AUDITORIA_CHECKPOINT_ibfk_2` FOREIGN KEY (`ID_CHECKPOINT`) REFERENCES `TBL_CHECKPOINT` (`ID_CHECKPOINT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_AUDITORIA_CHECKPOINT`
--

LOCK TABLES `TBL_AUDITORIA_CHECKPOINT` WRITE;
/*!40000 ALTER TABLE `TBL_AUDITORIA_CHECKPOINT` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_AUDITORIA_CHECKPOINT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_AUDITORIA_MATRIZ`
--

DROP TABLE IF EXISTS `TBL_AUDITORIA_MATRIZ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_AUDITORIA_MATRIZ` (
  `ID_AUDITORIA_MATRIZ` int NOT NULL AUTO_INCREMENT,
  `ID_AUDITORIA` int NOT NULL,
  `ID_MATRIZ_RISCO` int NOT NULL,
  PRIMARY KEY (`ID_AUDITORIA_MATRIZ`),
  KEY `ID_AUDITORIA` (`ID_AUDITORIA`),
  KEY `ID_MATRIZ_RISCO` (`ID_MATRIZ_RISCO`),
  CONSTRAINT `TBL_AUDITORIA_MATRIZ_ibfk_1` FOREIGN KEY (`ID_AUDITORIA`) REFERENCES `TBL_AUDITORIA` (`ID_AUDITORIA`),
  CONSTRAINT `TBL_AUDITORIA_MATRIZ_ibfk_2` FOREIGN KEY (`ID_MATRIZ_RISCO`) REFERENCES `TBL_MATRIZ_RISCO` (`ID_MATRIZ_RISCO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_AUDITORIA_MATRIZ`
--

LOCK TABLES `TBL_AUDITORIA_MATRIZ` WRITE;
/*!40000 ALTER TABLE `TBL_AUDITORIA_MATRIZ` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_AUDITORIA_MATRIZ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_AUDITORIA_RELATORIO`
--

DROP TABLE IF EXISTS `TBL_AUDITORIA_RELATORIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_AUDITORIA_RELATORIO` (
  `ID_AUDITORIA_RELATORIO` int NOT NULL AUTO_INCREMENT,
  `ID_AUDITORIA` int NOT NULL,
  `ID_RELATORIO` int NOT NULL,
  PRIMARY KEY (`ID_AUDITORIA_RELATORIO`),
  KEY `ID_AUDITORIA` (`ID_AUDITORIA`),
  KEY `ID_RELATORIO` (`ID_RELATORIO`),
  CONSTRAINT `TBL_AUDITORIA_RELATORIO_ibfk_1` FOREIGN KEY (`ID_AUDITORIA`) REFERENCES `TBL_AUDITORIA` (`ID_AUDITORIA`),
  CONSTRAINT `TBL_AUDITORIA_RELATORIO_ibfk_2` FOREIGN KEY (`ID_RELATORIO`) REFERENCES `TBL_RELATORIO` (`ID_RELATORIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_AUDITORIA_RELATORIO`
--

LOCK TABLES `TBL_AUDITORIA_RELATORIO` WRITE;
/*!40000 ALTER TABLE `TBL_AUDITORIA_RELATORIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_AUDITORIA_RELATORIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_AUDITORIA_TESTE`
--

DROP TABLE IF EXISTS `TBL_AUDITORIA_TESTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_AUDITORIA_TESTE` (
  `ID_AUDITORIA_TESTE` int NOT NULL AUTO_INCREMENT,
  `ID_AUDITORIA` int NOT NULL,
  `ID_TESTE` int NOT NULL,
  PRIMARY KEY (`ID_AUDITORIA_TESTE`),
  KEY `ID_AUDITORIA` (`ID_AUDITORIA`),
  KEY `ID_TESTE` (`ID_TESTE`),
  CONSTRAINT `TBL_AUDITORIA_TESTE_ibfk_1` FOREIGN KEY (`ID_AUDITORIA`) REFERENCES `TBL_AUDITORIA` (`ID_AUDITORIA`),
  CONSTRAINT `TBL_AUDITORIA_TESTE_ibfk_2` FOREIGN KEY (`ID_TESTE`) REFERENCES `TBL_TESTE` (`ID_TESTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_AUDITORIA_TESTE`
--

LOCK TABLES `TBL_AUDITORIA_TESTE` WRITE;
/*!40000 ALTER TABLE `TBL_AUDITORIA_TESTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_AUDITORIA_TESTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_AUDITORIA_WALKTHROUGH`
--

DROP TABLE IF EXISTS `TBL_AUDITORIA_WALKTHROUGH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_AUDITORIA_WALKTHROUGH` (
  `ID_AUDITORIA_WALKTHROUGH` int NOT NULL AUTO_INCREMENT,
  `ID_AUDITORIA` int NOT NULL,
  `ID_WALKTHROUGH` int NOT NULL,
  PRIMARY KEY (`ID_AUDITORIA_WALKTHROUGH`),
  KEY `ID_AUDITORIA` (`ID_AUDITORIA`),
  KEY `ID_WALKTHROUGH` (`ID_WALKTHROUGH`),
  CONSTRAINT `TBL_AUDITORIA_WALKTHROUGH_ibfk_1` FOREIGN KEY (`ID_AUDITORIA`) REFERENCES `TBL_AUDITORIA` (`ID_AUDITORIA`),
  CONSTRAINT `TBL_AUDITORIA_WALKTHROUGH_ibfk_2` FOREIGN KEY (`ID_WALKTHROUGH`) REFERENCES `TBL_WALKTHROUGH` (`ID_WALKTHROUGH`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_AUDITORIA_WALKTHROUGH`
--

LOCK TABLES `TBL_AUDITORIA_WALKTHROUGH` WRITE;
/*!40000 ALTER TABLE `TBL_AUDITORIA_WALKTHROUGH` DISABLE KEYS */;
INSERT INTO `TBL_AUDITORIA_WALKTHROUGH` VALUES (1,2,1);
/*!40000 ALTER TABLE `TBL_AUDITORIA_WALKTHROUGH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_CARGO`
--

DROP TABLE IF EXISTS `TBL_CARGO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_CARGO` (
  `ID_CARGO` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO_CARGO` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_CARGO`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_CARGO`
--

LOCK TABLES `TBL_CARGO` WRITE;
/*!40000 ALTER TABLE `TBL_CARGO` DISABLE KEYS */;
INSERT INTO `TBL_CARGO` VALUES (1,'AUDITOR JR'),(2,'AUDITOR PLENO'),(3,'AUDITOR SENIOR'),(4,'GERENTE'),(5,'SUPERINTENDENTE'),(6,'SUPERINTENDENTE GERAL'),(7,'SUPERINTENDENTE EXECUTIVO'),(8,'DIRETOR'),(9,'ESPECIALISTA I'),(10,'ESPECIALISTA II'),(11,'COORDENADOR');
/*!40000 ALTER TABLE `TBL_CARGO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_CHECKPOINT`
--

DROP TABLE IF EXISTS `TBL_CHECKPOINT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_CHECKPOINT` (
  `ID_CHECKPOINT` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO_CHECKPOINT` varchar(100) NOT NULL,
  `ID_TIPO_CHECKPOINT` int NOT NULL,
  PRIMARY KEY (`ID_CHECKPOINT`),
  KEY `ID_TIPO_CHECKPOINT` (`ID_TIPO_CHECKPOINT`),
  CONSTRAINT `TBL_CHECKPOINT_ibfk_1` FOREIGN KEY (`ID_TIPO_CHECKPOINT`) REFERENCES `TBL_TIPO_CHECKPOINT` (`ID_TIPO_CHECKPOINT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_CHECKPOINT`
--

LOCK TABLES `TBL_CHECKPOINT` WRITE;
/*!40000 ALTER TABLE `TBL_CHECKPOINT` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_CHECKPOINT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_COLABORADOR`
--

DROP TABLE IF EXISTS `TBL_COLABORADOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_COLABORADOR` (
  `ID_COLABORADOR` int NOT NULL AUTO_INCREMENT,
  `NOME_COLABORADOR` varchar(100) NOT NULL,
  `STATUS` varchar(100) NOT NULL,
  `ID_CARGO` int NOT NULL,
  `ID_AREA` int NOT NULL,
  PRIMARY KEY (`ID_COLABORADOR`),
  KEY `ID_CARGO` (`ID_CARGO`),
  KEY `ID_AREA` (`ID_AREA`),
  CONSTRAINT `TBL_COLABORADOR_ibfk_1` FOREIGN KEY (`ID_CARGO`) REFERENCES `TBL_CARGO` (`ID_CARGO`),
  CONSTRAINT `TBL_COLABORADOR_ibfk_2` FOREIGN KEY (`ID_AREA`) REFERENCES `TBL_AREA` (`ID_AREA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_COLABORADOR`
--

LOCK TABLES `TBL_COLABORADOR` WRITE;
/*!40000 ALTER TABLE `TBL_COLABORADOR` DISABLE KEYS */;
INSERT INTO `TBL_COLABORADOR` VALUES (2,'RAFAEL SOUZA SILVA','ATIVO',3,1);
/*!40000 ALTER TABLE `TBL_COLABORADOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_MATRIZ_RISCO`
--

DROP TABLE IF EXISTS `TBL_MATRIZ_RISCO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_MATRIZ_RISCO` (
  `ID_MATRIZ_RISCO` int NOT NULL AUTO_INCREMENT,
  `DATA_REGISTRO` varchar(100) NOT NULL,
  `DATA_REVISAO` varchar(100) NOT NULL,
  `ARQUIVO` blob NOT NULL,
  PRIMARY KEY (`ID_MATRIZ_RISCO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_MATRIZ_RISCO`
--

LOCK TABLES `TBL_MATRIZ_RISCO` WRITE;
/*!40000 ALTER TABLE `TBL_MATRIZ_RISCO` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_MATRIZ_RISCO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_PLANO_ACAO`
--

DROP TABLE IF EXISTS `TBL_PLANO_ACAO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_PLANO_ACAO` (
  `ID_PLANO_ACAO` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO_PLANO_ACAO` varchar(100) NOT NULL,
  `DATA_REGISTRO` varchar(100) NOT NULL,
  `DATA_CONCLUSAO` varchar(100) NOT NULL,
  `STATUS` varchar(100) NOT NULL,
  `ID_PRORROGACAO` int NOT NULL,
  PRIMARY KEY (`ID_PLANO_ACAO`),
  KEY `ID_PRORROGACAO` (`ID_PRORROGACAO`),
  CONSTRAINT `TBL_PLANO_ACAO_ibfk_1` FOREIGN KEY (`ID_PRORROGACAO`) REFERENCES `TBL_PRORROGACAO` (`ID_PRORROGACAO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_PLANO_ACAO`
--

LOCK TABLES `TBL_PLANO_ACAO` WRITE;
/*!40000 ALTER TABLE `TBL_PLANO_ACAO` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_PLANO_ACAO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_PRORROGACAO`
--

DROP TABLE IF EXISTS `TBL_PRORROGACAO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_PRORROGACAO` (
  `ID_PRORROGACAO` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO_PRORROGACAO` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_PRORROGACAO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_PRORROGACAO`
--

LOCK TABLES `TBL_PRORROGACAO` WRITE;
/*!40000 ALTER TABLE `TBL_PRORROGACAO` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_PRORROGACAO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_RELATORIO`
--

DROP TABLE IF EXISTS `TBL_RELATORIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_RELATORIO` (
  `ID_RELATORIO` int NOT NULL AUTO_INCREMENT,
  `DATA_EMISSAO` varchar(100) NOT NULL,
  `RISCO` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_RELATORIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_RELATORIO`
--

LOCK TABLES `TBL_RELATORIO` WRITE;
/*!40000 ALTER TABLE `TBL_RELATORIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_RELATORIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_TESTE`
--

DROP TABLE IF EXISTS `TBL_TESTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_TESTE` (
  `ID_TESTE` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO_TESTE` varchar(100) NOT NULL,
  `EVIDENCIA` blob,
  `DATA_REGISTRO` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_TESTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_TESTE`
--

LOCK TABLES `TBL_TESTE` WRITE;
/*!40000 ALTER TABLE `TBL_TESTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_TESTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_TIPO_CHECKPOINT`
--

DROP TABLE IF EXISTS `TBL_TIPO_CHECKPOINT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_TIPO_CHECKPOINT` (
  `ID_TIPO_CHECKPOINT` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO_TIPO_CHECKPOINT` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_TIPO_CHECKPOINT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_TIPO_CHECKPOINT`
--

LOCK TABLES `TBL_TIPO_CHECKPOINT` WRITE;
/*!40000 ALTER TABLE `TBL_TIPO_CHECKPOINT` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_TIPO_CHECKPOINT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_WALKTHROUGH`
--

DROP TABLE IF EXISTS `TBL_WALKTHROUGH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_WALKTHROUGH` (
  `ID_WALKTHROUGH` int NOT NULL AUTO_INCREMENT,
  `DESCRICAO_WALKTHROUGH` varchar(100) NOT NULL,
  `ID_AUDITOR` int NOT NULL,
  `DATA_CRIACAO` varchar(100) NOT NULL,
  `ID_REVISOR` int DEFAULT NULL,
  `DATA_REVISAO` varchar(100) DEFAULT NULL,
  `CONCLUSAO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_WALKTHROUGH`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_WALKTHROUGH`
--

LOCK TABLES `TBL_WALKTHROUGH` WRITE;
/*!40000 ALTER TABLE `TBL_WALKTHROUGH` DISABLE KEYS */;
INSERT INTO `TBL_WALKTHROUGH` VALUES (1,'ANALISE DE REVISAO DE ACESSO',2,'2024-03-31 04:23:49',NULL,NULL,NULL);
/*!40000 ALTER TABLE `TBL_WALKTHROUGH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'GADEV'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_ADD_AREA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SP_ADD_AREA`(P_DESCRICAO_AREA VARCHAR(100))
BEGIN
INSERT INTO TBL_AREA (DESCRICAO_AREA) VALUES (P_DESCRICAO_AREA);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ADD_AUDITORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SP_ADD_AUDITORIA`(

P_NOME_AUDITORIA VARCHAR (100)
,P_DATA_INICIO VARCHAR (10)
,P_DATA_FIM VARCHAR (10)
,P_ANO VARCHAR (4)
,P_NOME_RESPONSAVEL VARCHAR (100)

)
BEGIN

DECLARE P_ID_RESPONSAVEL INT DEFAULT 0;

SELECT ID_COLABORADOR INTO P_ID_RESPONSAVEL 
FROM GADEV.TBL_COLABORADOR 
WHERE NOME_COLABORADOR = P_NOME_RESPONSAVEL;

INSERT INTO GADEV.TBL_AUDITORIA
(NOME_AUDITORIA, DATA_INICIO, DATA_FIM, ANO, ID_RESPONSAVEL)
VALUES
(P_NOME_AUDITORIA, P_DATA_INICIO, P_DATA_FIM, P_ANO, P_ID_RESPONSAVEL);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ADD_CARGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SP_ADD_CARGO`(P_DESCRICAO_CARGO VARCHAR(100))
BEGIN
INSERT INTO TBL_CARGO (DESCRICAO_CARGO) VALUES (P_DESCRICAO_CARGO);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ADD_COLABORADOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SP_ADD_COLABORADOR`(
P_NOME_COLABORADOR VARCHAR (100)
,P_STATUS VARCHAR (100)
,P_DESCRICAO_CARGO VARCHAR (100)
,P_DESCRICAO_AREA VARCHAR (100)
)
BEGIN

DECLARE P_ID_CARGO INT DEFAULT 0;
DECLARE P_ID_AREA INT DEFAULT 0;

SELECT ID_CARGO INTO P_ID_CARGO FROM GADEV.TBL_CARGO WHERE DESCRICAO_CARGO = P_DESCRICAO_CARGO;
SELECT ID_AREA INTO P_ID_AREA FROM GADEV.TBL_AREA WHERE DESCRICAO_AREA = P_DESCRICAO_AREA;

INSERT INTO GADEV.TBL_COLABORADOR 
(NOME_COLABORADOR,STATUS,ID_CARGO,ID_AREA)
VALUES
(P_NOME_COLABORADOR,P_STATUS,P_ID_CARGO,P_ID_AREA);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ADD_WALKTHROUGH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `SP_ADD_WALKTHROUGH`(
 P_DESCRICAO_WALKTHROUGH VARCHAR (100)
,P_NOME_AUDITORIA VARCHAR (100)
,P_NOME_AUDITOR VARCHAR (100)
)
BEGIN

DECLARE P_ID_WALKTHROUGH INT DEFAULT 0;
DECLARE P_ID_AUDITORIA INT DEFAULT 0;
DECLARE P_ID_AUDITOR INT DEFAULT 0;

SELECT ID_AUDITORIA INTO P_ID_AUDITORIA
FROM GADEV.TBL_AUDITORIA
WHERE NOME_AUDITORIA = P_NOME_AUDITORIA;

SELECT ID_COLABORADOR INTO P_ID_AUDITOR
FROM GADEV.TBL_COLABORADOR
WHERE NOME_COLABORADOR = P_NOME_AUDITOR;

INSERT INTO TBL_WALKTHROUGH 
(DESCRICAO_WALKTHROUGH,ID_AUDITOR,DATA_CRIACAO)
 VALUES 
 (P_DESCRICAO_WALKTHROUGH,P_ID_AUDITOR,NOW());
 
SELECT MAX(ID_WALKTHROUGH) INTO P_ID_WALKTHROUGH FROM GADEV.TBL_WALKTHROUGH;
 
INSERT INTO TBL_AUDITORIA_WALKTHROUGH (ID_AUDITORIA,ID_WALKTHROUGH) VALUES (P_ID_AUDITORIA,P_ID_WALKTHROUGH);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-31  1:31:10
