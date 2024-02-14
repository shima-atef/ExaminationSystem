SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--Question table
--1- Select SP  
create proc [dbo].[Select_Question] @q_id int
as
begin
set nocount on;
--checking if the question exists .
if exists (select q.Question_ID  from Question q where q.Question_ID =@q_id)
	begin
	begin try
	select q. Question_ID as ID, 
	isnull(q.Type,'NA') as Type,
	isnull(q.Question,'NA') as Question,
	isnull(c.Crs_Name,'NA') as Course_Name,
	isnull(q.Model_Answer,'NA') as Model_Answer
	from Question q , Course c 
	where  c.Course_ID =q.Course_ID
	and q.Question_ID=@q_id
	end try
	begin catch
	select ERROR_NUMBER() AS ErrorNumber,
    ERROR_MESSAGE() AS ErrorMessage,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine;
	end catch
	end
else
	begin
	select'Question Does not exist' as ErrorMessage
	end
end;

GO
