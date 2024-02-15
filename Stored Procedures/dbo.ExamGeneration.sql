SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ExamGeneration] 
    @ExamID INT
AS
BEGIN
    DECLARE @CourseID INT;
	DECLARE @TFcount INT;
	DECLARE @MCQcount INT;


   
     SELECT @CourseID = Course_ID FROM Exam WHERE Exam_ID = @ExamID;
	 SELECT @TFcount = Exam.NumsOfTF FROM Exam WHERE Exam_ID = @ExamID;
	 SELECT @MCQcount = Exam.NumsOfMCQ FROM Exam WHERE Exam_ID = @ExamID;

    IF (@CourseID IS NULL)
    BEGIN
        SELECT 'Invalid Exam ID';
        RETURN;
    END;

   
    DECLARE @ExamQuestion TABLE (QuestionID INT);

    -- Insert T/F Questions
    INSERT INTO @ExamQuestion (QuestionID)
    SELECT TOP (@TFcount) Question_ID
    FROM Question
    WHERE Type = 'TF' AND Course_ID = @CourseID
    ORDER BY NEWID(); 

    -- Insert MCQ Questions
    INSERT INTO @ExamQuestion (QuestionID)
    SELECT TOP (@MCQcount) Question_ID
    FROM Question
    WHERE Type = 'MCQ' AND Course_ID = @CourseID
    ORDER BY NEWID();

    -- Insert generated questions into Exam_Question table for the provided Exam_ID
    INSERT INTO Exam_Question (Exam_ID, Question_ID)
    SELECT @ExamID, QuestionID FROM @ExamQuestion;
END
GO
