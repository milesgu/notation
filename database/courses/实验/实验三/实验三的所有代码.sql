--查询班号为g00401班的学生的学号和姓名
select student_id,student_name
from student
where class_id='g00401'

--查询“SQL Server数据库开发技术”课程的学分
select credit
from course
where course_name='SQL Server数据库开发技术'

--查询选修了课程编号为“dep04_s003”的学生的学号和成绩，并将成绩按降序输出
select student_id,grade
from student_course
where course_id='dep04_s003'
order by grade DESC

--查询学号为“g9940205”的学生选修的课程号和成绩
select course_id,grade
from student_course
where student_id='g9940205'
order by grade ASC

--查询选修了课程编号为“dep04_s001”且成绩高于85分的学生的学号和成绩
select student_id,grade
from student_course
where course_id='dep04_s001' and grade>85

--查询选修了课程编号为“dep04_s002”且成绩高于85分的学生的学号、姓名和成绩
select SC.student_id,S.student_name,SC.grade
from student AS  S,student_course AS SC
where course_id='dep04_s002' and grade>85 and SC.student_id=S.student_id

--查询所有学生的学号、姓名、选修的课程名称和成绩
select S.student_id,S.student_name,C.course_name,SC.grade
from student AS  S, student_course AS SC, course AS C
where S.student_id=SC.student_id and C.course_id=SC.course_id
order by student_id ASC

--查询计算机科学系林红同学选修的课程名称、学分和成绩,考试成绩>＝60有学分，否则无学分。
select C.course_name,grade,cridit=case when SC.grade>=60 then SC.credit else 0 end  
from student AS  S, student_course AS SC, course AS C  
where S.student_id=SC.student_id and C.course_id=SC.course_id and S.student_name='林红'  

select C.course_name,SC.grade,SC.credit  
from student AS  S, student_course AS SC, course AS C    
where S.student_id=SC.student_id and C.course_id=SC.course_id and S.student_name='林红'   

--查询至少选修了三门课程的学生的学号和姓名
select S.student_id,S.student_name,course_number=COUNT(SC.course_id)
from student_course as SC,student as S
where S.student_id=SC.student_id
group by S.student_id,S.student_name
having COUNT(SC.course_id)>=3

select S.student_id,S.student_name,course_number=COUNT(SC.course_id)
from student_course as SC,student as S
where S.student_id=SC.student_id
group by S.student_id,S.student_name
having COUNT(SC.course_id)>=3

--查询选修课程号为“dep04_b001”的学生的平均成绩
select grade=cast(AVG(cast(SC.grade as float)) as numeric(5,2))  
from student_course AS SC  
where SC.course_id='dep04_b001'  

--查询所有学生的学号和他选修课程的最高成绩，要求他的选修课程中没有成绩为空的
select student_id,max_grade=MAX(grade)
from student_course
group by student_id
having COUNT(*)=COUNT(grade)

--查询严为老师2001/2002学年所授“软件开发技术”课程的最高成绩及此学生的学号、姓名、班级
with target_course_id as(
	select C.course_id
	from teacher_course_class AS TCC, teacher as T, course as C
	where TCC.teacher_id=T.teacher_id and TCC.course_id=C.course_id and 
		  T.teacher_name='严为' and C.course_name='软件开发技术' and
		  TCC.school_year='2001/2002'
)

select S.student_id,S.student_name,S.class_id
from student_course as SC, student as S
where SC.student_id=S.student_id and SC.school_year='2001/2002' and SC.course_id=(select * from target_course_id) and SC.grade>=(
	select MAX(grade)
	from student_course as TSC
	where TSC.school_year='2001/2002' and TSC.course_id=(select * from target_course_id)
)

--查询数据库开发技术课程用过的教材名称，作者和出版社
select B.book_name, B.author, B.publish_company
from book as B, course as C
where B.book_id=C.book_id and C.course_name='SQL Server数据库开发技术'

