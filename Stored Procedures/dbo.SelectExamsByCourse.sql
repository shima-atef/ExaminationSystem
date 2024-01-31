SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[SelectExamsByCourse]
    @Course_ID INT
AS
BEGIN
    BEGIN TRY
        SELECT *
        FROM Exam
        WHERE Course_ID = @Course_ID;
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while selecting exams by course.';
    END CATCH
END;

GO
