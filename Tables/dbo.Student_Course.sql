CREATE TABLE [dbo].[Student_Course]
(
[Student_ID] [int] NOT NULL,
[Course_ID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Student_Course] ADD CONSTRAINT [PK_Student_Course] PRIMARY KEY CLUSTERED ([Student_ID], [Course_ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Student_Course] ADD CONSTRAINT [FK_Student_Course_Course] FOREIGN KEY ([Course_ID]) REFERENCES [dbo].[Course] ([Course_ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Student_Course] ADD CONSTRAINT [FK_Student_Course_Student] FOREIGN KEY ([Student_ID]) REFERENCES [dbo].[Student] ([Student_ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
