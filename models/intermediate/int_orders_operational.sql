#Operational margin = margin + shipping fee - log_cost - ship_cost

SELECT 
    om.date_date,
    om.orders_id,
    ROUND(SUM(om.revenue),2) AS revenue,
    SUM(om.quantity) AS quantity, 
    ROUND(SUM(om.purchase_cost),2) AS purchase_cost,
    ROUND(SUM(om.margin),2) AS margin,
    ROUND(SUM(sh.shipping_fee),2) AS shipping_fee,
    ROUND(SUM(sh.log_cost),2) AS log_cost,
    ROUND(SUM(sh.ship_cost),2) AS ship_cost,
    ROUND(SUM(om.margin + sh.shipping_fee - sh.log_cost - sh.ship_cost),2) AS operational_margin
FROM {{ ref('stg_raw__ship') }} as sh 
LEFT JOIN {{ ref('int_orders_margin') }} AS om 
USING (orders_id)
GROUP BY orders_id, date_date
ORDER BY date_date DESC, orders_id DESC, operational_margin DESC