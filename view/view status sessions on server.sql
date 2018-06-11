SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

SELECT
    session_id                                                        AS [id    ],
    CASE       WHEN login_name = 'sa' THEN 'sa' ELSE nt_user_name END AS [login ],
    status                                                            AS [status]
FROM sys.dm_exec_sessions
ORDER BY [status] DESC;