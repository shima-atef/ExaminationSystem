SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create    procedure [dbo].[Delete_Student_Course] @StudentID int=-1,@CourseID  int=-1 as
if @CourseID!=-1 and @StudentID!=-1
delete from Student_Course
where Course_ID=@CourseID and Student_ID=@StudentID
GO
