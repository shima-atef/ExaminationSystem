SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Insert_Instructor_Course] 
    @ins_id INT,
    @crs_id INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Instructor_Courses (Course_ID, Instructor_ID)
        VALUES (@crs_id, @ins_id);
    END TRY
    BEGIN CATCH
        --Eroor message
        SELECT 
            'An Error happened while inserting: ' + ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO
