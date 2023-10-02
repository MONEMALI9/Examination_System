--6-Question [Quest_id (PK) - Quest_txt - Quest_type - Quest_mark - Model_ans_id - Model_ans_txt]

CREATE TABLE QUESTION (
	question_id INT PRIMARY KEY,
	question_txt VARCHAR(100),
	model_ans_id INT,
	model_ans_txt VARCHAR(100),
	question_mark FLOAT,
	question_type VARCHAR(30)
);

--8-Choice [Choice_id (PK) - Choice_txt - Is_correct - Quest_id (FK)]

CREATE TABLE CHOICE (
	Choice_id INT PRIMARY KEY,
	Is_correct INT,
	Choice_txt VARCHAR(30)
);

--1-Student [St_id (PK) - Std_name - Std_email - Std_age - Std_gender - Std_city - Std_phone -  Std_grad_year - Std_faculty ] 

CREATE TABLE STUDENT (
	Std_id INT PRIMARY KEY,
	Std_name VARCHAR(30),
	Std_age INT,
	Std_phone INT,
	Std_gender VARCHAR(30),
	Std_email VARCHAR(30),
	Std_faculty VARCHAR(30),
	Std_address VARCHAR(30),
	Std_grade_year VARCHAR(30)
);

--2-Department [Dept_id (PK) - Dpet_name - Dept_location - Mgr_id (FK) ] 

CREATE TABLE DEPARTMENT (
	Dept_id INT PRIMARY KEY,
	Dept_name VARCHAR(30),
	Dept_location VARCHAR(30)
);

--3-Instructor [Ins_id (PK) - Ins_name - Ins_email - Ins_city - Ins_phone - Ins_gender - Dept_id (FK)] 

CREATE TABLE INSTRUCTOR (
	Ins_id INT PRIMARY KEY,
	Ins_name VARCHAR(30),
	Ins_gender VARCHAR(30),
	Ins_email VARCHAR(30),
	Ins_city VARCHAR(30),
	Ins_phone INT,
	Dept_id INT,  -- This is the foreign key column
    FOREIGN KEY (Dept_id) REFERENCES DEPARTMENT (Dept_id)
);

--15- Job_offer [Jop_offer_id - Std_id (FK) - Hiring_status - Job_title - Job_salary ]

CREATE TABLE JOB_OFFER (
	Job_offer_id INT PRIMARY KEY,
	Job_salary FLOAT,
	Job_status VARCHAR(30),
	Hiring_status VARCHAR(30),
	Std_id INT,  -- This is the foreign key column
    FOREIGN KEY (Std_id) REFERENCES STUDENT (Std_id)
);

--14- KPI [KPI_id - Std_id (FK) - Freelance_status - Freelance_Salary - cert_status ] 

CREATE TABLE KPI (
	KPI_id INT PRIMARY KEY,
	Freelance_salary FLOAT,
	Freelance_status VARCHAR(30),
	Cert_status VARCHAR(30),
	Std_id INT,  -- This is the foreign key column
    FOREIGN KEY (Std_id) REFERENCES STUDENT (Std_id)
);

--5-Topic [Topic_id (PK) - Topic_name ] 

CREATE TABLE TOPIC (
	Topic_id INT PRIMARY KEY,
	Topic_name VARCHAR(30)
);

--4-Course [Crs_id (PK) - Crs_name - Crs_duration - Topic_id (FK) - Ins_id (FK)] 

CREATE TABLE COURSE (
	Crs_id INT PRIMARY KEY,
	Crs_name VARCHAR(30),
	Crs_duration INT,
	Topic_id INT,  -- This is the foreign key column
	Ins_id INT,  -- This is the foreign key column
	FOREIGN KEY (Topic_id) REFERENCES TOPIC (Topic_id),
    FOREIGN KEY (Ins_id) REFERENCES INSTRUCTOR (Ins_id)
);

--7-Exam [Exam_id (PK) - No_of_question - Exam_duration - Exam_grade - Exam_date - Crs_id (FK)] 

CREATE TABLE EXAM (
    Exam_id INT PRIMARY KEY,
    Exam_date DATETIME,
    Exam_grade FLOAT,
    Exam_duration FLOAT,
    NO_of_questions INT,
    Crs_id INT,  -- This is the foreign key column
    FOREIGN KEY (Crs_id) REFERENCES COURSE (Crs_id)
);


--CONSTRAINT FK_Customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)