-- Cria a tabela medico
CREATE TABLE medico (
    codigo INT PRIMARY KEY,
    nome VARCHAR(50)
);

-- Cria a tabela paciente
CREATE TABLE paciente (
    codigo INT PRIMARY KEY,
    nome VARCHAR(50)
);

-- Cria a tabela consulta e define as chaves estrangeiras
CREATE TABLE consulta (
    data_hora DATE PRIMARY KEY,
    fk_codigo_paciente INT,
    fk_codigo_medico INT NOT NULL,
    -- Define a chave estrangeira para a tabela paciente
    FOREIGN KEY (fk_codigo_paciente) REFERENCES paciente (codigo),
    -- Define a chave estrangeira para a tabela medico
    FOREIGN KEY (fk_codigo_medico) REFERENCES medico (codigo)
);

-- Adiciona a coluna valor_consulta na tabela consulta
ALTER TABLE consulta ADD COLUMN valor_consulta integer;

-- Insere 5 médicos
INSERT INTO medico (codigo, nome) VALUES
(1, 'Dr. João Silva'),
(2, 'Dra. Maria Santos'),
(3, 'Dr. Carlos Oliveira'),
(4, 'Dra. Ana Costa'),
(5, 'Dr. Pedro Almeida');

-- Insere 10 pacientes
INSERT INTO paciente (codigo, nome) VALUES
(1, 'Lucas Fernandes'),
(2, 'Isabela Souza'),
(3, 'Ricardo Martins'),
(4, 'Juliana Gomes'),
(5, 'Guilherme Pereira'),
(6, 'Patrícia Lima'),
(7, 'Felipe Rodrigues'),
(8, 'Amanda Vieira'),
(9, 'Daniel Barbosa'),
(10, 'Larissa Mendes');

-- Insere 20 consultas
INSERT INTO consulta (data_hora, fk_codigo_paciente, fk_codigo_medico, valor_consulta) VALUES
('2024-05-10', 1, 1, 150),
('2024-05-11', 2, 3, 200),
('2024-05-12', 3, 2, 180),
('2024-05-13', 4, 1, 150),
('2024-05-14', 5, 4, 250),
('2024-05-15', 6, 5, 220),
('2024-05-16', 7, 3, 200),
('2024-05-17', 8, 2, 180),
('2024-05-18', 9, 1, 150),
('2024-05-19', 10, 4, 250),
('2024-05-20', 1, 5, 220),
('2024-05-21', 2, 3, 200),
('2024-05-22', 3, 1, 150),
('2024-05-23', 4, 2, 180),
('2024-05-24', 5, 4, 250),
('2024-05-25', 6, 3, 200),
('2024-05-26', 7, 5, 220),
('2024-05-27', 8, 1, 150),
('2024-05-28', 9, 2, 180),
('2024-05-29', 10, 4, 250);



