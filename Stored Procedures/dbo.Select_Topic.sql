SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[Select_Topic] 
    @Course_ID INT = -1
AS
BEGIN
    BEGIN TRY
	IF (@Course_ID != -1)
        SELECT Topic_Name
        FROM Topic
        WHERE Course_ID = @Course_ID;
	ELSE 
	SELECT Course.Crs_Name , Topic_Name
	FROM dbo.Topic,dbo.Course
	WHERE topic.Course_ID = course.Course_ID
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while selecting topic name by ID.';
    END CATCH
END;
GO
