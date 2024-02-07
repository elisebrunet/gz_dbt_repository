WITH calc AS (
    SELECT
        s.orders_id,
        s.date_date,
        s.revenue,
        s.quantity,
        s.quantity * p.purchase_price AS purchase_cost
    FROM {{ ref('stg_raw__sales') }} AS s
    LEFT JOIN {{ ref('stg_raw__product') }} AS p 
    ON s.products_id = p.products_id
)

SELECT 
    *,
    revenue - purchase_cost AS margin
FROM calc