CREATE DATABASE db_classificados

USE db_classificados

CREATE TABLE tb_classificado (
	Id_usuarios INT NOT NULL PRIMARY KEY,
	Nome VARCHAR (100) NOT NULL,
	Usuario VARCHAR (100) NOT NULL,
	Senha VARCHAR (100) NOT NULL,
	url_imagem VARCHAR (255) NULL,
);

CREATE TABLE tb_anuncio (
	Id_anuncio INT NOT NULL PRIMARY KEY,
	Titulo VARCHAR (100) NOT NULL,
	Descricao VARCHAR (100) NOT NULL,
	Contato VARCHAR (100) NOT NULL,
	url_imagem VARCHAR (255) NULL,
	data DATE NOT NULL,
	fk_usuario INT NOT NULL,
	FOREIGN KEY (fk_usuario) REFERENCES tb_classificado (Id_usuarios),
);

SELECT * FROM tb_anuncio RIGHT JOIN tb_classificado ON Id_anuncio = Id_usuarios;

SELECT Id_usuarios COUNT FROM tb_classificado;


