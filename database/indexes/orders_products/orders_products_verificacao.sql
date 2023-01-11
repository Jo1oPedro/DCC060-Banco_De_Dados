-- Verificação do índice idx_orders_products

-- Consulta 1
SELECT p.id, p.name, AVG(r.vote) as media_avaliacoes
FROM products p                                                                           
INNER JOIN orders_products op ON p.id = op.id_product
INNER JOIN orders o ON op.id_order = o.id
INNER JOIN ratings r ON o.id = r.id_order
GROUP BY p.id, p.name
ORDER BY media_avaliacoes DESC

-- Consulta 2
SELECT * FROM restaurant_rating_report(1);
