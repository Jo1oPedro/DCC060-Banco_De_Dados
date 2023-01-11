-- Quantas vezes cada cliente fez um pedido em seu restaurante favorito

SELECT u.id AS client_id, u.name, t2.id_restaurant, r.name as restaurant_name, t2.total_pedido FROM 
(
	SELECT COUNT(*) as total_pedido, t.id_client as cliente, t.id_restaurant FROM 
	(
	   SELECT o.id, f.* FROM  
	   orders o, 
	   favorites f
	   WHERE o.id_client = f.id_client 
	) t
	GROUP BY t.id_client, t.id_restaurant
) t2
JOIN restaurants r ON r.id = t2.id_restaurant
JOIN users u ON u.id = t2.cliente
ORDER BY t2.cliente
