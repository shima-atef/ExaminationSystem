SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Update_Instructor_Course] 
    @ins_id INT,
    @crs_id INT,
    @newCrsId INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Instructor_Courses WHERE Instructor_ID = @ins_id AND Course_ID = @crs_id)
    BEGIN
        UPDATE Instructor_Courses 
        SET Course_ID = @newCrsId 
        WHERE Course_ID = @crs_id AND Instructor_ID = @ins_id;

        SELECT 'Instructor Course updated successfully' AS Status;
    END
    ELSE 
        SELECT 'Instructor Course not found' AS Status;
END
GO
