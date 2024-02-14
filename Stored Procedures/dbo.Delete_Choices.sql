SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--4-Delete choices
create proc [dbo].[Delete_Choices] @qid int
as 
	begin 
	set nocount on ;
	if exists(select c.Question_ID  from Choices c where c.Question_ID=@qid)
	begin 
	begin try
	 
	--deleting the answers 
	delete from Choices
	where Choices.Question_ID=@qid
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
	end

GO
