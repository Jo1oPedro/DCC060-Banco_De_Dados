-- Obter a lista de todos os pedidos e inclua a sua avaliação se houver alguma

SELECT * FROM ratings
RIGHT JOIN orders ON ratings.id_order = orders.id;
