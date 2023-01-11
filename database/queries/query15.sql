-- Listar todos os restaurantes que pertencem a uma dada categoria

SELECT r.name
FROM restaurants r
JOIN restaurants_restaurant_categories rrc ON r.id = rrc.id_restaurant
JOIN restaurant_categories rc ON rrc.id_restaurant_category = rc.id
WHERE rc.name IN ('Pizzaria', 'Lanchonete')
