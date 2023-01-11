CREATE TABLE cities 
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL
);

CREATE TABLE districts 
(
 	id SERIAL PRIMARY KEY,
 	name VARCHAR(255) NOT NULL,
	id_city INT NOT NULL,
  
  	CONSTRAINT fk_districts_cities FOREIGN KEY (id_city) REFERENCES cities(id)
);

CREATE TABLE addresses
(
  	id SERIAL PRIMARY KEY,
 	street VARCHAR(255) NOT NULL,  
	complement VARCHAR(255),
	number INT NOT NULL,
	CEP INT NOT NULL,
	id_district INT NOT NULL,
	
 	CONSTRAINT fk_addresses_districts FOREIGN KEY (id_district) REFERENCES districts(id)
);

CREATE TABLE restaurants 
(
	id SERIAL PRIMARY KEY,  
	name VARCHAR(255) NOT NULL,  
 	minimal_value NUMERIC,  
	description VARCHAR(255),
	rating_average NUMERIC,
	rating_count INT DEFAULT 0 NOT NULL,
	cnpj VARCHAR(14) NOT NULL,
	id_address INT NOT NULL,

	CONSTRAINT fk_restaurants_addresses FOREIGN KEY (id_address) REFERENCES addresses(id)
);

CREATE TABLE phones
(
	id SERIAL PRIMARY KEY,
  	country VARCHAR(10) NOT NULL,
  	ddd VARCHAR(10) NOT NULL,
  	phone_number VARCHAR(255) NOT NULL
);

CREATE TABLE users 
(
	id SERIAL PRIMARY KEY,
	password TEXT NOT NULL,
	name VARCHAR(255) NOT NULL,
  	email VARCHAR(255) NOT NULL,
	id_phone INT NOT NULL,
  
  	CONSTRAINT fk_users_phones FOREIGN KEY (id_phone) REFERENCES phones(id)
); 

CREATE TABLE products 
(
  	id SERIAL PRIMARY KEY,
 	name VARCHAR(255) NOT NULL,
	price NUMERIC NOT NULL,
	description VARCHAR(255),
 	id_restaurant INT NOT NULL,
  
  	CONSTRAINT fk_products_restaurants FOREIGN KEY (id_restaurant) REFERENCES restaurants(id)
);


CREATE TABLE restaurant_owners
(
	id_user INT PRIMARY KEY,
  	
  	CONSTRAINT fk_restaurant_owners_users FOREIGN KEY (id_user) REFERENCES users(id)
); 

CREATE TABLE administrators
( 
	id_user INT PRIMARY KEY,
  	
  	CONSTRAINT fk_administrators_users FOREIGN KEY (id_user) REFERENCES users(id)
);

CREATE TABLE clients 
(
 	id_user INT PRIMARY KEY,
 	
  	CONSTRAINT fk_clients_users FOREIGN KEY (id_user) REFERENCES users(id)
);

CREATE TABLE motoboys 
(
 	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	license_plate VARCHAR(255) NOT NULL,
 	CPF VARCHAR(255) NOT NULL,
	id_restaurant INT NOT NULL,
	id_phone INT NOT NULL,
 	
  	CONSTRAINT fk_motoboys_restaurants FOREIGN KEY (id_restaurant) REFERENCES restaurants(id),
  	CONSTRAINT fk_motoboys_phones FOREIGN KEY (id_phone) REFERENCES phones(id)
);

CREATE TYPE DeliveryStatus AS ENUM (
	'WAITING',
  	'ON THE WAY',
  	'DELIVERED'
);

CREATE TABLE deliveries 
(
  	id SERIAL PRIMARY KEY,
	status DeliveryStatus NOT NULL,
	id_motoboy INT NOT NULL,
  
  	CONSTRAINT fk_deliveries_motoboys FOREIGN KEY (id_motoboy) REFERENCES motoboys(id)
);

CREATE TYPE OrderStatus AS ENUM (
	'PENDANT',
  	'APPROVED',
  	'PREPARING',
  	'READY',
  	'FINISHED'
);

CREATE TABLE orders 
(
	id SERIAL PRIMARY KEY,
  	order_date TIMESTAMPTZ NOT NULL DEFAULT now(),
 	status OrderStatus NOT NULL,
 	total_value NUMERIC NOT NULL,
 	note VARCHAR(255),
 	id_client INT NOT NULL,
 	id_delivery INT,
  
	CONSTRAINT fk_orders_clients FOREIGN KEY (id_client) REFERENCES clients(id_user),
	CONSTRAINT fk_orders_deliveries FOREIGN KEY (id_delivery) REFERENCES deliveries(id)
);

CREATE TYPE DiscountType AS ENUM (
	'PERCENT',
  	'REAL'
);

CREATE TABLE discount_coupons 
(
	id SERIAL PRIMARY KEY,
 	value NUMERIC NOT NULL,
	due_date TIMESTAMPTZ,
	type DiscountType
); 

CREATE TABLE restaurant_categories 
(
 	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL UNIQUE  
); 

