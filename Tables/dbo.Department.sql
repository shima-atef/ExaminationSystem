CREATE TABLE [dbo].[Department]
(
[Dept_ID] [int] NOT NULL IDENTITY(1, 1),
[Dept_Name] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Department] ADD CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED ([Dept_ID]) ON [PRIMARY]
GO
