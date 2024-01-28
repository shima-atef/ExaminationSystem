SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Insert_Instructor] 
    @ins_id INT,
    @fname NVARCHAR(10),
    @lname NVARCHAR(10),
    @email NVARCHAR(70) = NULL,
    @did INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Instructor (Instructor_ID, First_Name, Second_Name, Email, Dept_ID)
        VALUES (@ins_id, @fname, @lname, @email, @did);
    END TRY
    BEGIN CATCH
        --Error message
        SELECT 
            'An Error happened while inserting: ' + ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO
