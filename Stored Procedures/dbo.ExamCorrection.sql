SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ExamCorrection]
	@StudID INT,
	@ExamID INT
AS
BEGIN
	--Declare Grade
	DECLARE @StdGrade INT;
	SET @StdGrade = 0;

	--Declare Cursor on Studnet Answer Table, 
	--Limited to ExamID and StudentID passed to the parameters.
	DECLARE answerCur CURSOR
	FOR 
		SELECT Student_Answer,Question_ID 
		FROM Student_Answer 
		WHERE Student_Answer.Exam_ID = @ExamID
		AND Student_Answer.Student_ID = @StudID
	FOR READ ONLY

	DECLARE @QuID INT
	DECLARE @StdAns varchar(200)
	OPEN answerCur 
	FETCH answerCur INTO @StdAns,@QuID
	BEGIN
		--Begin While Loop and set the Cursor to Zero
		WHILE @@FETCH_STATUS=0
		BEGIN
			DECLARE @ModelAnswer VARCHAR(200);

			--Get the right answer from Question Table
			SELECT @ModelAnswer = Question.Model_Answer
			FROM Question
			WHERE Question.Question_ID = @QuID;

			--Compare Right Answer to The Student Answer
			--If they are the same then Grade++
			IF @ModelAnswer = ISNULL(@StdAns,' ')
			BEGIN
				SET @StdGrade = @StdGrade + 1;
			END

			--Increment Cursor
			FETCH answerCur INTO @StdAns,@QuID
		END
	END

	--Close Cursor
	CLOSE answerCur
	DEALLOCATE answerCur

	--Put The Grade of the Student To Exam Table
	UPDATE Exam
	SET Grade = @StdGrade
	WHERE Exam_ID = @ExamID

END
GO
