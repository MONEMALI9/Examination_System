-- Topic Table --

-- SP SELECT --
GO
CREATE PROCEDURE SelectTopic
AS
BEGIN
    SELECT * FROM Topic
END

-- SP INSERT --
GO
CREATE PROCEDURE InsertTopic
    @Topic_Id INT,
	@topic_name VARCHAR(20)
AS
BEGIN
    INSERT INTO Topic
	VALUES(@Topic_Id, @topic_name)
END

-- SP UPDATE --
GO
CREATE PROCEDURE UpdateTopic
    @Topic_Id INT,
    @new_topic_name VARCHAR(20)
AS
BEGIN
    UPDATE Topic
	SET Topic_Name = @new_topic_name
	WHERE Topic_Id = @topic_id
END

-- SP DELETE --
GO
CREATE PROCEDURE DeleteTopic
    @topic_id INT
AS
BEGIN
    DELETE FROM Topic
	WHERE Topic_Id = @topic_id
END

-- Course Table --

-- SP SELECT --
GO
CREATE PROCEDURE SelectCourse
AS
BEGIN
    SELECT * FROM Course
END

-- SP INSERT --
GO
CREATE PROCEDURE InsertCousre
    @Crs_Id INT,
	@Crs_Name VARCHAR(20),
	@Crs_Duration INT,
	@Topic_Id INT,
	@Ins_Id INT
AS
BEGIN
    INSERT INTO Course
	VALUES(@Crs_Id,@Crs_Name,@Crs_Duration , @Topic_Id,@Ins_Id )
END

-- SP UPDATE --
GO
CREATE PROCEDURE UpdateCourse
    @Crs_Id INT,
    @New_Topic_Id INT
AS
BEGIN
    UPDATE Course
	SET Topic_id = @New_Topic_Id
	WHERE Crs_Id = @Crs_Id
END

-- SP DELETE --
GO
CREATE PROCEDURE DeleteCourse
    @Crs_Id INT
AS
BEGIN
    DELETE FROM Course
	WHERE Crs_ID = @Crs_Id
END

-- Department Table --

-- SP SELECT --
GO
CREATE PROCEDURE SelectDepartment
AS
BEGIN
    SELECT * FROM Department
END

-- SP INSERT --
GO
CREATE PROCEDURE InsertDepartment
    @Dept_No INT,
	@Dept_Name VARCHAR(20),
	@Dept_Location VARCHAR(20),
    @Mngr_Id INT
AS
BEGIN
    INSERT INTO Department
	VALUES(@Dept_No, @Dept_Name, @Dept_Location, @Mngr_Id)
END

-- SP UPDATE --
GO
CREATE PROCEDURE UpdateDepartment
    @Dept_No INT,
    @New_Mngr_Id INT
AS
BEGIN
    UPDATE Department
	SET Mgr_Id = @New_Mngr_Id
	WHERE Dept_id = @Dept_No
END

-- SP DELETE --
GO
CREATE PROCEDURE DeleteDepartment
    @Dept_No INT
AS
BEGIN
    DELETE FROM Department
	WHERE Dept_id = @Dept_No
END

-- Instructor Table --

-- SP SELECT --
GO
CREATE PROCEDURE SelectInstructor
AS
BEGIN
    SELECT * FROM Instructor
END

-- SP INSERT --
GO
CREATE PROCEDURE InsertInstructor
    @Ins_ID INT,
	@Ins_Name VARCHAR(30),
	@Ins_Email VARCHAR(50),
	@Ins_Phone INT,
	@Ins_City VARCHAR(30),
	@Ins_Gender VARCHAR(20),
	@Dept_No INT
AS
BEGIN
    INSERT INTO Instructor
	VALUES(@Ins_ID, @Ins_Name,@Ins_Email,@Ins_Phone,@Ins_City, @Ins_Gender,@Dept_No)
END

-- SP UPDATE --
GO
CREATE PROCEDURE UpdateInstructor
    @Ins_ID INT,
    @New_Ins_Dept_NO INT
AS
BEGIN
    UPDATE Instructor
	SET Dept_id = @New_Ins_Dept_NO
	WHERE Ins_id = @Ins_ID
END

-- SP DELETE --
GO
CREATE PROCEDURE DeleteInstructor
    @Ins_ID INT
AS
BEGIN
    DELETE FROM Instructor
	WHERE Ins_id = @Ins_ID
END

-- Student Table --

-- SP SELECT --
GO
CREATE PROCEDURE SelectStudent
AS
BEGIN
    SELECT * FROM Student
END

