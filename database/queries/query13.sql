-- Listar todos os pedidos que foram avaliados com nota igual ou superior a 4

SELECT o.*
FROM orders o
WHERE EXISTS (
    SELECT *
    FROM ratings r
    WHERE r.id_order = o.id
    AND r.vote >= 4
)
