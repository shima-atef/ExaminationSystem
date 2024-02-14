SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- Update Exam Grade
CREATE   PROCEDURE [dbo].[Update_Exam_Grade]
    @Exam_ID INT,
    @NewGrade INT
AS
BEGIN
    BEGIN TRY
        UPDATE Exam
        SET Grade = @NewGrade
        WHERE Exam_ID = @Exam_ID;

        PRINT 'Exam grade updated successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while updating exam grade.';
    END CATCH
END;
GO
