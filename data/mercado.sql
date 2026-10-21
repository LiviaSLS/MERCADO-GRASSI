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


-- ÁREA DOS INSERTS 
-- 2 LOGINS DE USUARIOS - COM TIPOS DIFERENTES 
INSERT INTO tb_usuario 
	(id_usuario, nome, perfil, email, senha, esta-ativo, )
VALUES
	(DEFAULT, "livia sl ", "gestor", "libina@gmail.com", "dela0960", 1);

INSERT INTO tb_usuario 
	(id_usuario, nome, perfil, email, senha, esta-ativo, )
VALUES
	(DEFAULT, "Alcione da silva ", "operador", "alcione002@gmail.com", "alciloba", 1);
-- READ - LER OS DADOS
SELECT *
	FROM tb_usuario;

-- 4 PRODUTOS - VERDURA, FRUTA ,E LEGUME
 -- KILO 'KG' E GRAMA 'G'
 INSERT INTO tb_produto
	(id_produto, codigo_interno , nome, categoria, unidade_venda ,  preco , imagem , esta_ativo)
VALUES
	(DEFAULT, "vr-009","Cenoura ", "verdura ", "5 reais o kilo ", "5.00", "não tem ", 1),
	(DEFAULT, "ft-008", "Banana","Fruta","10" , "7.00 reais o kilo ", "não tem ", 1),
	(DEFAULT, "lg-007", "Cebola", "legume", "20", "2.00 50 gramas ", "não tem ", 1 );
 
 
 -- 3 OCORRÊNCIAS
 
 
 -- JOIN COM TODAS AS INFORMAÇÕES JUNTAS DE OCORRÊNCIAS , COM RESPECTIVAS REFER