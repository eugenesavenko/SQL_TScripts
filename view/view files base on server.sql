SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

SELECT
    database_id   AS [id  ],
    name          AS [base],
    physical_name AS [file],
    size          AS [size],
    type_desc     AS [type]
FROM sys.master_files
WHERE name NOT IN ('master', 'msdb', 'model', 'tempdb', 'distribution')
ORDER BY size DESC;