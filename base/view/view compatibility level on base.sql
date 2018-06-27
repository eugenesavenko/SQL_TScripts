SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

SELECT
    name                AS [base ],
    compatibility_level AS [level]
FROM sys.databases
WHERE name NOT IN ('master', 'msdb', 'model', 'tempdb', 'distribution')
ORDER BY name;