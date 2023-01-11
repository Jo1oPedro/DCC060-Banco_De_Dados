-- Obter a lista de todos os produtos que já foram pedidos pelo menos uma vez

SELECT p.* from products p
WHERE exists
(
	SELECT op.id_product FROM orders_products AS op
	WHERE op.id_product = p.id
)
ORDER BY p.id
