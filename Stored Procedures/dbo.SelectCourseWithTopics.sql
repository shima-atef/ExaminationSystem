SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[SelectCourseWithTopics]
    @CourseName VARCHAR(20)
AS
BEGIN
    BEGIN TRY
        SELECT Course.Crs_Name AS CourseName, Topic.Topic_Name AS Topics
        FROM Course
        INNER JOIN Topic ON Course.Course_ID = Topic.Course_ID
        WHERE Course.Crs_Name = @CourseName;
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while selecting courses with topics.';
    END CATCH
END;
GO
