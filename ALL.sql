 ☆ Heba Mustafa ☆

all sql statements 

Tables

1.table teacher:

create table teacher (
 teacher_id int primary key,
  email varchar2(45) unique not null,
password varchar2(45) not null,
fname varchar2(45) not null,
 lname varchar2(45) ,
 dob date not null,
  phone varchar2(15),
 mobile varchar2(15) unique, 
  status number(1)  not null check (status in (0, 1)), 
  last_login_date date,
  last_login_ip varchar2(45)
);

2.table grade:

create table grade(
 grade_id int primary key,
 name varchar2(45),
  grade_description varchar2(45) 
); 

3.table classroom:

create table classroom (
 classroom_id int primary key, 
 year number(4) , 
  grade_id int , 
 section char(2) , 
 status number(1)   check (status in (0, 1)), 
  remarks varchar2(45), 
   teacher_id int,
    constraint fk_table_grade foreign key (grade_id) references grade(grade_id),
    constraint fk_table_teacher foreign key (teacher_id) references teacher(teacher_id)
);

4.table parent:

create table parent(
   parent_id int primary key,
   email varchar2(45) unique not null,
    password varchar2(45) not null,
  fname varchar2(45) not null,
   lname varchar2(45),
   dob date,
   phone varchar2(15),
   mobile varchar2(15) unique,
    status number(1)  check (status in (0, 1)),
    last_login_date date,
    last_login_ip varchar2(45)
    );


5.table student:

create table student(
  student_id int primary key,
  email varchar2(45) unique not null,
  password varchar2(45) not null,
   fname varchar2(45) not null,
   lname varchar2(45) ,
    dob date ,
    phone varchar2(15),
    mobile varchar2(15) ,
    parent_id int,
    date_of_join date,
    status number(1) check (status in (0, 1)),
    last_login_date date,
    last_login_ip varchar2(45),
    constraint fk_parent foreign key (parent_id) references parent(parent_id)
);

6.table classroom_student:

create table classroom_student(
classroom_id int,
student_id int,
primary key (classroom_id, student_id),
  constraint fk_classroom foreign key (classroom_id) references classroom(classroom_id),
  constraint fk_student foreign key (student_id) references student(student_id)
);

7.table attendance:

create table attendance (
 date_of_attendance date,
student_id int,
status number(1),
 remark varchar2(255),
   primary key (date_of_attendance, student_id),
    constraint fk_student_attendance foreign key (student_id) references student(student_id)
);

8.table exam_type:

create table exam_type(
 exam_type_id int primary key,
 name varchar2(45),
 description_exam varchar(45)  
);







9.table exam :

create table exam(
 exam_id int primary key,
 exam_type_id int,
 name varchar2(45),  
 start_date date,
    constraint fk_exam_type foreign key (exam_type_id) references exam_type(exam_type_id)
);

10. Table course:

create table course (
 course_id int primary key,
 name varchar2(45),
 description varchar2(45),
 grade_id int,
    constraint fk_grade foreign key (grade_id) references grade(grade_id)
);
  

11. Table exam_result:

create table exam_result (
 exam_id int,
 student_id int,
 course_id int,
 marks varchar2(45),
primary key (exam_id, student_id, course_id),
 constraint fk_exam_result_exam foreign key (exam_id) references exam(exam_id),
 constraint fk_exam_result_student foreign key (student_id) references student(student_id),
 constraint fk_exam_result_course foreign key (course_id) references course(course_id)
);

















Attributes	Explanation
	
1.table teacher:	
teacher_id	 : Unique identifier for each teacher (Primary Key).
email	 : Unique email address of the teacher (cannot be null).
password	 : Password for teacher login.
fname	:First name of the teacher.
lname	: Last name of the teacher (optional).
dob	: Date of birth of the teacher.
Phone:	Landline phone number of the teacher.
mobile	: Unique mobile phone number of the teacher.
status	: Active status of the teacher (0 for inactive, 1 for active).
last_login_date	: Date of the last login by the teacher.
last_login_ip	: IP address of the last login.
	
2.table grade:
grade_id	Unique identifier for each grade (Primary Key).
name	Name of the grade ( "Grade 1", "Grade 2").
grade_description	Description or remarks about the grade.
	
3.table classroom:
classroom_id	Unique identifier for each classroom (Primary Key).
year	The academic year for the classroom.
grade_id	References grade table to associate the classroom with a specific grade.
section	Section identifier for the classroom 
status	Status of the classroom (0 for inactive, 1 for active).
remarks	Any additional notes or comments about the classroom.
teacher_id	References teacher table to associate a teacher with the classroom.

