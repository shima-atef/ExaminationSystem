SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
 CREATE Proc [dbo].[ExamGeneration] @courseName varchar(30),@TFcount int,@MCQcount int
  as
  begin
  if(@TFcount+@MCQcount!=10)
  select 'Exam must have exactly 10 questions' 
  else
  begin
  declare @ExamQuestion table(QuestionID int)
  declare @CourseID int =(SELECT Course_ID FROM Course WHERE Crs_Name = @courseName) ;
  
  ---insert T/F Question
    INSERT INTO @ExamQuestion (QuestionID)
    SELECT TOP (@TFcount) Question_ID
    FROM Question
    WHERE Type = 'TF' AND Course_ID = @CourseID
    ORDER BY NEWID(); 
	-- Insert  MCQ Questions
    INSERT INTO @ExamQuestion (QuestionID)
    SELECT TOP (@MCQcount) Question_ID
    FROM Question
    WHERE Type = 'MCQ' AND Course_ID = @CourseID
    ORDER BY NEWID();

	declare @examID int;

    insert into Exam (Student_ID, Course_ID, Duration)
    values (5, @CourseID, 60); 

    set @examID = @@IDENTITY; -- Get the Exam_ID of the newly inserted row

    insert into Exam_Question (Exam_ID, Question_ID)
    select @examID, QuestionID from @examQuestion;

  end
  end
GO
