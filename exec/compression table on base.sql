SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

USE testdatabaseone;
EXEC sp_MSforeachtable 'ALTER TABLE ? REBUILD WITH (DATA_COMPRESSION = PAGE)';