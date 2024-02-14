SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[Select_TopicNameById]
    @Course_ID INT
AS
BEGIN
    BEGIN TRY
 

        SELECT Topic_Name
        FROM Topic
        WHERE Course_ID = @Course_ID;
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while selecting topic name by ID.';
    END CATCH
END;
GO
