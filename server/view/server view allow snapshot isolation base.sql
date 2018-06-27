SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

SELECT
    name                          AS [base       ],
    snapshot_isolation_state      AS [state      ],
    snapshot_isolation_state_desc AS [description]
FROM sys.databases
WHERE name NOT IN ('master','msdb','model','tempdb','distribution')
ORDER BY state;