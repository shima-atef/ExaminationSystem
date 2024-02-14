SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE proc [dbo].[Update_Exam_Question] @old_qid int , @old_ex_id int,@new_qid int 
	as
	begin
	set nocount on;
	if exists(select c.Question_ID  from Exam_Question c where c.Question_ID=@old_qid and c.Exam_ID=@old_ex_id)
	begin
	begin try
	
	update Exam_Question 
	set Question_ID=@new_qid
	where
	Exam_Question.Question_ID=@old_qid
	AND
    dbo.Exam_Question.Exam_ID=@old_ex_id
	
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
	select 'Question Does not exist' as ErrorMessag
	end
	END;
GO
