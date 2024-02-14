SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
	---------------------------------------------------------------------
	--2-update choices 
	create proc [dbo].[Update_Choices]
	@qid int ,
	 @oldChoice1 VARCHAR(50),
    @oldChoice2 VARCHAR(50),
    @oldChoice3 VARCHAR(50),
    @oldChoice4 VARCHAR(50),
	@Choice1 VARCHAR(50),
    @Choice2 VARCHAR(50),
    @Choice3 VARCHAR(50),
    @Choice4 VARCHAR(50)
	as
	begin
	set nocount on;
	if exists(select c.Question_ID  from Choices c where c.Question_ID=@qid)
	begin
	begin try
	update Choices 
	set Choices.Choices=@Choice1
	where
	Choices.Question_ID=@qid
	and Choices.Choices=@oldChoice1
	update Choices 
	set Choices.Choices=@Choice2
	where
	Choices.Question_ID=@qid
	and Choices.Choices=@oldChoice2
	update Choices 
	set Choices.Choices=@Choice3
	where
	Choices.Question_ID=@qid
	and Choices.Choices=@oldChoice3
	update Choices 
	set Choices.Choices=@Choice4
	where
	Choices.Question_ID=@qid
	and Choices.Choices=@oldChoice4
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
