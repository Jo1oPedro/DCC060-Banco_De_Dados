-- Qual é o pedido mais caro de um cliente

SELECT * FROM orders
WHERE id_client = 1
AND total_value= (
    SELECT MAX(total_value) FROM orders
    WHERE id_client = 1 
);
