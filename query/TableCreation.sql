--6-Question [Quest_id (PK) - Quest_txt - Quest_type - Quest_mark - Model_ans_id - Model_ans_txt]
CREATE TABLE QUESTION (
	question_id INT PRIMARY KEY,
	question_txt VARCHAR(255),
	question_type VARCHAR(255),
	question_mark FLOAT,
	model_ans_id INT,
	model_ans_txt VARCHAR(255)
);

--8-Choice [Choice_id (PK) - Choice_txt - Is_correct - Quest_id (FK)]
CREATE TABLE CHOICE (
	Choice_id INT PRIMARY KEY,
	Choice_txt VARCHAR(255),
	Is_correct INT,
	question_id INT,  -- This is the foreign key column
    FOREIGN KEY (question_id) REFERENCES QUESTION (question_id)
);

--1-Student [St_id (PK) - Std_name - Std_email - Std_age - Std_gender - Std_city - Std_phone -  Std_grad_year - Std_faculty ] 
CREATE TABLE STUDENT (
	Std_id INT PRIMARY KEY,
	Std_name VARCHAR(255),
	Std_email VARCHAR(255),
	Std_age INT,
	Std_gender VARCHAR(255),
	Std_city VARCHAR(255),
	Std_phone INT,
	Std_grade_year VARCHAR(255),
	Std_faculty VARCHAR(255)
);

--2-Department [Dept_id (PK) - Dpet_name - Dept_location - Mgr_id (FK) ] 
CREATE TABLE DEPARTMENT (
	Dept_id INT PRIMARY KEY,
	Dept_name VARCHAR(255),
	Dept_location VARCHAR(255),
	Mgr_id INT
);

--3-Instructor [Ins_id (PK) - Ins_name - Ins_email - Ins_city - Ins_phone - Ins_gender - Dept_id (FK)] 
CREATE TABLE INSTRUCTOR (
	Ins_id INT PRIMARY KEY,
	Ins_name VARCHAR(255),
	Ins_email VARCHAR(255),
	Ins_phone INT,
	Ins_city VARCHAR(255),
	Ins_gender VARCHAR(255),
	Dept_id INT,  -- This is the foreign key column
    FOREIGN KEY (Dept_id) REFERENCES DEPARTMENT (Dept_id)
);

--15- Job_offer [Jop_offer_id - Std_id (FK) - Hiring_status - Job_title - Job_salary ]
CREATE TABLE JOB_OFFER (
	Job_offer_id INT PRIMARY KEY,
	Std_id INT,  -- This is the foreign key column
    FOREIGN KEY (Std_id) REFERENCES STUDENT (Std_id),
	Hiring_status INT,
	Job_title VARCHAR(255),
	Job_salary FLOAT
);

--14- KPI [KPI_id - Std_id (FK) - Freelance_status - Freelance_Salary - cert_status ] 
CREATE TABLE KPI (
	KPI_id INT PRIMARY KEY,
	Std_id INT,  -- This is the foreign key column
    FOREIGN KEY (Std_id) REFERENCES STUDENT (Std_id),
	Std_Freelance_status INT,
	Freelance_salary FLOAT,
	Cert_status INT
);

--5-Topic [Topic_id (PK) - Topic_name ] 
CREATE TABLE TOPIC (
	Topic_id INT PRIMARY KEY,
	Topic_name VARCHAR(255)
);

--4-Course [Crs_id (PK) - Crs_name - Crs_duration - Topic_id (FK) - Ins_id (FK)] 
CREATE TABLE COURSE (
	Crs_id INT PRIMARY KEY,
	Crs_name VARCHAR(255),
	Crs_duration INT,
	Topic_id INT,  -- This is the foreign key column
	Ins_id INT,  -- This is the foreign key column
	FOREIGN KEY (Topic_id) REFERENCES TOPIC (Topic_id),
    FOREIGN KEY (Ins_id) REFERENCES INSTRUCTOR (Ins_id)
);

--7-Exam [Exam_id (PK) - No_of_question - Exam_duration - Exam_grade - Exam_date - Crs_id (FK)] 
CREATE TABLE EXAM (
    Exam_id INT PRIMARY KEY,
	NO_of_questions INT,
	Exam_duration FLOAT,
	Exam_grade FLOAT,
    Exam_date DATETIME,
    Crs_id INT,  -- This is the foreign key column
    FOREIGN KEY (Crs_id) REFERENCES COURSE (Crs_id)
);

--9- Exam_Question [ {Exam_id (FK) - Question_id (FK)} (PK) ] 
CREATE TABLE Exam_Question (
    Exam_id INT,
    Question_id INT,
    PRIMARY KEY (Exam_id, Question_id),
    FOREIGN KEY (Exam_id) REFERENCES Exam(Exam_id),
    FOREIGN KEY (Question_id) REFERENCES Question(Question_id)
);

--10-Std_course [{Std_id (FK) - Crs_id (FK)} (PK) - Crs_grade ] 
CREATE TABLE Std_course (
    Std_id INT,
    Crs_id INT,
	Crs_grade INT,
    PRIMARY KEY (Std_id, Crs_id),
    FOREIGN KEY (Std_id) REFERENCES Student(Std_id),
    FOREIGN KEY (Crs_id) REFERENCES Course(Crs_id)
);

--11-Std_answer [{Std_id (FK) - Exam_id (FK) - Quest_id (FK)} (PK) - Std_ans - Std_qs_grade] 
CREATE TABLE Std_answer (
    Std_id INT,
    Exam_id INT,
    PRIMARY KEY (Std_id, Exam_id),
	question_id INT,  -- This is the foreign key column
    FOREIGN KEY (question_id) REFERENCES QUESTION (question_id),
	Std_ans VARCHAR(255), 
	Std_qs_grade VARCHAR(255),
    FOREIGN KEY (Std_id) REFERENCES Student(Std_id),
    FOREIGN KEY (Exam_id) REFERENCES Exam(Exam_id)
);

--12-ST_Exam_Grade [ {ST_ID(FK) - Exam_ID(FK)}(PK) - Grade] 
CREATE TABLE ST_Exam_Grade (
    Std_id INT,
    Exam_id INT,
    PRIMARY KEY (Std_id, Exam_id),
	Grade FLOAT,
    FOREIGN KEY (Std_id) REFERENCES Student(Std_id),
    FOREIGN KEY (Exam_id) REFERENCES Exam(Exam_id)
);

--13-Crs_Evaluation [ {Crs_id (FK) - Std_id (FK) } (PK) - Crs_Material_helpful - Crs_Content - Crs_well-organised - 
			--Inst_ClassTime - Inst_Responce_Qus - Inst_GiveClearEx - Crs_id (FK) - Std_id (FK)] 
CREATE TABLE Crs_Evaluation (
    Std_id INT,
	Crs_id INT,
    Crs_Material_helpful INT,
    Crs_Content INT,
    Crs_well_organised INT,
	Inst_ClassTime INT,
	Inst_Responce_Qus INT,
	Inst_GiveClearEx INT,
    PRIMARY KEY (Crs_id, Std_id),
    FOREIGN KEY (Crs_id) REFERENCES Course(Crs_id),
    FOREIGN KEY (Std_id) REFERENCES Student(Std_id)
);

--CONSTRAINT FK_Customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)