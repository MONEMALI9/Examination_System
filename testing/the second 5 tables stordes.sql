---sp--
--Questions,  select --
CREATE PROCEDURE SelectQuest
AS
BEGIN
    SELECT * FROM Question
END
--insert --
GO
CREATE PROCEDURE InsertQuest
    @Quest_txt VARCHAR(255),
    @Quest_type VARCHAR(50),
    @Quest_mark INT,
    @Model_ans_id INT,
    @Model_ans_txt VARCHAR(255)
AS
BEGIN
    INSERT INTO Question(Quest_txt, Quest_type, Quest_mark, Model_ans_id, Model_ans_txt)
    VALUES (@Quest_txt, @Quest_type, @Quest_mark, @Model_ans_id, @Model_ans_txt)
END

--update --
Go
CREATE PROCEDURE UpdateQuest
    @Quest_id INT,
    @Quest_txt VARCHAR(255),
    @Quest_type VARCHAR(50),
    @Quest_mark INT,
    @Model_ans_id INT,
    @Model_ans_txt VARCHAR(255)
AS
BEGIN
    UPDATE Question
    SET
        Quest_txt = @Quest_txt,
        Quest_type = @Quest_type,
        Quest_mark = @Quest_mark,
        Model_ans_id = @Model_ans_id,
        Model_ans_txt = @Model_ans_txt
    WHERE Quest_id = @Quest_id
END


--delete --
Go
CREATE PROCEDURE DeleteQuest
    @Quest_id INT
AS
BEGIN
    DELETE FROM Question
    WHERE Quest_id = @Quest_id
END

----sp for Exam Table:---
--select--
Go
CREATE PROCEDURE SelectExam
AS
BEGIN
    SELECT * FROM Exam
END
--insert--
Go
CREATE PROCEDURE InsertExam
    @No_of_qs INT,
    @Exam_duration INT,
    @Exam_grade InT,
    @Exam_date DATE,
    @Crs_id INT
AS
BEGIN
    INSERT INTO Exam (No_of_qs, Exam_duration, Exam_grade, Exam_date, Crs_id)
    VALUES (@No_of_qs, @Exam_duration, @Exam_grade, @Exam_date, @Crs_id)
END

---update--
Go
CREATE PROCEDURE UpdateExam
    @Exam_id INT,
    @No_of_qs INT,
    @Exam_duration INT,
    @Exam_grade INT,
    @Exam_date DATE,
    @Crs_id INT
AS
BEGIN
    UPDATE Exam
    SET
        No_of_qs = @No_of_qs,
        Exam_duration = @Exam_duration,
        Exam_grade = @Exam_grade,
        Exam_date = @Exam_date,
        Crs_id = @Crs_id
    WHERE Exam_id = @Exam_id
END
---delet---
GO
CREATE PROCEDURE DeleteExam
    @Exam_id INT
AS
BEGIN
    DELETE FROM Exam
    WHERE Exam_id = @Exam_id
END


---sp for Choice Table --
--select--
GO
CREATE PROCEDURE SelectChoice
AS
BEGIN
    SELECT * FROM Choice
END

-- insert--
GO
CREATE PROCEDURE InsertChoice
    @Choice_txt VARCHAR(255),
    @Is_correct BIT,
    @Quest_id INT
AS
BEGIN
    INSERT INTO Choice (Choice_txt, Is_correct, Quest_id)
    VALUES (@Choice_txt, @Is_correct, @Quest_id)
END

-- update--
GO
CREATE PROCEDURE UpdateChoice
    @Choice_id INT,
    @Choice_txt VARCHAR(255),
    @Is_correct BIT,
    @Quest_id INT
AS
BEGIN
    UPDATE Choice
    SET
        Choice_txt = @Choice_txt,
        Is_correct = @Is_correct,
        Quest_id = @Quest_id
    WHERE Choice_id = @Choice_id
END

--delete--
Go
CREATE PROCEDURE DeleteChoice
    @Choice_id INT
AS
BEGIN
    DELETE FROM Choice
    WHERE Choice_id = @Choice_id
END

--sp for Exam_Question Table--
--select--

