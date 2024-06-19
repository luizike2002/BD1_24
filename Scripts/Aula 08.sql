USE NORMALIZACAO;
-- INNER JOIN
-- Retorna os registros que são comuns às duas tabelas.

-- Agrupa os itens da nota pelo número da nota, eliminando a repetição.
-- Conta e soma, exibindo estes dados conforme os grupos de itens das notas.
SELECT 
	NF.NRO_NOTA, NF.NOME_CLIENTE,
    COUNT(INF.COD_PRODUTO) AS QTD,
    SUM(INF.VALOR_TOTAL) AS TOTAL
FROM
	NOTA_FISCAL AS NF
INNER JOIN
	ITEM_NOTA_FISCAL AS INF
ON
	INF.NRO_NOTA = NF.NRO_NOTA
GROUP BY NF.NRO_NOTA, NF.NOME_CLIENTE
ORDER BY QTD, TOTAL DESC;

-- INNER JOIN
-- A nota 17, de Tyr, não será retornada pois não possui nenhum item de nota.

SELECT 
	NF.NRO_NOTA, NF.NOME_CLIENTE, P.DESC_PRODUTO
FROM
	NOTA_FISCAL AS NF
INNER JOIN ITEM_NOTA_FISCAL AS INF 
	ON NF.NRO_NOTA = INF.NRO_NOTA

INNER JOIN PRODUTO AS P
	ON INF.COD_PRODUTO = P.COD_PRODUTO
ORDER BY NF.NRO_NOTA ASC;

-- LEFT JOIN
-- Retorna os registros que estão na tabela à esquerda
-- (mesmo que não estejam à direita) e os registros da tabela à direita que são comuns a ela.alter
-- Agora, a NF de Tyr será mostrada, mesmo que ela não tenha nenhum produto.
SELECT 
	NF.NRO_NOTA, NF.NOME_CLIENTE, P.DESC_PRODUTO
FROM
	NOTA_FISCAL AS NF
LEFT JOIN ITEM_NOTA_FISCAL AS INF 
	ON NF.NRO_NOTA = INF.NRO_NOTA

LEFT JOIN PRODUTO AS P
	ON INF.COD_PRODUTO = P.COD_PRODUTO
ORDER BY NF.NRO_NOTA ASC;


-- RIGHT JOIN 
-- Usamos o right join para exibir os registros que estão na tabela
-- à direita mesmo que não estejam à esquerda, e os registros da tabela à esquerda que são comuns à direita
-- No caso, Tyr não aparecerá, mas o produto sem nenhuma nota fiscal sim.
SELECT 
	NF.NRO_NOTA, NF.NOME_CLIENTE, P.DESC_PRODUTO
FROM
	NOTA_FISCAL AS NF
RIGHT JOIN ITEM_NOTA_FISCAL AS INF 
	ON NF.NRO_NOTA = INF.NRO_NOTA

RIGHT JOIN PRODUTO AS P
	ON INF.COD_PRODUTO = P.COD_PRODUTO
ORDER BY NF.NRO_NOTA ASC;
