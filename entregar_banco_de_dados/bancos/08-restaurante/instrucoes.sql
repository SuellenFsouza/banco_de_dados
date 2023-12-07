CREATE TABLE "tb_produtos" (
	"produto_id"	INTEGER,
	"nome"	TEXT NOT NULL,
	"tipo"	TEXT NOT NULL,
	"preco"	REAL NOT NULL,
	"descricao"	TEXT NOT NULL,
	PRIMARY KEY("produto_id" AUTOINCREMENT)
);

CREATE TABLE "tb_mesas" (

	"mesa_id" INTEGER,
	"numero" TEXT NOT NULL,
	"capacidade" TEXT NOT NULL,
	PRIMARY KEY ("mesa_id" AUTOINCREMENT)
	);
	
CREATE TABLE "tb_pedidos" (
	"pedido_id"	INTEGER,
	"mesa_id"	INTEGER,
	"produto_id" TEXT NOT NULL,
	"quantidade" TEXT NOT NULL,
	"total"	REAL NOT NULL,
	FOREIGN KEY("produto_id") REFERENCES "tb_produtos"("produto_id"),
	FOREIGN KEY("mesa_id") REFERENCES "tb_mesas"("mesa_id"),
	PRIMARY KEY("pedido_id" AUTOINCREMENT)
);

---------------------------------------------------------------------

INSERT INTO "tb_produtos" (nome, tipo, preco, descricao)
VALUES

	('X-bacon', 'lanche', '30,00', 'pao, dois hamburgueres, dois bacons, queijo'),
	('coca-cola', 'bebida', '5,00', 'lata de coca 300ml'),
	('sorvete', 'sobremesa', '15,00', 'uma cesta'),
	('suco', 'bebida', '15,00', 'natural, 500ml'),
	('pastel', 'prato', '10,00', 'todos os sabores, tamanho medio'),
	('sorvete', 'sobremesa', '15,00', 'uma cesta'),
	('self service', 'lanche', '10,00', 'misto frio com presunto e queijo e outros aperitivos opcionais'),
	('misto frio', 'sobremesa', '15,00', 'uma cesta');
	
INSERT INTO "tb_mesas" (numero, capacidade)
VALUES

	('1', '8'),
	('2', '3'),
	('3', '4'),
	('4', '5'),
	('5', '2'),
	('6', '1'),
	('7', '7'),
	('8', '3');
    
INSERT INTO "tb_pedidos" (mesa_id, produto_id, quantidade, total)
VALUES

	('1', '3', '2', '30,00'),
	('2', '2', '3', '15,00'),
	('3', '7', '2', '20,00'),
	('4', '5', '4', '40,00'),
	('2', '1', '1', '30,00'),
	('3', '3', '2', '30,00'),
	('1', '2', '3', '15,00'),
	('4', '6', '4', '60,00'),
	('3', '1', '2', '60,00'),
	('2', '4', '3', '45,00');
    
---------------------------------------------------------------------

//CONSULTA

SELECT * FROM tb_produtos WHERE tipo = "bebida";

SELECT * FROM tb_mesas WHERE numero = "1";

SELECT nome, tipo, preco FROM tb_produtos;

---------------------------------------------------------------------

SELECT * FROM tb_mesas WHERE numero = "1";

SELECT * FROM tb_mesas WHERE capacidade > "6";

---------------------------------------------------------------------
SELECT
	tb_produtos.nome,
	tb_produtos.tipo,
	tb_produtos.preco,
	tb_mesas.numero,
	tb_mesas.capacidade,
	tb_pedidos.pedido_id,
	tb_pedidos.quantidade,
	tb_pedidos.total
FROM
	tb_pedidos
INNER JOIN
	tb_produtos ON tb_pedidos.produto_id = tb_produtos.produto_id
INNER JOIN
	tb_mesas ON tb_pedidos.mesa_id = tb_mesas.mesa_id;
-----------------------------------------------------------------------------
SELECT
	tb_produtos.nome,
	tb_produtos.tipo,
	tb_produtos.preco,
	tb_mesas.numero,
	tb_mesas.capacidade,
	tb_pedidos.pedido_id,
	tb_pedidos.quantidade,
	tb_pedidos.total
FROM
	tb_pedidos
INNER JOIN
	tb_produtos ON tb_pedidos.produto_id = tb_produtos.produto_id
INNER JOIN
	tb_mesas ON tb_pedidos.mesa_id = tb_mesas.mesa_id
WHERE
	tb_pedidos.total = "10,00";
----------------------------------------------------------------------------------
SELECT
	tb_produtos.nome,
	tb_produtos.tipo,
	tb_produtos.preco,
	tb_mesas.numero,
	tb_mesas.capacidade,
	tb_pedidos.pedido_id,
	tb_pedidos.quantidade,
	tb_pedidos.total
FROM
	tb_pedidos
INNER JOIN
	tb_produtos ON tb_pedidos.produto_id = tb_produtos.produto_id
INNER JOIN
	tb_mesas ON tb_pedidos.mesa_id = tb_mesas.mesa_id
WHERE
	tb_pedidos.total > "20,00";
-------------------------------------------------------------------------------------
UPDATE tb_produtos
SET nome = "chá"
WHERE produto_id = 3;

UPDATE tb_produtos
SET descricao = "nada"
WHERE produto_id = 2;

UPDATE tb_produtos
SET descricao = "laranja"
WHERE produto_id = 6;

UPDATE tb_produtos
SET descricao = "peixe"
WHERE produto_id = 3;

UPDATE tb_produtos
SET descricao = "nada"
WHERE produto_id = 8;
------------------------------------------------------------------------------------------
UPDATE tb_mesas
SET numero = "s10"
WHERE mesa_id = 3;

UPDATE tb_mesas
SET numero = "ss"
WHERE mesa_id = 2;

UPDATE tb_mesas
SET numero = "ss1"
WHERE mesa_id = 1;

UPDATE tb_mesas
SET numero = "s4s"
WHERE mesa_id = 6;

UPDATE tb_mesas
SET numero = "ss7"
WHERE mesa_id = 8;
---------------------------------------------------------------------------------------------------
DELETE FROM tb_pedidos WHERE pedido_id = 1;
DELETE FROM tb_pedidos WHERE pedido_id = 2;
DELETE FROM tb_pedidos WHERE pedido_id = 3;
DELETE FROM tb_pedidos WHERE pedido_id = 4;
----------------------------------------------------------------------------------------------------
SELECT sum(preco) FROM tb_produtos;
----------------------------------------------------------------------------------------------------
SELECT count("produto_id") from  tb_produtos;
----------------------------------------------------------------------------------------------------
SELECT * FROM tb_produtos WHERE produto_id BETWEEN 1 and 3;
----------------------------------------------------------------------------------------------------
SELECT* FROM tb_pedidos ORDER BY pedido_id ASC;
----------------------------------------------------------------------------------------------------
SELECT* FROM tb_pedidos ORDER BY pedido_id DESC;

