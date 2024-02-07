SELECT 
    c.date_date, 
    f.daily_operational_margin-c.ads_cost AS ads_margin,
    f.average_basket,
    f.daily_operational_margin, 
    c.ads_cost,
    c.ads_impressions,
    c.ads_clicks
FROM {{ ref('int_campaign_day') }} AS c 
    LEFT JOIN {{ ref('finance_days') }} AS f 
ON c.date_date = f.date_date
ORDER BY date_date DESC
