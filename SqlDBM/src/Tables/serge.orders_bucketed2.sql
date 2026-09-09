-- ************************************** serge.orders_bucketed2
CREATE TABLE serge.orders_bucketed2 (
  order_id bigint NOT NULL CONSTRAINT PK_11 PRIMARY KEY COMMENT 'Primary key',
  customer_id bigint NOT NULL COMMENT 'FK to customers',
  order_date date NOT NULL COMMENT 'Date the order was placed',
  region_code string COMMENT 'Sales region',
  order_status string COMMENT 'PENDING | SHIPPED | CANCELLED',
  order_total decimal(18, 2) COMMENT 'Order total in USD',
  created_at timestamp COMMENT 'Row creation timestamp'
)
USING DELTA
CLUSTER BY AUTO
COMMENT 'Orders fact table, bucketed for join locality on customer_id'
TBLPROPERTIES (quality = 'gold', delta.parquet.compression.codec = 'zstd', delta.feature.collations = 'supported', delta.minWriterVersion = 7, delta.feature.rowTracking = 'supported', delta.feature.generatedColumns = 'supported', delta.feature.appendOnly = 'supported', delta.enableDeletionVectors = true, delta.minReaderVersion = 3, delta.feature.domainMetadata = 'supported', delta.checkpoint.writeStatsAsStruct = true, delta.feature.clustering = 'supported', delta.enableRowTracking = true, delta.checkpoint.writeStatsAsJson = false, delta.feature.deletionVectors = 'supported', delta.rowTracking.materializedRowCommitVersionColumnName = '_row-commit-version-col-f75547fa-6cb2-41fd-844e-35c60c1d785e', delta.rowTracking.materializedRowIdColumnName = '_row-id-col-1f72cdb1-a765-4061-9ee7-6f368350aebc', delta.feature.invariants = 'supported');