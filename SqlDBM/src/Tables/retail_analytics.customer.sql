-- ************************************** retail_analytics.customer
CREATE TABLE retail_analytics.customer (
  customer_id string NOT NULL CONSTRAINT customer_pk PRIMARY KEY,
  first_name string,
  last_name string,
  email string,
  loyalty_member boolean
)
USING DELTA
TBLPROPERTIES (delta.minWriterVersion = 7, delta.feature.appendOnly = 'supported', delta.enableDeletionVectors = true, delta.minReaderVersion = 3, delta.checkpoint.writeStatsAsStruct = true, delta.checkpoint.writeStatsAsJson = false, delta.feature.deletionVectors = 'supported', delta.feature.invariants = 'supported');