-- Obter a lista de todos os produtos que nunca foram pedidos

SELECT * FROM products AS p 
FULL OUTER JOIN orders_products AS op ON p.id = op.id_product 
WHERE p.id is NULL OR op.id_product is NULL
