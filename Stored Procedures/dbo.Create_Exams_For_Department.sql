SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[Create_Exams_For_Department]
    @DepartmentID INT,
    @CourseID INT,
    @Duration INT,
    @NumsOfMCQ INT,
    @NumsOfTF INT,
    @ExamDate DATE,
    @ExamTime TIME
AS
BEGIN
    -- Insert exams for all students in the specified department
    INSERT INTO Exam (Student_ID, Grade, Course_ID, Duration, NumsOfMCQ, NumsOfTF, Date, Time)
    SELECT 
        Student.Student_ID,
        NULL AS Grade, -- Assuming grade is not specified in this scenario
        @CourseID AS Course_ID,
        @Duration AS Duration,
        @NumsOfMCQ AS NumsOfMCQ,
        @NumsOfTF AS NumsOfTF,
        @ExamDate AS Date,
        @ExamTime AS Time
    FROM 
        Student
    WHERE 
        Student.Dept_ID = @DepartmentID;
END
GO
