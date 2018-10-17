Name: Chenyang Li
Course: CS579
Due Date: 11/07/2017
Submission Date: 11/07/2017


create table student(
     Student_ID int     NOT NULL,
     FName varchar(15) NOT NULL,
     LName varchar(15) NOT NULL,
     Deg_code int       NOT NULL,
     PRIMARY KEY (Student_ID),
     CONSTRAINT STFK
         FOREIGN KEY (Deg_code) REFERENCES degree(Deg_code)
                      ON DELETE CASCADE   
    );
create table transcript (
     Student_ID int NOT NULL,
     Course_no int NOT NULL,
     Semester varchar(15),
     Year int,
     Grade real,
     PRIMARY KEY (Student_ID, Course_no, Semester, Year),
     CONSTRAINT TRANSFK1
     FOREIGN KEY (Student_ID) REFERENCES student(Student_ID)
                  ON DELETE CASCADE,
     CONSTRAINT TRANSFK2
     FOREIGN KEY (Course_no) REFERENCES course(Course_no)
                  ON DELETE CASCADE
     );
create table course(
     Course_no int NOT NULL,
     Course_name varchar(50) NOT NULL,
     Description char(50),
     PRIMARY KEY (Course_no),
     UNIQUE (Course_name)
);
create table concentration(
     Conc_code int NOT NULL,
     Conc_name varchar(50) NOT NULL,
     Description char(50),
     Deg_code int NOT NULL,
     PRIMARY KEY (Conc_code),
     CONSTRAINT CONCENFK
     FOREIGN KEY (Deg_code) REFERENCES degree(Deg_code)
                  ON DELETE CASCADE
);
create table student_concentration(
     Student_ID int NOT NULL,
     Conc_code int NOT NULL,
     PRIMARY KEY (Student_ID, Conc_code),
     CONSTRAINt STCONCEFK1
     FOREIGN KEY (Student_ID) REFERENCES student(Student_ID)
                 ON DELETE CASCADE,
     CONSTRAINT STCONCEFK2
     FOREIGN KEY (Conc_code) REFERENCES concentration(Conc_code)
                 ON DELETE CASCADE
);
create table prerequisite(
     Course int NOT NULL,
     Prereq int NOT NULL,
     PRIMARY KEY (Course, Prereq),
     CONSTRAINT PREFK1
     FOREIGN KEY (Course) REFERENCES course(Course_no)
                 ON DELETE CASCADE,
     CONSTRAINT PREFK2
     FOREIGN KEY (Prereq) REFERENCES course(Course_no)
                 ON DELETE CASCADE
);
create table concentration_course(
     Conc_code int NOT NULL,
     Course_no int NOT NULL,
     Type varchar(15),
     PRIMARY KEY (Conc_code, Course_no),
     CONSTRAINT CONCOUFK1
     FOREIGN KEY (Conc_code) REFERENCES concentration(Conc_code)
                 ON DELETE CASCADE,
     CONSTRAINT CONCOUFK2
     FOREIGN KEY (Course_no) REFERENCES course(Course_no)
                 ON DELETE CASCADE
);
create table degree(
     Deg_code int NOT NULL,
     Deg_name varchar(15) NOT NULL,
     Description char(200),
     PRIMARY KEY (Deg_code)
);
create table degree_course(
     Deg_code int NOT NULL,
     Course_no int NOT NULL,
     Type varchar(15),
     PRIMARY KEY (Deg_code, Course_no),
     CONSTRAINT DEGCOUFK1
     FOREIGN KEY (Deg_code) REFERENCES degree(Deg_code)
                 ON DELETE CASCADE,
     CONSTRAINT DEGCOUFK2
     FOREIGN KEY (Course_no) REFERENCES course(Course_no)
                 ON DELETE CASCADE
);



insert into course
values('535','Computer Networks','MSCS Core course');

insert into course
values('579','Database Management','MSCS Core course');

insert into course
values('566','Analysis of Algorithms','MSCS Core course');

insert into course
values('575','Operating Systems','MSCS Core course');

insert into course
values('662','OComputer Language Theory','MSCS Core course');

insert into course
values('673','Software Engineering','MSCS Core course');

insert into course
values('532','Computer Graphics','MSCS Elective course');

insert into course
values('664','Artificial Intelligence','MSCS Elective course');

insert into course
values('665','Software Design and Patterns','MSCS Elective course');

insert into course
values('683','Mobile Application Development','MSCS Elective course');

insert into course
values('699','Data Mining and Business Intelligence','MSCS Elective course');

insert into course
values('701','Rich Internet Application Development','MSCS Elective course');

insert into course
values('767','Fuzzy, Expert, Genetic, and Neural Systems','MSCS Elective course');

insert into course
values('773','Software Quality Management','MSCS Elective course');

insert into course
values('690','Network Security','MSCS Elective course');

insert into course
values('695','Enterprise Information Security','MSCS Elective course');

insert into course
values('789','Cryptography','MSCS Elective course');

insert into course
values('599','Biometrics','MSCS Elective course');

