-- Verificação update
UPDATE cascata.restaurants SET description='Somos um restaurant de comida japonesa' WHERE id=1;
UPDATE cascata.orders SET status='READY' WHERE id=1;
UPDATE cascata.products SET price='22.50' WHERE id=1;
UPDATE cascata.freights SET value='4.00' WHERE id=1;
UPDATE cascata.restaurant_categories SET name='Italiana' WHERE id=1;
UPDATE cascata.motoboys SET license_plate='ABC1D23' WHERE id=1;
UPDATE cascata.deliveries SET status='ON THE WAY' WHERE id=1;
UPDATE cascata.districts SET name='Centro' WHERE id=1;
UPDATE cascata.cities SET name='Guarani' WHERE id=1;
UPDATE cascata.schedules SET start_time='18:00' WHERE id=1;
UPDATE cascata.ratings SET vote=4 WHERE id=1;

-- Verificação delete
DELETE FROM cascata.ratings WHERE id=1;
DELETE FROM  cascata.schedules WHERE id=1;
DELETE FROM cascata.freights WHERE id=1;
DELETE FROM cascata.favorites WHERE id=1;
-- (Não pode apagar pois viola restrição de chave estrangeira)
DELETE FROM cascata.restaurants WHERE id=1;
-- (Não pode apagar pois viola restrição de chave estrangeira)
DELETE FROM cascata.orders WHERE id=1;
-- (Não pode apagar pois viola restrição de chave estrangeira)
DELETE FROM cascata.products WHERE id=1;
