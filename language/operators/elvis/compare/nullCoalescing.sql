-- nullCoalescing.sql

DECLARE @result VARCHAR(10)

SET @result = COALESCE(null, 'default')
SELECT  @result

SET @result = COALESCE(0, 'default')
SELECT  @result