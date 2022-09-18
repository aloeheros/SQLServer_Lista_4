CREATE DATABASE db_redes_sociais

USE db_redes_sociais

CREATE TABLE tb_usuarios (
	Id_usuarios INT NOT NULL PRIMARY KEY,
	Nome VARCHAR (100) NOT NULL,
	Usuario VARCHAR (100) NOT NULL,
	Senha VARCHAR (100) NOT NULL,
	url_foto VARCHAR (255) NULL,
);

CREATE TABLE tb_postagens (
	Id_postagem INT NOT NULL PRIMARY KEY IDENTITY,
	titulo VARCHAR (100) NOT NULL,
	descricao VARCHAR (100) NULL,
	url_imagem VARCHAR (255) NULL,
	data_postagem DATE NOT NULL,
	fk_criador INT NOT NULL,
	fk_grupo INT NOT NULL,
	FOREIGN KEY (fk_criador) REFERENCES tb_usuarios (Id_usuarios),
	FOREIGN KEY (fk_grupo) REFERENCES tb_grupos (Id_grupos),
);

CREATE TABLE tb_grupos (
	Id_grupos INT NOT NULL PRIMARY KEY IDENTITY,
	grupo VARCHAR (100) NOT NULL,
	descricao VARCHAR (100) NOT NULL,
	url_imagem VARCHAR (255) NULL,
	fk_grupo INT NOT NULL,
	fk_criador INT NOT NULL,
	FOREIGN KEY (fk_criador) REFERENCES tb_usuarios (Id_usuarios),
);

CREATE TABLE tb_inscritos(
	fk_usuarios INT NOT NULL,
	FOREIGN KEY (fk_usuarios) REFERENCES tb_usuarios (Id_usuarios),
	fk_grupo INT NOT NULL,
	FOREIGN KEY (fk_grupo) REFERENCES tb_grupos (Id_grupos),
);

INSERT INTO tb_usuarios
VALUES
(1, 'AMANDA', 'AMANDINHA', 'AMANDA123', 'FOTOAMANDA'),
(2, 'FABIO', 'FABINHOIKI', 'FABINHO321', 'FOTOFABIO'),
(3, 'NICKOLAS', 'NICKTOLEDO', 'NICK123', 'FOTONICK'),
(4, 'JOHNNY', 'JOHNNYMARCELINO', '13245', 'FOTOJOHNNY'),
(5, 'RAUL', 'RAULZINHO', 'RAUL123', 'FOTORAUL'),
(6, 'THAINA', 'THAINAZINHA', 'THAINA321', 'FOTOTHAINA'),
(7, 'JOAO VINICIUS', 'J.VINI', 'VINI549', 'FOTOVINI');

INSERT INTO tb_grupos
VALUES
('AMO ANIMAIS', 'GRUPO DE PESSOAS QUE AMAM ANIMAIS', 'IMGGRUPOANIMAIS', 1, 4),
('ROLE SABADO COM BINHO', 'VAMOS COMBINAR O ROLE', 'IMGBINHO', 7, 6);

SELECT * FROM tb_postagens;
SELECT * FROM tb_inscritos;
SELECT * FROM tb_usuarios
WHERE Senha LIKE '%12%';

SELECT * FROM tb_usuarios
WHERE Id_usuarios BETWEEN 2 AND 5;

SELECT COUNT (*) AS 'TOTAL DE USUARIOS'
FROM tb_usuarios;

SELECT Nome FROM tb_usuarios
FULL OUTER JOIN tb_postagens ON Id_usuarios=Id_postagem;

