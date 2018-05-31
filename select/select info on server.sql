SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;


SELECT
    SERVERPROPERTY('MachineName'   ) AS [machine],
    SERVERPROPERTY('ServerName'    ) AS [server ],
    SERVERPROPERTY('Edition'       ) AS [edition],
    SERVERPROPERTY('ProductVersion') AS [version],
    SERVERPROPERTY('ProductLevel'  ) AS [level  ];