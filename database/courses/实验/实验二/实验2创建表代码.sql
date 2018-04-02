use student_class_database;
go
create table book(
    book_id varchar(20) not null,
    book_name varchar(50) not null,
    publish_company varchar(50) not null,
    author varchar(10) not null,
    price decimal(5,1),
    primary key(book_id)
);
go

create table course(
    course_id varchar(20) not null,
    course_name varchar(50) not null,
    book_id varchar(20),
    total_perior smallint not null,
    week_perior smallint not null,
    credit tinyint,
    primary key(course_id)
);
go

create table class(
    class_id varchar(10) not null,
    monitor varchar(10),
    classroom varchar(20) not null,
    department_id varchar(10) not null,
    primary key(class_id)
);
go

create table class_course(
    class_id varchar(10) not null,
    course_id varchar(20) not null,
    primary key(class_id,course_id)
);
go

create table department(
    department_id varchar(10) not null,
    department_name varchar(50) not null,
    department_header varchar(10),
    teacher_num smallint,
    primary key(department_id)
);
go

create table student(
    student_id varchar(10) not null,
    student_name varchar(10) not null,
    sex varchar(2) not null,
    birth date,
    class_id varchar(10) not null,
    entrance_date date not null,
    home_addr varchar(200),
    primary key(student_id)
);
go

create table student_course(
    course_id varchar(20) not null,
    student_id varchar(10) not null,
    grade tinyint,
    credit tinyint not null,
    semester tinyint not null,
    school_year varchar(10) not null,
    primary key(course_id,student_id)
);
go

create table teacher(
    teacher_id varchar(10) not null,
    teacher_name varchar(10) not null,
    sex varchar(2) not null,
    birth date,
    department_id varchar(10) not null,
    profession varchar(10) not null,
    telephone varchar(15,0) not null,
    home_addr varchar(200),
    postalcode varchar(10),
    primary key(teacher_id)
);
go

create table teacher_course_class(
    teacher_id varchar(10) not null,
    course_id varchar(20) not null,
    class_id varchar(10) not null,
    semester tinyint not null,
    school_year varchar(10) not null,
    course_schedule decimal(10,0) not null,
    course_classroom varchar(10) not null,
    book_id varchar(20),
    primary key(teacher_id,course_id,class_id)
);
go