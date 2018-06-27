SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

DECLARE @base nvarchar(max);
DECLARE @sql  nvarchar(max);
DECLARE c     CURSOR FOR
    SELECT name AS base
    FROM   sys.databases
    WHERE  name NOT IN ('master','msdb','model','tempdb','distribution');

OPEN c;
FETCH NEXT FROM c INTO @base;
WHILE (@@FETCH_STATUS=0)
BEGIN
    SELECT @sql = 'ALTER DATABASE ' + @base + ' SET COMPATIBILITY_LEVEL = 130;';
    EXEC sp_executesql @sql;
    FETCH NEXT FROM c INTO @base;
END
CLOSE c;
DEALLOCATE c;