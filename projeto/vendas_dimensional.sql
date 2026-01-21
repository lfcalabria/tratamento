CREATE DATABASE  IF NOT EXISTS vendas_dimensional;
USE vendas_dimensional;

DROP TABLE IF EXISTS dim_categoria;
CREATE TABLE dim_categoria (
  id bigint NOT NULL AUTO_INCREMENT,
  idtransacional bigint NOT NULL,
  categoria varchar(200) NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS dim_cliente;
CREATE TABLE dim_cliente (
  id bigint NOT NULL AUTO_INCREMENT,
  idtransacional bigint NOT NULL,
  nome varchar(200) NOT NULL,
  sexocodigo char(1) DEFAULT NULL,
  sexodescricao varchar(45) DEFAULT NULL,
  siglanacionalidade varchar(45) DEFAULT NULL,
  nacionalidade varchar(100) DEFAULT NULL,
  profissao varchar(200) DEFAULT NULL,
  email varchar(400) DEFAULT NULL,
  provedordocliente varchar(45) DEFAULT NULL,
  nascimento date DEFAULT NULL,
  cadastro date DEFAULT NULL,
  enderecocompleto varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS dim_fornecedor;
CREATE TABLE dim_fornecedor (
  id bigint NOT NULL AUTO_INCREMENT,
  idtransacional bigint NOT NULL,
  fornecedor varchar(200) NOT NULL,
  contato varchar(200) DEFAULT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS dim_pais;
CREATE TABLE dim_pais (
  id bigint NOT NULL AUTO_INCREMENT,
  idtransacional bigint NOT NULL,
  sigla char(2) NOT NULL,
  sigla3 char(3) NOT NULL,
  pais varchar(100) NOT NULL,
  nomeinternacional varchar(100) DEFAULT NULL,
  continente varchar(100) DEFAULT NULL,
  regiao varchar(100) DEFAULT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS dim_pedido;
CREATE TABLE dim_pedido (
  id bigint NOT NULL,
  idtransacional bigint NOT NULL,
  numerodopedido bigint NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE (id)
);

DROP TABLE IF EXISTS dim_produto;
CREATE TABLE dim_produto (
  id bigint NOT NULL AUTO_INCREMENT,
  idtransacional bigint NOT NULL,
  produto varchar(200) NOT NULL,
  precounitario float DEFAULT NULL,
  descontinuado tinyint(1) DEFAULT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS dim_tempo;
CREATE TABLE dim_tempo (
  id bigint NOT NULL AUTO_INCREMENT,
  data date NOT NULL,
  dia int DEFAULT NULL,
  mes int DEFAULT NULL,
  ano int DEFAULT NULL,
  data_juliana varchar(45) DEFAULT NULL,
  semestre int DEFAULT NULL,
  quadrimestre int DEFAULT NULL,
  trimestre int DEFAULT NULL,
  bimestre int DEFAULT NULL,
  nome_mes varchar(45) DEFAULT NULL,
  dia_da_semana int DEFAULT NULL,
  nome_dia_da_semana varchar(45) DEFAULT NULL,
  semana_do_ano varchar(45) DEFAULT NULL,
  data_string char(10) DEFAULT NULL,
  dia_no_ano int DEFAULT NULL,
  ultimo_dia_mes int DEFAULT NULL,
  fim_de_semana tinyint(1) DEFAULT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS dim_transportadora;
CREATE TABLE dim_transportadora (
  id bigint NOT NULL AUTO_INCREMENT,
  idtransacional bigint NOT NULL,
  transportadora varchar(200) NOT NULL,
  contato varchar(200) DEFAULT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS dim_vendedor;
CREATE TABLE dim_vendedor (
  id bigint NOT NULL AUTO_INCREMENT,
  idtransacional bigint NOT NULL,
  nome varchar(200) NOT NULL,
  sexocodigo char(1) DEFAULT NULL,
  sexodescricao varchar(45) DEFAULT NULL,
  nascimento date DEFAULT NULL,
  contrato date DEFAULT NULL,
  supervisor varchar(200) DEFAULT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS fat_item;
CREATE TABLE fat_item (
  id bigint NOT NULL AUTO_INCREMENT,
  qtdvendida int NOT NULL,
  precounitarionavenda float NOT NULL,
  valorfrete float DEFAULT NULL,
  valordesconto float DEFAULT NULL,
  valorcomissao float DEFAULT NULL,
  idtempopedido bigint NOT NULL,
  idtempopagamento bigint DEFAULT NULL,
  idtempoprevisao bigint DEFAULT NULL,
  idtempoenvio bigint DEFAULT NULL,
  idtempoentrega bigint DEFAULT NULL,
  idcliente bigint NOT NULL,
  idcategoria bigint NOT NULL,
  idproduto bigint NOT NULL,
  idvendedor bigint NOT NULL,
  idtransportadora bigint DEFAULT NULL,
  idpedido bigint NOT NULL,
  idfornecedor bigint DEFAULT NULL,
  idpaisorigemcliente bigint DEFAULT NULL,
  idpaisnacionalidadecliente bigint DEFAULT NULL,
  idpaisdestino bigint DEFAULT NULL,
  idpaistransportadora bigint DEFAULT NULL,
  idpaisvendedor bigint DEFAULT NULL,
  idpaisfornecedor bigint DEFAULT NULL,
  PRIMARY KEY (id)
);
ALTER TABLE fat_item
ADD CONSTRAINT fj_item_pedido FOREIGN KEY (idpedido) REFERENCES dim_pedido (id);
ALTER TABLE fat_item
ADD CONSTRAINT fk_item_categoria FOREIGN KEY (idcategoria) REFERENCES dim_categoria (id);
ALTER TABLE fat_item
ADD CONSTRAINT fk_item_cliente FOREIGN KEY (idcliente) REFERENCES dim_cliente (id);
ALTER TABLE fat_item
ADD CONSTRAINT fk_item_fornecedor FOREIGN KEY (idfornecedor) REFERENCES dim_fornecedor (id);
ALTER TABLE fat_item
ADD CONSTRAINT fk_item_pais_destino FOREIGN KEY (idpaisdestino) REFERENCES dim_pais (id);
ALTER TABLE fat_item
ADD CONSTRAINT fk_item_pais_fornecedor FOREIGN KEY (idpaisfornecedor) REFERENCES dim_pais (id);
ALTER TABLE fat_item
ADD CONSTRAINT fk_item_pais_nacionalidade_cliente FOREIGN KEY (idpaisnacionalidadecliente) REFERENCES dim_pais (id);
ALTER TABLE fat_item
ADD CONSTRAINT fk_item_pais_origem_cliente FOREIGN KEY (idpaisorigemcliente) REFERENCES dim_pais (id);
ALTER TABLE fat_item
ADD CONSTRAINT fk_item_pais_transportadora FOREIGN KEY (idpaistransportadora) REFERENCES dim_pais (id);
ALTER TABLE fat_item
ADD CONSTRAINT fk_item_pais_vendedor FOREIGN KEY (idpaisvendedor) REFERENCES dim_pais (id);
ALTER TABLE fat_item
ADD CONSTRAINT fk_item_produto FOREIGN KEY (idproduto) REFERENCES dim_produto (id);
ALTER TABLE fat_item
ADD CONSTRAINT fk_item_tempo_entrega FOREIGN KEY (idtempoentrega) REFERENCES dim_tempo (id);
ALTER TABLE fat_item
ADD CONSTRAINT fk_item_tempo_envio FOREIGN KEY (idtempoenvio) REFERENCES dim_tempo (id);
ALTER TABLE fat_item
ADD CONSTRAINT fk_item_tempo_pagamento FOREIGN KEY (idtempopagamento) REFERENCES dim_tempo (id);
ALTER TABLE fat_item
ADD CONSTRAINT fk_item_tempo_pedido FOREIGN KEY (idtempopedido) REFERENCES dim_tempo (id);
ALTER TABLE fat_item
ADD CONSTRAINT fk_item_tempo_previsao FOREIGN KEY (idtempoprevisao) REFERENCES dim_tempo (id);
ALTER TABLE fat_item
ADD CONSTRAINT fk_item_transportadora FOREIGN KEY (idtransportadora) REFERENCES dim_transportadora (id);
ALTER TABLE fat_item
ADD CONSTRAINT fk_item_vendedor FOREIGN KEY (idvendedor) REFERENCES dim_vendedor (id);
