DECLARE @base AS VARCHAR  (max) = 'testbase';
DECLARE @sql  AS NVARCHAR (max) = '';

SET @sql = 'ALTER DATABASE ' + @base + ' SET RECOVERY SIMPLE WITH NO_WAIT;';
PRINT @sql;
EXEC sp_executesql @sql;