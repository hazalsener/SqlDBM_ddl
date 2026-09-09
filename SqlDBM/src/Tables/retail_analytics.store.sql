-- ************************************** retail_analytics.store
CREATE TABLE retail_analytics.store (
  store_id string NOT NULL CONSTRAINT store_pk PRIMARY KEY,
  store_name string,
  region string,
  opening_date date
)
USING DELTA
TBLPROPERTIES (delta.minWriterVersion = 7, delta.feature.appendOnly = 'supported', delta.enableDeletionVectors = true, delta.minReaderVersion = 3, delta.checkpoint.writeStatsAsStruct = true, delta.checkpoint.writeStatsAsJson = false, delta.feature.deletionVectors = 'supported', delta.feature.invariants = 'supported');