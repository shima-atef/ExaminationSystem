SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[ExamAnswers] 
  @ExamID int, 
  @studID int, 
  @Ans1 varchar(200), 
  @Ans2 varchar(200), 
  @Ans3 varchar(200), 
  @Ans4 varchar(200), 
  @Ans5 varchar(200), 
  @Ans6 varchar(200), 
  @Ans7 varchar(200), 
  @Ans8 varchar(200), 
  @Ans9 varchar(200), 
  @Ans10 varchar(200)
AS
BEGIN 
  DECLARE @examQuestion table (questionID int, RowNum int);

  INSERT INTO @examQuestion 
  SELECT Question_ID, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) as RowNum
  FROM Exam_Question 
  WHERE Exam_ID = @ExamID;

  DECLARE @currentRowNum int = 1;

  WHILE @currentRowNum <= 10
  BEGIN
    DECLARE @currentQuestionID int = (SELECT questionID FROM @examQuestion WHERE RowNum = @currentRowNum);

    INSERT INTO Student_Answer (Exam_ID, Question_ID, Student_ID, Student_Answer)
    VALUES (@ExamID, @currentQuestionID, @studID, 
            CASE 
              WHEN @currentRowNum = 1 THEN @Ans1
              WHEN @currentRowNum = 2 THEN @Ans2
              WHEN @currentRowNum = 3 THEN @Ans3
              WHEN @currentRowNum = 4 THEN @Ans4
              WHEN @currentRowNum = 5 THEN @Ans5
              WHEN @currentRowNum = 6 THEN @Ans6
              WHEN @currentRowNum = 7 THEN @Ans7
              WHEN @currentRowNum = 8 THEN @Ans8
              WHEN @currentRowNum = 9 THEN @Ans9
              WHEN @currentRowNum = 10 THEN @Ans10
            END);

    SET @currentRowNum = @currentRowNum + 1;
  END


END
GO
