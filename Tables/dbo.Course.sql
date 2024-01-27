CREATE TABLE [dbo].[Course]
(
[Course_ID] [int] NOT NULL,
[Crs_Name] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Course] ADD CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED ([Course_ID]) ON [PRIMARY]
GO
