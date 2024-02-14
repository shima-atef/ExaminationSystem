SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Delete_Department] 
    @id INT
AS
BEGIN
    IF EXISTS (SELECT dept_id FROM Department WHERE dept_id = @id)
    BEGIN
        IF EXISTS (SELECT Student.Student_ID FROM Student WHERE Student.Dept_ID = @id)
            SELECT 'Cannot delete department: it has associated students' ;
        ELSE IF EXISTS (SELECT Instructor.Instructor_ID FROM Instructor WHERE Instructor.Dept_ID = @id)
            SELECT 'Cannot delete department: it has associated instructors' ;
        ELSE
            DELETE FROM Department WHERE dept_id = @id;
    END
    ELSE 
        SELECT 'Department not found' ;
END;
GO
