-- Quanto cada restaurante já recebeu no total dos pedidos

SELECT SUM(o.total_value) AS valor_total, m.id_restaurant AS restaurant 
FROM orders o, deliveries d, motoboys m
WHERE o.id_delivery = d.id
AND m.id = d.id_motoboy
GROUP BY m.id_restaurant
