SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--------------------------------------DELETE--------------------------------------
CREATE PROCEDURE [dbo].[Delete_Student_Answer]
	@ExamID INT,
	@QuID INT,
	@StudID INT
AS
BEGIN
	IF EXISTS (SELECT Student_Answer FROM Studend_Answer WHERE Exam_ID = @ExamID AND Question_ID = @QuID AND Student_ID = @StudID)
	BEGIN
		BEGIN TRY
			DELETE FROM Student_Answer
			WHERE Exam_ID = @ExamID 
			AND Question_ID = @QuID 
			AND Student_ID = @StudID
		END TRY
		BEGIN CATCH
			SELECT 'There Is An Error Happened!'
		END CATCH
	END
	ELSE SELECT 'There is no Student Answer Matched!'
END
GO
