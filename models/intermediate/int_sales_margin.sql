WITH calc AS (
    SELECT
        s.revenue,
        s.quantity * p.purchase_price AS purchase_cost
    FROM {{ ref('stg_raw__sales') }} AS s
    INNER JOIN {{ ref('stg_raw__product') }} AS p 
    ON s.products_id = p.products_id
)

SELECT 
    revenue - purchase_cost AS margin
FROM calc