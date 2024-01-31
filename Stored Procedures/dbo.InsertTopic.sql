SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[InsertTopic]
AS
BEGIN
    BEGIN TRY
        INSERT INTO Topic (Course_ID, Topic_Name)
        VALUES
            (1, 'Generics'),
            (1, 'Indexers'),
            (1, 'Enums'),
            (2, 'Procedures'),
            (2, 'Triggers'),
            (2, 'Cursor'),
            (2, 'Views'),
            (1, 'Events'),
            (3, 'Inheritance'),
            (3, 'Polymorphism');
    END TRY
    BEGIN CATCH
        PRINT 'Invalid data';
    END CATCH
END;
GO
