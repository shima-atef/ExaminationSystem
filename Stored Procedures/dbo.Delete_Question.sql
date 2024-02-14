SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	--4- Delete SP
	create proc [dbo].[Delete_Question] @qid int
	as 
	begin 
	set nocount on ;
	if exists(select q.Question_ID  from Question q where q.Question_ID=@qid)
	begin 
	begin try
	 
	--deleting the answers of this question first------------
	delete from Choices
	where Choices.Question_ID=@qid
	-- Deleting from exam-question table
    DELETE FROM Exam_Question
    WHERE Question_ID = @qid;
	--deleting the questio 
	delete from Question 
	where Question.Question_ID=@qid
	--to reset the identity of question id -------------
	
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
	END
    

GO
