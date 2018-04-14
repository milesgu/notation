增加class_id为g99401的课程记录，要求所有课程都和班级g99402一样；
然后删除class_id为g99402的所有记录；
最后将class_id为g99403的记录的class_id改为g99402。

--创建数据库的代码
create database student_class_database    
on primary    
(    
    name=student_class_data,    //存放数据的主文件
    filename='C:\Users\16417\Desktop\SQL\student_class_database.mdf',    
    size=3mb,    --文件初始大小为3MB
    maxsize=30mb,    --文件大小上限为30MB
    filegrowth=3mb    --文件每次增量为3MB
)    
log on    
(    
    name=student_class_log,    //日志文件
    filename='C:\Users\16417\Desktop\SQL\student_class_database_log.ldf',   
    size=1mb,    
    maxsize=10mb,    
    filegrowth=1mb    
);    

--创建class_course表
create table class_course(
    class_id varchar(10) not null,
    course_id varchar(20) not null,
    primary key(class_id,course_id)
);
go

--导入class_course表
INSERT INTO class_course  
SELECT *  
FROM OPENROWSET('MICROSOFT.JET.OLEDB.4.0', 'EXCEL 5.0;HDR=YES;DATABASE=C:\Users\16417\Desktop\notation\database\courses\实验\实验二\数据\class_course.xls', sheet1$)  
go

--显示class_course表中的所有记录
SELECT *
FROM class_course

--增加class_id为g99401的课程记录，要求所有课程都和班级g99402一样
USE student_class_database  
INSERT INTO class_course(class_id,course_id)(  
    SELECT 'g99401',T.course_id  
    FROM class_course AS T  
    WHERE T.class_id='g99402'  
);
SELECT *
FROM class_course

--删除class_id为g99402的所有记录；
DELETE FROM class_course  
WHERE class_id='g99402';
SELECT *
FROM class_course

--将class_id为g99403的记录的class_id改为g99402。
UPDATE class_course  
SET class_id='g99402'  
WHERE class_id='g99403'
SELECT *
FROM class_course

