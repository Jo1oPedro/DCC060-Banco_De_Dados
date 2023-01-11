-- Script Carga

-- Tabela: cities / Instâncias: 5
INSERT INTO
	cities (name)
VALUES
	('Juiz de Fora'),
	('Belo Horizonte'),
	('Vitória'),
	('São Paulo'),
	('Rio de Janeiro');

-- Tabela: districts / Instâncias: 17
INSERT INTO
	districts (name, id_city)
VALUES
	('São Pedro', 1),
	('Cascatinha', 1),
	('São Mateus', 1),
	('Centro', 1),
	('São Luís', 2),
	('Liberdade', 2),
	('Ouro Preto', 2),
	('Centro', 2),
	('Jardim da Penha', 3),
	('Goiabeiras', 3),
	('Jardim Camburi', 3),
	('Ibirapuera', 4),
	('Vila Formosa', 4),
	('Campo Limpo', 4),
	('Santa Teresa', 5),
	('Ipanema', 5),
	('Copacabana', 5);

-- Tabela: addresses / Instâncias: 20
INSERT INTO
	addresses (street, complement, number, cep, id_district)
VALUES
	('José Silva', 'Apt 204', 190, '28706903', 1),
	('João', NULL, 192, '28706913', 1),
	('Presidente', NULL, 200, '28706904', 2),
	('João Goulart', NULL, 260, '28566904', 2),
	('Marechal Deodoro', NULL, 201, '28706904', 3),
	('Getúlio Vargas', NULL, 205, '28706905', 4),
	('Itamar Franco', NULL, 207, '28716904', 5),
	('Juscelino', NULL, 15, '28712904', 6),
	('Floriano Peixoto', NULL, 17, '28703404', 7),
	('Prudente de Morais', NULL, 14, '28156904', 8),
	('Campos Sales', NULL, 359, '38706904', 9),
	('Rodrigues Alves', NULL, 412, '45706904', 10),
	('Afonson Pena', NULL, 10, '23506904', 11),
	('Nilo Peçanha', NULL, 27, '28676904', 12),
	('Hermes da Fonseca', NULL, 32, '28236904', 13),
	('Rodrigues Alves', NULL, 43, '28734504', 14),
	('Epitácio Pessoa', NULL, 34, '28756704', 15),
	('Artur Bernardes', NULL, 576, '28706701', 16),
	('Júlio Prestes', NULL, 1001, '28706653', 17),
	('Jânio Quadros', NULL, 1010, '28725704', 17);

-- Tabela: restaurants / Instâncias: 7
INSERT INTO
	restaurants (name, minimal_value, description, cnpj, id_address)
VALUES
	('McDonalds', 15.00, 'Aqui você encontra o melhor Big Mac da cidade', '12345678912345', 1),
	('Subway', 20.00, 'Baratíssimo!!', '12345654612345', 7),
	('La Dolina', 20.00, 'Casa de carnes Argentina', '26755678512345', 11),
	('Pizzaria Stroele', 35.00, 'A melhor pizza da cidade', '56745678912345', 14),
	('Bobs', 10.00, 'Milk Shakes em promoção!', '50289679567345', 20),
	('Forno a lenha', NULL, NULL, '50285479567335', 19),
	('Oro Restaurante', NULL, 'O melhor do Brasil!', '20285423567335', 18);


-- Tabela: phones / Instâncias: 19
INSERT INTO
	phones (country, ddd, phone_number)
VALUES
	('55', '27', '999998888'),
	('55', '32', '999998887'),
	('55', '32', '999998886'),
	('55', '32', '999998885'),
	('55', '31', '999998884'),
	('55', '31', '999998883'),
	('55', '31', '999998882'),
	('55', '31', '999998881'),
	('55', '31', '999998880'),
	('55', '32', '888889999'),
	('55', '32', '888889998'),
	('55', '32', '888889997'),
	('55', '32', '888889996'),
	('55', '32', '888889995'),
	('55', '32', '888889994'),
	('55', '32', '888889993'),
	('55', '32', '888889992'),
	('55', '32', '888889991'),
	('55', '32', '888889990');
	
-- Tabela: users / Instâncias: 9
INSERT INTO
	users (password, name, email, id_phone)
