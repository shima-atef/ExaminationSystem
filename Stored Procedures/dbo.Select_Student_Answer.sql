SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--Table Student_Answer


--------------------------------------SELECT--------------------------------------

CREATE PROCEDURE [dbo].[Select_Student_Answer]
	@StudID INT = -1,
	@ExamID INT = -1,
	@QuID INT = -1
AS
BEGIN
	BEGIN TRY
		IF(@StudID = -1 AND @ExamID != -1 AND @QuID != -1)
		BEGIN
			SELECT *
			FROM Student_Answer
			WHERE Exam_ID = @ExamID
			AND Question_ID = @QuID
		END

		ELSE IF(@StudID = -1 AND @ExamID = -1 AND @QuID != -1)
		BEGIN
			SELECT *
			FROM Student_Answer
			WHERE Question_ID = @QuID
		END

		ELSE IF(@StudID = -1 AND @ExamID != -1 AND @QuID = -1)
		BEGIN
			SELECT *
			FROM Student_Answer
			WHERE Exam_ID = @ExamID
		END

		ELSE IF(@StudID = -1 AND @ExamID = -1 AND @QuID = -1)
		BEGIN
			SELECT *
			FROM Student_Answer
		END

		ELSE IF(@StudID != -1 AND @ExamID = -1 AND @QuID = -1)
		BEGIN
			SELECT *
			FROM Student_Answer
			WHERE Student_ID = @StudID
		END

		ELSE IF(@StudID != -1 AND @ExamID != -1 AND @QuID = -1)
		BEGIN
			SELECT *
			FROM Student_Answer
			WHERE Student_ID = @StudID
			AND Exam_ID = @ExamID
		END

		ELSE IF(@StudID != -1 AND @ExamID = -1 AND @QuID != -1)
		BEGIN
			SELECT *
			FROM Student_Answer
			WHERE Student_ID = @StudID
			AND Question_ID = @QuID
		END

		ELSE IF(@StudID != -1 AND @ExamID != -1 AND @QuID != -1)
		BEGIN
			SELECT *
			FROM Student_Answer
			WHERE Student_ID = @StudID
			AND Question_ID = @QuID
			AND Exam_ID = @ExamID
		END
	END TRY
	BEGIN CATCH
		SELECT 'There is an Error Heppened'
	END CATCH
END
GO