4.table parent:
parent_id	Unique identifier for each parent (Primary Key).
email	Unique email address of the parent.
password	Password for parent login.
fname	First name of the parent.
lname	Last name of the parent (optional).
dob	Date of birth of the parent.
phone	Landline phone number of the parent.
mobile	Unique mobile phone number of the parent.
status	Status of the parent (0 for inactive, 1 for active).
last_login_date	Date of the last login by the parent.
last_login_ip	IP address of the last login.
5.table student:
student_id	Unique identifier for each student (Primary Key).
email	Unique email address of the student.
password	Password for student login.
fname	First name of the student.
lname	Last name of the student (optional).
dob	Date of birth of the student.
phone	Landline phone number of the student.
mobile	Mobile phone number of the student.
parent_id	References parent table to associate a parent with the student.
date_of_join	Date when the student joined.
status	Status of the student (0 for inactive, 1 for active).
last_login_date	Date of the last login by the student.
last_login_ip	IP address of the last login.
	
6.table classroom_student:
classroom_id	References classroom table to associate students with classrooms.
student_id	References student table to associate a student with a classroom.
	
7.table attendance:
date_of_attendance	Date of the attendance record.
student_id	References student table to indicate which student the record belongs to.
status	Attendance status ( 1 for present, 0 for absent).
remark	Additional comments or remarks about the attendance.

8.table exam_type:
exam_type_id	Unique identifier for the type of exam (Primary Key).
name	Name of the exam type .
description_exam	Description or remarks about the exam type.

9.table exam :
exam_id	Unique identifier for the exam (Primary Key).
exam_type_id	References exam_type table to associate the exam with a type.
name	Name of the exam .
start_date	Date when the exam is scheduled to start.





10. Table course:

course_id	Unique identifier for the course (Primary Key).
name	Name of the course 
description	Description of the course.
grade_id	References grade table to associate the course with a grade.




11. Table exam_result:
exam_id	References exam table to identify which exam the result belongs to.
student_id	References student table to associate the result with a student.
course_id	References course table to identify the course.
marks	Marks obtained by the student for the exam.


table teacher :
INSERT INTO teacher (teacher_id, email, password, fname, lname, dob, phone, mobile, status, last_login_date, last_login_ip)
VALUES 
(1, 'ali.khan@teacher.com', 'pass123', 'Ali', 'Khan', TO_DATE('1980-05-12', 'YYYY-MM-DD'), '1234567890', '9876543210', 1, TO_DATE('2024-03-01', 'YYYY-MM-DD'), '192.168.1.1');
INSERT INTO teacher (teacher_id, email, password, fname, lname, dob, phone, mobile, status, last_login_date, last_login_ip)
VALUES 
(2, 'fatima.khan@teacher.com', 'pass234', 'Fatima', 'Khan', TO_DATE('1978-08-22', 'YYYY-MM-DD'), '2233445566', '9988776655', 1, TO_DATE('2024-02-20', 'YYYY-MM-DD'), '192.168.1.2');

INSERT INTO teacher (teacher_id, email, password, fname, lname, dob, phone, mobile, status, last_login_date, last_login_ip)
VALUES 
(3, 'mohammed.ali@teacher.com', 'pass345', 'Mohammed', 'Ali', TO_DATE('1985-03-15', 'YYYY-MM-DD'), '3344556677', '1122334455', 0, TO_DATE('2024-01-25', 'YYYY-MM-DD'), '192.168.1.3');

INSERT INTO teacher (teacher_id, email, password, fname, lname, dob, phone, mobile, status, last_login_date, last_login_ip)
VALUES 
(4, 'layla.jamal@teacher.com', 'pass456', 'Layla', 'Jamal', TO_DATE('1990-01-14', 'YYYY-MM-DD'), '4455667788', '2233445566', 1, TO_DATE('2024-01-30', 'YYYY-MM-DD'), '192.168.1.4');

INSERT INTO teacher (teacher_id, email, password, fname, lname, dob, phone, mobile, status, last_login_date, last_login_ip)
VALUES 
(5, 'omar.youssef@teacher.com', 'pass567', 'Omar', 'Youssef', TO_DATE('1982-12-20', 'YYYY-MM-DD'), '5566778899', '3344556677', 0, TO_DATE('2024-02-10', 'YYYY-MM-DD'), '192.168.1.5');

