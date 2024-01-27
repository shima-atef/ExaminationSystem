SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[GetStudentGrades] @StudentID INT
AS
BEGIN
    SELECT
        Course.Crs_Name,
        Exam.Grade
    FROM
        Course
    INNER JOIN
        Exam ON Course.Course_ID = Exam.Course_ID
    INNER JOIN
        Student ON Exam.Student_ID = Student.Student_ID
    WHERE
        Exam.Grade IS NOT NULL
        AND Student.Student_ID = @StudentID;
END;
GO
