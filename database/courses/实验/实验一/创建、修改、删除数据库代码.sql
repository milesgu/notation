-- 创建数据库
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

-- 修改数据库(大小等)
ALTER DATABASE student_class_database  
MODIFY FILE  
    (NAME = student_class_data,  
        SIZE = 6MB);  

-- 查询数据库文件大小
USE student_class_database;   
GO    
SELECT file_id, name, type_desc, physical_name, size, max_size    
FROM sys.database_files ;

-- 删除数据库
USE master  
GO  
DROP DATABASE student_class_database  
  
