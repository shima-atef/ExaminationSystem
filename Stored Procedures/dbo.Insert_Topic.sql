SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[Insert_Topic]  @CourseID int, @CourseName VARCHAR(20)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Topic (Course_ID, Topic_Name)
        VALUES (@CourseID, @CourseName)
    END TRY
    BEGIN CATCH
        PRINT 'Invalid data';
    END CATCH
END;
GO
