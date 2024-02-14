SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create proc [dbo].[Select_Department] @id int =-1 , @name nvarchar(50)=' '
as
if @id=-1 and @name!=' '
begin
if exists (select dept_name from Department where dept_name=@name )
select dept_id as [dept id] , dept_name as [dept name] from Department where dept_name=@name
else select 'department not found'
end
else if @id!=-1 and @name=' '
begin
if exists (select dept_id from Department where dept_id=@id )
select dept_id as [dept id] , dept_name as [dept name] from Department where dept_id=@id
else select 'department not found'
end
else
select dept_id as [dept id] , dept_name as [dept name] from Department
GO
