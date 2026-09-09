-- ************************************** serge.persons
CREATE TABLE serge.persons (
  name string,
  address string,
  region string
)
USING DELTA
TBLPROPERTIES (delta.parquet.compression.codec = 'zstd', delta.minWriterVersion = 7, delta.feature.rowTracking = 'supported', delta.feature.appendOnly = 'supported', delta.enableDeletionVectors = true, delta.minReaderVersion = 3, delta.feature.domainMetadata = 'supported', delta.checkpoint.writeStatsAsStruct = true, delta.enableRowTracking = true, delta.checkpoint.writeStatsAsJson = false, delta.feature.deletionVectors = 'supported', delta.rowTracking.materializedRowCommitVersionColumnName = '_row-commit-version-col-133688da-9772-49ba-a83c-f38d9e6867a8', delta.rowTracking.materializedRowIdColumnName = '_row-id-col-5e71b14e-8bbb-4b9b-8de3-be8326781711', delta.feature.invariants = 'supported');