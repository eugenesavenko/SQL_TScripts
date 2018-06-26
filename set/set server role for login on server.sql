SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

USE [master];
ALTER SERVER ROLE [dbcreator] ADD MEMBER [loginone];