CREATE TABLE ratings 
(
  	id SERIAL PRIMARY KEY,
	vote INT CHECK (vote BETWEEN 1 AND 5),
	feedback VARCHAR(255),
	id_order INT NOT NULL,
  
  	CONSTRAINT fk_ratings_orders FOREIGN KEY (id_order) REFERENCES orders(id)
); 

CREATE TABLE clients_addresses 
(
	id SERIAL PRIMARY KEY,
	id_client INT NOT NULL,
	id_address INT NOT NULL,
  	
  	CONSTRAINT fk_clients_addresses_clients FOREIGN KEY (id_client) REFERENCES clients(id_user),
  	CONSTRAINT fk_clients_addresses_addresses FOREIGN KEY (id_address) REFERENCES addresses(id)
);

CREATE TYPE Weekday AS ENUM (
	'SUNDAY',
	'MONDAY',
	'TUESDAY',
	'WEDNESDAY',
	'THURSDAY',
	'FRIDAY',
	'SATURDAY'
);

CREATE TABLE schedules 
(
	id SERIAL PRIMARY KEY,
	start_time TIME(0) NOT NULL,
	end_time TIME(0) NOT NULL,
	week_day Weekday NOT NULL,
	id_restaurant INT NOT NULL,
  
 	CONSTRAINT fk_schedules_restaurants FOREIGN KEY (id_restaurant) REFERENCES restaurants(id)
);

CREATE TABLE favorites 
(
  	id SERIAL PRIMARY KEY,
 	id_client INT NOT NULL,
  	id_restaurant INT NOT NULL,
  
  	CONSTRAINT fk_favorites_clients FOREIGN KEY (id_client) REFERENCES clients(id_user),
  	CONSTRAINT fk_favorites_restaurants FOREIGN KEY (id_restaurant) REFERENCES restaurants(id)
); 

CREATE TABLE freights 
(
  	id SERIAL PRIMARY KEY,
	value NUMERIC NOT NULL,
  	id_restaurant INT NOT NULL,
  	id_district INT NOT NULL,
 	
  	CONSTRAINT fk_freights_restaurants FOREIGN KEY (id_restaurant) REFERENCES restaurants(id),
  	CONSTRAINT fk_freights_districts FOREIGN KEY (id_district) REFERENCES districts(id)
);

CREATE TABLE clients_discount_coupons 
(
	id SERIAL PRIMARY KEY,
	id_client INT NOT NULL,
	id_discount_coupon INT NOT NULL,
	id_order INT NOT NULL,

	CONSTRAINT fk_clients_discount_coupons_clients FOREIGN KEY (id_client) REFERENCES clients(id_user),
	CONSTRAINT fk_clients_discount_coupons_discount_coupons FOREIGN KEY (id_discount_coupon) REFERENCES discount_coupons(id),
	CONSTRAINT fk_clients_discount_coupons_orders FOREIGN KEY (id_order) REFERENCES orders(id),

	UNIQUE (id_client, id_discount_coupon),
	UNIQUE (id_order)
);

CREATE TABLE clients_addresses_deliveries
(
	id SERIAL PRIMARY KEY,
	id_clients_address INT NOT NULL,
	id_delivery INT NOT NULL,

	CONSTRAINT fk_clients_addresses_deliveries_clients_addresses FOREIGN KEY (id_clients_address) REFERENCES clients_addresses (id),
	CONSTRAINT fk_clients_addresses_deliveries_deliveries FOREIGN KEY (id_delivery) REFERENCES deliveries (id)
);

CREATE TABLE orders_products 
(
	id SERIAL PRIMARY KEY,
	id_order INT NOT NULL,
	id_product INT NOT NULL,
	amount INT NOT NULL,

	CONSTRAINT fk_orders_products_orders FOREIGN KEY (id_order) REFERENCES orders(id),
	CONSTRAINT fk_orders_products_products FOREIGN KEY (id_product) REFERENCES products(id)
);

CREATE TABLE restaurant_owners_restaurants 
(
	id SERIAL PRIMARY KEY,
	id_restaurant_owner INT NOT NULL,
	id_restaurant INT NOT NULL,

	CONSTRAINT fk_restaurant_owners_restaurants_restaurant_owners FOREIGN KEY (id_restaurant_owner) REFERENCES restaurant_owners(id_user),
	CONSTRAINT fk_restaurant_owners_restaurants_restaurants FOREIGN KEY (id_restaurant) REFERENCES restaurants(id)
);

CREATE TABLE restaurants_restaurant_categories 
(
	id SERIAL PRIMARY KEY,
	id_restaurant INT NOT NULL,
	id_restaurant_category INT NOT NULL,

	CONSTRAINT fk_restaurants_restaurant_categories_restaurant FOREIGN KEY (id_restaurant) REFERENCES restaurants(id),
	CONSTRAINT fk_restaurants_restaurant_categories_restaurant_categories FOREIGN KEY (id_restaurant_category) REFERENCES restaurant_categories(id)
);