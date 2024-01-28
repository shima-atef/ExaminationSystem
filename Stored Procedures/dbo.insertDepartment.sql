SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create proc [dbo].[insertDepartment] @name nvarchar(20)
as
insert into Department values(@name)
GO
