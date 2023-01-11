-- Qual motoboy fez mais entregas no mês de janeiro

SELECT t.contagem, t.id_motoboy FROM
(
    SELECT COUNT(d.id_motoboy) as contagem, d.id_motoboy FROM
    orders AS o
    INNER JOIN deliveries d ON d.id = o.id_delivery
    WHERE extract(month FROM o.order_date) = 1
    GROUP BY d.id_motoboy
) t
WHERE t.contagem = 
(
	SELECT MAX(t2.contagem) FROM (
		SELECT COUNT(d.id_motoboy) as contagem, d.id_motoboy FROM
		orders AS o
		INNER JOIN deliveries d ON d.id = o.id_delivery
		WHERE extract(month FROM o.order_date) = 1
		GROUP BY d.id_motoboy
	) t2
)
