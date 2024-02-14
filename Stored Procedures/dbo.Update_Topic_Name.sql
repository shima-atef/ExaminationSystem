SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Update the topic name
CREATE PROCEDURE [dbo].[Update_Topic_Name]
    @Course_ID INT,
    @OldTopicName VARCHAR(50),
    @NewTopicName VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        UPDATE Topic
        SET Topic_Name = @NewTopicName
        WHERE Course_ID = @Course_ID
          AND Topic_Name = @OldTopicName;

        PRINT 'Topic name updated successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while updating topic name.';
    END CATCH
END;
GO
