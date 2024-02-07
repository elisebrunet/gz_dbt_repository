SELECT 
    DATE_TRUNC(c.date_date, MONTH) AS month,
    SUM(f.daily_operational_margin - c.ads_cost) AS ads_margin,
    SUM(f.average_basket) AS average_basket,
    SUM(f.daily_operational_margin) AS total_operational_margin, 
    SUM(c.ads_cost) AS total_ads_cost,
    SUM(c.ads_impressions) AS total_ads_impressions,
    SUM(c.ads_clicks) AS total_ads_clicks
FROM {{ ref('int_campaign_day') }} AS c 
LEFT JOIN {{ ref('finance_days') }} AS f 
    ON c.date_date = f.date_date
GROUP BY month
ORDER by month DESC