INSERT INTO teacher (teacher_id, email, password, fname, lname, dob, phone, mobile, status, last_login_date, last_login_ip)
VALUES 
(6, 'hana.samir@teacher.com', 'pass678', 'Hana', 'Samir', TO_DATE('1988-06-25', 'YYYY-MM-DD'), '6677889900', '4455667788', 1, TO_DATE('2024-02-15', 'YYYY-MM-DD'), '192.168.1.6');

********************************************************************************************************************************

table grade :

INSERT INTO grade (grade_id, name, grade_description)
VALUES 
(1, 'Grade 1', 'First grade in the school');
INSERT INTO grade (grade_id, name, grade_description)
VALUES 
(2, 'Grade 2', 'Second grade in the school');
INSERT INTO grade (grade_id, name, grade_description)
VALUES 
(3, 'Grade 3', 'Third grade in the school');
INSERT INTO grade (grade_id, name, grade_description)
VALUES 
(4, 'Grade 4', 'Fourth grade in the school');
INSERT INTO grade (grade_id, name, grade_description)
VALUES 
(5, 'Grade 5', 'Fifth grade in the school');
INSERT INTO grade (grade_id, name, grade_description)
VALUES 
(6, 'Grade 6', 'Sixth grade in the school');

************************************************************************************************************************************
table classroom :

INSERT INTO classroom (classroom_id, year, grade_id, section, status, remarks, teacher_id)
VALUES 
(1, 2024, 1, 'A', 1, 'First grade in the school', 1);
INSERT INTO classroom (classroom_id, year, grade_id, section, status, remarks, teacher_id)
VALUES 
(2, 2024, 2, 'B', 1, 'Second grade in the school', 2);
INSERT INTO classroom (classroom_id, year, grade_id, section, status, remarks, teacher_id)
VALUES 
(3, 2024, 3, 'C', 0, 'Third grade in the school', 3);
INSERT INTO classroom (classroom_id, year, grade_id, section, status, remarks, teacher_id)
VALUES 
(4, 2024, 4, 'D', 1, 'Fourth grade in the school', 4);
INSERT INTO classroom (classroom_id, year, grade_id, section, status, remarks, teacher_id)
VALUES 
(5, 2024, 5, 'E', 1, 'Fifth grade in the school', 5);
INSERT INTO classroom (classroom_id, year, grade_id, section, status, remarks, teacher_id)
VALUES 
(6, 2024, 6, 'F', 0, 'Sixth grade in the school', 6);

**************************************************************************************************************************************

table parent :

INSERT INTO parent (parent_id, email, password, fname, lname, dob, phone, mobile, status, last_login_date, last_login_ip)
VALUES (3, 'heba@hotmail.com', 'hebaPass567', 'Heba', 'Mustafa', TO_DATE('1990-09-20', 'YYYY-MM-DD'), '0593344556', '0561122334', 1, SYSDATE, '192.168.1.3');

INSERT INTO parent (parent_id, email, password, fname, lname, dob, phone, mobile, status, last_login_date, last_login_ip)
VALUES (1, 'hadi@gmail.com', 'hadiPass123', 'Hadi', 'Kamal', TO_DATE('1980-02-15', 'YYYY-MM-DD'), '0591234567', '0569876543', 1, SYSDATE, '192.168.1.1');

INSERT INTO parent (parent_id, email, password, fname, lname, dob, phone, mobile, status, last_login_date, last_login_ip)
VALUES (2, 'yahya@yahoo.com', 'yPass234', 'yahya', 'Salim', TO_DATE('1985-05-10', 'YYYY-MM-DD'), '0592233445', '0567788990', 1, SYSDATE, '192.168.1.2');

INSERT INTO parent (parent_id, email, password, fname, lname, dob, phone, mobile, status, last_login_date, last_login_ip)
VALUES (4, 'ali@outlook.com', 'aliPass789', 'Ali', 'Omar', TO_DATE('1975-11-05', 'YYYY-MM-DD'), '0594455667', '0569988776', 1, SYSDATE, '192.168.1.4');

INSERT INTO parent (parent_id, email, password, fname, lname, dob, phone, mobile, status, last_login_date, last_login_ip)
VALUES (5, 'suha@gmail.com', 'raedPass321', 'suha', 'Ahmed', TO_DATE('1982-06-25', 'YYYY-MM-DD'), '0595566778', '0568899776', 1, SYSDATE, '192.168.1.5');

