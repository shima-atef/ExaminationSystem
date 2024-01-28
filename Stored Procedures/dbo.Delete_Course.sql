SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--delete course
create proc [dbo].[Delete_Course] @id int
as
if exists(select Course_ID from Course where Course_ID=@id)
begin
	delete from Choices where Question_ID in (select Question_ID from Question where Course_ID = @id)
	delete from Student_Answer where Question_ID in (select Question_ID from Question where Course_ID=@id)
	delete from Question where Course_ID =@id
	delete from Instructor_courses where Course_ID =@id
	delete from Student_course where Course_ID=@id
	delete from Exam where Course_ID =@id
	delete from Topic where Course_ID=@id
	delete from Course where Course_ID=@id
end
else select 'Course Not Found'
GO
