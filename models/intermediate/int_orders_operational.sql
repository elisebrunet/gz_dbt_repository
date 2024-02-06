#Operational margin = margin + shipping fee - log_cost - ship_cost

SELECT 
    om.*,
    sh.shipping_fee,
    sh.log_cost,
    sh.ship_cost,
    om.margin + sh.shipping_fee - sh.log_cost - sh.ship_cost AS operational_margin
FROM {{ ref('stg_raw__ship') }} as sh 
INNER JOIN {{ ref('int_orders_margin') }} AS om 
USING (orders_id)