SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

EXEC sp_detach_db 'testdatabaseone', 'true';
EXEC sp_detach_db 'testdatabasetwo', 'true';