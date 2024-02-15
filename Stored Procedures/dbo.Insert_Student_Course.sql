SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[Insert_Student_Course] @StudentID int,@CourseID int as
begin try
insert into student_course
values (@StudentID,@CourseID)
end try
begin catch
select 'error in insert'
end catch
GO
