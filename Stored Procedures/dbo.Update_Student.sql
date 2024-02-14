SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create PROCEDURE [dbo].[Update_Student]
	@StudID INT,
	@FirstName VARCHAR(15) = 'NA',
	@SecondName VARCHAR(15) = 'NA',
	@Email VARCHAR(50) = 'NA',
	@Password VARCHAR(50) = 'NA',
	@DeptID INT = -1
AS
BEGIN
	IF EXISTS (SELECT Student_ID FROM Student WHERE Student_ID = @StudID)
	BEGIN
		BEGIN TRY
			IF @FirstName != 'NA'
				UPDATE Student SET First_Name = @FirstName WHERE Student_ID = @StudID

			IF @SecondName != 'NA'
				UPDATE Student SET Second_Name = @SecondName WHERE Student_ID = @StudID

			IF @Email != 'NA'
				UPDATE Student SET Email = @Email WHERE Student_ID = @StudID

			IF @Password != 'NA'
				UPDATE Student SET [Password] = @Password WHERE Student_ID = @StudID

			IF @DeptID != -1
				UPDATE Student SET Dept_ID = @DeptID WHERE Student_ID = @StudID
		END TRY

		BEGIN CATCH
			SELECT 'There Is An Error Happened!'
		END CATCH
	END

	ELSE SELECT 'No Student Found!';
END
GO
