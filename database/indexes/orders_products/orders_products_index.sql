-- Índice para facilitar a consulta à tabela que relaciona pedidos com seus produtos, pois é utilizada
-- como tabela pivot em muitas consultas

CREATE INDEX idx_orders_products ON orders_products (id_order, id_product);
