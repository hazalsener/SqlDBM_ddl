-- ************************** SqlDBM: Snowflake *************************
-- *** Generated by SqlDBM: Awesome Project by hazal.sener@sqldbm.com ***

-- ************************************** SampleTable
CREATE TABLE SampleTable
(
 ETL_ID        timestamp NOT NULL COMMENT 'Table load date',
 ETL_TIMESTAMP timestamp_ntz NOT NULL COMMENT 'Table load date TIME',
 SampleColumn  varchar(50) NOT NULL
);
