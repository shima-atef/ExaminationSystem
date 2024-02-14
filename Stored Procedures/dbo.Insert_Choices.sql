SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	-------------------------------------------------------------------
	--table choices ----
	
	--1-insert choicese 
	CREATE PROCEDURE [dbo].[Insert_Choices] @QuestionID INT ,
    @Choice1 VARCHAR(50),
    @Choice2 VARCHAR(50),
    @Choice3 VARCHAR(50),
    @Choice4 VARCHAR(50)
AS
BEGIN
set nocount on;

    -- Insert into Question table
    INSERT INTO dbo.Choices
    (
        Question_ID,
        Choices
    )
    VALUES
    (@QuestionID, @Choice1),
            (@QuestionID, @Choice2),
            (@QuestionID, @Choice3),
            (@QuestionID, @Choice4);
			END;
   

GO
