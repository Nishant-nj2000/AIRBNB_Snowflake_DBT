CREATE FILE FORMAT IF NOT EXISTS csv_format
  TYPE = 'CSV' 
  FIELD_DELIMITER = ','
  SKIP_HEADER = 1
  ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE;


CREATE OR REPLACE STAGE snowstage
FILE_FORMAT = csv_format
URL='s3://snowbucketnishant/source/';
    

COPY INTO HOSTS
FROM @snowstage
FILES=('hosts.csv')
CREDENTIALS=(aws_key_id = 'AKIASV426SUFQFM4WX6N', aws_secret_key = '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');


show file formats;
show stages;