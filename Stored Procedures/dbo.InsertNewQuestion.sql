SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InsertNewQuestion] @questionType varchar(3),@questionText varchar(200),@Model_Answer varchar(200),@courseID int
AS
Insert into Question
Values(@questionType,@questionText,@Model_Answer,@courseID)
GO
