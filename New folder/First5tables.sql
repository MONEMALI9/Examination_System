----- SPs -----

----- Topic table -----

----- SP SELECT
GO
CREATE PROCEDURE SelectTopic
AS
BEGIN
    SELECT *
	FROM Topic
END

----- SP INSERT
GO
CREATE PROCEDURE InsertTopic
    @Topic_Id INT,
	@topic_name VARCHAR(20)
AS
BEGIN
    INSERT INTO Topic
	VALUES(@Topic_Id, @topic_name)
END

----- SP UPDATE
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

----- SP DELETE
GO
CREATE PROCEDURE DeleteTopic
    @topic_id INT
AS
BEGIN
    DELETE FROM Topic
	WHERE Topic_Id = @topic_id
END

----- Course table -----

----- SP SELECT
GO
CREATE PROCEDURE SelectCourse
AS
BEGIN
    SELECT *
	FROM Course
END

----- SP INSERT
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

----- SP UPDATE
GO
CREATE PROCEDURE UpdateCourse
    @Crs_Id INT,
    @New_Topic_Id INT
AS
BEGIN
    UPDATE Course
	SET [Topic_id ] = @New_Topic_Id
	WHERE Crs_Id = @Crs_Id
END

----- SP DELETE
GO
CREATE PROCEDURE DeleteCourse
    @Crs_Id INT
AS
BEGIN
    DELETE FROM Course
	WHERE Crs_ID = @Crs_Id
END

----- Department table -----

----- SP SELECT
GO
CREATE PROCEDURE SelectDepartment
AS
BEGIN
    SELECT *
	FROM Department
END

----- SP INSERT
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

----- SP UPDATE
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

----- SP DELETE
GO
CREATE PROCEDURE DeleteDepartment
    @Dept_No INT
AS
BEGIN
    DELETE FROM Department
	WHERE Dept_id = @Dept_No
END

----- Instructor table -----

----- SP SELECT
GO
CREATE PROCEDURE SelectInstructor
AS
BEGIN
    SELECT *
	FROM Instructor
END

----- SP INSERT
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

----- SP UPDATE
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

----- SP DELETE
GO
CREATE PROCEDURE DeleteInstructor
    @Ins_ID INT
AS
BEGIN
    DELETE FROM Instructor
	WHERE Ins_id = @Ins_ID
END

----- Student table -----

----- SP SELECT
GO
CREATE PROCEDURE SelectStudent
AS
BEGIN
    SELECT *
	FROM Student
END

----- SP INSERT
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


----- SP UPDATE
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

----- SP DELETE
GO
CREATE PROCEDURE DeleteStudent
    @Std_ID INT
AS
BEGIN
    DELETE FROM Student
	WHERE Std_id = @Std_ID
END