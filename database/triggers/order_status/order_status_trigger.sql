-- Triggers e Procedures

-- Order status

CREATE OR REPLACE FUNCTION finish_order()
	RETURNS trigger AS
$$
	BEGIN
		UPDATE
			orders
		SET
			status = 'FINISHED'
		WHERE
			id_delivery = new.id;

		RETURN NEW;
	END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER order_status
	AFTER UPDATE ON deliveries
	FOR EACH ROW
	WHEN (new.status = 'DELIVERED')
	EXECUTE PROCEDURE finish_order();

