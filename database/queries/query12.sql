-- Obter o frete de todos os bairros de um determinado restaurante e ordenar em ordem crescente de valor

SELECT d.* FROM restaurants AS r
INNER JOIN freights f ON f.id_restaurant = r.id
INNER JOIN districts d ON d.id = f.id_district
WHERE r.name = 'Pizzaria Stroele'
ORDER BY f.value
