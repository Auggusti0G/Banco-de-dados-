-- tabela Aluno
CREATE TABLE Aluno (
    id_aluno SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    semestre VARCHAR(10),
    curso_origem VARCHAR(255)
);

-- tabela Curso
CREATE TABLE Curso (
    id_curso SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    area VARCHAR(255),
    carga_horaria INT NOT NULL
);

-- tabela Professor
CREATE TABLE Professor (
    id_prof SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    especialidade VARCHAR(255)
);

-- tabela Oferta
CREATE TABLE Oferta (
    id_oferta SERIAL PRIMARY KEY,
    id_curso INT NOT NULL,
    id_prof INT NOT NULL,
    semestre VARCHAR(10),
    turno VARCHAR(50),
    FOREIGN KEY (id_curso)
        REFERENCES Curso (id_curso),
    FOREIGN KEY (id_prof)
        REFERENCES Professor (id_prof)
);

-- tabela Matricula
CREATE TABLE Matricula (
    id_aluno INT NOT NULL,
    id_oferta INT NOT NULL,
    nota_final INT,
    PRIMARY KEY (id_aluno, id_oferta),
    FOREIGN KEY (id_aluno)
        REFERENCES Aluno (id_aluno),
    FOREIGN KEY (id_oferta)
        REFERENCES Oferta (id_oferta)
);

-- Inserir dados na tabela Curso
INSERT INTO Curso (id_curso, titulo, area, carga_horaria) VALUES
(1, 'Introdução a Bancos de Dados', 'Tecnologia', 80),
(2, 'Programação Orientada a Objetos', 'Tecnologia', 120),
(3, 'Cálculo I', 'Matemática', 60);

-- Inserir dados na tabela Professor
INSERT INTO Professor (id_prof, nome, especialidade) VALUES
(1, 'Ana Paula Silva', 'Bancos de Dados'),
(2, 'João Carlos Mendes', 'Desenvolvimento de Software'),
(3, 'Maria Fernandes', 'Álgebra e Geometria');

-- Inserir dados na tabela Aluno
INSERT INTO Aluno (id_aluno, nome, semestre, curso_origem) VALUES
(1, 'Pedro Santos', '2023/2', 'Ciência da Computação'),
(2, 'Luisa Oliveira', '2024/1', 'Engenharia de Software'),
(3, 'Mariana Costa', '2023/2', 'Análise e Desenvolvimento de Sistemas');

-- Inserir dados na tabela Oferta
INSERT INTO Oferta (id_oferta, id_curso, id_prof, semestre, turno) VALUES
(1, 1, 1, '2025/1', 'Matutino'),
(2, 2, 3, '2025/1', 'Noturno'),
(3, 3, 2, '2025/1', 'Vespertino'),
(4,2,3, '2025\20', 'manha');

insert into Oferta (id_oferta, id_curso, id_prof, semestre, turno) VALUES
(4,2,3, '2025\20', 'manha');

select * from oferta
-- Inserir dados na tabela Matricula
INSERT INTO Matricula (id_aluno, id_oferta, nota_final) VALUES
(1, 1, null),
(1, 2, null),
(2, 1, null),
(3, 3, null);

CREATE TABLE semestre (
    id_semestre int PRIMARY KEY,
    semestre VARCHAR(10)
);

CREATE TABLE turno (
    id_turno int PRIMARY KEY,
    turno VARCHAR(10)
);

-- Inserir dados na tabela semestre
INSERT INTO semestre (id_semestre, semestre) VALUES
(1,'2025/1');

-- Inserir dados na tabela truno
INSERT INTO turno (id_turno, turno) VALUES
(1,'Matutino'),
(2, 'Vespertino');

--INSERIR AS COLUNAS fk_id_semestre; fk_id_turno na tabela oferta
ALTER TABLE oferta add column fk_id_semestre int;
ALTER TABLE oferta add column fk_id_turno int;

--ADICIONAR AS RESTRIÇÕES DE FK na tabela oferta
ALTER TABLE oferta add constraint fk_smestre foreign key (fk_id_semestre)
	references semestre(id_semestre);
ALTER TABLE oferta add constraint fk_turno foreign key (fk_id_turno)
	references turno(id_turno);

select * from oferta;

-- ATUALIZAR OS VINCULOS DE OFERTA (fk_id_semestre; fk_id_turno)
-- PARA QUE FUNCIONE, O MODELO E O CONJUNTO DE DADOS PRECISA SER O MESMO ACIMA
UPDATE oferta 
SET id_semestre = 1
WHERE semestre = '2025/1';

UPDATE oferta 
SET id_semestre = 2
WHERE semestre = '2025\20';

UPDATE oferta
SET id_turno = 1
WHERE turno = 'Matutino' OR turno = 'manha';

UPDATE oferta
SET id_turno = 2
WHERE turno = 'Vespertino';

UPDATE oferta
SET id_turno = 3
WHERE turno = 'Noturno';

SELECT *
FROM oferta;

