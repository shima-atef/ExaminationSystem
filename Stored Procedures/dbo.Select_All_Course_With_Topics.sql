SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[Select_All_Course_With_Topics]
AS
BEGIN
    BEGIN TRY
        SELECT Course.Crs_Name AS CourseName, Topic.Topic_Name AS Topics
        FROM Course , Topic
        WHERE Course.Course_ID = Topic.Course_ID;
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while selecting courses with topics.';
    END CATCH
END;
GO
