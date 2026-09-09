CREATE OR REPLACE VIEW serge.customer_view (customer_id int COMMENT 'Unique customer identifier', full_name string COMMENT 'Customer full name', email_address string COMMENT 'Primary contact email', email_domain string COMMENT 'Domain extracted from email', preference string COMMENT 'Customer preference (note: source column is misspelled)', age int COMMENT 'Customer age in years', age_group string COMMENT 'Bucketed age category', balance decimal(10, 2) COMMENT 'Account balance in USD', balance_tier string COMMENT 'Balance segmentation tier', tag_count int COMMENT 'Number of tags on customer', primary_tag string COMMENT 'First tag in tags array', street string COMMENT 'Street portion of address', city string COMMENT 'City portion of address', zip string COMMENT 'Zip code portion of address', preference_count int COMMENT 'Total preferences set', is_high_value boolean COMMENT 'Flag for VIP customers') COMMENT 'Flattened customer view with derived analytics fields' AS
SELECT
  id                                          AS customer_id,
  name                                        AS full_name,
  email                                       AS email_address,
  split(email, '@')[1]                        AS email_domain,
  prefernce                                   AS preference,
  age,
  CASE
    WHEN age < 18 THEN 'Under 18'
    WHEN age BETWEEN 18 AND 29 THEN '18-29'
    WHEN age BETWEEN 30 AND 44 THEN '30-44'
    WHEN age BETWEEN 45 AND 59 THEN '45-59'
    WHEN age >= 60 THEN '60+'
    ELSE 'Unknown'
  END                                         AS age_group,
  balance,
  CASE
    WHEN balance < 100 THEN 'Low'
    WHEN balance < 1000 THEN 'Medium'
    WHEN balance < 10000 THEN 'High'
    ELSE 'VIP'
  END                                         AS balance_tier,
  size(tags)                                  AS tag_count,
  element_at(tags, 1)                         AS primary_tag,
  address.street                              AS street,
  address.city                                AS city,
  address.zip                                 AS zip,
  size(preferences) + size(preferences2)      AS preference_count,
  balance >= 10000                            AS is_high_value
FROM serge.customer
WHERE id IS NOT NULL;