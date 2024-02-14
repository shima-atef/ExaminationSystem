SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Update_Department]
    @DeptID INT,
    @NewDeptName VARCHAR(200)
AS
BEGIN
    BEGIN TRY
        UPDATE Department
        SET Dept_Name = @NewDeptName
        WHERE Dept_ID = @DeptID;
        
        IF @@ROWCOUNT = 0
        BEGIN
            SELECT 'Department not found' ;
        END
    END TRY
    BEGIN CATCH
        SELECT 'An error occurred' ;
    END CATCH;
END;
GO
