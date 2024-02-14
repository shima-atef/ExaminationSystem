SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[Select_TopicNames]
AS
BEGIN
    BEGIN TRY
        SELECT Topic_Name 
        FROM Topic;
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while selecting all topic names.';
    END CATCH
END;
GO
