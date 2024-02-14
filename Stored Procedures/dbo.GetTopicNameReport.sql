SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   proc [dbo].[GetTopicNameReport]
    @crsId int
as
begin
    SET NOCOUNT ON;

    if exists (select Course_ID
               from Course
               where Course_ID = @crsId)
    begin
        begin try
            select *
            from Topic
            where Course_ID = @crsId;
        end try
        begin catch
            select ERROR_NUMBER() AS ErrorNumber,
                   ERROR_MESSAGE() AS ErrorMessage,
                   ERROR_PROCEDURE() AS ErrorProcedure,
                   ERROR_LINE() AS ErrorLine;
        end catch;
    end
    else
    begin
        select 'Course not found' AS ErrorMessage;
    end
end;
GO
