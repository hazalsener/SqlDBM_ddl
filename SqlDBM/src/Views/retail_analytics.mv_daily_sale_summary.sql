CREATE OR REPLACE MATERIALIZED VIEW retail_analytics.mv_daily_sale_summary (sale_date date, store_id string, total_sales decimal(22, 2), transaction_count bigint) AS
SELECT
    sale_date,
    store_id,
    SUM(total_amount) AS total_sales,
    COUNT(*) AS transaction_count
FROM retail_analytics.sale
GROUP BY sale_date, store_id;