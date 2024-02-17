CREATE TABLE [dbo].[Exam_Structure]
(
[Structure_ID] [int] NOT NULL IDENTITY(1, 1),
[Course_ID] [int] NULL,
[Duration] [int] NULL,
[MCQ_Count] [int] NULL,
[TF_Count] [int] NULL,
[Date] [date] NULL,
[time] [time] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exam_Structure] ADD CONSTRAINT [PK_Exam_Structure] PRIMARY KEY CLUSTERED ([Structure_ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exam_Structure] ADD CONSTRAINT [FK_Exam_Structure_Course] FOREIGN KEY ([Course_ID]) REFERENCES [dbo].[Course] ([Course_ID])
GO
