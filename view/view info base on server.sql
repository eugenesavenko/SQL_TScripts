SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

SELECT
    @@SERVERNAME        AS [server],
    create_date         AS [date  ],
    name                AS [base  ],
    Compatibility_level AS [level ],
    recovery_model_desc AS [model ],
    state_desc          AS [state ]
FROM sys.databases
WHERE name NOT IN ('master', 'msdb', 'model', 'tempdb', 'distribution')
ORDER BY name;