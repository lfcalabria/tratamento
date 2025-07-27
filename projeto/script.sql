CREATE DATABASE  IF NOT EXISTS `vendas_dimensional` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `vendas_dimensional`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: vendas_dimensional
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `dim_categoria`
--

DROP TABLE IF EXISTS `dim_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_categoria` (
  `id` bigint DEFAULT NULL,
  `idcategoria` bigint DEFAULT NULL,
  `nomecategoria` text,
  `descricaocategoria` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_cliente`
--

DROP TABLE IF EXISTS `dim_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_cliente` (
  `id` bigint DEFAULT NULL,
  `idcliente` bigint DEFAULT NULL,
  `nome` text,
  `sexo` text,
  `profissao` text,
  `documento` text,
  `nacionalidade` text,
  `email` text,
  `nascimento` date DEFAULT NULL,
  `telefone` text,
  `cartao_operadora` text,
  `cadastro` datetime DEFAULT NULL,
  `idlocalizacao` bigint DEFAULT NULL,
  `nomepaisnacionalidade` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_fornecedor`
--

DROP TABLE IF EXISTS `dim_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_fornecedor` (
  `id` bigint DEFAULT NULL,
  `idfornecedor` bigint DEFAULT NULL,
  `empresa` text,
  `contato` text,
  `telefone` text,
  `idlocalizacao` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_localizacao`
--

DROP TABLE IF EXISTS `dim_localizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_localizacao` (
  `id` bigint DEFAULT NULL,
  `endereco` text,
  `bairro` text,
  `cidade` text,
  `estado` text,
  `pais` text,
  `cep` text,
  `nomepais` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_produto`
--

DROP TABLE IF EXISTS `dim_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_produto` (
  `id` bigint DEFAULT NULL,
  `idproduto` bigint DEFAULT NULL,
  `produto` text,
  `precounitarioatual` double DEFAULT NULL,
  `unidadesemestoque` bigint DEFAULT NULL,
  `nivelminimo` bigint DEFAULT NULL,
  `descontinuado` bigint DEFAULT NULL,
  `unidadespedidas` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_tempo`
--

DROP TABLE IF EXISTS `dim_tempo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_tempo` (
  `id` bigint DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `ano` int DEFAULT NULL,
  `mes` int DEFAULT NULL,
  `semestre` int DEFAULT NULL,
  `dia` int DEFAULT NULL,
  `dia_do_ano` int DEFAULT NULL,
  `semana_do_ano` bigint DEFAULT NULL,
  `dia_da_semana` int DEFAULT NULL,
  `nome_dia` text,
  `nome_mes` text,
  `trimestre` int DEFAULT NULL,
  `fim_de_semana` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_transportadora`
--

DROP TABLE IF EXISTS `dim_transportadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_transportadora` (
  `id` bigint DEFAULT NULL,
  `idtransportadora` bigint DEFAULT NULL,
  `empresa` text,
  `contato` text,
  `telefone` text,
  `idlocalizacao` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_vendedor`
--

DROP TABLE IF EXISTS `dim_vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_vendedor` (
  `id` bigint DEFAULT NULL,
  `idvendedor` bigint DEFAULT NULL,
  `nome` text,
  `sexo` text,
  `documento` text,
  `email` text,
  `nascimento` date DEFAULT NULL,
  `telefone` text,
  `datacontrato` text,
  `idlocalizacao` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fat_item`
--

DROP TABLE IF EXISTS `fat_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fat_item` (
  `id` bigint DEFAULT NULL,
  `quantidadevendida` bigint DEFAULT NULL,
  `precovenda` double DEFAULT NULL,
  `percentualfrete` double DEFAULT NULL,
  `percentualdesconto` double DEFAULT NULL,
  `percentualcomissao` double DEFAULT NULL,
  `id_categoria` bigint DEFAULT NULL,
  `id_tempo_pedido` bigint DEFAULT NULL,
  `id_tempo_pagamento` double DEFAULT NULL,
  `id_tempo_previsao` double DEFAULT NULL,
  `id_tempo_envio` double DEFAULT NULL,
  `id_tempo_entrega` double DEFAULT NULL,
  `id_cliente` bigint DEFAULT NULL,
  `id_produto` bigint DEFAULT NULL,
  `id_vendedor_geral` bigint DEFAULT NULL,
  `id_vendedor_supervisor` double DEFAULT NULL,
  `id_transportadora` bigint DEFAULT NULL,
  `id_fornecedor` bigint DEFAULT NULL,
  `id_localizacao_destino` bigint DEFAULT NULL,
  `valortotal` double DEFAULT NULL,
  `valordesconto` double DEFAULT NULL,
  `valorliquido` double DEFAULT NULL,
  `valorcomissao` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-27 16:09:58
