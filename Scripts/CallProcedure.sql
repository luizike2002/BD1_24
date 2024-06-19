USE NORMALIZACAO;

CALL GetAllProducts();

CALL GetProductById(10, @level);
SELECT @level;