SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Create_Exams_For_Department]
    @DepartmentID INT,
    @CourseID INT,
    @Duration INT,
    @NumsOfMCQ INT,
    @NumsOfTF INT,
    @ExamDate DATE,
    @ExamTime TIME
AS
BEGIN
    DECLARE @StructureID INT;

    -- Insert into Exam_Structure
    INSERT INTO Exam_Structure (Course_ID, Duration, MCQ_Count, TF_Count, Date, Time)
    VALUES (@CourseID, @Duration, @NumsOfMCQ, @NumsOfTF, @ExamDate, @ExamTime);

    -- Get the Structure_ID of the inserted record
    SET @StructureID = SCOPE_IDENTITY();

    -- Insert exams for all students in the specified department
    INSERT INTO Exam (Student_ID, Grade, Structure_ID)
    SELECT 
        Student.Student_ID,
        NULL AS Grade, -- Assuming grade is not specified in this scenario
        @StructureID AS Structure_ID
    FROM 
        Student
    WHERE 
        Student.Dept_ID = @DepartmentID;
END
GO
