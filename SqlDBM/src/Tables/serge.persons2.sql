-- ************************************** serge.persons2
CREATE TABLE serge.persons2 (
  ssn string NOT NULL CONSTRAINT PK_12 PRIMARY KEY,
  name string
)
USING DELTA
TBLPROPERTIES (delta.parquet.compression.codec = 'zstd', delta.minWriterVersion = 7, delta.feature.rowTracking = 'supported', delta.feature.appendOnly = 'supported', delta.enableDeletionVectors = true, delta.minReaderVersion = 3, delta.feature.domainMetadata = 'supported', delta.checkpoint.writeStatsAsStruct = true, delta.enableRowTracking = true, delta.checkpoint.writeStatsAsJson = false, delta.feature.deletionVectors = 'supported', delta.rowTracking.materializedRowCommitVersionColumnName = '_row-commit-version-col-921236b6-05d8-44ce-8cfa-0aa4f84cbe9a', delta.rowTracking.materializedRowIdColumnName = '_row-id-col-26c1d3f7-63cb-4db6-9fdd-5062fee147b2', delta.feature.invariants = 'supported');