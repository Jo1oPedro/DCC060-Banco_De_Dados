SELECT * FROM top_selling_products_of_month WHERE mes =
EXTRACT(MONTH FROM CURRENT_DATE)
AND restaurant_name = 'Pizzaria Stroele';
