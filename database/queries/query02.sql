-- Obter a lista de todos os clientes e inclua os seus pedidos se houver algum

SELECT * FROM clients c
LEFT JOIN orders o ON c.id_user = o.id_client;
