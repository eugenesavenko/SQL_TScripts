DECLARE @base AS VARCHAR  (max) = 'testbase';
DECLARE @sql  AS NVARCHAR (max) = '';

SET @sql = 'DBCC SHRINKDATABASE(N''' + @base + ''');';
PRINT @sql;
EXEC sp_executesql @sql;