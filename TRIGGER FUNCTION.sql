
CREATE OR REPLACE FUNCTION calculate_order_total(p_order_id INT)
RETURNS NUMERIC AS $$
DECLARE
    total NUMERIC;
BEGIN
    SELECT SUM(oi.quantity * p.price)
    INTO total
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    WHERE oi.order_id = p_order_id;

    RETURN COALESCE(total, 0);
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION order_item_after_insert()
RETURNS TRIGGER AS $$
BEGIN
    
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;

   
    UPDATE orders
    SET total_amount = calculate_order_total(NEW.order_id)
    WHERE order_id = NEW.order_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION payment_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    SELECT total_amount
    INTO NEW.amount
    FROM orders
    WHERE order_id = NEW.order_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION payment_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    
    SELECT total_amount
    INTO NEW.amount
    FROM orders
    WHERE order_id = NEW.order_id;

   
    IF NEW.status IS NULL OR trim(NEW.status) = '' THEN
        NEW.status := 'pending';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