insert into course
values('693','Digital Forensics and Investigations','MSCS Elective course');

insert into course
values('703','Network Forensics','MSCS Elective course');

insert into course
values('713','Advanced Digital Forensics','MSCS Elective course');

insert into course
values('635','Network Design and Implementation','MSCS Elective course');

insert into course
values('685','Network Design and Management','MSCS Elective course');

insert into course
values('775','Advanced Networking','MSCS Elective course');

insert into course
values('520','Information Structures','MSCIS Core course');

insert into course
values('546','Quantitative Methods for Information Systems','MSCIS Core course');

insert into course
values('625','Business Data Communication and Networks','MSCIS Core course');

insert into course
values('669','Database Design and Implementation for Business','MSCIS Core course');

insert into course
values('682','Information Systems Analysis and Design','MSCIS Core course');

insert into course
values('782','IT Strategy and Management','MSCIS Core course');

insert into course
values('779','Advanced Database Management','MSCIS Elective course');

insert into course
values('674','Database Security','MSCIS Elective course');

insert into course
values('689','Designing and Implementing a Data Warehouse','MSCIS Elective course');

insert into course
values('780','Database Administration','MSCIS Elective course');

insert into course
values('601','Web Application Development','MSCIS Elective course');

insert into course
values('633','Distributed Software Development and Management','MSCIS Elective course');

insert into course
values('651','Web Development with .NET','MSCIS Elective course');

insert into course
values('667','Enterprise Java','MSCIS Elective course');

insert into course
values('783','Enterprise Architecture','MSCIS Elective course');

insert into degree
values('1','MSCS','A program for computer professionals and those who intend to
move into the computer field from other areas of study.');

insert into degree
values('2','MSCIS','Designed for students who wish to combine technical 
competence in information systems with knowledge of managerial and organizational issues.');

insert into concentration
values('1','Security','MSCS','1');

insert into concentration
values('2','Computer Networks','MSCS','1');

insert into concentration
values('3','Computer Networks','MSCIS','2');

insert into concentration
values('4','Database Management and Business Intelligence','MSCIS','2');

insert into concentration
values('5','Web Application Development','MSCIS','2');

insert into concentration_course
values('1','690','Core');

insert into concentration_course
values('1','695','Core');

insert into concentration_course
values('1','789','Core');

insert into concentration_course
values('1','599','Elective');

insert into concentration_course
values('1','693','Elective');

insert into concentration_course
values('1','703','Elective');

insert into concentration_course
values('1','713','Elective');

insert into concentration_course
values('2','635','Core');

insert into concentration_course
values('2','685','Core');

insert into concentration_course
values('2','690','Core');

insert into concentration_course
values('2','775','Core');

insert into concentration_course
values('3','635','Core');

insert into concentration_course
values('3','690','Core');

insert into concentration_course
values('3','695','Core');

insert into concentration_course
values('3','775','Core');

insert into concentration_course
values('4','699','Core');

insert into concentration_course
values('4','779','Core');

insert into concentration_course
values('4','674','Elective');

insert into concentration_course
values('4','689','Elective');

insert into concentration_course
values('4','780','Elective');

insert into concentration_course
values('5','601','Core');

insert into concentration_course
values('5','701','Core');

insert into concentration_course
values('5','633','Elective');

insert into concentration_course
values('5','651','Elective');

insert into concentration_course
values('5','667','Elective');

insert into concentration_course
values('5','783','Elective');

insert into student
values('123456789','John','Smith','1');

insert into student
values('123456788','Sam','Kel','1');

insert into student
values('123456888','Tom','King','1');

insert into transcript
values('123456789','546','Spring','2014',4.0);

insert into transcript
values('123456789','579','Spring','2014',4.0);

insert into transcript
values('123456789','699','Spring','2015',NULL);

insert into prerequisite
values('579','546');

insert into prerequisite
values('699','579');

insert into degree_course
values('1','535', 'Core');

insert into degree_course
values('2','520', 'Core');

insert into degree_course
values('2','546', 'Core');

insert into degree_course
values('2','625', 'Core');

insert into degree_course
values('2','669', 'Core');

insert into degree_course
values('2','682', 'Core');

insert into degree_course
values('2','782', 'Core');

insert into student_concentration
values('123456789','1');




a.
select course.Course_no, course.Course_name, transcript.Grade
from student, transcript, course
where student.FName = 'John' and student.LName = 'Smith' 
and transcript.Semester = 'Spring' and transcript.Year = '2014' 
and transcript.Course_no = course.Course_no and transcript.Student_ID = transcript.Student_ID;
b.
select Conc_name
from concentration
where description = 'MSCS';
c.
select Course_no, Course_name
from course, prerequisite
where Course_no = Course and Prereq = '546';
d.
select course.Course_no, course.Course_name,concentration_course.Type
from course, concentration, concentration_course
where concentration_course.conc_code = concentration.conc_code and concentration_course.Course_no = course.Course_no
and concentration.Conc_name = 'Web Application Development';













