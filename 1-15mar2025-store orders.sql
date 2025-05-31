SELECT * from "fmc.store_orders"
WHERE order_date BETWEEN '2025-03-01' AND '2025-03-15'
AND order_type = 'store'; -- For count of store orders for first 2 weeks of March 2025