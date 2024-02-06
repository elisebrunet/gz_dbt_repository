#Operational margin = margin + shipping fee - log_cost - ship_cost

SELECT 
    om.date_date,
    om.orders_id,
    SUM(om.revenue) AS revenue,
    SUM(om.quantity) AS quantity, 
    SUM(om.purchase_cost) AS purchase_cost,
    SUM(om.margin) AS margin,
    SUM(sh.shipping_fee) AS shipping_fee,
    SUM(sh.log_cost) AS log_cost,
    SUM(sh.ship_cost) AS ship_cost,
    SUM(om.margin + sh.shipping_fee - sh.log_cost - sh.ship_cost) AS operational_margin
FROM {{ ref('stg_raw__ship') }} as sh 
LEFT JOIN {{ ref('int_orders_margin') }} AS om 
USING (orders_id)
GROUP BY orders_id, date_date
ORDER BY date_date DESC, orders_id DESC