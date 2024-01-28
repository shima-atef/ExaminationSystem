SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--select from InstructorCourse
CREATE PROCEDURE [dbo].[Select_InstructorCourse] 
    @ins_id INT = 0,
    @crs_id INT = 0
AS
BEGIN
    IF (@ins_id = 0 AND @crs_id != 0)
    BEGIN
        -- Query for filtering by course ID only
        SELECT 
            C.Course_ID,
            C.Crs_Name AS CourseName,
            I.Instructor_ID,
            I.First_Name + ' ' + I.Second_Name AS Full_Name
        FROM 
            Instructor_Courses IC
            INNER JOIN Course C ON IC.Course_ID = C.Course_ID
            INNER JOIN Instructor I ON IC.Instructor_ID = I.Instructor_ID
        WHERE 
            IC.Course_ID = @crs_id;
    END
    ELSE IF (@crs_id = 0 AND @ins_id != 0)
    BEGIN
        -- Query for filtering by instructor ID only
        SELECT 
            C.Course_ID,
            C.Crs_Name AS CourseName,
            I.Instructor_ID,
            I.First_Name + ' ' + I.Second_Name AS Full_Name
        FROM 
            Instructor_Courses IC
            INNER JOIN Course C ON IC.Course_ID = C.Course_ID
            INNER JOIN Instructor I ON IC.Instructor_ID = I.Instructor_ID
        WHERE 
            I.Instructor_ID = @ins_id;
    END
    ELSE IF (@ins_id = 0 AND @crs_id = 0)
    BEGIN
        -- Query without any filtering
        SELECT 
            C.Course_ID,
            C.Crs_Name AS CourseName,
            I.Instructor_ID,
            I.First_Name + ' ' + I.Second_Name AS Full_Name
        FROM 
            Instructor_Courses IC
            INNER JOIN Course C ON IC.Course_ID = C.Course_ID
            INNER JOIN Instructor I ON IC.Instructor_ID = I.Instructor_ID;
    END
    ELSE
    BEGIN
        -- Query for filtering by both course ID and instructor ID
        SELECT 
            C.Course_ID,
            C.Crs_Name AS CourseName,
            I.Instructor_ID,
            I.First_Name + ' ' + I.Second_Name AS Full_Name
        FROM 
            Instructor_Courses IC
            INNER JOIN Course C ON IC.Course_ID = C.Course_ID
            INNER JOIN Instructor I ON IC.Instructor_ID = I.Instructor_ID
        WHERE 
            IC.Course_ID = @crs_id
            AND I.Instructor_ID = @ins_id;
    END
END
GO
