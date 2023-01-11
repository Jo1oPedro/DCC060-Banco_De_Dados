-- Triggers e Procedures

-- Restauranrt rating

CREATE TYPE rating_report AS (id_restaurant int, rating_average numeric, rating_count int);

CREATE OR REPLACE FUNCTION rating_report_by_restaurant()
	RETURNS SETOF rating_report AS
$$
	SELECT
		t.id_restaurant,
		AVG(r1.vote) AS rating_average,
		COUNT(*) AS rating_count
	FROM
		ratings r1
	INNER JOIN
		(
			SELECT
				p.id_restaurant,
				r2.id_order
			FROM
				ratings r2
				INNER JOIN orders_products op
					ON r2.id_order = op.id_order
				INNER JOIN products p
					ON op.id_product = p.id
			WHERE
				r2.vote IS NOT NULL
			GROUP BY
				p.id_restaurant,
				r2.id_order
		) t
	ON r1.id_order = t.id_order
	GROUP BY
		t.id_restaurant
	ORDER BY
		rating_average DESC
$$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION restaurant_rating_report(id_rest int)
	RETURNS rating_report AS
$$
	DECLARE
		r_report rating_report;
	BEGIN
		SELECT
			*
		FROM
			rating_report_by_restaurant() ra
		WHERE
			ra.id_restaurant = id_rest
		INTO
			r_report;

		RETURN r_report;
	END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_restaurant_rating()
	RETURNS trigger AS
$$
	DECLARE
		id_rest int;
		rest_rating_report rating_report;
	BEGIN
		IF (TG_OP = 'DELETE') THEN
			SELECT
				p.id_restaurant
			FROM
				orders_products op
				INNER JOIN products p
					ON op.id_product = p.id
			WHERE
				op.id_order = old.id_order
			LIMIT
				1
			INTO
				id_rest;
		ELSE
			SELECT
				p.id_restaurant
			FROM
				orders_products op
				INNER JOIN products p
					ON op.id_product = p.id
			WHERE
				op.id_order = new.id_order
			LIMIT
				1
			INTO
				id_rest;
		END IF;

		SELECT * FROM restaurant_rating_report(id_rest)
		INTO rest_rating_report;

		IF (rest_rating_report.rating_count IS NULL) THEN
			UPDATE
				restaurants r
			SET
				rating_average = rest_rating_report.rating_average,
				rating_count = 0
			WHERE
				r.id = id_rest;
		ELSE
			UPDATE
				restaurants r
			SET
				rating_average = rest_rating_report.rating_average,
				rating_count = rest_rating_report.rating_count
			WHERE
				r.id = id_rest;
		END IF;

		IF (TG_OP = 'DELETE') THEN
			RETURN old;
		ELSE
			RETURN new;
		END IF;
	END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER restaurant_rating
	AFTER INSERT OR UPDATE ON ratings
	FOR EACH ROW
	WHEN (new.vote IS NOT NULL)
	EXECUTE PROCEDURE update_restaurant_rating();

CREATE TRIGGER restaurant_rating_on_delete
	AFTER DELETE ON ratings
	FOR EACH ROW
	WHEN (old.vote IS NOT NULL)
	EXECUTE PROCEDURE update_restaurant_rating();

-- Verificações
UPDATE ratings SET vote = 3 WHERE id = 3;

INSERT INTO
	ratings (vote, feedback, id_order)
VALUES
	(5, NULL, 11);

DELETE FROM ratings where id = 10;
