--sp--Std_Answer table
 /* SELECT */
CREATE PROC Select_StdAns
AS
BEGIN 
SELECT * FROM Std_Answer ;

END

-- SP INSERT
GO 
CREATE PROC Insert_StdAns
    @Std_id int ,
	@Exam_id int ,
	@Quest_id int ,
	@Std_ans_txt VARCHAR(255),
	@Std_qs_grade INT
AS
BEGIN 
    INSERT INTO Std_Answer (Std_id , Exam_id, Quest_id, Std_ans_txt, Std_qs_grade)
	VALUES (@Std_id , @Exam_id, @Quest_id, @Std_ans_txt,@Std_qs_grade);
END

-- SP UPDATE
GO
CREATE PROC Update_StdAns
           @Std_id int ,
	       @Exam_id int ,
	       @Quest_id int ,
	       @Std_ans_txt VARCHAR(255),
	       @Std_qs_grade INT
AS
BEGIN 
    UPDATE Std_Answer
	SET Std_ans_txt = @Std_ans_txt ,
	    Std_qs_grade = @Std_qs_grade
	WHERE Std_id=@Std_id 
	AND Exam_id =@Exam_id
	AND Quest_id =@Quest_id ;
END 

--SP DELETE
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
        AND Quest_id = @Quest_id;
END


--sp--Std_Exam_Grade table

--SP SELECT  

CREATE PROC SelectStdExamGrade
AS
BEGIN
    SELECT * FROM Std_Exam_Grade;
END

--SP INSERT 

GO
CREATE PROC InsertStdExamGrade
    @Std_id INT,
    @Exam_id INT,
    @Grade INT
AS
BEGIN
    INSERT INTO Std_Exam_Grade (Std_id, Exam_id, Grade)
    VALUES (@Std_id, @Exam_id, @Grade);
END

--SP UPDATE 

GO
CREATE PROC UpdateStdExamGrade
    @Std_id INT,
    @Exam_id INT,
    @Grade INT
AS
BEGIN
    UPDATE Std_Exam_Grade
    SET Grade = @Grade
    WHERE Std_id = @Std_id
        AND Exam_id = @Exam_id;
END

--SP DELETE

GO
 CREATE PROC DeleteStdExamGrade
    @Std_id INT,
    @Exam_id INT
AS
BEGIN
    DELETE FROM Std_Exam_Grade
    WHERE Std_id = @Std_id
        AND Exam_id = @Exam_id;
END



--sp--Crs_Evaluation table

--SP SELECT 

CREATE PROC SelectCrsEvaluation
AS
BEGIN
    SELECT * FROM Crs_Evaluation;
END

--SP INSERT
GO

CREATE PROC InsertCrsEvaluation
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
    INSERT INTO Crs_Evaluation (Std_id, Crs_id, Crs_Material_helpful, Crs_Content, Crs_well_organised, Inst_ClassTime, Inst_Response_Qus, Inst_GiveClearEx)
    VALUES (@Std_id, @Crs_id, @Crs_Material_helpful, @Crs_Content, @Crs_well_organised, @Inst_ClassTime, @Inst_Response_Qus, @Inst_GiveClearEx);
END


--SP UPDATE

GO
CREATE PROC UpdatecrsEvaluation
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
		Crs_well_organised = @Crs_well_organised,
		Inst_ClassTime = @Inst_ClassTime,
        Inst_Response_Qus = @Inst_Response_Qus,
        Inst_GiveClearEx = @Inst_GiveClearEx
	WHERE Std_id = @Std_id 
	AND Crs_id = @Crs_id
END


--SP DELETE
GO

CREATE PROC DeleteCrsEvaluation
    @Std_id INT,
    @Crs_id INT
AS
BEGIN
    DELETE FROM Crs_Evaluation
    WHERE Std_id = @Std_id
        AND Crs_id = @Crs_id;
END


--SP--KPI TABLE

--SP SELECT
CREATE PROC SelectKPI

AS
BEGIN
    SELECT * FROM KPI;
END


--SP INSERT

CREATE PROC InsertKPI
    @KPI_id INT,
    @Std_id INT,
    @Freelance_status VARCHAR(50),
    @Freelance_Salary INT,
    @cert_status VARCHAR(50)
AS
BEGIN
    INSERT INTO KPI (KPI_id, Std_id, Freelance_status, Freelance_salary , Cert_status)
    VALUES (@KPI_id, @Std_id, @Freelance_status, @Freelance_Salary, @cert_status);
END

--SP UPDATE 

