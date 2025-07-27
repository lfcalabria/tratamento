use vendas_dimensional;
-- DROP TABLE statements (opcional, para limpar se as tabelas já existirem e você quiser recriá-las)
-- DROP TABLE IF EXISTS fat_item;
-- DROP TABLE IF EXISTS dim_cliente;
-- DROP TABLE IF EXISTS dim_vendedor;
-- DROP TABLE IF EXISTS dim_produto;
-- DROP TABLE IF EXISTS dim_categoria;
-- DROP TABLE IF EXISTS dim_transportadora;
-- DROP TABLE IF EXISTS dim_fornecedor;
-- DROP TABLE IF EXISTS dim_pais;
-- DROP TABLE IF EXISTS dim_tempo;

-- Tabela de Dimensão: dim_tempo
-- Armazena informações detalhadas sobre datas e períodos
CREATE TABLE dim_tempo (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    dia INT,
    mes INT,
    ano INT,
    data_juliana VARCHAR(45),
    semestre INT,
    quadrimestre INT,
    trimestre INT,
    bimestre INT,
    nome_mes VARCHAR(45),
    dia_da_semana INT,
    nome_dia_da_semana VARCHAR(45),
    semana_do_ano VARCHAR(45),
    data_string CHAR(10),
    dia_no_ano INT,
    ultimo_dia_mes INT,
    fim_de_semana TINYINT(1) -- TINYINT(1) é comum para booleanos (0 ou 1)
);

-- Tabela de Dimensão: dim_categoria
-- Armazena informações sobre as categorias de produtos
CREATE TABLE dim_categoria (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
	id_transacional BIGINT NOT NULL,
    categoria VARCHAR(200) NOT NULL
);

-- Tabela de Dimensão: dim_produto
-- Armazena informações detalhadas sobre os produtos
CREATE TABLE dim_produto (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
	id_transacional BIGINT NOT NULL,
    produto VARCHAR(200) NOT NULL,
    preco_unitario FLOAT,
    descontinuado TINYINT(1)
);

-- Tabela de Dimensão: dim_vendedor
-- Armazena informações sobre os vendedores
CREATE TABLE dim_vendedor (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
	id_transacional BIGINT NOT NULL,
    nome VARCHAR(200) NOT NULL,
    sexo_codigo CHAR(1),
    sexo_descricao VARCHAR(45),
    nascimento DATE,
    contrato DATE,
    supervisor VARCHAR(200) 
);

-- Tabela de Dimensão: dim_pais
-- Armazena informações sobre países
CREATE TABLE dim_pais (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
	id_transacional BIGINT NOT NULL,
    sigla CHAR(2) NOT NULL,
    pais VARCHAR(100) NOT NULL
);

-- Tabela de Dimensão: dim_cliente
-- Armazena informações sobre os clientes
CREATE TABLE dim_cliente (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
	id_transacional BIGINT NOT NULL,
    nome_cliente VARCHAR(200) NOT NULL,
	sexo_codigo CHAR(1),
    nacionalidade varchar(100), 
    sexo_descricao VARCHAR(45),
    profissao VARCHAR(200),
    email VARCHAR(400),
    provedor_do_cliente VARCHAR(45),
    nascimento DATE,
    cadastro DATE,
    endereco_completo VARCHAR(255),
    cod_nacionalidade VARCHAR(45)
);

-- Tabela de Dimensão: dim_transportadora
-- Armazena informações sobre as empresas transportadoras
CREATE TABLE dim_transportadora (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
	id_transacional BIGINT NOT NULL,
    transportadora VARCHAR(200) NOT NULL,
    contato VARCHAR(200)
);

-- Tabela de Dimensão: dim_fornecedor
-- Armazena informações sobre os fornecedores
CREATE TABLE dim_fornecedor (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
	id_transacional BIGINT NOT NULL,
    fornecedor VARCHAR(200) NOT NULL,
    contato VARCHAR(200)
);

