SET ANSI_NULLS ON;
SET NOCOUNT ON;
SET QUOTED_IDENTIFIER ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;


SELECT
    name                                AS [base ],
    DATABASEPROPERTYEX(name,'recovery') AS [model]
FROM sys.databases
WHERE name NOT IN ('master','model','tempdb','msdb','distribution')
ORDER BY [model], [base];