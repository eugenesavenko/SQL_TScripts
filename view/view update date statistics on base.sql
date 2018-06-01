SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

USE testbase;--enter the name of the database
SELECT
    name                            AS [name  ],
    STATS_DATE(object_id, stats_id) AS [update]
FROM sys.stats
ORDER BY STATS_DATE(object_id, stats_id) DESC;