-- SP INSERT --
GO
CREATE PROCEDURE InsertStudent
    @Std_ID INT,
    @Std_Name VARCHAR(20),
	@Std_Email VARCHAR(50),
	@Std_Age INT,
	@Std_Gender VARCHAR(20),
	@Std_City VARCHAR(20),
	@Std_Phone INT,
	@Std_Grad_year INT ,
	@Std_Faculty NVARCHAR(255)
AS
BEGIN
    INSERT INTO Student
	VALUES(@Std_ID, @Std_Name,@Std_Email,@Std_Age,@Std_Gender,@Std_City,@Std_Phone,@Std_Grad_year,@Std_Faculty)
END

-- SP UPDATE --
GO
CREATE PROCEDURE UpdateStudent
    @Std_ID INT,
	@New_Std_City VARCHAR(20)
AS
BEGIN
    UPDATE Student
	SET Std_City = @New_Std_City
	WHERE Std_id = @Std_ID
END

-- SP DELETE --
GO
CREATE PROCEDURE DeleteStudent
    @Std_ID INT
AS
BEGIN
    DELETE FROM Student
	WHERE Std_id = @Std_ID
END


-- Question Table --

-- SP SELECT --
GO
CREATE PROCEDURE SelectQuest
AS
BEGIN
    SELECT * FROM Question
END

-- SP INSERT --
GO
CREATE PROCEDURE InsertQuest
	@Quest_id INT,
    @Quest_txt VARCHAR(255),
    @Quest_type VARCHAR(50),
    @Quest_mark INT,
    @Model_ans_id INT,
    @Model_ans_txt VARCHAR(255)
AS
BEGIN
    INSERT INTO Question(Quest_id, Quest_txt, Quest_type, Quest_mark, Model_ans_id, Model_ans_txt)
    VALUES (@Quest_id, @Quest_txt, @Quest_type, @Quest_mark, @Model_ans_id, @Model_ans_txt)
END

-- SP UPDATE --
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
    SET Quest_txt = @Quest_txt,
        Quest_type = @Quest_type,
        Quest_mark = @Quest_mark,
        Model_ans_id = @Model_ans_id,
        Model_ans_txt = @Model_ans_txt
    WHERE Quest_id = @Quest_id
END

-- SP DELETE --
Go
CREATE PROCEDURE DeleteQuest
    @Quest_id INT
AS
BEGIN
    DELETE FROM Question
    WHERE Quest_id = @Quest_id
END


-- Exam Table --

-- SP SELECT --
Go
CREATE PROCEDURE SelectExam
AS
BEGIN
    SELECT * FROM Exam
END

-- SP INSERT --
Go
CREATE PROCEDURE InsertExam
	@Exam_Id INT,
    @No_of_qs INT,
    @Exam_duration INT,
    @Exam_grade INT,
    @Exam_date DATE,
    @Crs_id INT
AS
BEGIN
    INSERT INTO Exam (Exam_id, No_of_qs, Exam_duration, Exam_grade, Exam_date, Crs_id)
    VALUES (@Exam_Id, @No_of_qs, @Exam_duration, @Exam_grade, @Exam_date, @Crs_id)
END

-- SP UPDATE --
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
    SET No_of_qs = @No_of_qs,
        Exam_duration = @Exam_duration,
        Exam_grade = @Exam_grade,
        Exam_date = @Exam_date,
        Crs_id = @Crs_id
    WHERE Exam_id = @Exam_id
END

-- SP DELETE --
GO
CREATE PROCEDURE DeleteExam
    @Exam_id INT
AS
BEGIN
    DELETE FROM Exam
    WHERE Exam_id = @Exam_id
END


-- Choice Table --

-- SP SELECT --
GO
CREATE PROCEDURE SelectChoice
AS
BEGIN
    SELECT * FROM Choice
END

-- SP INSERT --
GO
CREATE PROCEDURE InsertChoice
	@Choice_Id INT,
    @Choice_txt VARCHAR(255),
    @Is_correct BIT,
    @Quest_id INT
AS
BEGIN
    INSERT INTO Choice (Choice_id, Choice_txt, Is_correct, Quest_id)
    VALUES (@Choice_Id, @Choice_txt, @Is_correct, @Quest_id)
END

-- SP UPDATE --
GO
CREATE PROCEDURE UpdateChoice
    @Choice_id INT,
    @Choice_txt VARCHAR(255),
    @Is_correct BIT,
    @Quest_id INT
AS
BEGIN
    UPDATE Choice
    SET Choice_txt = @Choice_txt,
        Is_correct = @Is_correct,
        Quest_id = @Quest_id
    WHERE Choice_id = @Choice_id
