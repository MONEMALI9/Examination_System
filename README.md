# Examination_System

# Online Examination System README
## Overview
This README provides an overview of the requirements and specifications for an automated online examination system along with its associated SQL database. This system is designed to facilitate online exams, manage exam-related data, and provide reporting capabilities for ITI (Information Technology Institute) staff.

## System Requirements
Entity-Relationship Diagram (ERD)
ERD

The ERD illustrates the relationships between the key entities in the system, including Students, Instructors, Courses, Exams, Questions, Answers, and Departments.

## Database Dictionary
Below is a simplified database dictionary outlining the key tables and their respective columns:

## Tables
### Students

StudentID (Primary Key)
FirstName
LastName
DepartmentID (Foreign Key)
...
### Instructors

InstructorID (Primary Key)
FirstName
LastName
...
### Courses

CourseID (Primary Key)
CourseName
InstructorID (Foreign Key)
...
### Exams

ExamID (Primary Key)
CourseID (Foreign Key)
...
### Questions

QuestionID (Primary Key)
ExamID (Foreign Key)
QuestionText
...
### Answers

AnswerID (Primary Key)
QuestionID (Foreign Key)
AnswerText
IsCorrect
...
### Departments

DepartmentID (Primary Key)
DepartmentName
...
## Stored Procedures
The system includes the following stored procedures for database management:

SELECT, INSERT, UPDATE, and DELETE procedures for any table.

Procedure for generating exams.

Procedure for recording and managing exam answers.

Procedure for correcting exams.

## Reporting
The system incorporates reporting features to assist ITI staff in managing and monitoring exams. It utilizes SQL Server Reporting Services (SSRS), Power BI for creating dashboards, and integrates with social networks such as Facebook and Twitter for notifications.

## Reports
Student Information by Department

Input: Department Number
Output: List of students in the specified department.
Grades by Student

Input: Student ID
Output: Student's grades in all courses.
Courses Taught by Instructor

Input: Instructor ID
Output: List of courses taught by the instructor and the number of students per course.
Topics by Course

Input: Course ID
Output: List of topics covered in the course.
Questions in an Exam

Input: Exam Number
Output: List of questions in the exam.
Student Exam Answers

Input: Exam Number, Student ID
Output: List of questions in the exam with the student's answers.

## Technology Stack
Database: SQL Server
Reporting: SQL Server Reporting Services (SSRS), Power BI for Dashboard
Social Network Integration: Facebook, Twitter

## Implementation
The above requirements serve as the foundation for the development of the automated online examination system. It is crucial to ensure that the system is designed, implemented, and tested in accordance with these specifications to meet the needs of ITI staff and students effectively.

For detailed instructions on setting up and using the system, please refer to the system documentation or contact the system administrator.

For any questions or concerns, please contact Contact Information.
