USE student_class_database;   
GO
CREATE VIEW sc_name2
AS
SELECT s.student_name, c.course_name  
FROM student as s,student_course as sc,course as c
WHERE s.student_id=sc.student_id and sc.course_id=c.course_id;
GO  
-- Query the view  
-- SELECT FirstName, LastName, HireDate  
-- FROM HumanResources.EmployeeHireDate  
-- ORDER BY LastName; 
ALTER VIEW student_class_database 
AS  
SELECT s.student_name, c.course_name    
FROM student as s,student_course as sc,course as c
WHERE s.student_id=sc.student_id and sc.course_id=c.course_id and s.student_name='李*';
GO  