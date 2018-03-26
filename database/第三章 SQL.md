DDL、DML、DCL？
##Struct Query Language（结构化查询语言）
    SQL是一个非过程化的、说明性的语言。
### 查询
一个典型的SQL query的格式如下
<pre>
select A1,A2,…,An
from r1,r2,…,rn
where P
</pre>

A1,A2,…,An是需要查询的列（域）
r1,r2,…,rn是所涉及到的表
P是条件
select对应的是选择操作
from对应的是**笛卡尔乘积**而不是自然连接！所以连接条件也要被包含在P中

Find the names of all instructors:
<pre>
select name
from instructor
</pre>
姓名是可能重复的，最终结果是否保留重复性，要考虑实际意义，缺省的情况下是保留重复的,相当于
<pre>
select all name
from instructor
</pre>

distnict关键字可以起到去重的作用
<pre>
select distinct name
from instructor
</pre>

*表示选择了所有的列（域）
<pre>
select *
from instructor
</pre>

as表示起别名
<pre>
select ID,name,salary/12
from instructor

select ID,name,salary/12 as monthly_salary
from instructor
</pre>

计算机学院的老师姓名
<pre>
select name
from instructor
where dept_name='Comp.Sci.'
</pre>

计算机学院年薪大于80000的老师姓名
<pre>
select name
from instructor
where dept_name='Comp.Sci' and salary>80000
</pre>

计算机学院年薪在[90000,100000]的老师姓名
<pre>
select name
from instructor
where salary between 90000 and 100000
</pre>

Tuple comparison
由于instructor和teaches两张表中都含有ID的列，所以为了避免二义性，在引用ID时，需要指明表（不管二义性是出现在select还是where中）
<pre>
select name,course_id
form instructor,teaches
where (instructor.ID,dept_name)=(teaches.ID,'Biology')
</pre>

###The rename Operation
自连接涉及到同一张表的数据的比较
重命名有两个好处
- 简化条件语句
- 便于自连接
重命名不会作用域表结构本身
<pre>
select distinct T.name
from instructor as T,instructor as S
where T.salary>S.salary and S.dept_name='Comp.Sci'
</pre>

###String Operation
模糊匹配：%表示匹配任意字符串，_表示匹配任意字符
<pre>
select name
from instructor
where name like '张%'
</pre>


### Ordering the display of Tuples
<pre>
select distict name
from instrutor
order by name
order by name desc
order by name asc
order by dept_name,name
</pre>

### 处理重复

###Set operations
union,intersect,except（缺省情况下，是去重的）
union all,intersect all,except all（不去重）

### Aggregate Functions（聚集函数）
<pre>
select avg(salary)
from instructor
where dept_name='Comp.Sci'
</pre>

<pre>
select count(distinct ID)
from teaches
where semester='Spring' and year=2010;
</pre>

###分组
<pre>
select dept_name,avg(salary) as avg_salary
from instructor
group by dept_name
</pre>
下面的语句是错误的，如果是group by语句，那么select中，只能出现group by中的属性或者聚集函数

<pre>
select dept_name,avg(salary) as avg_salary
from instructor
group by dept_name
</pre>

可以用having语句对分组进行筛选
<pre>
select dept_name,avg(salary)
from instructor
group by dept_name
having avg(salary)>42000
</pre>

###空值
<pre>
select name
from instructor
where salary is null
where salary is not null
</pre>

 