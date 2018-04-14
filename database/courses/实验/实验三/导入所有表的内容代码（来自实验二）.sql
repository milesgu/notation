use student_class_database
go

INSERT INTO book  
SELECT *  
FROM OPENROWSET('MICROSOFT.JET.OLEDB.4.0', 'EXCEL 5.0;HDR=YES;DATABASE=C:\Users\16417\Desktop\notation\database\courses\实验\实验二\数据\book.xls', sheet1$)  
go

INSERT INTO class
SELECT *  
FROM OPENROWSET('MICROSOFT.JET.OLEDB.4.0', 'EXCEL 5.0;HDR=YES;DATABASE=C:\Users\16417\Desktop\notation\database\courses\实验\实验二\数据\class.xls', sheet1$)  
go

INSERT INTO class_course  
SELECT *  
FROM OPENROWSET('MICROSOFT.JET.OLEDB.4.0', 'EXCEL 5.0;HDR=YES;DATABASE=C:\Users\16417\Desktop\notation\database\courses\实验\实验二\数据\class_course.xls', sheet1$)  
go

INSERT INTO course
SELECT *  
FROM OPENROWSET('MICROSOFT.JET.OLEDB.4.0', 'EXCEL 5.0;HDR=YES;DATABASE=C:\Users\16417\Desktop\notation\database\courses\实验\实验二\数据\course.xls', sheet1$)  
go

INSERT INTO department  
SELECT *  
FROM OPENROWSET('MICROSOFT.JET.OLEDB.4.0', 'EXCEL 5.0;HDR=YES;DATABASE=C:\Users\16417\Desktop\notation\database\courses\实验\实验二\数据\department.xls', sheet1$)  
go

INSERT INTO student  
SELECT *  
FROM OPENROWSET('MICROSOFT.JET.OLEDB.4.0', 'EXCEL 5.0;HDR=YES;DATABASE=C:\Users\16417\Desktop\notation\database\courses\实验\实验二\数据\student.xls', sheet1$)  
go

INSERT INTO student_course
SELECT *  
FROM OPENROWSET('MICROSOFT.JET.OLEDB.4.0', 'EXCEL 5.0;HDR=YES;DATABASE=C:\Users\16417\Desktop\notation\database\courses\实验\实验二\数据\student_course.xls', sheet1$)  
go

INSERT INTO teacher
SELECT *  
FROM OPENROWSET('MICROSOFT.JET.OLEDB.4.0', 'EXCEL 5.0;HDR=YES;DATABASE=C:\Users\16417\Desktop\notation\database\courses\实验\实验二\数据\teacher.xls', sheet1$)  
go

INSERT INTO teacher_course_class
SELECT *  
FROM OPENROWSET('MICROSOFT.JET.OLEDB.4.0', 'EXCEL 5.0;HDR=YES;DATABASE=C:\Users\16417\Desktop\notation\database\courses\实验\实验二\数据\teacher_course_class.xls', sheet1$)  
go
