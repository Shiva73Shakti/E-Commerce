
CREATE VIEW user_orders_view AS
SELECT 
    u.user_id,
    u.name,
    u.email,
    o.order_id,
    o.order_date
FROM users u
JOIN orders o ON u.user_id = o.user_id;


CREATE VIEW order_details_view AS
SELECT 
    o.order_id,
    o.order_date,
    p.product_id,
    p.name AS product_name,
    oi.quantity,
    p.price,
    (oi.quantity * p.price) AS total_price
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;



CREATE VIEW payment_status_view AS
SELECT 
    o.order_id,
    u.name AS customer_name,
    p.amount,
    p.status
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN users u ON o.user_id = u.user_id;


CREATE VIEW Total_order AS
SELECT 
    u.user_id,
    u.name AS customer_name,
    o.order_id,
    o.order_date,
    pr.name AS product_name,
    oi.quantity,
    pr.price,
    (oi.quantity * pr.price) AS item_total,
    pay.amount AS payment_amount,
    pay.status AS payment_status
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products pr ON oi.product_id = pr.product_id
LEFT JOIN payments pay ON o.order_id = pay.order_id;