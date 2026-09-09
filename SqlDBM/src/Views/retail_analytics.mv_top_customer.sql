CREATE OR REPLACE MATERIALIZED VIEW retail_analytics.mv_top_customer (customer_id string, lifetime_value decimal(22, 2)) AS
SELECT
    customer_id,
    SUM(total_amount) AS lifetime_value
FROM demo.retail_analytics.sale
GROUP BY customer_id;