SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[Insert_Student]
	@FirstName VARCHAR(15),
	@SecondName VARCHAR(15),
	@Email VARCHAR(50),
	@Password VARCHAR(50),
	@DeptID INT = NULL
AS
BEGIN
	--Check If There Is Any Error Will Happen Using TRY-CATCH
	BEGIN TRY
		INSERT INTO Student
		VALUES (@FirstName, @SecondName, @Email, @Password, @DeptID)
	END TRY

	BEGIN CATCH
		SELECT 'There Is An Error Happened!'
	END CATCH
END
GO
