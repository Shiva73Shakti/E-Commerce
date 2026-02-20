
CREATE UNIQUE INDEX idx_users_email ON users(email);


CREATE INDEX idx_products_name ON products(name);


CREATE INDEX idx_orders_user_id ON orders(user_id);

CREATE INDEX idx_order_items_order_id ON order_items(order_id);


CREATE INDEX idx_payments_order_id ON payments(order_id);