--查询计算机科学系讲授过“JAVA程序设计与开发”的老师姓名和职称
with target_departement_id as(
	select department_id
	from department
	where department_name='计算机科学'
)

select T.teacher_name,T.profession
from teacher_course_class as TCC, teacher as T, course as C
where T.department_id=(select * from target_departement_id) and TCC.teacher_id=T.teacher_id and
	  TCC.course_id=C.course_id and C.course_name='JAVA程序设计与开发'

--查询选修了“计算机基础”的学生的学号和姓名
select S.student_id,S.student_name
from student_course as SC, student as S
where SC.student_id=S.student_id and SC.course_id=(
	select course_id
	from course
	where course_name='计算机基础'
)

--查询没有选修 “计算机基础”的学生的学号和姓名
select S.student_id, S.student_name
from student as S
except
select S.student_id, S.student_name
from student_course as SC, student as S
where SC.student_id=S.student_id and SC.course_id=(
	select course_id
	from course
	where course_name='计算机基础'
)

--查询至少选修了学号为“g9940201”的学生所选修的所有课程的学生的学号和姓名
select distinct S.student_id, S.student_name
from student_course as SC, student as S
where SC.student_id=S.student_id and
not exists(
	select TSC.course_id
	from student_course as TSC
	where TSC.student_id='g9940201'
	except
	select TTSC.course_id
	from student_course as TTSC
	where TTSC.student_id=SC.student_id
)

--建立视图，包含以下信息
--学生学号、姓名、所在系、授课老师姓名、课程名称、课程教材名称、出版社、学分、选课成绩

USE student_class_database; 
GO 

CREATE VIEW my_view
AS 
SELECT S.student_id, S.student_name, D.department_name, T.teacher_name, CO.course_name, B.book_name, B.publish_company, SC.credit, SC.grade
FROM student as S, class as CL, department as D, student_course as SC, teacher as T, teacher_course_class as TCC, course as CO, book as B
WHERE S.student_id=SC.student_id and SC.course_id=CO.course_id and SC.course_id=TCC.course_id and S.class_id=CL.class_id and 
      S.class_id=TCC.class_id and CL.department_id=D.department_id and CO.book_id=B.book_id and TCC.teacher_id=T.teacher_id
GO



CREATE VIEW my_view
AS
SELECT S.student_id, S.student_name, D.department_name, T.teacher_name, CO.course_name, B.book_name, B.publish_company, SC.credit, SC.grade
FROM student as S join student_course as SC on S.student_id=SC.student_id
                  join course as CO on SC.course_id=CO.course_id
                  join book as B on CO.book_id=B.book_id
                  join class as CL on S.class_id=CL.class_id
                  join department as D on CL.department_id=D.department_id
                  left outer join teacher_course_class as TCC on SC.course_id=TCC.course_id and TCC.class_id=CL.class_id
                  left outer join teacher as T on TCC.teacher_id=T.teacher_id
GO

--修改以上视图，增加学生所在班级信息
ALTER VIEW my_view
AS
SELECT S.student_id, S.student_name, CL.class_id, D.department_name, T.teacher_name, CO.course_name, B.book_name, B.publish_company, SC.credit, SC.grade
FROM student as S join student_course as SC on S.student_id=SC.student_id
                  join course as CO on SC.course_id=CO.course_id
                  join book as B on CO.book_id=B.book_id
                  join class as CL on S.class_id=CL.class_id
                  join department as D on CL.department_id=D.department_id
                  left outer join teacher_course_class as TCC on SC.course_id=TCC.course_id and TCC.class_id=CL.class_id
                  left outer join teacher as T on TCC.teacher_id=T.teacher_id
GO

--查询选修了计算机基础的学生的学号和成绩
select student_id,grade
from my_view
where course_name='计算机基础'


--查询所有学生的学号、姓名、选修的课程名称和成绩
select distinct student_id,student_name,course_name,grade
from my_view


--查询选修了乔红老师课程的学生的学号和姓名、课程名称
select student_id,student_name,course_name
from my_view
where teacher_name='乔红'