CREATE PROC UpdateKPI
    @KPI_id INT,
    @Std_id INT,
    @Freelance_status VARCHAR(50),
    @Freelance_Salary INT,
    @cert_status VARCHAR(50)
AS
BEGIN 
   UPDATE KPI 
    SET Freelance_status = @Freelance_status,
        Freelance_salary = @Freelance_Salary,
        Cert_status  = @cert_status
    WHERE KPI_id = @KPI_id
        AND Std_id = @Std_id;
END

--SP DELETE 

CREATE PROC DeleteKPI

    @KPI_id INT,
    @Std_id INT

AS
BEGIN
    DELETE FROM KPI
	WHERE KPI_ID = @KPI_ID
	AND Std_id = @Std_id;

END


--SP--Job_Offer table


--SP SELECT

CREATE PROC SelectJobOffer
AS
BEGIN
    SELECT * FROM Job_offer;
END


--SP INSERT 

CREATE PROC InsertJobOffer
    @Job_offer_id INT,
    @Std_id INT,
    @Hiring_status VARCHAR(50),
    @Job_title VARCHAR(100),
    @Job_salary INT 
AS
BEGIN
    INSERT INTO Job_offer (Job_offer_id, Std_id, Hiring_status, Job_title, Job_salary)
    VALUES (@Job_offer_id, @Std_id, @Hiring_status, @Job_title, @Job_salary);
END


--SP UPDATE

CREATE PROC UpdateJobOffer
    @Job_offer_id INT,
    @Std_id INT,
    @Hiring_status VARCHAR(50),
    @Job_title VARCHAR(100),
    @Job_salary INT

AS 
BEGIN 
    UPDATE Job_offer
	  SET Hiring_status = @Hiring_status,
        Job_title = @Job_title,
        Job_salary = @Job_salary
      WHERE Job_offer_id = @Job_offer_id
        AND Std_id = @Std_id;
END



--SP DELETE 
CREATE PROC DeleteJobOffer
    @Job_offer_id INT,
    @Std_id INT
AS
BEGIN
    DELETE FROM Job_offer
    WHERE Job_offer_id = @Job_offer_id
        AND Std_id = @Std_id;
END


--#  the test code for Std_answer table

--SELECT 
-- Execute the stored procedure
--EXEC Select_StdAns;


--INSERT

-- Declare variables for input values
 --   DECLARE @Std_id int = 101; 
	--DECLARE @Exam_id int =765432 ; 
	--DECLARE @Quest_id int =121 ,
	--DECLARE @Std_ans_txt VARCHAR(255) = 'FALSE',
 --   DECLARE @Std_qs_grade INT =0

-- Execute the stored procedure
--EXEC Insert_StdAns @Std_id,@Exam-id , @Quest_id, @Std_ans_txt , Std_qs_grade;



--UPDATE

-- Declare variables for input values
 --   DECLARE @Std_id int = 101; 
	--DECLARE @Exam_id int =765432 ; 
	--DECLARE @Quest_id int =121 ,
	--DECLARE @Std_ans_txt VARCHAR(255) = 'TRUE',
 --   DECLARE @Std_qs_grade INT =5
 --Execute the stored procedure
--EXEC Update_StdAns @Std_id,@Exam-id , @Quest_id, @Std_ans_txt , Std_qs_grade;


--DELETE 
-- Declare variables for input values
--DECLARE @Std_id INT = 101;
--DECLARE @Exam_id INT = 765432;
--DECLARE @Quest_id INT = 121;

-- Execute the stored procedure
--EXEC Delete_StdAns @Answer_id, @Std_id, @Question_id;


--# test code for Std_Exam_Grade table

--SELECT
-- Execute the stored procedure
--EXEC SelectStdExamGrade;


--INSERT 

-- Declare variables for input values
--DECLARE @Std_id INT = 101;
--DECLARE @Exam_id INT = 765432;
--DECLARE @Grade INT = 80;

-- Execute the stored procedure
--EXEC InsertStdExamGrade @Std_id, @Exam_id, @Grade;


--UPDATE
-- Declare variables for input values
--DECLARE @Std_id INT = 101;
--DECLARE @Exam_id INT = 765432;
--DECLARE @Grade INT = 77;

-- Execute the stored procedure
--EXEC UpdateStdExamGrade @Std_id, @Exam_id, @Grade;


--DELETE

-- Declare variables for input values
--DECLARE @Std_id INT = 123;
--DECLARE @Exam_id INT = 765432;

-- Execute the stored procedure
--EXEC DeleteStdExamGrade @Std_id, @Exam_id;



--# test code for Crs_Evaluation table


