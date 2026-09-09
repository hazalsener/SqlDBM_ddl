-- ************************************** serge.orders_bucketed
CREATE TABLE serge.orders_bucketed (
  order_id bigint NOT NULL CONSTRAINT PK_10 PRIMARY KEY COMMENT 'Primary key',
  customer_id bigint NOT NULL COMMENT 'FK to customers',
  order_date date NOT NULL COMMENT 'Date the order was placed',
  region_code string COMMENT 'Sales region',
  order_status string COMMENT 'PENDING | SHIPPED | CANCELLED',
  order_total decimal(18, 2) COMMENT 'Order total in USD',
  created_at timestamp COMMENT 'Row creation timestamp'
)
USING DELTA
COMMENT 'Orders fact table, bucketed for join locality on customer_id'
TBLPROPERTIES (quality = 'gold', delta.parquet.compression.codec = 'zstd', delta.minWriterVersion = 7, delta.feature.rowTracking = 'supported', delta.feature.appendOnly = 'supported', delta.enableDeletionVectors = true, delta.minReaderVersion = 3, delta.feature.domainMetadata = 'supported', delta.checkpoint.writeStatsAsStruct = true, delta.feature.clustering = 'supported', delta.checkpoint.writeStatsAsJson = false, delta.feature.deletionVectors = 'supported', delta.rowTracking.materializedRowCommitVersionColumnName = '_row-commit-version-col-bc6935bd-b20f-4dda-88c7-0e5661324e11', delta.rowTracking.materializedRowIdColumnName = '_row-id-col-c477a9e2-04dd-4bb4-b282-444d0a504168', delta.feature.invariants = 'supported');