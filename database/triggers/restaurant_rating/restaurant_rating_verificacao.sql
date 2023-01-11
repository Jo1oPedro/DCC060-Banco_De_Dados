-- Trigger: restaurant_rating

-- Verificações
UPDATE ratings SET vote = 3 WHERE id = 3;

INSERT INTO
	ratings (vote, feedback, id_order)
VALUES
	(5, NULL, 11);

DELETE FROM ratings where id = 10;
