CREATE TABLE [dbo].[Exam]
(
[Exam_ID] [int] NOT NULL IDENTITY(1, 1),
[Student_ID] [int] NOT NULL,
[Grade] [int] NULL,
[Course_ID] [int] NOT NULL,
[Duration] [int] NOT NULL,
[NumsOfMCQ] [int] NULL,
[NumsOfTF] [int] NULL,
[Date] [date] NULL,
[Time] [time] (0) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exam] ADD CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED ([Exam_ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exam] ADD CONSTRAINT [FK_Exam_Course] FOREIGN KEY ([Course_ID]) REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Exam] ADD CONSTRAINT [FK_Exam_Student] FOREIGN KEY ([Student_ID]) REFERENCES [dbo].[Student] ([Student_ID])
GO
