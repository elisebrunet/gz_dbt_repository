SELECT 
    *
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date