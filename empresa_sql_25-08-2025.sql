-- Tabela Departamento
CREATE TABLE Departamento (
    Dnumero INT PRIMARY KEY,
    Dnome VARCHAR(50),
    Cpf_gerente VARCHAR(11),
    Data_inicio_gerente DATE
);
-- Tabela Funcionario
CREATE TABLE Funcionario (
    Cpf VARCHAR(11) PRIMARY KEY,
    Pnome VARCHAR(50),
    Minicial CHAR(1),
    Unome VARCHAR(50),
    Datansc DATE,
    Endereco VARCHAR(100),
    Sexo CHAR(1),
    Salario DECIMAL(10,2),
    Cpf_supervisor VARCHAR(11),
    Dnr INT,
    FOREIGN KEY (Cpf_supervisor) REFERENCES Funcionario(Cpf),
    FOREIGN KEY (Dnr) REFERENCES Departamento(Dnumero)
);
ALTER TABLE Departamento add constraint fk_cpf_gerente foreign key (Cpf_gerente) REFERENCES Funcionario(Cpf);

-- Tabela Localizacoes_dep
CREATE TABLE Localizacoes_dep (
    Dnumero INT,
    Dlocal VARCHAR(50),
    PRIMARY KEY (Dnumero, Dlocal),
    FOREIGN KEY (Dnumero) REFERENCES Departamento(Dnumero)
);

-- Tabela Projeto
CREATE TABLE Projeto (
    Projnumero INT PRIMARY KEY,
    Projnome VARCHAR(100),
    Projlocal VARCHAR(50),
    Dnum INT,
    FOREIGN KEY (Dnum) REFERENCES Departamento(Dnumero)
);

-- Tabela Trabalha_em
CREATE TABLE Trabalha_em (
    Fcpf VARCHAR(11),
    Pnr INT,
    Horas INT,
    PRIMARY KEY (Fcpf, Pnr),
    FOREIGN KEY (Fcpf) REFERENCES Funcionario(Cpf),
    FOREIGN KEY (Pnr) REFERENCES Projeto(Projnumero)
);

-- Tabela Dependente
CREATE TABLE Dependente (
    Fcpf VARCHAR(11),
    Nome_dependente VARCHAR(50),
    Sexo CHAR(1),
    Datansc DATE,
    Parentesco VARCHAR(50),
    PRIMARY KEY (Fcpf, Nome_dependente),
    FOREIGN KEY (Fcpf) REFERENCES Funcionario(Cpf)
);

-- Inserindo dados na tabela Departamento
INSERT INTO Departamento (Dnumero, Dnome, Cpf_gerente, Data_inicio_gerente) 
VALUES
(1, 'Pesquisa', null, '2010-01-01'),
(2, 'Administracao', null, '2012-03-15'),
(3, 'Producao', null, '2015-06-20');

-- Inserindo dados na tabela Funcionario
INSERT INTO Funcionario (Cpf, Pnome, Minicial, Unome, Datansc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr) 
VALUES
('123456789', 'Joao', 'A', 'Silva', '1980-01-09', 'Rua_das_Flores_10', 'M', 5000, NULL, 1),
('987654321', 'Maria', 'B', 'Souza', '1975-05-20', 'Av_Central_200', 'F', 7500, NULL, 2),
('456789123', 'Pedro', 'C', 'Lima', '1990-03-15', 'Rua_Nova_45', 'M', 3500, '123456789', 1),
('654321987', 'Ana', 'D', 'Costa', '1988-07-30', 'Rua_Azul_77', 'F', 4200, '987654321', 2),
('789123456', 'Lucas', 'E', 'Pereira', '1995-11-10', 'Av_Sul_300', 'M', 2800, '123456789', 3);

-- Update gerente na tabela Departamento

Update Departamento set Cpf_gerente = '123456789' where Dnumero = 1;
Update Departamento set Cpf_gerente = '987654321' where Dnumero = 2;
Update Departamento set Cpf_gerente = '654321987' where Dnumero = 3;

-- Inserindo dados na tabela Localizacoes_dep
INSERT INTO Localizacoes_dep (Dnumero, Dlocal) 
VALUES
(1, 'Sao_Paulo'),
(1, 'Campinas'),
(2, 'Brasilia'),
(3, 'Rio_de_Janeiro');

-- Inserindo dados na tabela Projeto
INSERT INTO Projeto (Projnumero, Projnome, Projlocal, Dnum) 
VALUES
(101, 'Sistema_RH', 'Sao_Paulo', 2),
(102, 'BI_Analytics', 'Campinas', 1),
(103, 'Automacao_Fabril', 'Rio_de_Janeiro', 3),
(104, 'Chatbot_Suporte', 'Brasilia', 2);

-- Inserindo dados na tabela Trabalha_em
INSERT INTO Trabalha_em (Fcpf, Pnr, Horas) 
VALUES
('123456789', 101, 20),
('456789123', 102, 15),
('654321987', 103, 30),
('789123456', 103, 25),
('987654321', 104, 10);

-- Inserindo dados na tabela Dependente
INSERT INTO Dependente (Fcpf, Nome_dependente, Sexo, Datansc, Parentesco) 
VALUES
('123456789', 'Carla', 'F', '2010-08-15', 'Filha'),
('123456789', 'Renata', 'F', '1985-09-09', 'Esposa'),
('987654321', 'Bruno', 'M', '2005-02-20', 'Filho'),
('654321987', 'Fernanda', 'F', '2012-12-01', 'Filha'),
('789123456', 'Jose', 'M', '1970-06-06', 'Pai');