END

-- SP DELETE --
Go
CREATE PROCEDURE DeleteChoice
    @Choice_id INT
AS
BEGIN
    DELETE FROM Choice
    WHERE Choice_id = @Choice_id
END


-- Exam_Question Table--

-- SP SELECT --
GO
CREATE PROCEDURE SelectExamQuestion
AS
BEGIN
    SELECT * FROM Exam_Question
END

-- SP INSERT --
GO
CREATE PROCEDURE InsertExamQuestion
    @Exam_id INT,
    @Question_id INT
AS
BEGIN
    INSERT INTO Exam_Question (Exam_id, Quest_id)
    VALUES (@Exam_id, @Question_id)
END

-- SP UPDATE --
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

-- SP DELETE --
GO
CREATE PROCEDURE DeleteExamQuestion
    @Exam_id INT,
    @Question_id INT
AS
BEGIN
    DELETE FROM Exam_Question
    WHERE Exam_id = @Exam_id AND Quest_id = @Question_id
END


-- Std_course Table --

-- SP SELECT --
GO
CREATE PROCEDURE SelectStdCourse
AS
BEGIN
    SELECT * FROM Std_course
END

-- SP INSERT --
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

-- SP UPDATE --
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

-- SP DELETE --
GO
CREATE PROCEDURE DeleteStdCourse
    @Std_id INT,
    @Crs_id INT
AS
BEGIN
    DELETE FROM Std_course
    WHERE Std_id = @Std_id AND Crs_id = @Crs_id
END


-- Std_Answer Table --

-- SP SELECT --
GO
CREATE PROCEDURE Select_StdAns
AS
BEGIN 
	SELECT * FROM Std_Answer
END

-- SP INSERT --
GO 
CREATE PROCEDURE Insert_StdAns
    @Std_id INT,
	@Exam_id INT,
	@Quest_id INT,
	@Std_ans_txt VARCHAR(255),
	@Std_qs_grade INT
AS
BEGIN 
    INSERT INTO Std_Answer (Std_id , Exam_id, Quest_id, Std_ans_txt, Std_qs_grade)
	VALUES (@Std_id , @Exam_id, @Quest_id, @Std_ans_txt,@Std_qs_grade)
END

-- SP UPDATE --
GO
CREATE PROCEDURE Update_StdAns
    @Std_id INT,
	@Exam_id INT,
	@Quest_id INT,
	@Std_ans_txt VARCHAR(255),
	@Std_qs_grade INT
AS
BEGIN 
    UPDATE Std_Answer
	SET Std_ans_txt = @Std_ans_txt ,
		Std_qs_grade = @Std_qs_grade
	WHERE Std_id=@Std_id 
	AND Exam_id =@Exam_id
	AND Quest_id =@Quest_id
END 

--SP DELETE --
GO
CREATE PROC Delete_StdAns
    @Std_id INT,
    @Exam_id INT,
    @Quest_id INT
AS
BEGIN
    DELETE FROM Std_Answer
    WHERE Std_id = @Std_id
    AND Exam_id = @Exam_id
    AND Quest_id = @Quest_id
END


-- Std_Exam_Grade Table --

-- SP SELECT --
GO
CREATE PROCEDURE SelectStdExamGrade
AS
BEGIN
    SELECT * FROM Std_Exam_Grade
END

-- SP INSERT --
GO
CREATE PROCEDURE InsertStdExamGrade
    @Std_id INT,
    @Exam_id INT,
    @Grade INT
AS
BEGIN
    INSERT INTO Std_Exam_Grade (Std_id, Exam_id, Grade)
    VALUES (@Std_id, @Exam_id, @Grade)
END

--SP UPDATE 
GO
CREATE PROCEDURE UpdateStdExamGrade
    @Std_id INT,
    @Exam_id INT,
    @Grade INT
AS
BEGIN
    UPDATE Std_Exam_Grade
    SET Grade = @Grade
    WHERE Std_id = @Std_id
    AND Exam_id = @Exam_id
END

-- SP DELETE --
GO
 CREATE PROC DeleteStdExamGrade
    @Std_id INT,
    @Exam_id INT
AS
BEGIN
    DELETE FROM Std_Exam_Grade
    WHERE Std_id = @Std_id
    AND Exam_id = @Exam_id
END


-- Crs_Evaluation Table --

-- SP SELECT --
GO
CREATE PROCEDURE SelectCrsEvaluation
AS
BEGIN
    SELECT * FROM Crs_Evaluation
END

