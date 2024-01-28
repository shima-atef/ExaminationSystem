SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ExamGeneration]
	@StudID INT, 
	@CrsID INT, 
	@Dur INT, 
	@numTF INT, 
	@numMCQ INT
AS
BEGIN
	--Make an Exam and insert it into the table
	INSERT INTO Exam(Student_ID, Grade, Course_ID, Duration)
	VALUES (@StudID, NULL, @CrsID, @Dur);

	--Get the ID of the inserted Exam
	DECLARE @examID INT;
	SET @examID = @@IDENTITY;

	--Get the randomized TF questions and insert them
	INSERT INTO Exam_Question(Exam_ID, Question_ID)
	SELECT TOP(@numTF) @examID as Exam_ID, Question_ID
	FROM Question
	WHERE [Type] = 'TF'
	ORDER BY NEWID();

	--Get the randomized MCQ questions and insert them
	INSERT INTO Exam_Question(Exam_ID, Question_ID)
	SELECT TOP(@numMCQ) @examID as Exam_ID, Question_ID
	FROM Question
	WHERE [Type] = 'MCQ'
	ORDER BY NEWID();
END
GO
