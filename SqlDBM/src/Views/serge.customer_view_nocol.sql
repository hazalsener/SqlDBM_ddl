CREATE OR REPLACE VIEW serge.customer_view_nocol (customer_id int, full_name string, email_address varchar(50), email_domain string, preference string, age int, age_group string, balance decimal(10, 2), balance_tier string, tag_count int, primary_tag string, street string, city string, zip string, preference_count int, is_high_value boolean) COMMENT 'Flattened customer view with derived analytics fields' AS
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