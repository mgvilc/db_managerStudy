drop database db_ManagerStudy
go
create database db_ManagerStudy
go
use db_ManagerStudy

-- Students table
create table Student (
	Id			int identity(1,1),
	Name		varchar(20),
	LastName	varchar(60),
	primary key (Id)
)

-- Course table
create table Course (
	Id			int identity(1,1),
	Name		varchar(60),
	primary key (Id)
)

-- Teacher table
create table Teacher (
	Id			int identity(1,1),
	Name		varchar(20),
	LastName	varchar(60),
	primary key (Id)
)

-- Professors teaching a course
create table TeacherCourse (
	IdTeacherCourse			int identity(1,1),
	IdTeacher				int,
	IdCourse				int,
	primary key (IdTeacherCourse),
	foreign key (IdTeacher) REFERENCES Teacher(Id),
	foreign key (IdCourse) REFERENCES Course(Id)
)

-- Students studying a course
create table StudentCourse (
	Id						int identity(1,1),
	IdStudent				int,
	IdCourse				int,
	Grade1					float default 0,
	Grade2					float default 0,
	Grade3					float default 0,
	Grade4					float default 0,
	Final					float default 0,
	primary key (Id),
	foreign key (IdStudent) REFERENCES Student(Id),
	foreign key (IdCourse) REFERENCES Course(Id)
)

-- Table professional school
create table ProfessionalSchool (
	Id			int identity(1,1),
	Name		varchar(20),
	primary key (Id)
)

-- Table Career
create table Career (
	Id						int identity(1,1),
	Name					varchar(60),
	IdProfessionalSchool	int,
	primary key (Id),
	foreign key (IdProfessionalSchool) REFERENCES ProfessionalSchool(Id)
)

-- Table semester
create table Semester (
	Id					int identity(1,1),
	IdCareer			int,
	IdCourse			int,
	primary key (Id),
	foreign key (IdCareer) REFERENCES Career(Id),
	foreign key (IdCourse) REFERENCES Course(Id)
)

-- Table subject
create table Subject (
	Id			int identity(1,1),
	Name		varchar(60),
	IdCourse	int,
	primary key (Id),
	foreign key (IdCourse) REFERENCES Course(Id),
)

-- Exam for a specific course
create table Examn (
	Id				int identity(1,1),
	Title			varchar(60),
	LimitTime		tinyint,
	IdSubject		int,
	primary key (Id),
	foreign key (IdSubject) REFERENCES Subject(Id)
)

-- Student taking a course exam
create table StudentCourseExamn (
	Id				int identity(1,1),
	IdStudentCourse	int,
	IdExamn			int,
	Date			date,
	primary key (Id),
	foreign key (IdExamn) REFERENCES Examn(Id),
	foreign key (IdStudentCourse) REFERENCES StudentCourse(Id)
)	

-- Questions about a topic
create table ExamnQuestion (
	Id			int identity(1,1),
	Question	varchar(100),
	IdSubject	int,
	primary key (Id),
	foreign key (IdSubject) REFERENCES Subject(Id)
)

-- Answer keys for all questions
create table ExamnAlternatives (
	Id				int identity(1,1),
	IdExamnQuestion	int,
	Alternative		char(1),
	isCorrect		bit,
	primary key (Id),
	foreign key (IdExamnQuestion) REFERENCES ExamnQuestion(Id)
)

-- Answers from a student
create table Answers (
	Id							int identity(1,1),
	IdStudentCourseExamn		int,
	IdAnswerAlumn				int,
	isCorrect					bit,
	primary key (Id),
	foreign key (IdStudentCourseExamn) REFERENCES StudentCourseExamn(Id)
)

-- Schedule review time
create table ScheduleForReview (
	Id							int identity(1,1),
	IdStudentCourseExamn		int,
	TimeForReview				tinyint
)