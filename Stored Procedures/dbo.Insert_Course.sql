SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Insert_Course]
    @crsname NVARCHAR(15)
AS
BEGIN
    BEGIN TRY
        INSERT INTO Course(Crs_Name)
        VALUES (@crsname)
    END TRY
    BEGIN CATCH
        -- Error message
        SELECT 
            'An Error happened while inserting: ' + ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO
