CREATE TABLE "tb_passageiros" (
    "CPF" INTEGER,
    "nome" TEXT NOT NULL,
    "tataNascimento" TEXT NOT NULL,
    "telefone1" TEXT NOT NULL,
    "telefone2" TEXT NOT NULL,
    "rua" TEXT NOT NULL,
    "numero" TEXT NOT NULL,
    "CEP" TEXT NOT NULL,
    "complemento" TEXT NOT NULL,
    "bairro" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "estado" TEXT NOT NULL
    PRIMARY KEY ("CPF" AUTOINCREMENT)
);

CREATE TABLE "tb_Rotas" (
    "rota_id" INTEGER,
    "Origem" TEXT NOT NULL,
    "Destino" TEXT NOT NULL,
	PRIMARY KEY ("rota_id" AUTOINCREMENT)
);
CREATE TABLE tb_voos (
    "voo_id" INTEGER,
    "rota_id" INTEGER,
    "DataPartida" TEXT NOT NULL,
    "DataChegada" TEXT NOT NULL,
    "Aviao" TEXT NOT NULL,
	PRIMARY KEY ("voo_id" AUTOINCREMENT),
    FOREIGN KEY ("rota_id") REFERENCES tb_Rotas("rota_id")
);
CREATE TABLE tb_reservas (
    "reserva_id" INTEGER,
    "CPF" INTEGER,
    "voo_id" INTEGER,
    "Assento_id" INTEGER,
	PRIMARY KEY ("reserva_id" AUTOINCREMENT),
    FOREIGN KEY ("CPF") REFERENCES tb_passageiros("CPF"),
    FOREIGN KEY ("voo_id") REFERENCES tb_voos(voo_id)
);
------------------------------------------------------------------------------------------------------------------
INSERT INTO "tb_Rotas" (Origem, Destino)
VALUES

	('São paulo-SP-BR', 'amsterdam-HOLANDA'),
	('Las vegas-EUA', 'Rio de janeiro-JR-BR'),
	('New york-EUA', 'Salvador-BH-BR'),
	('Barcelona-ESPANHA', 'berlim-ALEMANHA'),
	('Tokyo-JP', 'São paulo-SP-BR');

INSERT INTO "tb_voos" (rota_id,DataPartida,DataChegada,Aviao)
VALUES

	(1, '10/09/2023', '12/09/2023', '001' ),
	(2, '01/08/2023', '03/08/2023', '003'),
	(3, '25/01/2023', '16/01/2023', '004'),
	(4, '16/10/2023', '17/10/2023', '010'),
	(5, '05/03/2023', '06/03/2023', '015');
    
    INSERT INTO "tb_passageiros" (CPF,Nome,DataNascimento,Telefone1,Telefone2,Rua,Numero,CEP,Complemento,Bairro,Cidade,Estado)
VALUES

	('000001', 'amanda', '12/09/2007', '11 987670736', '11 987670726', 'rua das rosas', '40', '07791625', 'atras do MC', 'polvilho', 'cajamar', 'SP' ),
	('000002', 'suellen', '03/08/2000', '11 987670735', '11 987670716', 'rua das bromelias', '39', '07791628', 'atras do BK', 'polvilho', 'cajamar', 'RJ'),
	('000003', 'samantha', '16/01/2006', '11 987670733', '11 987670766', 'rua dos ipes', '03', '07793625', 'atras do Shopping', 'polvilho', 'cajamar', 'BH'),
	('000004', 'Thaina', '17/10/1999', '11 987670732', '11 987670786', 'rua dos lirios', '41', '07491625', 'atras do loja', 'polvilho', 'cajamar', 'MG'),
	('000005', 'Catarina', '06/03/2005', '11 987670738', '11 987670796', 'rua dos girassois ', '500', 'atras do subway', '40', 'polvilho', 'cajamar', 'PE');