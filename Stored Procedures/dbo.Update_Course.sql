SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Update_Course] 
    @id INT,
    @name NVARCHAR(50)
AS
BEGIN
    IF EXISTS (SELECT Course_ID FROM Course WHERE Course_ID = @id)
    BEGIN
        UPDATE Course SET Crs_Name = @name WHERE Course_ID = @id;
        SELECT 'Course updated successfully' AS Status;
    END
    ELSE 
        SELECT 'Course not found' AS Status;
END
GO