GO
CREATE PROCEDURE SelectExamQuestion
AS
BEGIN
    SELECT * FROM Exam_Question
END

-- insert--
GO
CREATE PROCEDURE InsertExamQuestion
    @Exam_id INT,
    @Question_id INT
AS
BEGIN
    INSERT INTO Exam_Question (Exam_id, Quest_id)
    VALUES (@Exam_id, @Question_id)
END

-- update--
GO
CREATE PROCEDURE UpdateExamQuestion
    @Exam_id INT,
    @Question_id INT
AS
BEGIN
    UPDATE Exam_Question
    SET Quest_id = @Question_id
    WHERE Exam_id = @Exam_id
END

--delete--

GO
CREATE PROCEDURE DeleteExamQuestion
    @Exam_id INT,
    @Question_id INT
AS
BEGIN
    DELETE FROM Exam_Question
    WHERE Exam_id = @Exam_id AND Quest_id = @Question_id
END

---- sp for Std_course Table ---
-- select--

GO
CREATE PROCEDURE SelectStdCourse
AS
BEGIN
    SELECT * FROM Std_course
END

---insert--

GO
CREATE PROCEDURE InsertStdCourse
    @Std_id INT,
    @Crs_id INT,
    @Crs_grade INT
AS
BEGIN
    INSERT INTO Std_course (Std_id, Crs_id, Crs_grade)
    VALUES (@Std_id, @Crs_id, @Crs_grade)
END

---update--

GO
CREATE PROCEDURE UpdateStdCourse
    @Std_id INT,
    @Crs_id INT,
    @Crs_grade INT
AS
BEGIN
    UPDATE Std_course
    SET Crs_grade = @Crs_grade
    WHERE Std_id = @Std_id AND Crs_id = @Crs_id
END

-- delete--

GO
CREATE PROCEDURE DeleteStdCourse
    @Std_id INT,
    @Crs_id INT
AS
BEGIN
    DELETE FROM Std_course
    WHERE Std_id = @Std_id AND Crs_id = @Crs_id
END
----

---Test the SelectQuest procedure:---
/*
--Test the SelectQuest procedure:--

EXEC SelectQuest



--Test the InsertQuest procedure:--

EXEC InsertQuest 
'Sample question text', 'Multiple Choice', 10, 1, 'Sample model answer text'



--Test the UpdateQuest procedure:--

EXEC UpdateQuest
1, 'Updated question text', 'True/False', 5, 2, 'Updated model answer text'


--Test the DeleteQuest procedure:--

EXEC DeleteQuest 1

---------------------
--Exam Table:--

--Test the SelectExam procedure:--

EXEC SelectExam


--Test the InsertExam procedure:--

EXEC InsertExam
20, 120, 100, '2023-10-12', 

--Test the UpdateExam procedure:--

EXEC UpdateExam 1, 25, 150, 85, '2023-10-15', 2


--Test the DeleteExam procedure:--

EXEC DeleteExam 1

--------------------------------

--Choice Table:--

--Test the SelectChoice procedure:--

EXEC SelectChoice

--Test the InsertChoice procedure:--

EXEC InsertChoice 'Choice 1', 1, 1

--Test the UpdateChoice procedure:--

EXEC UpdateChoice 1, 'Updated Choice 1', 0, 1


--Test the DeleteChoice procedure:--

EXEC DeleteChoice 1

-----------------------------------
--Exam_Question Table:--

--Test the SelectExamQuestion procedure:--

EXEC SelectExamQuestion


--Test the InsertExamQuestion procedure:--

EXEC InsertExamQuestion 1, 1


--Test the UpdateExamQuestion procedure:--

EXEC UpdateExamQuestion 1, 2


--Test the DeleteExamQuestion procedure:--

EXEC DeleteExamQuestion 1, 1

-------------------------------------

--Std_course Table:--

--Test the SelectStdCourse procedure:--

EXEC SelectStdCourse

--Test the InsertStdCourse procedure:--

EXEC InsertStdCourse 1, 1, 100

--Test the UpdateStdCourse procedure:--

EXEC UpdateStdCourse 1, 1, 85

---Test the DeleteStdCourse procedure:--

EXEC DeleteStdCourse 1, 1

*/
