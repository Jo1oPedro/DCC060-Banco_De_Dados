-- View destinada aos clientes do sistema

CREATE VIEW restaurant_products AS
SELECT p.* FROM products p
JOIN restaurants r ON p.id_restaurant = r.id;
