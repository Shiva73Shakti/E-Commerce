  CREATE TRIGGER trg_order_item_after_insert
AFTER INSERT ON order_items
FOR EACH ROW
EXECUTE FUNCTION order_item_after_insert();




CREATE TRIGGER trg_payment_before_insert
BEFORE INSERT ON payments
FOR EACH ROW
EXECUTE FUNCTION payment_before_insert();

