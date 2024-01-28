SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create proc [dbo].[GetQuestionsWithStudentAnswers] @QuID int, @ExamID int
as
select Question.Question as TheQuestions , Student_Answer.Student_Answer as StudentAnswers
from Exam_Question , Student_Answer ,Question
where Question.Question_ID = Exam_Question.Question_ID
and Student_Answer.Exam_ID=Exam_Question.Exam_ID
and Question.Question_ID=@QuID
and Exam_Question.Exam_ID=@ExamID
GO
