-- Exam Generation --

CREATE PROCEDURE GenerateExam
    @Exam_Id INT,
    @Crs_Id INT,
    @Ex_Duration INT,
    @No_Of_TF INT,
    @No_Of_MCQ INT,
	@Ex_Grade INT,
	@No_of_qs INT
AS
BEGIN
    IF EXISTS(SELECT Crs_id FROM Course WHERE Crs_id = @Crs_Id)
    BEGIN
        IF EXISTS (SELECT Exam_id FROM Exam WHERE Exam_id = @Exam_Id)
            SELECT 'The exam id already exists' AS 'ErrMessage'
        ELSE
        BEGIN
            IF @No_Of_TF + @No_Of_MCQ = 20
            BEGIN
                IF @No_Of_TF = 5
                BEGIN

                    -- Generate a random exam with 10 questions --
                    INSERT INTO Exam (Exam_id, No_of_qs, Exam_duration, Exam_date, Exam_grade, Crs_id)
                    VALUES (@Exam_Id, @No_of_qs, @Ex_Duration,GETDATE(), @Ex_Grade, @Crs_Id);

                    -- Select True/False questions related to the same course--
                    INSERT INTO Exam_Question (Exam_id, Quest_id)
                    SELECT TOP (@No_Of_TF) @Exam_Id, q.Quest_id
                    FROM Question q
                    JOIN Exam_Question eq ON q.Quest_id = eq.Quest_id
                    JOIN Exam e ON eq.Exam_id = e.Exam_id
                    WHERE Crs_id = @Crs_Id
                    AND Quest_type = 't/f'
                    ORDER BY NEWID();

                    -- Select Multiple Choice questions related to the same course --
                    INSERT INTO Exam_Question (Exam_id, Quest_id)
                    SELECT TOP (@No_Of_MCQ) @Exam_Id, q.Quest_id
                    FROM Question q
                    JOIN Exam_Question eq ON q.Quest_id = eq.Quest_id
                    JOIN Exam e ON eq.Exam_id = e.Exam_id
                    WHERE Crs_id = @Crs_Id
                    AND Quest_type = 'mcq'
                    ORDER BY NEWID();
    
                    -- Select exam model --
                    SELECT Q.* 
                    FROM Exam_Question eq, Question Q, Exam E
                    WHERE eq.Exam_id = E.Exam_id AND eq.Quest_id = Q.Quest_id AND eq.Exam_id = @Exam_Id
                END
                ELSE
                    SELECT 'No of TF questions must be 5' AS 'ErrMessage'
            END
            ELSE
                SELECT 'No of questions must be 20' AS 'ErrMessage'
        END
    END
    ELSE
        SELECT 'The course does not exist' AS 'ErrMessage'
END

-- Test --
/*GO
 GenerateExam @Exam_Id = 345678, @Crs_Id = 13, @Ex_Duration = 45,
			@No_Of_TF = 5, @No_Of_MCQ = 15, @Ex_Grade= 100, @No_of_qs = 20*/
 


-- Exam Answers --

GO
CREATE PROCEDURE StudentAnswer
    @Exam_Id INT,
    @Std_Id INT,
    @Quest_Id INT,
    @Std_Ans_txt nvarchar(255) = 'No Answer'
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Student WHERE Std_id = @Std_Id)
	BEGIN
		SELECT 'The student does not exist' AS 'ErrMessage'
	END
		ELSE IF NOT EXISTS (SELECT * FROM Exam WHERE Exam_id = @Exam_Id)
		BEGIN
			SELECT 'The exam does not exist' AS 'ErrMessage'
		END
			ELSE IF NOT EXISTS (SELECT * FROM Question WHERE Quest_id = @Quest_Id)
			BEGIN
				SELECT 'The question does not exist' AS 'ErrMessage'
			END
				ELSE
				BEGIN 
					INSERT INTO Std_Answer(Std_id, Exam_id, Quest_id, Std_ans_txt)
					VALUES (@Std_Id, @Exam_Id, @Quest_Id, @Std_Ans_txt);
				END
END

-- Test --

/*GO
StudentAnswer @Exam_Id = 345678, @Std_Id = 1, @Quest_Id = 81, @Std_Ans_txt = 'A programming language'*/



-- Exam Correction --

GO
CREATE PROCEDURE ExamCorrect 
	@Std_Id INT, 
	@Exam_Id INT
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Exam WHERE Exam_id = @Exam_Id)
	BEGIN
		SELECT 'The exam does not exist' AS 'ErrMessage'
	END
		ELSE IF NOT EXISTS (SELECT * FROM Student WHERE Std_ID = @Std_Id)
	    BEGIN
            SELECT 'The student does not exist' AS 'ErrMessage'
        END
			ELSE
			BEGIN

				-- Calculate the total number of questions --
				DECLARE @total_questions int
				SELECT  @total_questions = count (Quest_id) FROM Std_Answer
				WHERE  Std_id = @Std_Id AND Exam_id = @Exam_Id

				-- Calculate the total number of correct answers --
				DECLARE @total_right_questions float
				SELECT  @total_right_questions = count(SE.Quest_id) 
				FROM Std_Answer SE JOIN Question Q ON SE.Quest_id = Q.Quest_id
				WHERE  Std_id = @Std_Id AND Exam_id = @Exam_Id AND SE.Std_ans_txt = Q.Model_ans_txt

				-- Calculate the grade --
				DECLARE @Grade float
				SELECT  @Grade =  (@total_right_questions* 5)

				-- Update Crs_grade based on the student's answers --
				UPDATE Std_course
				SET	   Crs_grade = @Grade
				WHERE  Std_id = @Std_Id and Crs_id = (Select Crs_id from Exam where Exam_id = @Exam_Id)

				-- Return the grade --
				SELECT 'student degree percentage ' + str(@Grade) + ' of ' + str(@total_questions * 5)

			END
END

-- Test --

/*Go
ExamCorrect @Std_Id = 1 , @Exam_Id = 345678*/
