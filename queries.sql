-- Add alumn question
exec AddQuestionAlumn 1, 1
exec AddQuestionAlumn 1, 6
exec AddQuestionAlumn 1, 13
exec AddQuestionAlumn 1, 17
exec AddQuestionAlumn 1, 20
exec AddQuestionAlumn 1, 22
exec AddQuestionAlumn 1, 26
exec AddQuestionAlumn 1, 31
exec AddQuestionAlumn 1, 36
exec AddQuestionAlumn 1, 42

exec AddQuestionAlumn 2, 1
exec AddQuestionAlumn 2, 9
exec AddQuestionAlumn 2, 15
exec AddQuestionAlumn 2, 17
exec AddQuestionAlumn 2, 20
exec AddQuestionAlumn 2, 22
exec AddQuestionAlumn 2, 28
exec AddQuestionAlumn 2, 35
exec AddQuestionAlumn 2, 36
exec AddQuestionAlumn 2, 42

exec AddQuestionAlumn 3, 1
exec AddQuestionAlumn 3, 9
exec AddQuestionAlumn 3, 14
exec AddQuestionAlumn 3, 17
exec AddQuestionAlumn 3, 20
exec AddQuestionAlumn 3, 22
exec AddQuestionAlumn 3, 26
exec AddQuestionAlumn 3, 33
exec AddQuestionAlumn 3, 36
exec AddQuestionAlumn 3, 41

-- Get result alumn
select * from Answers where IdStudentCourseExamn=1 
select * from Answers where IdStudentCourseExamn=2
select * from Answers where IdStudentCourseExamn=3

-- Get review
-- If the student failed less than 50% TimeForReview is 1 days, if the student did more than 80% correctly is 5 days
-- otherwise it is 2 days
exec SaveResults 1
select * from ScheduleForReview where IdStudentCourseExamn = 1

exec SaveResults 2
select * from ScheduleForReview where IdStudentCourseExamn = 2

exec SaveResults 3
select * from ScheduleForReview where IdStudentCourseExamn = 3

select * from ScheduleForReview

-- Most failed topics
select * from FailedTopics


