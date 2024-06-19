-- Criar novo BD
DROP DATABASE IF EXISTS GREENHOUSE;
CREATE DATABASE GREENHOUSE;

-- Utilizando o BD
USE GREENHOUSE;

-- CRIANDO UMA TABELA
CREATE TABLE `GREENHOUSE`.`PLANTS` (
	`PLANT_NAME` CHAR(30) NOT NULL,
    `SENSOR_VALUE` FLOAT DEFAULT NULL,
    `SENSOR_EVENT` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `SENSOR_LEVEL` CHAR(5) DEFAULT NULL,
    PRIMARY KEY `PK_LANT_NAME` (`PLANT_NAME`)
);

-- COMANDOS DML DE INSERÇÃO DE DADOS

INSERT INTO plants (PLANT_NAME, SENSOR_VALUE, SENSOR_LEVEL) VALUES ('Absinto',19,'HIGH'),
							('Alfazema',15.8,'HIGH'),
							('Arruda',19.9,'HIGH'),
							('Cânfora',29,'HIGH'),
							('Cravo Chabaud',6.3,'HIGH'),
							('Estragão',28.7,'HIGH'),
							('Gerânio',21,'HIGH'),
							('Girassol',13,'LOW'),
							('Lírio do Vale',9.5,'LOW'),
							('Rosa de Saron',11.6,'LOW'),
							('Tagetes',12,'LOW'),
							('Violeta',25,'HIGH');
                            
-- Selecionando tudo
SELECT  * FROM `GREENHOUSE`.`PLANTS`;

-- Selecionando apenas colunas específicas
SELECT PLANT_NAME, SENSOR_EVENT FROM PLANTS;

-- Aplicando filtros na consulta
SELECT PLANT_NAME FROM PLANTS WHERE SENSOR_LEVEL = 'HIGH';

-- Aplicando filtros booleanos
SELECT * FROM PLANTS WHERE SENSOR_LEVEL = 'HIGH' AND 10 <SENSOR_LEVEL< 20;

-- Objetos numa coleção
SELECT * FROM PLANTS WHERE SENSOR_LEVEL IN ('HIGH', 'LOW');

-- Cláusula de ordenação
SELECT * FROM PLANTS WHERE SENSOR_VALUE <15 ORDER BY SENSOR_VALUE DESC;

-- Funções de agrupamento
-- Mostra a quantidade de registros, separados por um registro contido na instrução group by.
SELECT COUNT(*), SENSOR_LEVEL FROM PLANTS GROUP BY SENSOR_LEVEL;

-- EXEMPLO SELECT TOP
SELECT * FROM PLANTS WHERE SENSOR_VALUE>18 LIMIT 3;

-- EXEMPLO MIN E MAX
SELECT MIN(SENSOR_VALUE) FROM PLANTS WHERE SENSOR_LEVEL = 'HIGH';
SELECT MAX(SENSOR_VALUE) FROM PLANTS WHERE SENSOR_LEVEL = 'LOW';

-- EXEMPLO COUNT
SELECT COUNT(*) FROM PLANTS WHERE SENSOR_LEVEL = 'LOW';

-- EXEMPLO SUM
SELECT SUM(SENSOR_VALUE) FROM PLANTS;

-- EXEMPLO AVG
SELECT AVG(SENSOR_VALUE) FROM PLANTS;

-- EXEMPLO LIKE
SELECT * FROM PLANTS WHERE PLANT_NAME LIKE 'A%';
SELECT * FROM PLANTS WHERE PLANT_NAME LIKE '%ni%';
SELECT * FROM PLANTS WHERE PLANT_NAME LIKE '%O';

-- Comando UPDATE para atualizar registros de dados
SELECT * FROM PLANTS;
UPDATE PLANTS SET SENSOR_VALUE = 34, SENSOR_LEVEL = ('HIGH') WHERE PLANT_NAME = 'Rosa de Saron';

-- Comando DELETE para apagar registros
DELETE FROM PLANTS WHERE PLANT_NAME = 'Arruda';
INSERT INTO GREENHOUSE.PLANTS VALUES ('Arruda', 14.5, 'LOW');

-- Comando INSERT INTO SELECT FROM para "copiar" uma tabela em outra.
CREATE TABLE COMPONENTES(ID_COMPONENTE INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT, nome varchar(30));
INSERT INTO COMPONENTES (NOME) SELECT PLANT_NAME FROM PLANTS;
SELECT * FROM COMPONENTES;

-- Comando INNER JOIN para retornar dados que sejam iguais em duas tabelas (NESTE CASO, todos).
SELECT C.ID_COMPONENTE, C.NOME, P.SENSOR_LEVEL FROM COMPONENTES AS C INNER JOIN PLANTS AS P ON C.NOME = P.PLANT_NAME;



-- Comando LEFT JOIN para retornar todos os dados de uma tabela juntamente com aqueles que sejam iguais em duas.
CREATE TABLE GREENHOUSE.VENDAS (
	ID_VENDA INTEGER NOT NULL AUTO_INCREMENT,
    PLANT_NAME CHAR(30) NOT NULL,
    VALOR DOUBLE NOT NULL,
    DATA_VENDA TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(ID_VENDA),
    FOREIGN KEY(PLANT_NAME) REFERENCES PLANTS(PLANT_NAME)
);

INSERT INTO VENDAS (PLANT_NAME, VALOR)
VALUES('Absinto', 5.44),
	  ('Estragão', 2.50),
      ('Alfazema', 5.75),
      ('Rosa de Saron', 49.99);

-- O comando abaixo retornará toda a lista de plantas cadastradas.
-- Entretanto, algumas delas possuem registros de vendas na tabela de vendas.
-- A ligação entre as duas se dá pela chave estrangeira do nome das plantas.
-- Assim, as plantas que possuem um ID de venda atrelado ao seu nome aparecerão primeiro.
SELECT PLANTS.PLANT_NAME, VENDAS.ID_VENDA, VENDAS.VALOR FROM PLANTS
LEFT JOIN VENDAS ON PLANTS.PLANT_NAME = VENDAS.PLANT_NAME
ORDER BY ID_VENDA DESC;

-- Se o comando INNER JOIN fosse utilizado, apenas os registros em comum apareceriam.
SELECT PLANTS.PLANT_NAME, VENDAS.ID_VENDA, VENDAS.VALOR FROM PLANTS
INNER JOIN VENDAS ON PLANTS.PLANT_NAME = VENDAS.PLANT_NAME;






-- Comando CREATE VIEW para criar tabelas "virtuais" com propósito de visualização de dados.alter
-- A VIEW abaixo apresenta as plantas cujo nível de temperatura pode ser considerado baixo, ou frio.
CREATE VIEW COLD_PLANTS AS SELECT PLANT_NAME, SENSOR_VALUE FROM PLANTS WHERE SENSOR_VALUE<15 ORDER BY SENSOR_VALUE DESC;
SELECT * FROM COLD_PLANTS;
DROP VIEW COLD_PLANTS;

-- Esta VIEW mostra quais plantas possuem sua temperatura acima da média de todo o conjunto cadastrado.
CREATE VIEW ABOVE_AVERAGE_PLANTS AS SELECT PLANT_NAME, SENSOR_VALUE FROM PLANTS
			WHERE SENSOR_VALUE>(SELECT AVG(SENSOR_VALUE) FROM PLANTS)
            ORDER BY SENSOR_VALUE DESC;
SELECT * FROM ABOVE_AVERAGE_PLANTS;
DROP VIEW ABOVE_AVERAGE_PLANTS;