INSERT INTO parent (parent_id, email, password, fname, lname, dob, phone, mobile, status, last_login_date, last_login_ip)
VALUES (6, 'sobhi@gmail.com', 'sobhiPass654', 'Sobhi', 'Tariq', TO_DATE('1995-03-15', 'YYYY-MM-DD'), '0596677889', '0567766554', 1, SYSDATE, '192.168.1.6');

******************************************************************************************************************************************
table student:
INSERT INTO student (student_id, email, password, fname, lname, dob, phone, mobile, parent_id, date_of_join, status, last_login_date, last_login_ip)
VALUES 
(1, 'ali.karim@html.com', 'pass123', 'Ali', 'Karim', TO_DATE('2010-03-15', 'YYYY-MM-DD'), '1234567890', '9876543210', 1, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 1, TO_DATE('2024-03-10', 'YYYY-MM-DD'), '192.168.2.1');
INSERT INTO student (student_id, email, password, fname, lname, dob, phone, mobile, parent_id, date_of_join, status, last_login_date, last_login_ip)
VALUES 
(2, 'sara.farid@outlook.com', 'pass234', 'Sara', 'Farid', TO_DATE('2011-07-20', 'YYYY-MM-DD'), '2233445566', '9988776655', 2, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 1, TO_DATE('2024-03-12', 'YYYY-MM-DD'), '192.168.2.2');
INSERT INTO student (student_id, email, password, fname, lname, dob, phone, mobile, parent_id, date_of_join, status, last_login_date, last_login_ip)
VALUES 
(3, 'khaled.omer@html.com', 'pass345', 'Khaled', 'Omer', TO_DATE('2010-12-10', 'YYYY-MM-DD'), '3344556677', '1122334455', 3, TO_DATE('2024-03-08', 'YYYY-MM-DD'), 0, TO_DATE('2024-03-15', 'YYYY-MM-DD'), '192.168.2.3');
INSERT INTO student (student_id, email, password, fname, lname, dob, phone, mobile, parent_id, date_of_join, status, last_login_date, last_login_ip)
VALUES 
(4, 'layla.ahmad@gmail.com', 'pass456', 'Layla', 'Ahmad', TO_DATE('2012-02-25', 'YYYY-MM-DD'), '4455667788', '2233445566', 4, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 1, TO_DATE('2024-03-17', 'YYYY-MM-DD'), '192.168.2.4');
INSERT INTO student (student_id, email, password, fname, lname, dob, phone, mobile, parent_id, date_of_join, status, last_login_date, last_login_ip)
VALUES 
(5, 'nasser.ali@gmail.com', 'pass567', 'Nasser', 'Ali', TO_DATE('2011-05-30', 'YYYY-MM-DD'), '5566778899', '3344556677', 5, TO_DATE('2024-03-12', 'YYYY-MM-DD'), 1, TO_DATE('2024-03-18', 'YYYY-MM-DD'), '192.168.2.5');
INSERT INTO student (student_id, email, password, fname, lname, dob, phone, mobile, parent_id, date_of_join, status, last_login_date, last_login_ip)
VALUES 
(6, 'hana.yousef@gmail.com', 'pass678', 'Hana', 'Yousef', TO_DATE('2013-08-15', 'YYYY-MM-DD'), '6677889900', '4455667788', 6, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 0, TO_DATE('2024-03-22', 'YYYY-MM-DD'), '192.168.2.6');


******************************************************************************************************************************************
table course :
INSERT INTO course (course_id, name, description, grade_id)
VALUES (1, 'Mathematics', 'Basic arithmetic and algebra', 1);

INSERT INTO course (course_id, name, description, grade_id)
VALUES (2, 'Science', 'Introduction to natural sciences', 2);

INSERT INTO course (course_id, name, description, grade_id)
VALUES (3, 'English', 'Basic reading and writing skills', 3);

INSERT INTO course (course_id, name, description, grade_id)
VALUES (4, 'History', 'Overview of world history', 4);

INSERT INTO course (course_id, name, description, grade_id)
VALUES (5, 'Physics', 'Basic concepts of physics', 5);

INSERT INTO course (course_id, name, description, grade_id)
VALUES (6, 'Chemistry', 'Introduction to chemical reactions', 6);

******************************************************************************************************************************************
table exam_type:

