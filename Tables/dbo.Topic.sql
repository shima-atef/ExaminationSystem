CREATE TABLE [dbo].[Topic]
(
[Course_ID] [int] NOT NULL,
[Topic_Name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Topic] ADD CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED ([Course_ID], [Topic_Name]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Topic] ADD CONSTRAINT [FK_Topic_Course] FOREIGN KEY ([Course_ID]) REFERENCES [dbo].[Course] ([Course_ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
