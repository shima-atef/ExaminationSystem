SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--delete instructor_course
CREATE PROCEDURE [dbo].[Delete_Instructor_Course] 
    @ins_id INT = 0,
    @crs_id INT = 0
AS
BEGIN
    IF (@ins_id != 0 AND @crs_id = 0)
        DELETE FROM Instructor_Courses WHERE Instructor_ID = @ins_id;
    ELSE IF (@ins_id = 0 AND @crs_id != 0)
        DELETE FROM Instructor_Courses WHERE Course_ID = @crs_id;
    ELSE IF (@ins_id != 0 AND @crs_id != 0)
        DELETE FROM Instructor_Courses WHERE Instructor_ID = @ins_id AND Course_ID = @crs_id;
END
GO
