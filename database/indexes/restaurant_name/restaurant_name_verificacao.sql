-- Verificação do índice idx_restaurant_name

-- Consulta 1
SELECT * FROM restaurants
WHERE name = 'Pizzaria Stroele';

-- Consulta 2
SELECT d.* FROM restaurants AS r
INNER JOIN freights f ON f.id_restaurant = r.id
INNER JOIN districts d ON d.id = f.id_district
WHERE r.name = 'Pizzaria Stroele'
ORDER BY f.value
