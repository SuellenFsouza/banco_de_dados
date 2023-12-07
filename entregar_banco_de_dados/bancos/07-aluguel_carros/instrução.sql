--2
CREATE TABLE "tb_cliente"(
	"cliente_id" INTEGER,
	"nome" TEXT NOT NULL,
	"cnh" TEXT NOT NULL,
	"telefone" TEXT NOT NULL
	PRIMARY KEY ("cliente_id" AUTOINCREMENT)
);
CREATE TABLE "tb_veiculo"(
	"veiculo_id" INTEGER,
	"modelo" TEXT NOT NULL,
	"ano" TEXT NOT NULL,
	"placa" TEXT NOT NULL,
	"disponibilidade" TEXT NOT NULL
	PRIMARY KEY ("cliente_id" AUTOINCREMENT)
);
CREATE TABLE "tb_veiculo"(
	"aluguel_id" INTEGER,
	"cliente_id" INTEGER,
	"veiculo_id" INTEGER,
	"data_inicio" TEXT NOT NULL,
	"data_fim" TEXT NOT NULL
	PRIMARY KEY ("aluguel_id" AUTOINCREMENT)
	FOREIGN KEY ("cliente_id") REFERENCES tb_cliente ("cliente_id")
	FOREIGN KEY ("veiculo_id") REFERENCES tb_veiculo ("veiculo_id")
);
------------------------------------------------------------------
--3

INSERT INTO "tb_cliente" ( nome,cnh,telefone) 
VALUES
	('Amanda Ferreira', '12345678901','12345-6789'),
	('Samatha Alves', '12345678901', '12345-6789'),
	('Denis Holanda', '12345678901', '12345-6789'),
	('Estella Dias', '12345678901', '12345-6789'),
	('Thaina Cortez', '12345678901', '12345-6789'),
	('Rafael de Gino', '12345678901', '12345-6789'),
	('Yollanda Moraes', '12345678901', '12345-6789'),
	('Giovanna Ferreira', '12345678901' , '12345-6789');
    
------------------------------------------------------
--4
INSERT INTO "tb_aluguel" ( cliente_id,veiculo_id,data_inicio,data_fim) 
VALUES
	('1', '1','2023-05-06','2023-012-25'),
	('2', '2', '2023-05-06', '2023-012-25'),
	('3', '4', '2023-05-06','2023-012-25'),
	('4', '6', '2023-05-06','2023-012-25'),
	('8', '3', '2023-05-06','2023-012-25'),
	('9', '5', '2023-05-06', '2023-012-25'),
	('6', '8', '2023-05-06','2023-012-25'),
	('5', '1' , '2023-05-06','2023-012-25'),
	('7', '8' , '2023-05-06','2023-012-25'),
	('8', '2' , '2023-05-06','2023-012-25');
    --------------------------------------------------------------------------
    INSERT INTO "tb_veiculo" ( modelo,ano,placa,disponibilidade) 
VALUES
	('Mercedes-Benz', '2010','ABC-1234','disponivel'),
	('Toyota', '2018', 'DEF-5678', 'disponivel'),
	('BMW', '2019', 'GHI-9012','disponivel'),
	('Volkswagen', '2020', 'JKL-3456','alugado'),
	('Hyundai', '2017', 'MNO-7890','disponivel'),
	('Honda', '2016', 'PQR-1234','disponivel'),
	('Ford', '2015', 'STU-6789','disponivel'),
	('Tesla', '2021' , 'VWX-0123','alugado');
-----------------------------------------------------------------
--5
SELECT * FROM tb_cliente WHERE telefone = "12345-6789";
-----------------------------------------------------------------
SELECT * FROM tb_cliente WHERE cnh = "12345678901";
-----------------------------------------------------------------
SELECT nome,cnh FROM tb_cliente ;
-----------------------------------------------------------------
--6
SELECT * FROM tb_veiculo WHERE ano = "2017";
-----------------------------------------------------------------
SELECT * FROM tb_veiculo WHERE veiculo_id = "2";
-----------------------------------------------------------------
SELECT * FROM tb_veiculo WHERE disponibilidade = "alugado";
-----------------------------------------------------------------
--7
SELECT
	tb_cliente.nome,
	tb_cliente.cnh,
	tb_veiculo.modelo,
	tb_veiculo.placa,
	tb_veiculo.disponibilidade,
	tb_aluguel.aluguel_id,
	tb_aluguel.data_inicio,
	tb_aluguel.data_fim
FROM
	tb_aluguel
INNER JOIN
	tb_cliente ON tb_cliente.cliente_id = tb_aluguel.cliente_id
INNER JOIN
	tb_veiculo ON tb_veiculo.veiculo_id = tb_aluguel.veiculo_id
------------------------------------------------------------------------
--8
SELECT
	tb_cliente.nome,
	tb_cliente.cnh,
	tb_veiculo.modelo,
	tb_veiculo.placa,
	tb_veiculo.disponibilidade,
	tb_aluguel.aluguel_id,
	tb_aluguel.data_inicio,
	tb_aluguel.data_fim
FROM
	tb_aluguel
INNER JOIN
	tb_cliente ON tb_cliente.cliente_id = tb_aluguel.cliente_id
INNER JOIN
	tb_veiculo ON tb_veiculo.veiculo_id = tb_aluguel.veiculo_id
WHERE
	tb_veiculo.disponibilidade = "disponivel";
    
--------------------------------------------------------------------------
--9
SELECT
	tb_cliente.nome,
	tb_cliente.cnh,
	tb_veiculo.modelo,
	tb_veiculo.placa,
	tb_veiculo.disponibilidade,
	tb_aluguel.aluguel_id,
	tb_aluguel.data_inicio,
	tb_aluguel.data_fim
FROM
	tb_aluguel
INNER JOIN
	tb_cliente ON tb_cliente.cliente_id = tb_aluguel.cliente_id
INNER JOIN
	tb_veiculo ON tb_veiculo.veiculo_id = tb_aluguel.veiculo_id
WHERE
	tb_veiculo.disponibilidade = "alugado";
    
-----------------------------------------------------------------
--10
UPDATE tb_cliente
SET telefone = "358756786"
WHERE cliente_id = 1;

UPDATE tb_cliente
SET telefone = "7384657486"
WHERE cliente_id = 2;

UPDATE tb_cliente
SET telefone = "7465865834"
WHERE cliente_id = 6;

UPDATE tb_cliente
SET telefone = "9458390685"
WHERE cliente_id = 8;

UPDATE tb_cliente
SET telefone = "485729487"
WHERE cliente_id = 5;
--------------------------------------------------------------------
--11
UPDATE tb_veiculo
SET ano = "2016"
WHERE veiculo_id = 3;

UPDATE tb_veiculo
SET ano = "2022"
WHERE veiculo_id = 4;

UPDATE tb_veiculo
SET ano = "2014"
WHERE veiculo_id = 1;

UPDATE tb_veiculo
SET ano = "2013"
WHERE veiculo_id = 8;

UPDATE tb_veiculo
SET ano = "2023"
WHERE veiculo_id = 2;
--------------------------------------------------------------------
--12
DELETE FROM tb_aluguel WHERE aluguel_id = 1;
DELETE FROM tb_aluguel WHERE aluguel_id = 3;
DELETE FROM tb_aluguel WHERE aluguel_id = 6;
DELETE FROM tb_aluguel WHERE aluguel_id = 7;
DELETE FROM tb_aluguel WHERE aluguel_id = 2;