VALUES
	(crypt('123456', gen_salt('bf', 8)), 'Gabriel Frasson', 'frasson@email.com', 1),
	(crypt('123456', gen_salt('bf', 8)), 'João', 'joao@email.com', 2),
	(crypt('123456', gen_salt('bf', 8)), 'Gabriel Bahia', 'bahia@email.com', 3),
	(crypt('123456', gen_salt('bf', 8)), 'José', 'jose@email.com', 4),
	(crypt('123456', gen_salt('bf', 8)), 'Maria', 'maria@email.com', 5),
	(crypt('123456', gen_salt('bf', 8)), 'Felipe', 'felipe@email.com', 6),
	(crypt('123456', gen_salt('bf', 8)), 'Victor', 'victor@email.com', 7),
	(crypt('123456', gen_salt('bf', 8)), 'Bárbara', 'barbara@email.com', 8),
	(crypt('123456', gen_salt('bf', 8)), 'Pedro', 'pedro@email.com', 9);

-- Tabela: products / Instâncias: 24
INSERT INTO
	products (name, price, description, id_restaurant)
VALUES
	('Big Mac', 25.00, 'Dois hambúrgueres (100% carne bovina), alface americana, queijo cheddar, maionese Big Mac, cebola, picles e pão com gergelim.', 1),
	('Cheeseburger', 14.99, 'Um hamburguer (100% carne bovina), queijo sabor cheddar, cebola, picles, ketchup, mostarda e pão sem gergelim.', 1),
	('McFritas', 8.99, 'A batata frita mais famosa do mundo. Deliciosas batatas selecionadas, fritas, crocantes por fora, macias por dentro, douradas, irresistíveis, saborosas, famosas, e todos os outros adjetivos positivos que você quiser dar.', 1),
	('Frango Ranch', 17.99, 'Frango defumado em cubos e molho ranch', 2),
	('Frango defumado com Cream Cheese', 18.99, 'Frango defumado em cubos e Cream Cheese', 2),
	('Baratíssimo', 14.50, 'Frango grelhado', 2),
	('Polígrafo de Flores', 39.00, 'Saboroso hambúrguer de fraldinha (200g) com tomates confitados, bacon assado, rúcula e molho de champignons, alho poró e vinho branco em pão de ervas.', 3),
	('Queijo a La Parrilla', 38.00, NULL, 3),
	('Moda do Chef', 54.00, NULL, 4),
	('Marguerita', 60.00, NULL, 4),
	('Portuguesa', 50.00, NULL, 4),
	('Calabresa', 45.00, NULL, 4),
	('Frango com catupiry', 45.00, NULL, 4),
	('Milk shake 300ml', 11.00, NULL, 5),
	('Milk shake 500ml', 13.00, NULL, 5),
	('Milk shake 700ml', 15.00, NULL, 5),
	('Casquinha', 3.50, NULL, 5),
	('Cascão', 5.50, NULL, 5),
	('Moda do Chef', 64.00, NULL, 6),
	('Marguerita', 70.00, NULL, 6),
	('Portuguesa', 60.00, NULL, 6),
	('Picanha', 100.00, NULL, 7),
	('Risoto', 150.00, NULL, 7),
	('Escalope', 85.00, NULL, 7);

-- Tabela: restaurant_owners / Instâncias: 6
INSERT INTO
	restaurant_owners (id_user)
VALUES
	(1),
	(2),
	(3),
	(7),
	(8),
	(9);

-- Tabela: administrators / Instâncias: 3
INSERT INTO
	administrators (id_user)
VALUES
	(1),
	(2),
	(3);

-- Tabela: clients / Instâncias: 8
INSERT INTO
	clients (id_user)
VALUES
	(1),
	(2),
	(3),
	(4),
	(5),
	(6),
	(7),
	(8);

-- Tabela: motoboys / Instâncias: 10
INSERT INTO
	motoboys (name, license_plate, CPF, id_restaurant, id_phone)
VALUES
	('João', 'ABC1234', '12345678901', 1, 10),
	('Maria', 'BCD1234', '22345678901', 1, 11),
	('José', 'GCD1234', '22655678901', 1, 12),
	('Pedro', 'GCJ2234', '22655678901', 2, 13),
	('Paulo', 'GCA1224', '22698678901', 2, 14),
	('Gustavo', 'GCB9224', '22698678031', 3, 15),
	('Gisele', 'JCB9224', '22623878031', 4, 16),
	('Marcos', 'GCB9202', '42598678031', 5, 17),
	('Victor', 'GCB3214', '22698678281', 6, 18),
	('Lucas', 'JLB9224', '89398678031', 7, 19);

-- Tabela: deliveries / Instâncias: 16
INSERT INTO
	deliveries (status, id_motoboy)
VALUES
	('WAITING', 1),
	('ON THE WAY', 2),
	('ON THE WAY', 3),
	('DELIVERED', 1),
	('DELIVERED', 2),
	('DELIVERED', 3),
	('DELIVERED', 4),
	('DELIVERED', 5),
	('DELIVERED', 6),
	('DELIVERED', 7),
	('DELIVERED', 8),
	('DELIVERED', 9),
	('DELIVERED', 10),
	('WAITING', 10),
	('WAITING', 10),
	('WAITING', 10);