INSERT INTO exam_type (exam_type_id, name, description_exam)
VALUES
(1, 'Final Exam', 'End of year final exams');
INSERT INTO exam_type (exam_type_id, name, description_exam)
VALUES
(2, 'Midterm Exam', 'Midterm exams for the semester');
INSERT INTO exam_type (exam_type_id, name, description_exam)
VALUES
(3, 'Quiz', 'Short quizzes for students');
INSERT INTO exam_type (exam_type_id, name, description_exam)
VALUES
(4, 'Project', 'Project-based assessment');
INSERT INTO exam_type (exam_type_id, name, description_exam)
VALUES
(5, 'Oral Exam', 'Oral exam ’ speaking ');
INSERT INTO exam_type (exam_type_id, name, description_exam)
VALUES
(6, 'Practical Exam', 'Practical exam ');
**********************************************************************************************************************************************

table exam_result:
INSERT INTO exam_result (exam_id, student_id, course_id, marks)
VALUES (1, 1, 1, '70');   

INSERT INTO exam_result (exam_id, student_id, course_id, marks)
VALUES (2, 2, 2, '90');  

INSERT INTO exam_result (exam_id, student_id, course_id, marks)
VALUES (3, 3, 3, '90');  

INSERT INTO exam_result (exam_id, student_id, course_id, marks)
VALUES (4, 4, 4, '89'); 

INSERT INTO exam_result (exam_id, student_id, course_id, marks)
VALUES (5, 5, 5, '77'); 

INSERT INTO exam_result (exam_id, student_id, course_id, marks)
VALUES (6, 6, 6, '95'); 
*********************************************************************************************************************************************
table classroom_student
INSERT INTO classroom_student (classroom_id, student_id)
VALUES (1, 1);

INSERT INTO classroom_student (classroom_id, student_id)
VALUES (1, 2);
INSERT INTO classroom_student (classroom_id, student_id)
VALUES (2, 3);

INSERT INTO classroom_student (classroom_id, student_id)
VALUES (3, 4);

INSERT INTO classroom_student (classroom_id, student_id)
VALUES (4, 5);

INSERT INTO classroom_student (classroom_id, student_id)
VALUES (5, 6);

********************************************************************************************************************************************
table exam 
INSERT INTO exam (exam_id, exam_type_id, name, start_date)
VALUES (1, 1, 'Incomplete Exam for Math', TO_DATE('2024-01-10', 'YYYY-MM-DD'));
INSERT INTO exam (exam_id, exam_type_id, name, start_date)
VALUES (2, 2, 'First Term Exam for Science', TO_DATE('2024-01-15', 'YYYY-MM-DD'));
INSERT INTO exam (exam_id, exam_type_id, name, start_date)
VALUES (3, 3, 'Mid-Term Exam for Math', TO_DATE('2024-02-05', 'YYYY-MM-DD'));
INSERT INTO exam (exam_id, exam_type_id, name, start_date)
VALUES (4, 4, 'Final Science Exam', TO_DATE('2024-03-20', 'YYYY-MM-DD'));
INSERT INTO exam (exam_id, exam_type_id, name, start_date)
VALUES (5, 5, 'Oral English Exam', TO_DATE('2024-03-25', 'YYYY-MM-DD'));
INSERT INTO exam (exam_id, exam_type_id, name, start_date)
VALUES (6, 6, 'Special Exam for Sarah’s Class', TO_DATE('2024-04-01', 'YYYY-MM-DD'));
****************************************************************************************************************************************
table attendance:

INSERT INTO attendance (date_of_attendance, student_id, status, remark)
VALUES (TO_DATE('2024-01-01', 'YYYY-MM-DD'), 1, 1, 'Present and participated in class.');

INSERT INTO attendance (date_of_attendance, student_id, status, remark)
VALUES (TO_DATE('2024-01-01', 'YYYY-MM-DD'), 2, 0, 'Absent due to illness.');

INSERT INTO attendance (date_of_attendance, student_id, status, remark)
VALUES (TO_DATE('2024-01-01', 'YYYY-MM-DD'), 3, 1, 'Present but quiet.');

INSERT INTO attendance (date_of_attendance, student_id, status, remark)
VALUES (TO_DATE('2024-01-02', 'YYYY-MM-DD'), 4, 1, 'On time and participated.');

INSERT INTO attendance (date_of_attendance, student_id, status, remark)
VALUES (TO_DATE('2024-01-02', 'YYYY-MM-DD'), 5, 0, 'Absent, no notice given.');

INSERT INTO attendance (date_of_attendance, student_id, status, remark)
VALUES (TO_DATE('2024-01-02', 'YYYY-MM-DD'), 6, 1, 'Present and asked questions.');

