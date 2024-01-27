CREATE TABLE [dbo].[Question]
(
[Question_ID] [int] NOT NULL IDENTITY(1, 1),
[Type] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Question] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Model_Answer] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Course_ID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Question] ADD CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED ([Question_ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Question] ADD CONSTRAINT [FK_Question_Course] FOREIGN KEY ([Course_ID]) REFERENCES [dbo].[Course] ([Course_ID])
GO
