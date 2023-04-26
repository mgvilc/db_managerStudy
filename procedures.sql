create function VerificaRespuesta (@IdAnswerAlumn	int)
returns bit
as
begin
	declare @answer	bit
	select @answer = isCorrect from ExamnAlternatives where Id = @IdAnswerAlumn 
	return @answer
end

go

create procedure AddQuestionAlumn (
	@IdStudentCourseExamn	int,
	@AnswerAlumn			int
)
as
begin
	insert into Answers values(@IdStudentCourseExamn, @AnswerAlumn,dbo.VerificaRespuesta(@AnswerAlumn))
end

go

create procedure SaveResults (
	@IdStudentCourseExamn	int
)
as
begin
	declare @correct			tinyint
	select @correct = sum(cast(Answers.isCorrect as tinyint)) from Answers
	where IdStudentCourseExamn = @IdStudentCourseExamn
	group by IdStudentCourseExamn

	if @correct > 8
	begin
		insert into ScheduleForReview values(@IdStudentCourseExamn,5)
	end
	else
	begin
		if @correct > 5
		begin
			insert into ScheduleForReview values(@IdStudentCourseExamn,2)
		end
		else
		begin
			insert into ScheduleForReview values(@IdStudentCourseExamn,1)
		end
	end
end
	
go

create view FailedTopics 
as
select S.Name, count(S.Name) as Failed from Answers as A, StudentCourseExamn as SC, Examn as E, Subject as S 
where A.IdStudentCourseExamn = SC.Id 
and SC.IdExamn = E.Id
and E.IdSubject = S.Id
and A.isCorrect = 0
group by S.Name







