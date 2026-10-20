
DROP DATABASE IF EXISTS db_mercado;

CREATE DATABASE IF NOT EXISTS db_mercado;

USE db_mercado;

CREATE TABLE tb_usuario(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
    perfil ENUM ('gestor', 'operador') NOT NULL , 
    email VARCHAR(100) NOT NULL UNIQUE , 
    senha VARCHAR(100) NOT NULL ,
    esta_ativo TINYINT(1) NOT NULL DEFAULT 1
);

CREATE TABLE tb_produto(
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
	codigo_interno VARCHAR(100) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR (100) NOT NULL ,
    unidade_venda VARCHAR(100) NOT NULL,
    preco DECIMAL (5,2) NOT NULL,
    imagem VARCHAR(100),
    esta_ativo TINYINT(1) NOT NULL DEFAULT 1
);

CREATE TABLE tb_ocorrencia(
	id_ocorrencia INT PRIMARY KEY AUTO_INCREMENT,
	quantidade INT NOT NULL,
    diferenca DECIMAL (5,2) NOT NULL,
    data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    produto_correto INT NOT NULL,
    FOREIGN KEY (produto_correto)
    REFERENCES tb_produto(id_produto),
	produto_errado INT,
    FOREIGN KEY (produto_errado) 
    REFERENCES tb_produto(id_produto),
    usuario INT,
    FOREIGN KEY (usuario) 
    REFERENCES tb_usuario(id_usuario)
    
);

