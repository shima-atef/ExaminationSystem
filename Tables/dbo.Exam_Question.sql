CREATE TABLE [dbo].[Exam_Question]
(
[Exam_ID] [int] NOT NULL,
[Question_ID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exam_Question] ADD CONSTRAINT [PK_Exam_Question] PRIMARY KEY CLUSTERED ([Exam_ID], [Question_ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exam_Question] ADD CONSTRAINT [FK_Exam_Question_Exam] FOREIGN KEY ([Exam_ID]) REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[Exam_Question] ADD CONSTRAINT [FK_Exam_Question_Question] FOREIGN KEY ([Question_ID]) REFERENCES [dbo].[Question] ([Question_ID])
GO
