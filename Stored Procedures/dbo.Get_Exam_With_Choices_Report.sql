SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Get_Exam_With_Choices_Report]
	@ExamID INT
AS
BEGIN
    DECLARE crs CURSOR FOR 
        SELECT Question_ID
        FROM Exam_Question
        WHERE Exam_ID = @ExamID
        FOR READ ONLY

    DECLARE @QuID INT
    OPEN crs
    FETCH crs INTO @QuID
  
    BEGIN  
        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Select Question row
            SELECT Question
            FROM Question
            WHERE Question_ID = @QuID
            union All
            -- Select choices for the current question
            SELECT Choices 
            FROM Choices
            WHERE Question_ID = @QuID
			FETCH crs INTO @QuID
        END
    END 

    CLOSE crs  
    DEALLOCATE crs
END
GO
