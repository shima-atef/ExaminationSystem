SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   proc [dbo].[GetStudentInformationReport] @dept_num int
as 
begin
    SET NOCOUNT ON;

	-- Checking if the department exists 
    if exists (select d.Dept_ID
               from Department d
               where dept_id = @dept_num )
    begin
        begin try
            select s.Student_ID AS ID ,
			ISNULL(s.First_Name,'NA') AS First_Name,
			ISNULL(s.Second_Name,'NA') AS Last_Name,
			ISNULL(s.Email,'NA') AS Email,
			s.Dept_ID as Department
			from Student s
			where s.Dept_ID=@dept_num

        end try
        begin catch

            SELECT ERROR_NUMBER() AS ErrorNumber,
                   ERROR_MESSAGE() AS ErrorMessage,
                   ERROR_PROCEDURE() AS ErrorProcedure,
                   ERROR_LINE() AS ErrorLine;

           
        end catch;
    end
    else
    begin
        print 'Department not found';
    end
end
GO
