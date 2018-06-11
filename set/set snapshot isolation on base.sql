SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

ALTER DATABASE [testdatabaseone] SET SINGLE_USER              WITH ROLLBACK IMMEDIATE;
ALTER DATABASE [testdatabaseone] SET ALLOW_SNAPSHOT_ISOLATION ON                     ;
ALTER DATABASE [testdatabaseone] SET MULTI_USER               WITH ROLLBACK IMMEDIATE;