-- Tabela: orders / Instâncias: 17
INSERT INTO
	orders (status, total_value, note, id_client, id_delivery)
VALUES
	('PENDANT', 25.00, NULL, 1, 1),            -- Big Mac 
	('READY', 14.99, NULL, 1, 2),              -- Cheeseburger
	('READY', 33.99, NULL, 2, 3),              -- Big Mac + McFritas
	('READY', 25.00, 'Sem alface', 3, 4),      -- Big Mac
	('READY', 14.99, NULL, 3, 5),              -- Cheeseburger
	('READY', 39.99, NULL, 4, 6),              -- Big Mac + Cheeseburger
	('READY', 17.99, NULL, 5, 7),              -- Frango Ranch
	('READY', 18.99, NULL, 3, 8),              -- Frango defumado com Cream Cheese
	('READY', 39.00, NULL, 1, 9),              -- Polígrafo de Flores
	('READY', 60.00, NULL, 2, 10),             -- Marguerita
	('READY', 11.00, NULL, 3, 11),             -- Milk shake 300ml
	('READY', 64.00, NULL, 7, 12),             -- Moda do Chef
	('READY', 85.00, NULL, 8, 13),             -- Escalope
	('APPROVED', 185.00, NULL, 1, 14),         -- Escalope + Picanha
	('PREPARING', 100.00, NULL, 2, 15),        -- Picanha
	('READY', 150.00, NULL, 3, 16),            -- Risoto
	('PENDANT', 150.00, NULL, 5, NULL);        -- Risoto

-- Tabela: discount_coupons / Instâncias: 5
INSERT INTO
	discount_coupons (value, due_date, type)
VALUES
	(15, timestamptz '2023-01-20 23:59:59 America/Sao_Paulo', 'REAL'),
	(10, timestamptz '2023-01-25 23:59:59 America/Sao_Paulo', 'PERCENT'),
	(10, timestamptz '2023-01-05 23:59:59 America/Sao_Paulo', 'REAL'),
	(20, timestamptz '2023-01-04 23:59:59 America/Sao_Paulo', 'REAL'),
	(15, timestamptz '2023-01-26 23:59:59 America/Sao_Paulo', 'PERCENT');
	
-- Tabela: restaurant_categories / Instâncias: 7
INSERT INTO
	restaurant_categories (name)
VALUES
	('Fast Food'),
	('Lanchonete'),
	('Pizzaria'),
	('Sorveteria'),
	('Gourmet'),
	('Vegano'),
	('Churrascaria');

-- Tabela: ratings / Instâncias: 10
INSERT INTO
	ratings (vote, feedback, id_order)
VALUES
	(5, 'Muito bom', 1),
	(1, 'Não gostei', 2),
	(2, 'Ok', 3),
	(3, 'Mediano', 4),
	(4, 'Bom', 5),
	(5, 'Fantástico!', 6),
	(5, 'Muito bom mesmo', 7),
	(4, 'Bom demais', 8),
	(5, 'Gostei', 9),
	(3, 'Mediano', 10);

-- Tabela: clients_addresses / Instâncias: 13
INSERT INTO
	clients_addresses (id_client, id_address)
VALUES
	(1, 2),
	(2, 2),
	(2, 3),
	(3, 4),
	(4, 5),
	(5, 6),
	(6, 8),
	(7, 9),
	(8, 10),
	(8, 12),
	(8, 13),
	(8, 15),
	(8, 16);

-- Tabela: schedules / Instâncias: 36
INSERT INTO
	schedules (start_time, end_time, week_day, id_restaurant)