-- Tabela Fato: fat_item
-- Armazena as métricas das vendas de itens e as chaves estrangeiras para as dimensões
CREATE TABLE fat_item (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    qtd_vendida INT NOT NULL,
    preco_unitario_na_venda FLOAT NOT NULL,
    valor_frete FLOAT,
    valor_desconto FLOAT,
    valor_comissao FLOAT,
    
    -- Chaves estrangeiras para a dimensão de tempo (diferentes eventos de tempo)
    id_tempo_pedido BIGINT NOT NULL,
    id_tempo_pagamento BIGINT,
    id_tempo_previsao BIGINT,
    id_tempo_envio BIGINT,
    id_tempo_entrega BIGINT,

    -- Chaves estrangeiras para outras dimensões
    id_cliente BIGINT NOT NULL,
    id_categoria BIGINT NOT NULL,
    id_produto BIGINT NOT NULL,
    id_vendedor BIGINT NOT NULL,
    id_transportadora BIGINT,
    id_fornecedor BIGINT,
    
    -- Chaves estrangeiras para dim_pais (diferentes contextos geográficos da transação)
    id_pais_origem_cliente BIGINT,       -- Pais de moradia/origem do cliente no momento da venda
    id_pais_nacionalidade_cliente BIGINT, -- Pais de nacionalidade do cliente no momento da venda
    id_pais_destino BIGINT,             -- Pais de destino do envio
    id_pais_transportadora BIGINT,      -- Pais da transportadora
    id_pais_vendedor BIGINT,            -- Pais do vendedor
    id_pais_fornecedor BIGINT,          -- Pais do fornecedor
    
    -- Restrições de Chave Estrangeira
    CONSTRAINT fk_item_tempo_pedido FOREIGN KEY (id_tempo_pedido) REFERENCES dim_tempo(id),
    CONSTRAINT fk_item_tempo_pagamento FOREIGN KEY (id_tempo_pagamento) REFERENCES dim_tempo(id),
    CONSTRAINT fk_item_tempo_previsao FOREIGN KEY (id_tempo_previsao) REFERENCES dim_tempo(id),
    CONSTRAINT fk_item_tempo_envio FOREIGN KEY (id_tempo_envio) REFERENCES dim_tempo(id),
    CONSTRAINT fk_item_tempo_entrega FOREIGN KEY (id_tempo_entrega) REFERENCES dim_tempo(id),
    
    CONSTRAINT fk_item_cliente FOREIGN KEY (id_cliente) REFERENCES dim_cliente(id),
    CONSTRAINT fk_item_categoria FOREIGN KEY (id_categoria) REFERENCES dim_categoria(id),
    CONSTRAINT fk_item_produto FOREIGN KEY (id_produto) REFERENCES dim_produto(id),
    CONSTRAINT fk_item_vendedor FOREIGN KEY (id_vendedor) REFERENCES dim_vendedor(id),
    CONSTRAINT fk_item_transportadora FOREIGN KEY (id_transportadora) REFERENCES dim_transportadora(id),
    CONSTRAINT fk_item_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES dim_fornecedor(id),
    
    CONSTRAINT fk_item_pais_origem_cliente FOREIGN KEY (id_pais_origem_cliente) REFERENCES dim_pais(id),
    CONSTRAINT fk_item_pais_nacionalidade_cliente FOREIGN KEY (id_pais_nacionalidade_cliente) REFERENCES dim_pais(id),
    CONSTRAINT fk_item_pais_destino FOREIGN KEY (id_pais_destino) REFERENCES dim_pais(id),
    CONSTRAINT fk_item_pais_transportadora FOREIGN KEY (id_pais_transportadora) REFERENCES dim_pais(id),
    CONSTRAINT fk_item_pais_vendedor FOREIGN KEY (id_pais_vendedor) REFERENCES dim_pais(id),
    CONSTRAINT fk_item_pais_fornecedor FOREIGN KEY (id_pais_fornecedor) REFERENCES dim_pais(id)
);