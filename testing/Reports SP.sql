-- Report 1 --
-- Get Std info by Dept Id --

GO
CREATE PROCEDURE R1_GetStdInfo
	@Dept_Id INT
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Department WHERE Dept_id = @Dept_Id)
	BEGIN
        SELECT 'The department does not exist' AS 'ErrMessage'
    END
		ELSE
		BEGIN	
		    WITH StdDept AS 
			    (SELECT DISTINCT sct.Std_id, d.Dept_id
		         FROM Std_course sct JOIN Course c
				 ON sct.Crs_ID = c.Crs_ID
				 INNER JOIN Instructor ins
				 ON c.[Ins_id ] = ins.Ins_id
				 INNER JOIN Department d
				 ON ins.Dept_id = d.Dept_id)

			SELECT s.* 
			FROM Student s LEFT JOIN StdDept sd
			ON s.Std_ID = sd.Std_ID
			WHERE sd.Dept_id = @Dept_Id
		END		
END 

--Test --

/*Go
R1_GetStdInfo @Dept_Id = 10*/


-- Report 2 --
-- Get Std Grade by Std Id --
GO
CREATE PROCEDURE R2_GetStdGrade
	@Std_Id INT
AS
BEGIN
	SELECT sum(Crs_grade)
	FROM Std_course
	WHERE Std_id = @Std_Id
END

-- Test --

/*Go
R2_GetStdGrade @Std_Id = 1*/


-- Report 3 --
-- Get Ins crs and its students by Ins Id --

GO
CREATE PROCEDURE R3_GetInsCrs
	@Ins_Id INT
AS
Begin
		SELECT i.Crs_name,COUNT(Std_ID) as 'Student Numbers in the course'
		FROM Course i JOIN Course c ON c.Crs_Id = i.Crs_Id JOIN Std_course sc ON sc.Crs_id = c.Crs_id
		WHERE i.[Ins_id ] = @Ins_Id
		GROUP BY i.Crs_name
END

-- Test --

/*GO
R3_GetInsCrs @Ins_Id = 1*/


-- Report 4 --
-- Get Crs Topic by Crs Id --

GO
CREATE PROCEDURE R4_GetCrsTopic
	@Crs_Id INT
AS
BEGIN
	SELECT Crs_ID, Crs_Name, C.[Topic_id ], Topic_Name
    FROM Course C , Topic T
    Where C.[Topic_id ] = T.Topic_Id and Crs_ID=@Crs_Id
END

-- Test --

/*GO
R4_GetCrsTopic @Crs_Id = 13*/


-- Report 5 --
-- Get Exam questions and its choices by Exam Id --

GO
CREATE PROCEDURE R5_GetExamQuest
	@Exam_Id INT
AS
BEGIN
	SELECT q.Quest_txt , q.Quest_type, Choice_txt
    FROM Exam_Question eq , Question q , Choice c
    WHERE eq.Quest_ID = q.Quest_ID
	AND c.Quest_id = q.Quest_id
	AND eq.Exam_ID = @Exam_Id
END

-- Test --

/*GO
R5_GetExamQuest @Exam_Id = 345678*/


-- Report 6 --
-- Get Std quest and his Ans by Exam Id and Std Id --

GO
CREATE PROCEDURE R6_GetStdAns
	@Exam_Id INT,
	@Std_Id INT
AS
BEGIN
	SELECT Quest_txt , Std_ans_txt
    FROM Std_Answer st , Question q
    Where st.Quest_id = q.Quest_id
	AND st.Exam_id = @Exam_Id
	AND Std_id = @Std_Id
END

-- Test --

/*GO
R6_GetStdAns @Exam_Id = 345678 , @Std_Id = 1*/
