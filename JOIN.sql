SELECT o.order_id, o.order_date, o.total_amount,
       u.name AS user_name, u.email AS user_email,
       p.name AS product_name, oi.quantity, p.price,
       pay.amount AS payment_amount, pay.status AS payment_status
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
LEFT JOIN payments pay ON pay.order_id = o.order_id
WHERE o.order_id = 3;


