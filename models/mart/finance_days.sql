{{ config(materialized='table') }}

SELECT 
    COUNT(orders_id) AS nbr_of_transactions,
    date_date,
    ROUND(SUM(revenue)) AS revenue,
    ROUND(AVG(revenue),1) AS average_basket,
    ROUND(SUM(margin)) AS daily_margin,
    ROUND(SUM(operational_margin)) AS daily_operational_margin,
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date
ORDER BY date_date DESC