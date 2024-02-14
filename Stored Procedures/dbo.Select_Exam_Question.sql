SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
	------------------------------------------------------------------------------------
	--table Exam-Question 
	--1 Select SP
	CREATE   proc [dbo].[Select_Exam_Question] @qid int =0 , @ex_id int=0 
	as
	begin
	set nocount on;
	--checking if the question exists .
	if exists 
	(select c.Question_ID  from Exam_Question c where c.Question_ID =@qid 
	)
	begin
	begin try
	if(@qid!=0 and @ex_id !=0)
	begin
	select c.Question_ID ,c.Exam_ID
	from Exam_Question c 
	where c.Question_ID=@qid 
	and c.Exam_ID=@ex_id
	end
	else if (@qid!=0 and @ex_id=0)
	begin
	select c.Question_ID ,c.Exam_ID
	from Exam_Question c 
	where c.Question_ID=@qid 
	end
	else if(@qid=0 and @ex_id!=0)
	begin
	select c.Question_ID ,c.Exam_ID
	from Exam_Question c 
	where  c.Exam_ID=@ex_id
	END
	
	end try
	begin catch
	select ERROR_NUMBER() AS ErrorNumber,
    ERROR_MESSAGE() AS ErrorMessage,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine;
	end catch
	END
    else if(@qid=0 and @ex_id=0)
	begin
	select *
	from Exam_Question c 
	end
else
	begin
	select'Question Does not exist' as ErrorMessage
	end
end;


GO
