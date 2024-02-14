SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


--2- Insert SP
create proc [dbo].[Insert_Exam_Question] @qid int , @ex_id int
	as
	BEGIN
	set nocount on;
	--checking if the question exists .
	if exists (select c.Question_ID  from Exam_Question c where c.Question_ID =@qid)
	begin
	begin try
    -- Insert into Question table
    INSERT INTO Exam_Question(Question_ID,Exam_ID)
    VALUES (@qid,@ex_id);
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
	
END;

GO
