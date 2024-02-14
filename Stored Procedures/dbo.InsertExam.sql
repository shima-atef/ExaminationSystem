SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- Inserting Exam Records
CREATE   PROCEDURE [dbo].[InsertExam]
    @Student_ID INT,
    @Grade INT,
    @Course_ID INT,
    @Duration INT,
    @McqCount INT,
    @TFCount INT,
	 @Date DATE,
	 @Time TIME
AS
BEGIN
    BEGIN TRY
        INSERT INTO Exam (Student_ID, Grade, Course_ID, Duration, NumsOfMCQ, NumsOfTF, Date, Time)
        VALUES (@Student_ID, @Grade, @Course_ID, @Duration, @McqCount, @TFCount, @Date, @Time);
        PRINT 'Exam record inserted successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while inserting exam record. Error Message: ' + ERROR_MESSAGE();
    END CATCH
END;
GO
