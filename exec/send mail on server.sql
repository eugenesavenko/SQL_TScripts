SET ANSI_NULLS        ON                              ;
SET NOCOUNT           ON                              ;
SET QUOTED_IDENTIFIER ON                              ;
SET TRANSACTION       ISOLATION LEVEL READ UNCOMMITTED;

DECLARE @profile   AS NVARCHAR(max) = 'profile'             ;
DECLARE @recipient AS NVARCHAR(max) = 'recipient@domain.com';
DECLARE @subject   AS NVARCHAR(max) = ''                    ;
DECLARE @massage   AS NVARCHAR(max) = ''                    ;

SELECT @subject = 'message subject '  +                                                    DB_NAME();
SELECT @massage = 'message text for ' + @recipient + ' about the event in the database ' + DB_NAME();

EXEC msdb.dbo.sp_send_dbmail
    @body         = @massage  ,
    @profile_name = @profile  ,
    @recipients   = @recipient,
    @subject      = @subject  ;