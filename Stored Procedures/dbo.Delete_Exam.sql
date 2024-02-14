SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--Delete Exam
CREATE   PROCEDURE [dbo].[Delete_Exam] @ExamID INT
AS 
BEGIN
	BEGIN TRY
		DELETE FROM Exam_Question
		WHERE Exam_ID = @ExamID;

		DELETE FROM Exam
		WHERE Exam_ID = @ExamID;

		PRINT 'Exam deleted successfully from the database';
	END TRY
	BEGIN CATCH
		PRINT 'Error while deleting the exam ' + ERROR_MESSAGE();
	END CATCH
END;
GO
