SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--------------------------------------INSERT--------------------------------------
CREATE PROCEDURE [dbo].[Insert_Student_Answer]
	@ExamID INT,
	@QuID INT,
	@StudID INT,
	@StudAns varchar(200)
AS
BEGIN
	BEGIN TRY
		INSERT INTO Student_Answer
		VALUES (@ExamID, @QuID, @StudID, @StudAns)
	END TRY
	BEGIN CATCH
		SELECT 'There Is An Error Happened!'
	END CATCH
END
GO
