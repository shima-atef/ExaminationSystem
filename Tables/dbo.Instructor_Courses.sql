CREATE TABLE [dbo].[Instructor_Courses]
(
[Instructor_ID] [int] NOT NULL,
[Course_ID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Instructor_Courses] ADD CONSTRAINT [PK_Instructor_Courses] PRIMARY KEY CLUSTERED ([Instructor_ID], [Course_ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Instructor_Courses] ADD CONSTRAINT [FK_Instructor_Courses_Course] FOREIGN KEY ([Course_ID]) REFERENCES [dbo].[Course] ([Course_ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Instructor_Courses] ADD CONSTRAINT [FK_Instructor_Courses_Instructor] FOREIGN KEY ([Instructor_ID]) REFERENCES [dbo].[Instructor] ([Instructor_ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
