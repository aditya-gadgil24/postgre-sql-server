CREATE OR REPLACE FUNCTION update_product_stock(
    p_product_id INT,
    p_quantity INT,
    p_action TEXT  -- 'add' or 'sell'
)
RETURNS VOID AS $$
BEGIN
    IF p_action = 'add' THEN
        UPDATE product
        SET current_stock = current_stock + p_quantity
        WHERE product_id = p_product_id;

    ELSIF p_action = 'sell' THEN
        UPDATE product
        SET current_stock = current_stock - p_quantity
        WHERE product_id = p_product_id;

    ELSE
        RAISE EXCEPTION 'Invalid action: %, expected "add" or "sell"', p_action;
    END IF;
END;
$$ LANGUAGE plpgsql;