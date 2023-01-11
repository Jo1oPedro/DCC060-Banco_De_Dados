-- Listar todos os clientes que já fizeram pelo menos uma compra em um determinado período

SELECT c.id_user, u.name
FROM clients c
JOIN users u ON u.id = c.id_user
WHERE EXISTS (
    SELECT *
    FROM orders o
    WHERE o.id_client = c.id_user
    AND o.order_date BETWEEN '2022-05-01' AND '2022-12-31'
)
