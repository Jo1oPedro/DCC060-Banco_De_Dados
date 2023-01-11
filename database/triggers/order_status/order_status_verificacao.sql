-- Trigger: order_status

-- Verificações
UPDATE deliveries SET status = 'DELIVERED' WHERE id = 3;
