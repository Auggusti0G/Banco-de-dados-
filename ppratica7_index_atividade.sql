-- Atividade index Banco de dados 
-- Aluno: Rafael Augusto       RA: 22508717

-- 1.Abrir o SGBD PostgreSQL (usar a interface PgAdmin) e criar um banco de
--dados chamado pratica07.

-- 2) Criação da tabela exemplo1 (sem chave primária)
DROP TABLE IF EXISTS exemplo1;
CREATE TABLE exemplo1 (
    c1 integer NOT NULL,
    c2 integer,
    c3 integer,
    c4 integer
);

-- 2) Função para inserir registros (opção A - sua função)
CREATE OR REPLACE FUNCTION inserir_reg(qnt integer)
RETURNS void AS
$$
DECLARE
    i integer;
BEGIN
    FOR i IN 1..qnt LOOP
        INSERT INTO exemplo1 VALUES (i, i, i, i);
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- 2B) (opção B - alternativa mais rápida) -- insere 1.000.000 de linhas usando generate_series
INSERT INTO exemplo1 (c1, c2, c3, c4)
-SELECT i, i, i, i FROM generate_series(1,1000000) AS g(i);

-- 3) Popule a tabela:
 (Escolha apenas uma das abordagens: A) usar a função; B) usar generate_series)
-- Opção A: função (pode demorar se qnt grande)
SELECT inserir_reg(1000000);

-- Opção B: generate_series (recomendada por ser mais rápida)
INSERT INTO exemplo1 (c1, c2, c3, c4)
SELECT i, i, i, i FROM generate_series(1,1000000) AS g(i);

-- 4) Exemplo de consulta a ser medida (primeira medição antes de índices)
-- Use EXPLAIN ANALYZE para medir tempo e ver plano:
EXPLAIN ANALYZE
SELECT * FROM exemplo1
WHERE c3 = 50000 AND c2 = 50000 AND c4 = 50000;

-- 5) Criar índices em c2, c3, c4
CREATE INDEX idx_c2 ON exemplo1 USING btree (c2);
CREATE INDEX idx_c3 ON exemplo1 USING btree (c3);
CREATE INDEX idx_c4 ON exemplo1 USING btree (c4);

-- Atualizar estatísticas (ANALYZE)
ANALYZE exemplo1;

-- 6) Repetir a consulta do item 4 e comparar tempos
EXPLAIN ANALYZE
SELECT * FROM exemplo1
WHERE c3 = 50000 AND c2 = 50000 AND c4 = 50000;

-- 7) Teste de c1 (não indexado) versus c2 (indexado)
-- a) sem índice em c1:
EXPLAIN ANALYZE
SELECT * FROM exemplo1 WHERE c1 = 90000;

-- b) c2 está indexado:
EXPLAIN ANALYZE
SELECT * FROM exemplo1 WHERE c2 = 90000;

-- OBS: se o otimizador escolher Seq Scan mesmo com índice (dependendo da seletividade),
-- verifique o EXPLAIN: pode ser que um Seq Scan seja mais barato que usar índice.

-- 8) Criação da tabela exemplo2
DROP TABLE IF EXISTS exemplo2;
CREATE TABLE exemplo2 (
    c1 integer NOT NULL,
    c2 integer,
    c3 integer,
    c4 integer,
    c5 integer
);

-- 9) Popular exemplo2 (use generate_series para velocidade)
INSERT INTO exemplo2 (c1, c2, c3, c4, c5)
SELECT i, i, i, i, i FROM generate_series(1,1000000) AS g(i);

-- Verifique (SELECT com LIMIT)
SELECT count(*) FROM exemplo1;
SELECT count(*) FROM exemplo2;
SELECT * FROM exemplo1 LIMIT 5;
SELECT * FROM exemplo2 LIMIT 5;

-- 10) Consulta JOIN (corrigida: WHERE exemplo1.c1 = exemplo2.c2)
EXPLAIN ANALYZE
SELECT exemplo1.c1, exemplo2.c1
FROM exemplo1, exemplo2
WHERE exemplo1.c1 = exemplo2.c2;

-- 11) Criar índice idx_c2 em exemplo2 e ANALYZE
CREATE INDEX idx_exemplo2_c2 ON exemplo2 USING btree (c2);
ANALYZE exemplo2;

-- Re-execute a consulta JOIN e compare o EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT exemplo1.c1, exemplo2.c1
FROM exemplo1, exemplo2
WHERE exemplo1.c1 = exemplo2.c2;