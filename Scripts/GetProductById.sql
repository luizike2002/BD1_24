USE NORMALIZACAO;

DELIMITER $$


CREATE PROCEDURE GetProductById(
	IN pProductId INT,
    OUT pProductLevel VARCHAR(20)
)
BEGIN
	DECLARE VALOR DECIMAL(10,2) DEFAULT 0;
    
    SELECT COUNT(*)
    INTO VL_PRODUTO
    FROM PRODUTO AS P
    WHERE P.COD_PRODUTO = pProductId;
    
    IF(VALOR >= 5 AND VALOR <= 10 ) THEN 
		SET pProductLevel = 'Crítico';
	ELSEIF(VALOR > 10 AND VALOR <= 20) THEN
		SET pProductLevel = 'Preocupante';
	ELSEIF(VALOR > 20) THEN 
		SET pProductLevel = 'Normal';
	ELSE
		SET pProductLevel = 'Fuja';
	END IF;

END$$

DELIMITER ;