******************************************************************************************************************************
sql queries 

1. Retrieve a list of all students in a specific classroom along with their grade.
select 
  c.classroom_id as classroom_id,
  s.fname || ' ' || s.lname as student_name,
  g.name as grade_name,
  g.grade_description as grade_desc
from 
   student s
join 
    classroom_student cs on s.student_id = cs.student_id
join 
    classroom c on cs.classroom_id = c.classroom_id
join 
    grade g on c.grade_id = g.grade_id
order by    c.classroom_id, s.lname; 

*****************************************************
2.Fetch the details of all teachers teaching a specific course

SELECT t.teacher_id, t.fname || ' ' || t.lname AS teacher_name, t.email, t.phone
FROM teacher t
JOIN classroom c ON t.teacher_id = c.teacher_id
JOIN course cr ON c.grade_id = cr.grade_id
WHERE cr.course_id = 4;


*****************************************************
3.Find all exams taken by a student along with their marks.
SELECT e.name AS exam_name, et.name AS exam_type, er.marks
FROM exam_result er
JOIN exam e ON er.exam_id = e.exam_id
JOIN exam_type et ON e.exam_type_id = et.exam_type_id
WHERE er.student_id = 3;
 

*****************************************************
4.Retrieve the attendance records for a specific student within a given date range.

SELECT 
      A.date_of_attendance, 
  A.status, 
    A.remark
FROM 
    attendance  A
WHERE 
  A.student_id = 6
    AND A.date_of_attendance 
        BETWEEN TO_DATE('2024-01-01', 'YYYY-MM-DD') 
        AND TO_DATE('2024-01-31', 'YYYY-MM-DD')
ORDER BY 
    A.date_of_attendance;

*****************************************************
5.List the parents contact information for all students in a particular grade.
SELECT p.fname || ' ' || p.lname AS parent_name, p.phone, p.mobile, p.email
FROM parent p
JOIN student s ON p.parent_id = s.parent_id
JOIN classroom_student cs ON s.student_id = cs.student_id
JOIN classroom c ON cs.classroom_id = c.classroom_id
JOIN grade g ON c.grade_id = g.grade_id
WHERE g.grade_id = 1;

*****************************************************
6.Fetch the average marks for each exam type for a specific course.
SELECT et.name AS exam_type, AVG(TO_NUMBER(er.marks)) AS average_marks
FROM exam_result er
JOIN exam e ON er.exam_id = e.exam_id
JOIN exam_type et ON e.exam_type_id = et.exam_type_id
WHERE er.course_id = 1
GROUP BY et.name;


*****************************************************
7. Display all courses along with their associated grade and teacher.

SELECT cr.name AS course_name, g.name AS grade_name, t.fname || ' ' || t.lname AS teacher_name
FROM course cr
JOIN grade g ON cr.grade_id = g.grade_id
JOIN classroom c ON g.grade_id = c.grade_id
JOIN teacher t ON c.teacher_id = t.teacher_id;

*****************************************************
8. List all classrooms along with the number of students in each.
SELECT c.classroom_id, c.year, c.section, COUNT(cs.student_id) AS student_count
FROM classroom c
LEFT JOIN classroom_student cs ON c.classroom_id = cs.classroom_id
GROUP BY c.classroom_id, c.year, c.section
ORDER BY c.classroom_id;

***************************************************************************************************
5. report( view )

CREATE OR REPLACE VIEW report1 AS
SELECT 
    c.classroom_id,
    c.year,
    c.section,
    AVG(TO_NUMBER(er.marks)) AS average_marks
FROM 
    classroom c
JOIN classroom_student cs ON c.classroom_id = cs.classroom_id
JOIN exam_result er ON cs.student_id = er.student_id
GROUP BY 
    c.classroom_id, c.year, c.section
ORDER BY 
    c.classroom_id;
desc report1;
select * from report1;
************************************************************
CREATE OR REPLACE VIEW report2 AS
SELECT 
    t.teacher_id,
    t.fname || ' ' || t.lname AS teacher_name,
    cr.course_id,
    cr.name AS course_name,
    g.grade_id,
    g.name AS grade_name
FROM 
    teacher t
JOIN classroom c ON t.teacher_id = c.teacher_id
JOIN grade g ON c.grade_id = g.grade_id
JOIN course cr ON g.grade_id = cr.grade_id
ORDER BY 
    t.teacher_id, cr.course_id;
desc report2;
select * from report2;
**************************************************************