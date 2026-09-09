CREATE OR REPLACE MATERIALIZED VIEW serge.mv_customer (id int, street string, type string, key string, name string, city string, value string, value string, email varchar(50), zip string, prefernce string, age int, balance decimal(10, 2), tags array<string>, address STRUCT<>, preferences ARRAY<STRUCT<>>, preferences2 ARRAY<STRUCT<>>, age_group string) COMMENT 'sample view by serge' AS
SELECT
    id,
    name,
    email,
    prefernce,
    age,
    balance,
    tags,
    address,
    preferences,
    preferences2,
    CASE
        WHEN age < 18  THEN 'Minor'
        WHEN age < 35  THEN 'Young Adult'
        WHEN age < 55  THEN 'Middle Aged'
        ELSE 'Senior'
    END AS age_group
FROM demo.serge.customer;