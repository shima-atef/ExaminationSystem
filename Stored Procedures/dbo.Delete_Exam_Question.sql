SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [dbo].[Delete_Exam_Question] @qid INT,@ex_id int
	AS
	BEGIN
	set nocount on;
	--checking if the question exists .
	if exists (select c.Question_ID  from Exam_Question c where c.Question_ID =@qid AND c.Exam_ID=@ex_id)
	begin
	begin try
    delete from dbo.Exam_Question
	where dbo.Exam_Question.Question_ID=@qid
	AND Exam_ID=@ex_id

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
