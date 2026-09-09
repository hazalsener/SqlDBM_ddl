-- ************************************** retail_analytics.table_16
CREATE TABLE retail_analytics.table_16 (
  customer_id string NOT NULL,
  CONSTRAINT FK_7 FOREIGN KEY (customer_id) REFERENCES retail_analytics.customer (customer_id)
)
TBLPROPERTIES (delta.columnMapping.mode = 'name');