VALUES
	('08:00', '22:00', 'MONDAY', 1),
	('08:00', '22:00', 'TUESDAY', 1),
	('08:00', '22:00', 'WEDNESDAY', 1),
	('08:00', '22:00', 'THURSDAY', 1),
	('08:00', '22:00', 'FRIDAY', 1),
	('08:00', '22:00', 'SATURDAY', 1),
	('10:00', '22:00', 'MONDAY', 2),
	('10:00', '22:00', 'TUESDAY', 2),
	('10:00', '22:00', 'WEDNESDAY', 2),
	('10:00', '22:00', 'THURSDAY', 2),
	('10:00', '22:00', 'FRIDAY', 2),
	('08:00', '20:00', 'MONDAY', 3),
	('08:00', '20:00', 'TUESDAY', 3),
	('08:00', '20:00', 'WEDNESDAY', 3),
	('08:00', '20:00', 'THURSDAY', 3),
	('10:00', '22:00', 'FRIDAY', 3),
	('08:00', '22:00', 'MONDAY', 4),
	('08:00', '22:00', 'TUESDAY', 4),
	('08:00', '22:00', 'WEDNESDAY', 4),
	('08:00', '22:00', 'THURSDAY', 4),
	('08:00', '22:00', 'FRIDAY', 4),
	('08:00', '22:00', 'MONDAY', 5),
	('08:00', '22:00', 'TUESDAY', 5),
	('08:00', '22:00', 'WEDNESDAY', 5),
	('08:00', '22:00', 'THURSDAY', 5),
	('08:00', '22:00', 'FRIDAY', 5),
	('08:00', '22:00', 'MONDAY', 6),
	('08:00', '22:00', 'TUESDAY', 6),
	('08:00', '22:00', 'WEDNESDAY', 6),
	('08:00', '22:00', 'THURSDAY', 6),
	('08:00', '22:00', 'FRIDAY', 6),
	('08:00', '22:00', 'MONDAY', 7),
	('08:00', '22:00', 'TUESDAY', 7),
	('08:00', '22:00', 'WEDNESDAY', 7),
	('08:00', '22:00', 'THURSDAY', 7),
	('08:00', '22:00', 'FRIDAY', 7);

-- Tabela: favorites / Instâncias: 7
INSERT INTO
	favorites (id_client, id_restaurant)
VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(2, 5),
	(2, 6),
	(3, 1);

-- Tabela: freights / Instâncias: 23
INSERT INTO
	freights (value, id_restaurant, id_district)
VALUES
	(3.50, 1, 1),
	(2.50, 1, 2),
	(4.50, 1, 3),
	(5.00, 1, 4),
	(5.00, 2, 5),
	(6.00, 2, 6),
	(5.50, 2, 7),
	(7.00, 2, 8),
	(5.00, 3, 9),
	(4.00, 3, 10),
	(3.00, 3, 11),
	(4.00, 4, 12),
	(4.00, 4, 13),
	(4.00, 4, 14),
	(5.00, 5, 15),
	(5.00, 5, 16),
	(5.00, 5, 17),
	(6.00, 6, 15),
	(6.00, 6, 16),
	(6.00, 6, 17),
	(3.00, 7, 15),
	(3.00, 7, 16),
	(3.00, 7, 17);

-- Tabela: clients_discount_coupons / Instâncias: 3
INSERT INTO
	clients_discount_coupons (id_client, id_discount_coupon, id_order)
VALUES
	(1, 1, 1),
	(1, 2, 2),
	(2, 2, 3);

-- Tabela: clients_addresses_deliveries / Instâncias: 
INSERT INTO
	clients_addresses_deliveries (id_clients_address, id_delivery)
VALUES
	(1, 1),
	(1, 2),
	(2, 3),
	(4, 4),
	(4, 5),
	(4, 6),
	(6, 7),
	(4, 8),
	(1, 9),
	(3, 10),
	(4, 11),
	(8, 12),
	(9, 13),
	(1, 14),
	(2, 15),
	(4, 16);

-- Tabela: orders_products / Instâncias: 20
INSERT INTO
	orders_products (id_order, id_product, amount)
VALUES
	(1, 1, 1),
	(2, 2, 1),
	(3, 1, 1),
	(3, 3, 1),
	(4, 1, 1),
	(5, 2, 1),
	(6, 1, 1),
	(6, 2, 1),
	(7, 4, 1),
	(8, 5, 1),
	(9, 7, 1),
	(10, 10, 1),
	(11, 14, 1),
	(12, 19, 1),
	(13, 24, 1),
	(14, 22, 1),
	(14, 24, 1),
	(15, 22, 1),
	(16, 23, 1),
	(17, 23, 1);

-- Tabela: restaurant_owners_restaurants / Instâncias: 8
INSERT INTO
	restaurant_owners_restaurants (id_restaurant_owner, id_restaurant)
VALUES
	(1, 1),
	(2, 1),
	(2, 2),
	(3, 3),
	(7, 4),
	(8, 5),
	(9, 6),
	(9, 7);

-- Tabela: restaurants_restaurant_categories / Instâncias: 14
INSERT INTO
	restaurants_restaurant_categories (id_restaurant, id_restaurant_category)
VALUES
	(1, 1),
	(1, 2),
	(2, 1),
	(2, 2),
	(2, 6),
	(3, 2),
	(3, 5),
	(3, 7),
	(4, 3),
	(5, 1),
	(5, 2),
	(5, 4),
	(6, 3),
	(7, 5);
