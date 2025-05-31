CREATE OR REPLACE FUNCTION check_prod_qty()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.prod_qty <= 0 THEN
        RAISE EXCEPTION 'Product quantity must be greater than 0. Given: %', NEW.prod_qty;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
