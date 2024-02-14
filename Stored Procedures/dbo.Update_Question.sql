SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	--3-Update Question ------------
	create proc [dbo].[Update_Question]
	@id int ,
	@Type VARCHAR(3),
    @QuestionText VARCHAR(200),
    @ModelAnswer VARCHAR(200),
    @CourseID INT
	as
	begin
	set nocount on;
	if exists(select q.Question_ID  from Question q where q.Question_ID=@id)
	begin
	begin try
		update Question 
		set Question.Type=@Type,
			Question.Question=@QuestionText,
			Question.Model_Answer=@ModelAnswer,
			Question.Course_ID=@CourseID
		where
		Question.Question_ID=@id
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
			SELECT 'Question Does not exist' as ErrorMessage
		end
	END
    

GO