--SELECT 
-- Execute the stored procedure
--EXEC SelectCrsEvaluation;

--INSERT

-- Declare variables for input values
--DECLARE @Std_id INT = 101;
--DECLARE @Crs_id INT = 15;
--DECLARE @Crs_Material_helpful INT = 5;
--DECLARE @Crs_Content INT = 4;
--DECLARE @Crs_well_organised INT = 3;
--DECLARE @Inst_ClassTime INT = 4;
--DECLARE @Inst_Response_Qus INT = 5;
--DECLARE @Inst_GiveClearEx INT = 4;

-- Execute the stored procedure
--EXEC InsertCrsEvaluation @Std_id, @Crs_id, @Crs_Material_helpful, @Crs_Content, @Crs_well_organised, @Inst_ClassTime, @Inst_Response_Qus, @Inst_GiveClearEx;


-- UPDATE 

-- Declare variables for input values
--DECLARE @Std_id INT = 101;
--DECLARE @Crs_id INT = 15;
--DECLARE @Crs_Material_helpful INT = 4;
--DECLARE @Crs_Content INT = 3;
--DECLARE @Crs_well_organised INT = 5;
--DECLARE @Inst_ClassTime INT = 5;
--DECLARE @Inst_Response_Qus INT = 4;
--DECLARE @Inst_GiveClearEx INT = 5;

-- Execute the stored procedure
--EXEC UpdateCrsEvaluation @Std_id, @Crs_id, @Crs_Material_helpful, @Crs_Content, @Crs_well_organised, @Inst_ClassTime, @Inst_Response_Qus, @Inst_GiveClearEx;



--DELETE

-- Declare variables for input values
--DECLARE @Std_id INT = 101;
--DECLARE @Crs_id INT = 15;

-- Execute the stored procedure
--EXEC DeleteCrsEvaluation @Std_id, @Crs_id;



--# TEST CODE FOR KPI TABLE

--SELECT
-- Execute the stored procedure
--EXEC SelectKPI;

--INSERT
-- Declare variables for input values
--DECLARE @KPI_id INT = 101;
--DECLARE @Std_id INT = 101;
--DECLARE @Freelance_status VARCHAR(50) = 'Available';
--DECLARE @Freelance_Salary INT = 1000;
--DECLARE @cert_status VARCHAR(50) = 'Certified';

-- Execute the stored procedure
--EXEC InsertKPI @KPI_id, @Std_id, @Freelance_status, @Freelance_Salary, @cert_status;


--UPDATE

-- Declare variables for input values
--DECLARE @KPI_id INT = 101;
--DECLARE @Std_id INT = 101;
--DECLARE @Freelance_status VARCHAR(50) = 'Not Available';
--DECLARE @Freelance_Salary INT = 0;
--DECLARE @cert_status VARCHAR(50) = 'Not Certified';

-- Execute the stored procedure
--EXEC UpdateKPI @KPI_id, @Std_id, @Freelance_status, @Freelance_Salary, @cert_status;



--DELETE
-- Declare variables for input values
--DECLARE @KPI_id INT = 101;
--DECLARE @Std_id INT = 101;

-- Execute the stored procedure
--EXEC DeleteKPI @KPI_id, @Std_id;





--# TEST CODE FOR Job_Offer Table
--SELECT
-- Execute the stored procedure
--EXEC SelectJobOffer;

--INSERT
-- Declare variables for input values
--DECLARE @Job_offer_id INT = 101;
--DECLARE @Std_id INT = 101;
--DECLARE @Hiring_status VARCHAR(50) = 'Hired';
--DECLARE @Job_title VARCHAR(100) = 'Software Engineer';
--DECLARE @Job_salary INT = 5000;

--UPDATE
---- Execute the stored procedure
--EXEC InsertJobOffer @Job_offer_id, @Std_id, @Hiring_status, @Job_title, @Job_salary;

-- Declare variables for input values
--DECLARE @Job_offer_id INT = 101;
--DECLARE @Std_id INT = 101;
--DECLARE @Hiring_status VARCHAR(50) = 'Rejected';
--DECLARE @Job_title VARCHAR(100) = 'Data Analyst';
--DECLARE @Job_salary INT = 4000;

---- Execute the stored procedure
--EXEC UpdateJobOffer @Job_offer_id, @Std_id, @Hiring_status, @Job_title, @Job_salary;

--DELETE
-- Declare variables for input values
--DECLARE @Job_offer_id INT = 101;
--DECLARE @Std_id INT = 101;

---- Execute the stored procedure
--EXEC DeleteJobOffer @Job_offer_id, @Std_id;