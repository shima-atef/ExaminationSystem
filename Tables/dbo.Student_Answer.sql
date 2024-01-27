CREATE TABLE [dbo].[Student_Answer]
(
[Exam_ID] [int] NOT NULL,
[Question_ID] [int] NOT NULL,
[Student_ID] [int] NOT NULL,
[Student_Answer] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Student_Answer] ADD CONSTRAINT [PK_Student_Answer] PRIMARY KEY CLUSTERED ([Question_ID], [Student_ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Student_Answer] ADD CONSTRAINT [FK_Student_Answer_Exam] FOREIGN KEY ([Exam_ID]) REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[Student_Answer] ADD CONSTRAINT [FK_Student_Answer_Question] FOREIGN KEY ([Question_ID]) REFERENCES [dbo].[Question] ([Question_ID])
GO
ALTER TABLE [dbo].[Student_Answer] ADD CONSTRAINT [FK_Student_Answer_Student] FOREIGN KEY ([Student_ID]) REFERENCES [dbo].[Student] ([Student_ID])
GO
