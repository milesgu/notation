-- department表操作SQL语句
use student_class_database

UPDATE department SET teacher_num=100 
WHERE department_header='王敬远';

DELETE FROM department 
WHERE department_name='通信与信息工程'

INSERT INTO department 
VALUES('dep_02','通信与信息工程','王杰',99);

select *
from department;

-- student表操作SQL语句
use student_class_database

INSERT INTO student 
VALUES('g9940201','张伟','男','1980-09-22',
'g990402','1999-09-01','上海市南京路206号');

DELETE FROM student WHERE student_name='李红[大]';

UPDATE student SET student_name='李红' 
WHERE student_name='李红[小]';

select *
from student;

-- student_course表操作SQL语句
use student_class_database

INSERT INTO student_course 
VALUES('dep04_b001','g9940208',NULL,4,0,'1999/2000');

DELETE FROM student_course 
WHERE student_id='g9940205' and semester = 1;

UPDATE student_course SET grade=90 
WHERE student_id='g9940201' and course_id='dep04_s001';

select *
from student_course;

-- teacher表操作SQL语句
use student_class_database

UPDATE teacher SET profession='副教授' 
WHERE teacher_id='dep04_005';

DELETE FROM teacher 
WHERE teacher_id='dep04_004';

INSERT INTO teacher 
VALUES('dep01_002','严为','男','1978/09/01',
'dep_01','助教','7654987','南京鼓楼区长虹路3号','210002');

select *
from teacher

-- teacher_course_class表操作SQL语句
use student_class_database

UPDATE teacher_course_class 
SET course_classroom='教学楼203' 
WHERE course_classroom='教学楼211';

DELETE FROM teacher_course_class
WHERE school_year='1999/2000';

INSERT INTO teacher_course_class VALUES('dep04_002','dep04_j001','g99402',1,'1999/2000','110320234','教学楼303','dep04_j001_01');

select *
from teacher_course_class