-- SP INSERT --
GO
CREATE PROCEDURE InsertCrsEvaluation
    @Std_id INT,
    @Crs_id INT,
    @Crs_Material_helpful INT,
    @Crs_Content INT,
    @Crs_well_organised INT,
    @Inst_ClassTime INT,
    @Inst_Response_Qus INT,
    @Inst_GiveClearEx INT
AS
BEGIN
    INSERT INTO Crs_Evaluation (Std_id, Crs_id, Crs_Material_helpful, Crs_Content, [Crs_well-organised], Inst_ClassTime, Inst_Responce_Qus, Inst_GiveClearEx)
    VALUES (@Std_id, @Crs_id, @Crs_Material_helpful, @Crs_Content, @Crs_well_organised, @Inst_ClassTime, @Inst_Response_Qus, @Inst_GiveClearEx)
END

-- SP UPDATE --
GO
CREATE PROCEDURE UpdatecrsEvaluation
    @Std_id INT,
    @Crs_id INT,
    @Crs_Material_helpful INT,
    @Crs_Content INT,
    @Crs_well_organised INT,
    @Inst_ClassTime INT,
    @Inst_Response_Qus INT,
    @Inst_GiveClearEx INT
AS
BEGIN
	UPDATE Crs_Evaluation 
	SET Crs_Material_helpful = @Crs_Material_helpful,
		Crs_Content = @Crs_Content,
		[Crs_well-organised] = @Crs_well_organised,
		Inst_ClassTime = @Inst_ClassTime,
		Inst_Responce_Qus = @Inst_Response_Qus,
		Inst_GiveClearEx = @Inst_GiveClearEx
	WHERE Std_id = @Std_id 
	AND Crs_id = @Crs_id
END

-- SP DELETE --
GO
CREATE PROCEDURE DeleteCrsEvaluation
    @Std_id INT,
    @Crs_id INT
AS
BEGIN
    DELETE FROM Crs_Evaluation
    WHERE Std_id = @Std_id
    AND Crs_id = @Crs_id
END


-- KPI Table --

-- SP SELECT --
GO
CREATE PROCEDURE SelectKPI
AS
BEGIN
    SELECT * FROM KPI
END

-- SP INSERT --
GO
CREATE PROCEDURE InsertKPI
    @KPI_id INT,
    @Std_id INT,
    @Freelance_status INT,
    @Freelance_Salary INT,
    @cert_status INT
AS
BEGIN
    INSERT INTO KPI (KPI_id, Std_id, Freelance_status, Freelance_salary , Cert_status)
    VALUES (@KPI_id, @Std_id, @Freelance_status, @Freelance_Salary, @cert_status)
END

-- SP UPDATE --
GO
CREATE PROCEDURE UpdateKPI
    @KPI_id INT,
    @Std_id INT,
    @Freelance_status INT,
    @Freelance_Salary INT,
    @cert_status INT
AS
BEGIN 
   UPDATE KPI 
    SET Freelance_status = @Freelance_status,
        Freelance_salary = @Freelance_Salary,
        Cert_status = @cert_status
    WHERE KPI_id = @KPI_id
    AND Std_id = @Std_id
END

-- SP DELETE --
GO
CREATE PROCEDURE DeleteKPI
    @KPI_id INT,
    @Std_id INT
AS
BEGIN
    DELETE FROM KPI
	WHERE KPI_ID = @KPI_ID
	AND Std_id = @Std_id
END


-- Job_Offer Table --

-- SP SELECT --
GO
CREATE PROCEDURE SelectJobOffer
AS
BEGIN
    SELECT * FROM Job_offer
END

-- SP INSERT -- 
GO
CREATE PROCEDURE InsertJobOffer
    @Job_offer_id INT,
    @Std_id INT,
    @Hiring_status INT,
    @Job_title VARCHAR(100),
    @Job_salary INT 
AS
BEGIN
    INSERT INTO Job_offer (Job_offer_id, Std_id, Hiring_status, Job_title, Job_salary)
    VALUES (@Job_offer_id, @Std_id, @Hiring_status, @Job_title, @Job_salary)
END

-- SP UPDATE --
GO
CREATE PROCEDURE UpdateJobOffer
    @Job_offer_id INT,
    @Std_id INT,
    @Hiring_status INT,
    @Job_title VARCHAR(100),
    @Job_salary INT
AS 
BEGIN 
    UPDATE Job_offer
	SET Hiring_status = @Hiring_status,
        Job_title = @Job_title,
        Job_salary = @Job_salary
    WHERE Job_offer_id = @Job_offer_id
    AND Std_id = @Std_id
END

