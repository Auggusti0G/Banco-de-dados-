---Alunos : Rafael Augusto (22508717)
---Alunos : Caio Siqueira (22505969)
CREATE TABLE aluno (
	id_aluno INT PRIMARY KEY, 
	nome VARCHAR(50),
	semestre INT,
	curso_origem VARCHAR(50)
);

CREATE TABLE curso (
	id_curso INT PRIMARY KEY,
	titulo VARCHAR(50),
	area VARCHAR(30),
	carga_horaria DATE NOT NULL
);

CREATE TABLE professor (
	id_prof INT PRIMARY KEY,
	nome VARCHAR(50),
	especialidade VARCHAR (30)
);

CREATE TABLE oferta (
	id_oferta INT PRIMARY KEY,
	id_curso INT NOT NULL,
	FOREIGN KEY (id_curso) REFERENCES curso (id_curso),
	id_prof INT NOT NULL,
	FOREIGN KEY (id_prof) REFERENCES professor (id_prof),
	semestre VARCHAR(40) NOT NULL,
	turno DATE NOT NULL
);

CREATE TABLE matricula (
	id_matricula INT PRIMARY KEY,
	nota_final INT NOT NULL,
	id_aluno INT NOT NULL,
	FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
	id_oferta INT NOT NULL,
	FOREIGN KEY (id_oferta) REFERENCES oferta(id_oferta)
);

INSERT INTO aluno(id_aluno, nome, semestre, curso_origem) VALUES(2424, 'Davi Brito', 2, 'Direito');
INSERT INTO curso(id_curso, titulo, area, carga_horaria) VALUES(1212, 'Direito Admistrativo', 'Humanas', '23-02-07');
INSERT INTO professor(id_prof, nome, especialidade) VALUES(3636, 'Luan Muruk', 'Ciências Humanas e Socias');
INSERT INTO oferta(id_oferta, id_curso,id_prof, semestre, turno) VALUES(4848, 1212, 3636, '3° Semestre', '28-01-2007');
INSERT INTO matricula(id_matricula, nota_final, id_aluno, id_oferta) VALUES(5555, 10, 2424, 4848);


SELECT * FROM aluno

---ATIVIDADE 01 liste nome, titulo de curso e nome de professor 
SELECT a.nome, c.titulo, p.nome as nome_professor
from matricula m 
inner join aluno a on m.id_aluno = a.id_aluno
inner join oferta o on o.id_oferta = o.id_oferta
inner join curso c on o.id_curso = c.id_curso                               
inner join professor p on o.id_prof = p.id_prof


---ATIVIDADE 02
SELECT a.nome, c.area
FROM aluno a INNER JOIN matricula m ON a.id_aluno = m.id_aluno
INNER JOIN oferta o ON m.id_oferta = o.id_oferta
INNER JOIN curso c ON c.id_curso = o.id_curso
WHERE c.area = 'Humanas'

---ATIVIDADE 03
SELECT DISTINCT P.nome as proficiobnal

---ATIVIDADE 04