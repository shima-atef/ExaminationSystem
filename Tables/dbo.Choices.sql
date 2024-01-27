CREATE TABLE [dbo].[Choices]
(
[Question_ID] [int] NOT NULL,
[Choices] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Choices] ADD CONSTRAINT [PK_Choices] PRIMARY KEY CLUSTERED ([Question_ID], [Choices]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Choices] ADD CONSTRAINT [FK_Choices_Question] FOREIGN KEY ([Question_ID]) REFERENCES [dbo].[Question] ([Question_ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
