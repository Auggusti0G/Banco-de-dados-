-- 1. Cria o banco de dados (se ele não existir)
CREATE DATABASE SistemaComercial;

-- 2. Indica ao sistema que vamos usar este banco de dados
-- Nota: No PostgreSQL, você muda de banco pela interface; no SQL Server/MySQL usa-se o comando abaixo:
USE SistemaComercial;

-- 3. Cria a tabela de clientes com chaves e restrições
CREATE TABLE Clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY, -- IDENTITY(1,1) no SQL Server / No MySQL use: INT AUTO_INCREMENT PRIMARY KEY / No Postgres use: SERIAL PRIMARY KEY
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_cadastro DATETIME DEFAULT GETDATE(), -- GETDATE() no SQL Server / No MySQL e Postgres use: CURRENT_TIMESTAMP
    ativo BIT DEFAULT 1                       -- BIT no SQL Server e MySQL / No Postgres use: BOOLEAN DEFAULT TRUE
);