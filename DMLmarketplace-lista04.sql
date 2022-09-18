CREATE DATABASE db_marketplace

USE db_marketplace


CREATE TABLE tb_usuarios (
	Id INT NOT NULL PRIMARY KEY,
	Nome VARCHAR (100) NOT NULL,
	Email VARCHAR (100) NOT NULL,
	Senha VARCHAR (100) NOT NULL,
	url_imagem VARCHAR (255) NULL,
);

CREATE TABLE tb_produtos(
	Id_produto INT NOT NULL PRIMARY KEY IDENTITY,
	Produto VARCHAR (100) NOT NULL,
	Descricao VARCHAR (200) NOT NULL,
	Valor FLOAT (20) NOT NULL,
	url_imagem VARCHAR (255) NULL,
	fk_criador INT NOT NULL,
	FOREIGN KEY (fk_criador) REFERENCES tb_usuarios (Id),
	fk_Categoria INT NOT NULL,
	FOREIGN KEY (fk_Categoria) REFERENCES tb_categorias (Id_categorias),
);

CREATE TABLE tb_categorias (
	Id_categorias INT NOT NULL PRIMARY KEY IDENTITY,
	Categoria VARCHAR (100) NOT NULL,
);

CREATE TABLE tb_compras (
	fk_usuario INT NOT NULL,
	FOREIGN KEY (fk_usuario) REFERENCES tb_usuarios (Id),
	fk_produto INT NOT NULL,
	FOREIGN KEY (fk_produto) REFERENCES tb_produtos (Id_produto),
	fk_categorias INT NOT NULL,
	FOREIGN KEY (fk_categorias) REFERENCES tb_categorias (Id_categorias),
	date_DATA VARCHAR (110) NULL
);

DROP TABLE tb_usuarios;

DROP TABLE tb_produtos;

DROP TABLE tb_compras;

DROP TABLE tb_categorias;

INSERT INTO tb_usuarios
VALUES
(1, 'THAINA', 'thaina@email.com', 'THAINA123', 'FOTO'),
(2, 'RAUL', 'raul@email.com', 'RAUL321', 'FOTO'),
(3, 'VINICIUS', 'vinicius@email.com', 'VINI123', 'FOTO'),
(4, 'JOHNNY', 'johnny@email.com', 'JOHNNY321', 'FOTO');

INSERT INTO tb_categorias
VALUES('ROUPAS'),
('VIAGENS'),
('UTENSÍLIOS');

INSERT INTO tb_produtos
VALUES('COLCHÃO DE AR', 'UM COLCHÃO DE AR PORTÁTIL E PRÁTICO', 229.90, 'IMGCOLCHÃO', 3, 2),
('VESTIDO VERÃO', 'VESTIDO REGATA DE TECIDO LEVE', 89.99, 'IMGVESTIDO', 1, 1),
('SUPORTE DE MESA PARA PANELAS', 'SUPORTE DE MADEIRA EM FORMATOS VARIADOS', 37.55, 'IMGSUPORTE', 4, 3),
('CALÇA FLAIR', 'CALÇA EM ELASTANO NA COR PRETA', 119.99, 'IMGCALCA', 2, 1);

SELECT Valor FROM tb_produtos
WHERE Valor BETWEEN 100 AND 300;

SELECT Categoria FROM tb_categorias
WHERE Categoria LIKE '%U%';

SELECT COUNT (*) AS TOTAL
FROM tb_produtos;

SELECT Valor FROM tb_produtos
GROUP BY Valor
ORDER BY Valor ASC;

SELECT * FROM tb_produtos LEFT JOIN tb_categorias ON Id_produto = Id_categorias;