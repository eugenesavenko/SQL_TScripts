SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

DECLARE @base AS NVARCHAR (max) = 'testdatabaseone';
DECLARE @sql  AS NVARCHAR (max) = ''               ;

SET @sql = 'DBCC SHRINKDATABASE(N''' + @base + ''');';
EXEC sp_executesql @sql;