
--criar tabelas
CREATE TABLE "tb_plataforma"(
	"cod_plataforma" INTEGER,
	"nome" TEXT,
	"fabricante" TEXT,
	PRIMARY KEY ("cod_plataforma" AUTOINCREMENT)
);
CREATE TABLE "tb_jogos" (
	"cod_jogo" INTEGER,
	"titulo" TEXT,
	"genero" TEXT,
	"lancamento" TEXT,
	"cod_plataforma" INTEGER,
	PRIMARY KEY ("cod_jogo" AUTOINCREMENT),
	CONSTRAINT "cod_plataforma" FOREIGN KEY ("cod_plataforma") REFERENCES "tb_plataforma" ("cod_plataforma")
);

--inserir plataformas

INSERT INTO tb_plataforma (cod_plataforma,nome,fabricante)
VALUES
	 ('1', 'PlayStation 5', 'Sony'),
    ('2', 'Xbox Series X', 'Micfrosoft'),
    ('3', 'Nitendo Switch', 'Nitendo'),
    ('4', 'PlayStation 4', 'sony'),
    ('5', 'Xbox one', 'Microsoft'),
	('6', 'will U', 'Nitendo'),
	('7','PlayStation 3', 'Sony'),
    ('8', 'Xbox 360', 'Microsoft'),
    ('9', 'Nitendo will', 'Nitendo'),
    ('10', 'Plastation 2', 'Sony');

--inserir jogos

INSERT INTO tb_jogos (cod_jogo, titulo, genero, lancamento, cod_plataforma)
VALUES
    ('1', 'Demons Souls', 'RPG','2020-11-12', '1'),
    ('2', 'Ratchet & Clank: Rift Apart', 'Ação/Aventura', '2021-06-11', '1'),
    ('3', 'Halo Infinite', 'FPS', '2021-12-08', '2'),
    ('4', 'Forzan Horizon 5', 'Corrida', '2021-11-09', '2'),
    ('5', 'The Legend of Zelda:Breath of the Wild', 'Ação/Aventura', '2017-03-03', '3'),
    ('6', 'Animal Crossing: New Horizons', 'Simulação', '2020-03-20', '3'),
    ('7', 'God of War', 'Ação/Aventura', '2018-04-20', '4'),
    ('8', 'Horizon Zero Dawn', 'RPG', '2017-02-28', '4'),
    ('9', 'Gears of War 4', 'tiro', '2016-10-11', '5'),
    ('10', 'The Last of Us', 'Ação/Aventura', '2013-06-14', '7');

--selecionar por plataforma especifica

SELECT titulo FROM tb_jogos WHERE cod_plataforma = 1;

--selecionar por genero especifico

SELECT * FROM tb_jogos WHERE genero = "Ação/Aventura";

--colsuta inner join


SELECT
	tb_plataforma.nome,
	tb_plataforma.fabricante,
	tb_jogos.titulo,
	tb_jogos.lancamento,
	tb_jogos.genero
FROM
	tb_jogos
INNER JOIN
	tb_plataforma on tb_plataforma.cod_plataforma = tb_jogos.cod_jogo;

--alteração da data de lancamento 


UPDATE tb_jogos
SET lancamento = '2020-08-01'
WHERE cod_jogo = 3;

UPDATE tb_jogos
SET lancamento = '2023-09-01'
WHERE cod_jogo = 2;

UPDATE tb_jogos
SET lancamento = '2020-08-02'
WHERE cod_jogo = 6;

UPDATE tb_jogos
SET lancamento = '2020-10-12'
WHERE cod_jogo = 10;

--deletar jogos

DELETE FROM tb_jogos WHERE cod_jogo = 3;

DELETE FROM tb_jogos WHERE cod_jogo = 5;

DELETE FROM tb_jogos WHERE cod_jogo = 1;

DELETE FROM tb_jogos WHERE cod_jogo = 9;