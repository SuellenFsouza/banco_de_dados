CREATE TABLE "tb_aluno" (
	"aluno_id"	INTEGER,
	"nome"	TEXT NOT NULL,
	"cpf"	TEXT NOT NULL,
	"rg"	TEXT NOT NULL,
	"data_nascimento"	TEXT NOT NULL,
	"endereço"	TEXT NOT NULL,
	PRIMARY KEY("aluno_id" AUTOINCREMENT)
);
CREATE TABLE "tb_curso" (
	"curso_id"	INTEGER,
	"código_identificação"	TEXT NOT NULL,
	"nome"	TEXT NOT NULL,
	"carga_horária"	TEXT NOT NULL,
	PRIMARY KEY("curso_id" AUTOINCREMENT)
);
CREATE TABLE "tb_professor" (
	"professor_id"	INTEGER,
	"nome_professor"	TEXT NOT NULL,
	"especialidade"	TEXT NOT NULL,
	"contato"	TEXT NOT NULL,
	PRIMARY KEY("professor_id" AUTOINCREMENT)
);
CREATE TABLE "tb_matricula" (
	"matricula_id"	INTEGER,	
	"aluno_id"	INTEGER,
	"curso_id"	INTEGER,
	"n1"	TEXT NOT NULL,
	"n2"	TEXT NOT NULL,
	"n3"	TEXT NOT NULL,
	"n4"	TEXT NOT NULL,
	PRIMARY KEY("matricula_id" AUTOINCREMENT),
	FOREIGN KEY (aluno_id) REFERENCES tb_aluno(aluno_id),
	FOREIGN KEY (curso_id) REFERENCES tb_curso(curso_id)
	
);
----------------------------------------------------------------------------
INSERT INTO tb_professor (nome_professor, especialidade, contato)
VALUES
    ('Pedro Almeida', 'biologia', '55555-444'),
    ('Ana Souza', 'matematica', '22222-333'),
    ('Carlos Lima', 'historia', '98765-432'),
    ('Mariana Costa', 'Informatica', '12345-678'),
    ('Lucas Ferreira', 'Ingles',  '54321-876');
    
    INSERT INTO tb_curso (codigo_identificacao, nome, carga_horaria)
VALUES
    ('22', 'biologia', '8h'),
    ('33', 'matematica', '3h'),
    ('44', 'historia', '10h'),
    ('55', 'Informatica', '5h'),
    ('66', 'Ingles',  '6h');
    
    INSERT INTO tb_matricula (aluno_id, curso_id, n1, n2,n3, n4)
VALUES
    ('1', '11', '8','9' ,'10','7'),
    ('2', '12','8','9' ,'10','7'),
    ('3', '13','8','9' ,'10','7'),
    ('4', '14','8','9' ,'10','7'),
    ('5', '15','8','9' ,'10','7'),
    ('6', '12','8','9' ,'10','7');
	
    
    INSERT INTO tb_aluno (nome, cpf, rg, data_nascimento,endereço)
VALUES
    ('Ricardo Mendes', '6666-7777', '12345-678','01-03-2005' ,'Rua J'),
    ('Beatriz Ramos', '7777-2222','54321-876','03-03-2004' ,'Rua K'),
    ('Gustavo Pereira', '3333-5555','98765-432','03-05-2004' ,'Rua L'),
    ('Fernanda Castro', '2222-6666','12345-678','08-09-2004' ,'Rua M'),
    ('Henrique Santos', '8888-3333','54321-876','01-08-2004' ,'Rua N'),
    ('Isabela Fernandes', '7777-6666','98765-432','03-10-2004' ,'Rua O');