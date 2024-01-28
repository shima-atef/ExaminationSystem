SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Update_Instructor] 
    @ins_ID INT,
    @fname NVARCHAR(50) = '',
    @email VARCHAR(50) = '',
    @d_id INT = 0
AS
BEGIN
    IF EXISTS (SELECT Instructor_ID FROM Instructor WHERE Instructor_ID = @ins_ID)
    BEGIN
        BEGIN TRY
            IF (@fname != '')
                UPDATE Instructor SET First_Name = @fname WHERE Instructor_ID = @ins_ID;
            IF (@email != '')
                UPDATE Instructor SET Email = @email WHERE Instructor_ID = @ins_ID;
            IF (@d_id != 0)
                UPDATE Instructor SET Dept_ID = @d_id WHERE Instructor_ID = @ins_ID;
        END TRY
        BEGIN CATCH
            SELECT 'Invalid update. Error: ' + ERROR_MESSAGE() AS ErrorMessage
        END CATCH
    END
    ELSE 
        SELECT 'No Matched Instructor ID';
END
GO
