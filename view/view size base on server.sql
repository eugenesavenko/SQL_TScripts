SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

WITH FS AS (
    SELECT
        database_id      AS id,
        type,
        size*8/1024/1024 AS size
    FROM sys.master_files)
SELECT
    name AS base,
    (SELECT sum(size) AS mdf FROM fs WHERE type = 0 AND fs.ID = db.database_id) AS [mdf],
    (SELECT sum(size) AS mdf FROM fs WHERE type = 1 AND fs.ID = db.database_id) AS [ldf],
    (SELECT sum(size) FROM fs WHERE type = 0 AND fs.ID = db.database_id) + (SELECT sum(size) FROM fs WHERE type = 1 AND fs.ID = db.database_id) AS [total]
FROM sys.databases db
ORDER BY [total] DESC;