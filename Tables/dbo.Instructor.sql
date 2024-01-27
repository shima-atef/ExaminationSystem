CREATE TABLE [dbo].[Instructor]
(
[Instructor_ID] [int] NOT NULL IDENTITY(1, 1),
[First_Name] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Second_Name] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Email] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Password] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Dept_ID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Instructor] ADD CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED ([Instructor_ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Instructor] ADD CONSTRAINT [FK_Instructor_Department] FOREIGN KEY ([Dept_ID]) REFERENCES [dbo].[Department] ([Dept_ID])
GO
