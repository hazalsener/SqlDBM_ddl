-- ************************************** retail_analytics.sale
CREATE TABLE retail_analytics.sale (
  sale_id string NOT NULL CONSTRAINT sale_pk PRIMARY KEY,
  sale_date date,
  product_id string,
  customer_id string,
  store_id string,
  quantity int,
  total_amount decimal(12, 2),
  CONSTRAINT sale_product_fk FOREIGN KEY (product_id) REFERENCES retail_analytics.product (product_id),
  CONSTRAINT sale_customer_fk FOREIGN KEY (customer_id) REFERENCES retail_analytics.customer (customer_id),
  CONSTRAINT sale_store_fk FOREIGN KEY (store_id) REFERENCES retail_analytics.store (store_id)
)
USING DELTA
TBLPROPERTIES (delta.minWriterVersion = 7, delta.feature.appendOnly = 'supported', delta.enableDeletionVectors = true, delta.minReaderVersion = 3, delta.checkpoint.writeStatsAsStruct = true, delta.checkpoint.writeStatsAsJson = false, delta.feature.deletionVectors = 'supported', delta.feature.invariants = 'supported');