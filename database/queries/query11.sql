-- Listar todos os produtos que já foram pedidos e a média de suas avaliações por ordem decrescente

SELECT p.id, p.name, AVG(r.vote) as media_avaliacoes
FROM products p                                                                           
INNER JOIN orders_products op ON p.id = op.id_product
INNER JOIN orders o ON op.id_order = o.id
INNER JOIN ratings r ON o.id = r.id_order
GROUP BY p.id, p.name
ORDER BY media_avaliacoes DESC
