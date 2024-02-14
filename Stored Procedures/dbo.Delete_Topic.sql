SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Delete the topic name
CREATE PROCEDURE [dbo].[Delete_Topic]
    @Course_ID INT,
    @TopicName VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        DELETE FROM Topic
        WHERE Course_ID = @Course_ID
          AND Topic_Name = @TopicName;

        PRINT 'Topic deleted successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while deleting topic.';
    END CATCH
END;

GO
