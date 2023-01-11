-- view destinada ao dono do restaurante

CREATE VIEW top_selling_products_of_month AS
SELECT p.name, SUM(op.amount) as quantidade,
EXTRACT(MONTH FROM o.order_date) as mes, r.name
as restaurant_name
FROM products p
JOIN orders_products op ON p.id = op.id_product
JOIN orders o ON op.id_order = o.id
JOIN restaurants r ON p.id_restaurant = r.id
GROUP BY p.id, EXTRACT(MONTH FROM
o.order_date), r.id
ORDER BY quantidade DESC, mes;
