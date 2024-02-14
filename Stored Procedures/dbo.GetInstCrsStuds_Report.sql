SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
Create PROCEDURE [dbo].[GetInstCrsStuds_Report]
	@InstID INT
AS
BEGIN
	SELECT 
		Course.Crs_Name, 
		COUNT(Student_Course.Student_ID) as Num_Students
	FROM 
		Course
		LEFT JOIN 
		Student_Course ON Course.Course_ID = Student_Course.Course_ID
		LEFT JOIN 
		Instructor_Courses ON Instructor_Courses.Course_ID = Course.Course_ID
	WHERE 
		Instructor_Courses.Instructor_ID = @InstID
	GROUP BY 
		Course.Crs_Name;
END
GO
