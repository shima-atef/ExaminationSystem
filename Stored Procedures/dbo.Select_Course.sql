SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create proc [dbo].[Select_Course] @crs_id int =-1
as
	if(@crs_id!=-1)
		select Course_ID , Crs_Name as CourseName from Course where Course_ID=@crs_id
	else
		select Course_ID , Crs_Name as CourseName from Course
GO
