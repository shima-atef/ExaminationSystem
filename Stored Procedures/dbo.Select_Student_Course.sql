SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create   procedure [dbo].[Select_Student_Course] @StudentID  int =-1,@CourseID   int =-1  as 
if (@StudentID !=-1 and @CourseID  !=-1)
select Student_Course.Student_ID ,Student_Course.Course_ID , Student.First_Name+Student.Second_Name as StudentName ,Course.Crs_Name as CourseName
from Student,Course,Student_Course
where Student_Course.Student_ID = Student.Student_ID and Student_Course.Course_ID=Course.Course_ID and Student_Course.Student_ID=@StudentID and Student_Course.Course_ID =@CourseID

else if  @StudentID!=-1
select Student_Course.Student_ID ,Student_Course.Course_ID , Student.First_Name+Student.Second_Name as StudentName ,Course.Crs_Name as CourseName
from Student,Course,Student_Course
where Student_Course.Student_ID = Student.Student_ID and Student_Course.Course_ID=Course.Course_ID and Student_Course.Student_ID=@StudentID 

else if @CourseID !=-1
select Student_Course.Student_ID ,Student_Course.Course_ID , Student.First_Name+Student.Second_Name as StudentName ,Course.Crs_Name as CourseName
from Student,Course,Student_Course
where Student_Course.Student_ID = Student.Student_ID and Student_Course.Course_ID=Course.Course_ID  and Student_Course.Course_ID =@CourseID
GO