-- SP DELETE --
GO
CREATE PROCEDURE DeleteJobOffer
    @Job_offer_id INT,
    @Std_id INT
AS
BEGIN
    DELETE FROM Job_offer
    WHERE Job_offer_id = @Job_offer_id
    AND Std_id = @Std_id
END


-- Test SPs --
/*

-- Test Topic --

GO
EXEC SelectTopic

GO
EXEC InsertTopic 6, 'Sample Topic'

GO
EXEC UpdateTopic 6, 'Updated Topic Name'

GO
EXEC DeleteTopic 6

-- Test Course --

GO
EXEC SelectCourse

GO
EXEC InsertCousre
	16, 'Sample Course', 10, 1, 1;

GO
EXEC UpdateCourse 16, 2

GO
EXEC DeleteCourse 16

-- Test Dpartment --

GO
EXEC SelectDepartment

GO
EXEC InsertDepartment 
	8, 'Sample Department', 'Location', 1

GO
EXEC UpdateDepartment 8, 2

GO
EXEC DeleteDepartment 8

-- Test Instructor --

GO
EXEC SelectInstructor

GO
EXEC InsertInstructor
	16, 'Sample Instructor', 'email@example.com', 1234567890, 'City', 'Male', 1

GO
EXEC UpdateInstructor 16, 2

GO
EXEC DeleteInstructor 16

-- Tset Student --

GO
EXEC SelectStudent

GO
EXEC InsertStudent
	101, 'Sample Student', 'email@example.com', 19, 'Male', 'City', 1234567890, 2023, 'Faculty Name'

GO
EXEC UpdateStudent 101, 'New City'

GO
EXEC DeleteStudent 101

-- Test Question --

GO
EXEC SelectQuest

GO
EXEC InsertQuest
	301 ,'Sample question text', 'Multiple Choice', 10, 1, 'Sample model answer text'

GO
EXEC UpdateQuest
	301, 'Updated question text', 'True/False', 5, 2, 'Updated model answer text'

GO
EXEC DeleteQuest 301

-- Test Exam --

GO
EXEC SelectExam

GO
EXEC InsertExam
	1,20, 120,100, '2023-10-12', 1

GO
EXEC UpdateExam
	1, 25, 150,100, '2023-10-15', 2

GO
EXEC DeleteExam 1

-- Test Choice --

GO
EXEC SelectChoice

GO
EXEC InsertChoice
	1051,'Choice 1', 1, 1

GO
EXEC UpdateChoice
	1051, 'Updated Choice 1', 0, 1

GO
EXEC DeleteChoice 1051

-- Test Exam_Question --

GO
EXEC SelectExamQuestion

GO
EXEC InsertExamQuestion 1, 1

GO
EXEC UpdateExamQuestion 1, 2

GO
EXEC DeleteExamQuestion 1, 1

-- Test Std_course --

GO
EXEC SelectStdCourse

GO
EXEC InsertStdCourse
	1, 1, 100

GO
EXEC UpdateStdCourse 
	1, 1, 150

GO
EXEC DeleteStdCourse 1, 1

-- Test Std_answer --
 
GO
EXEC Select_StdAns

GO
EXEC Insert_StdAns
	101, 765432, 121, 'FALSE', 0

GO
EXEC Update_StdAns
	101, 765432, 121, 'TRUE', 5

GO
EXEC Delete_StdAns
	101, 765432, 121

-- Test Std_Exam_Grade --

GO
EXEC SelectStdExamGrade

GO
EXEC InsertStdExamGrade
	101, 765432, 80

GO
EXEC UpdateStdExamGrade
	101, 765432, 77

GO
EXEC DeleteStdExamGrade
	101, 765432

-- Test Crs_Evaluation --

GO
EXEC SelectCrsEvaluation

GO
EXEC InsertCrsEvaluation
	101, 15, 5, 4, 3, 4, 5, 4

GO
EXEC UpdateCrsEvaluation
	101, 15, 4, 3, 5, 5, 4, 5

GO
EXEC DeleteCrsEvaluation 101, 15

-- Test KPI --

GO
EXEC SelectKPI

GO
EXEC InsertKPI 
	101, 101, 1, 1000, 1

GO
EXEC UpdateKPI
	101, 101, 0 , 0, 0

GO
EXEC DeleteKPI 101, 101

-- Test Job_Offer --

GO
EXEC SelectJobOffer

GO
EXEC InsertJobOffer 
	101, 101, 1, 'Software Engineer', 5000

GO
EXEC UpdateJobOffer 
	101, 101, 0, 0, 0

GO
EXEC DeleteJobOffer 101, 101

*/
