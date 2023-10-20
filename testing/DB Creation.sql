CREATE DATABASE Examination_System;

					---FOREIGN KEYS---

-- Department Table
	ALTER TABLE Department
	ADD FOREIGN KEY (Mgr_id) REFERENCES Instructor(Ins_id);

-- Instructor Table
	ALTER TABLE Instructor
	ADD FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id);

-- Course Table
	ALTER TABLE Course
	ADD FOREIGN KEY (Topic_id) REFERENCES Topic(Topic_id);

	ALTER TABLE Course
	ADD FOREIGN KEY (Ins_id) REFERENCES Instructor(Ins_id);

-- Std_course Table
	ALTER TABLE Std_course
	ADD FOREIGN KEY (Std_id) REFERENCES Student(Std_id);

	ALTER TABLE Std_course
	ADD FOREIGN KEY (Crs_id) REFERENCES Course(Crs_id);

-- Crs_Evaluation Table
	ALTER TABLE Crs_Evaluation
	ADD FOREIGN KEY (Std_id) REFERENCES Student(Std_id);

	ALTER TABLE Crs_Evaluation
	ADD FOREIGN KEY (Crs_id) REFERENCES Course(Crs_id);

-- KPI Table
	ALTER TABLE KPI
	ADD FOREIGN KEY (Std_id) REFERENCES Student(Std_id);

-- Job_offer Table
	ALTER TABLE Job_offer
	ADD FOREIGN KEY (Std_id) REFERENCES Student(Std_id);

-- Question Table
	ALTER TABLE Question
	ADD FOREIGN KEY (Model_ans_id) REFERENCES Choice(Choice_id);

-- Exam Table
	ALTER TABLE Exam
	ADD FOREIGN KEY (Crs_id) REFERENCES Course(Crs_id);
	
-- Exam_Question Table
	ALTER TABLE Exam_Question
	ADD FOREIGN KEY (Exam_id) REFERENCES Exam(Exam_id);

	ALTER TABLE Exam_Question
	ADD FOREIGN KEY (Quest_id) REFERENCES Question(Quest_id);

-- Choice Table
	ALTER TABLE Choice
	ADD FOREIGN KEY (Quest_id) REFERENCES Question(Quest_id);

-- Std_answer Table
	ALTER TABLE Std_Answer
	ADD FOREIGN KEY (Std_id) REFERENCES Student(Std_id);

	ALTER TABLE Std_Answer
	ADD FOREIGN KEY (Exam_id) REFERENCES Exam(Exam_id);

	ALTER TABLE Std_Answer
	ADD FOREIGN KEY (Quest_id) REFERENCES Question(Quest_id);

-- Std_Exam_Grade Table
	ALTER TABLE Std_Exam_Grade
	ADD FOREIGN KEY (Std_id) REFERENCES Student(Std_id);

	ALTER TABLE Std_Exam_Grade
	ADD FOREIGN KEY (Exam_id) REFERENCES Exam(Exam_id);