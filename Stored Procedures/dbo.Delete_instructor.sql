SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--delete ins by id
create proc [dbo].[Delete_instructor] @id int
as
if exists(select Instructor_ID from Instructor where Instructor_ID = @id)
	begin
	delete from Instructor where Instructor_ID = @id
	delete from Instructor_Courses where Instructor_ID = @id
	end
else select 'This ID does not exist'
GO
