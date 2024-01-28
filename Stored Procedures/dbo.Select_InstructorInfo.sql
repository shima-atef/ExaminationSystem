SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create Procedure [dbo].[Select_InstructorInfo] @Ins_ID int=-1 , @Ins_name varchar(20)=' '
as
	if @Ins_ID = -1 and @Ins_name !=' '
		begin
		if exists(select First_Name from Instructor where First_Name = @Ins_name)
			select I.Instructor_ID, I.First_Name +' '+I.Second_Name as Full_Name
			,I.Email,D.Dept_Name Department,I.Dept_ID Department_ID
			from Instructor I,Department D
			where D.Dept_ID = I.Dept_ID
			and I.First_Name=@Ins_name
		else select 'No Matching Instructor'
		end
	else if @Ins_ID != -1 and @Ins_name =' '
		begin
		if exists(select Instructor_ID from Instructor where Instructor_ID = @Ins_ID)
			select I.Instructor_ID, I.First_Name +' '+I.Second_Name as Full_Name
			,I.Email,D.Dept_Name Department,I.Dept_ID Department_ID
			from Instructor I,Department D
			where D.Dept_ID = I.Dept_ID
			and I.Instructor_ID=@Ins_ID
		else select 'No Matching instructor'
		end
	else 
			select I.Instructor_ID, I.First_Name +' '+I.Second_Name as Full_Name
			,I.Email,D.Dept_Name Department,I.Dept_ID Department_ID
			from Instructor I,Department D
			where D.Dept_ID = I.Dept_ID
GO
