SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

USE testdatabaseone;--enter the name of the database
SELECT
    actual_state_desc       AS [state        ],
    desired_state_desc      AS [desired state],
    query_capture_mode_desc AS [capture mode ]
FROM
    sys.database_query_store_options;