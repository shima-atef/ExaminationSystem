SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Select_Student]
	@StudID int =-1,
	@StudFName varchar(15) = ' '
AS
BEGIN
	--If The User only Entered The Student ID
	IF(@StudID != -1 AND @StudFName = ' ')
	BEGIN
		--Check First If He Exists
		IF EXISTS (SELECT First_Name FROM Student WHERE Student_ID = @StudID)
			SELECT Student_ID, First_Name + ' ' + Second_Name as [Full Name], Email, 
				ISNULL(Department.Dept_Name, 'NA') as DeptName
			FROM Student LEFT JOIN Department
			ON Student.Dept_ID = Department.Dept_ID
			WHERE Student_ID = @StudID
			
		ELSE SELECT 'No Student Found!';
	END

	--If The User only Entered The Student First Name
	ELSE IF(@StudID = -1 AND @StudFName != ' ')
	BEGIN
		--Check First If He Exists
		IF EXISTS (SELECT First_Name FROM Student WHERE First_Name = @StudFName)
			SELECT Student_ID, First_Name + ' ' + Second_Name as [Full Name], Email, 
				ISNULL(Department.Dept_Name, 'NA') as DeptName
			FROM Student LEFT JOIN Department
			ON Department.Dept_Name = Student.Dept_ID
			WHERE First_Name = @StudFName
			
		ELSE SELECT 'No Student Found!';
	END

	--If The User Didn't Enter Any Info, Then Print All
	ELSE
	BEGIN
		SELECT Student_ID, First_Name + ' ' + Second_Name as [Full Name], Email, 
			ISNULL(Department.Dept_Name, 'NA') as DeptName
		FROM Student LEFT JOIN Department
		ON Student.Dept_ID = Department.Dept_ID
	END
END
GO
