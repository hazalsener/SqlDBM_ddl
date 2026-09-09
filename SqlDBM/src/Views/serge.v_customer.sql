CREATE OR REPLACE VIEW serge.v_customer (id int, name string, email varchar(50), prefernce string COMMENT 'of ice cream', age int, balance decimal(10, 2), tags array<string>, address struct<street:string,city:string,zip:string>, preferences array<struct<type:string,value:string>>, preferences2 array<struct<key:string,value:string>>, age_group string) COMMENT 'sample view by serge' AS
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