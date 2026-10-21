-- DELETAR O BANCO DE DADOS
DROP DATABASE db_bercario;

-- CRIAR O BANCO DE DADOS
CREATE DATABASE db_bercario;

-- UTILIZAÇÃO DE UM BANCO ESPECÍFICO
USE db_bercario;

-- GERECIAMENTO DAS TABELAS

-- CRIAR A TABELA 
CREATE TABLE tb_usuario(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    dt_nasc DATE,
    email VARCHAR(100) NOT NULL UNIQUE, 
    senha VARCHAR(100) NOT NULL,
    qtd_esposas BIGINT,
    ativo TINYINT,
    altura DECIMAL(5,2)
);

-- ALTERAR ESTRUTURA DA TABELA

-- ADICIONAR UMA COLUNA
ALTER TABLE tb_usuario
ADD COLUMN tipo VARCHAR(15); 

-- REMOVER UMA COLUNA
ALTER TABLE tb_usuario
DROP COLUMN qtd_esposas;

-- EXCLUIR UMA TABELA 
DROP TABLE tb_usuario;

-- TABELES BERÇÁRIO
CREATE TABLE tb_mae(
	id_mae INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE tb_medico(
	id_medico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE tb_bebe(
	id_bebe INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    peso DECIMAL(5,2),
    dt_nasc DATE,
    altura INT,
	-- COLOCANDO CHAVE ESTRANGEIRA
    mae INT,
    FOREIGN KEY (mae) REFERENCES tb_mae(id_mae),
    medico INT,
    FOREIGN KEY (medico) REFERENCES tb_medico(id_medico)
);

-- CRUD DE DADOS
-- CRIAR 
INSERT INTO tb_usuario 
	(id_usuario, nome, dt_nasc, email, senha, ativo, altura, tipo)
VALUES
	(DEFAULT, "Cristiano Ronaldo", "1985-02-05", "cr7@gmail.com", "eusouomilior", 1, 1.87, "ADM");

-- READ - LER OS DADOS
SELECT *
	FROM tb_usuario;

-- UPDATE - ATUALIZAR
UPDATE tb_usuario -- ESCOLHE A TABELA
	SET email = "cristiano@gmail.com", senha = "cris&greg" -- COLOCA AS COLUNAS E NOVOS VALORES
		WHERE id_usuario = 1; -- FILTRA PELO ID. PARA QUE SÓ UM SEJA ATINGIDO
    
-- DELETE - EXCLUIR
DELETE FROM tb_usuario
	WHERE id_usuario = 1;


-- INSERIR 3 MÃES
INSERT INTO tb_mae
	(id_mae, nome)
VALUES
	(DEFAULT, "Ana Sousa"),
	(DEFAULT, "Paula Britto"),
	(DEFAULT, "Marcela Paes");

INSERT INTO tb_mae
	(id_mae, nome)
VALUES
	(DEFAULT, "Karla"),
	(DEFAULT, "Luana"),
	(DEFAULT, "Rochelle");

-- INSERIR 2 MÉDICOS
INSERT INTO tb_medico
	(id_medico, nome)
VALUES
	(DEFAULT, "Jean Lemos"),
	(DEFAULT, "Isadora Moura");
    
-- INSERIR 5 BEBÊS
INSERT INTO tb_bebe
	(id_bebe, nome, peso, dt_nasc, altura, mae, medico)
VALUES
	(DEFAULT, "Cris"  , 3.20, "2000-05-04", 62, 1, 1),
   	(DEFAULT, "Mateus", 2.75, "2012-05-15", 40, 2, 1),
	(DEFAULT, "Marcos", 2.50, "2005-08-09", 39, 3, 2),
	(DEFAULT, "Lucas" , 3.50, "2008-12-23", 45, 1, 2),
	(DEFAULT, "João"  , 2.99, "2056-05-30", 56, 3, 2);

-- JOIN 
-- JUNTANDO MÃES E BEBÊS
SELECT * 
	FROM tb_bebe AS b
JOIN
	tb_mae AS m
ON 
	b.mae = m.id_mae;

-- JUNTANDO FILTRANDO COLUNAS
SELECT b.nome AS 'Criança', m.nome AS "Mãe"
	FROM tb_bebe AS b
JOIN
	tb_mae AS m
ON 
	b.mae = m.id_mae;

-- JUNTANDO MÉDICOS E BEBÊS
SELECT * 
	FROM tb_bebe AS b
JOIN
	tb_medico AS med
ON 
	b.medico = med.id_medico;

-- JUNTANDO MÃES, BEBÊS E MÉDICOS
SELECT * 
	FROM tb_bebe AS b
JOIN
	tb_mae AS m
ON 
	b.mae = m.id_mae
JOIN
	tb_medico AS med
ON 
	b.medico = med.id_medico;

SELECT b.nome AS 'Criança', m.nome AS "Mãe", med.nome AS "Médico"
	FROM tb_bebe AS b
JOIN
	tb_mae AS m
ON 
	b.mae = m.id_mae
JOIN
	tb_medico AS med
ON 
	b.medico = med.id_medico;
