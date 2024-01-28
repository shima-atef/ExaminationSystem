SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InsertQuestion]
    @Type VARCHAR(3),
    @QuestionText VARCHAR(200),
    @ModelAnswer VARCHAR(200),
    @CourseID INT,
    @Choice1 VARCHAR(200),
    @Choice2 VARCHAR(200),
    @Choice3 VARCHAR(200),
    @Choice4 VARCHAR(200)
AS
BEGIN
    -- Insert into Question table
    INSERT INTO Question (Type, Question, Model_Answer, Course_ID)
    VALUES (@Type, @QuestionText, @ModelAnswer, @CourseID);

    -- Get the generated Question_ID
    DECLARE  @QuestionID int  = SCOPE_IDENTITY();

    -- Insert into Choices table if the question type is MCQ
    IF @Type = 'MCQ'
    BEGIN
        INSERT INTO Choices (Question_ID, Choices)
        VALUES
            (@QuestionID, @Choice1),
            (@QuestionID, @Choice2),
            (@QuestionID, @Choice3),
            (@QuestionID, @Choice4);
    END
END;
GO
