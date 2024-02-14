SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create proc [dbo].[Insert_Department] @name nvarchar(20)
as
insert into Department values(@name)
GO
