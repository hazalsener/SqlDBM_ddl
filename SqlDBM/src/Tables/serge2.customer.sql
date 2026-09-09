-- ************************************** serge2.customer
CREATE TABLE serge2.customer (
  id int,
  name string,
  email varchar(50),
  prefernce string,
  age int,
  balance decimal(10, 2),
  tags array<string>,
  address STRUCT<street: string, city: string, zip: string>,
  preferences ARRAY<STRUCT<type: string, value: string>>
)
USING DELTA
TBLPROPERTIES (delta.minWriterVersion = 7, delta.feature.appendOnly = 'supported', delta.enableDeletionVectors = true, delta.minReaderVersion = 3, delta.checkpoint.writeStatsAsStruct = true, delta.checkpoint.writeStatsAsJson = false, delta.feature.deletionVectors = 'supported', delta.feature.invariants = 'supported');