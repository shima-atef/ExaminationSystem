CREATE TABLE [dbo].[Exam]
(
[Exam_ID] [int] NOT NULL IDENTITY(1, 1),
[Student_ID] [int] NOT NULL,
[Grade] [int] NULL,
[Structure_ID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exam] ADD CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED ([Exam_ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exam] ADD CONSTRAINT [FK_Exam_Exam_Structure] FOREIGN KEY ([Structure_ID]) REFERENCES [dbo].[Exam_Structure] ([Structure_ID])
GO
ALTER TABLE [dbo].[Exam] ADD CONSTRAINT [FK_Exam_Student] FOREIGN KEY ([Student_ID]) REFERENCES [dbo].[Student] ([Student_ID])
GO
