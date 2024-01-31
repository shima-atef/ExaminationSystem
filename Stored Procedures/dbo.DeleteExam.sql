SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[DeleteExam] @ExamID INT
AS 
BEGIN
	BEGIN TRY
		-- Delete associated records from Exam_Question
		DELETE FROM Exam_Question
		WHERE Exam_ID = @ExamID;

		-- Delete the Exam record
		DELETE FROM Exam
		WHERE Exam_ID = @ExamID;

		PRINT 'Exam deleted successfully from the database';
	END TRY
	BEGIN CATCH
		PRINT 'Error while deleting the exam ' + ERROR_MESSAGE();
	END CATCH
END;

GO
