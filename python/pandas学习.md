##pandas
全称python data analysis library，是基于Numpy的一种工具，该工具是为了解决数据分析任务而创建的
pandas提供了大量能使我们方便快捷的进行数据分析的函数和方法

以下内容主要根据http://codingpy.com/article/a-quick-intro-to-pandas/进行学习

###数据结构
####Series：
一维数组，与Numpy中的一维array类似。二者与Python基本的数据结构List也很相近，其区别是：List中的元素可以是不同的数据类型，而Array和Series中则只允许存储相同的数据类型，这样可以更有效的使用内存，提高运算效率。
**我试了一下，Series中可以存储不同的数据类型？**
series 是一种一维的数据类型，其中的**每个元素都有各自的标签**。你可以把它当作一个由带标签的元素组成的 numpy 数组。标签可以是数字或者字符。

####DataFrame：
二维的表格型数据结构，可以将DataFrame理解为Series的容器。
dataframe 可以储存许多不同类型的数据，并且每个轴都有标签。你可以把它当作一个 series 的字典。

####Panel:
三维的数组，可以理解为DataFrame的容器。

###读入数据
通常都读入csv格式的数据
```df=pd.read_csv('xxx.csv',header=0,encoding='utf8')```
xxx是csv文件名，后两个参数都是可选的，header=n指定哪一行是head标签，默认就是0；

### head和tail
```df.head(n)```读出前n行数据
```df.tail(n)```读出最后n行数据

### 自己创建一个dataframe
<pre>
data=[[1,2,3],[4,5,6]]
index=[0,1]
columns=['a','b','c']
df=pd.DataFrame(data,index,columns)
</pre>
其中data就是二维的数据，以python中二维列表的形式给出；index是行索引，可以是数字，也可以是字符串。

### 获取dataframe的某一行
pandas提供了iloc,loc,ix三种方法
#### loc
##### df.loc[i] 获取第i行（因为标签本身就是整数）
<pre>
import pandas as pd  
data = [[1,2,3],[4,5,6]]  
index = [0,1]  
columns=['a','b','c']  
df = pd.DataFrame(data=data, index=index, columns=columns)  
print (df.loc[1])  
''''' 
a    4 
b    5 
c    6 
'''  
</pre>

##### loc[‘d’]表示索引的是第’d’行（标签是字符）
<pre>
import pandas as pd  
data = [[1,2,3],[4,5,6]]  
index = ['d','e']  
columns=['a','b','c']  
df = pd.DataFrame(data=data, index=index, columns=columns)  
print (df.loc['d'])
''''' 
a    1 
b    2 
c    3 
'''  
</pre>

##### 可以有多行的行索引是一样的，索引结果也是多行
<pre>
import pandas as pd  
data = [[1,2,3],[4,5,6]]  
index = ['d','d']  
columns=['a','b','c']  
df = pd.DataFrame(data=data, index=index, columns=columns)  
print (df.loc['d'])  
''''' 
  a b c
d 1 2 3
d 4 5 6
'''  
</pre>

##### 也可以通过“:”范围的形式获取多个索引不同的行
<pre>
import pandas as pd  
data = [[1,2,3],[4,5,6]]  
index = ['d','e']  
columns=['a','b','c']  
df = pd.DataFrame(data=data, index=index, columns=columns)  
print (df.loc['d':])  
''''' 
   a  b  c 
d  1  2  3 
e  4  5  6 
'''  
</pre>

##### loc扩展——索引某行某列
<pre>
import pandas as pd  
data = [[1,2,3],[4,5,6]]  
index = ['d','e']  
columns=['a','b','c']  
df = pd.DataFrame(data=data, index=index, columns=columns)  
print df.loc['d',['b','c']]  
''''' 
b    2 
c    3 
'''
</pre>

##### loc扩展——索引某列（即行是所有的，用一个":"即可解决）（获取列还有更好的方式）
<pre>
import pandas as pd  
data = [[1,2,3],[4,5,6]]  
index = ['d','e']  
columns=['a','b','c']  
df = pd.DataFrame(data=data, index=index, columns=columns)  
print df.loc[:,['c']]  
''''' 
   c 
d  3 
e  6 
'''  
</pre>

#### iloc
##### df.iloc[i]
<pre>
import pandas as pd  
data = [[1,2,3],[4,5,6]]  
index = ['d','e']  
columns=['a','b','c']  
df = pd.DataFrame(data=data, index=index, columns=columns)  
print df.loc[1]  
''''' 
a    4 
b    5 
c    6 
'''  
</pre>

##### 多行
<pre>
import pandas as pd  
data = [[1,2,3],[4,5,6]]  
index = ['d','e']  
columns=['a','b','c']  
df = pd.DataFrame(data=data, index=index, columns=columns)  
print df.iloc[0:]  
''''' 
   a  b  c 
d  1  2  3 
e  4  5  6 
'''  
</pre>

##### 列(这种方法的好处在于不需要知道列标签)
<pre>
import pandas as pd  
data = [[1,2,3],[4,5,6]]  
index = ['d','e']  
columns=['a','b','c']  
df = pd.DataFrame(data=data, index=index, columns=columns)  
print df.iloc[:,[1]]  
''''' 
   b 
d  2 
e  5 
'''  
</pre>

#### ix（iloc和loc的混合，即既有iloc的功能，又有loc的功能）
下面先举两个例子
##### pd.ix[i]
<pre>
import pandas as pd  
data = [[1,2,3],[4,5,6]]  
index = ['d','e']  
columns=['a','b','c']  
df = pd.DataFrame(data=data, index=index, columns=columns)  
print df.ix[1]  
''''' 
a    4 
b    5 
c    6 
'''  
</pre>

##### pd.ix[行索引]
<pre>
import pandas as pd  
data = [[1,2,3],[4,5,6]]  
index = ['d','e']  
columns=['a','b','c']  
df = pd.DataFrame(data=data, index=index, columns=columns)  
print df.ix['e']  
''''' 
a    4 
b    5 
c    6 
'''  
</pre>

##### **不推荐使用ix!!! 为什么？？？**
如果行索引本身就是数字呢？那么ix[i]索引的结果到底是什么？可以是索引为i的，也可以是第i行，pandas优先将其理解为索引为i，下面看一个例子的输出结果
<pre>
import pandas as pd  
data = [[1,2,3],[4,5,6]]  
index = [1,1]  
columns=['a','b','c']  
df = pd.DataFrame(data=data, index=index, columns=columns)  
print (df.ix[1])  
''''' 
  a b c
1 1 2 3
1 4 5 6
'''  
</pre>

### 更改列标签
以英国的降雨数据为例，先读入，再查看信息
<pre>
df=pd.read_csv('uk_rain_2014.csv')
print(df.info())
</pre>

结果如下
<pre>
<class 'pandas.core.frame.DataFrame'>
RangeIndex: 33 entries, 0 to 32
Data columns (total 7 columns):
Water Year                33 non-null object
Rain (mm) Oct-Sep         33 non-null int64
Outflow (m3/s) Oct-Sep    33 non-null int64
Rain (mm) Dec-Feb         33 non-null int64
Outflow (m3/s) Dec-Feb    33 non-null int64
Rain (mm) Jun-Aug         33 non-null int64
Outflow (m3/s) Jun-Aug    33 non-null int64
dtypes: int64(6), object(1)
memory usage: 1.9+ KB
None
</pre>
上面显示了每一列的具体信息

我们看到每一列的标签非常复杂。在前面的例子中，我们已经知道了columns列表中保存的就是列标签，于是我们只需要更改columns列表的内容即可。赋值时，列表的元素个数必须和原DataFrame的列数一致。
<pre>
df.columns=['water_year','rain_octsep', 'outflow_octsep', 
'rain_decfeb', 'outflow_decfeb', 
'rain_junaug', 'outflow_junaug']
</pre>
此时再查看信息
<pre>
<class 'pandas.core.frame.DataFrame'>
RangeIndex: 33 entries, 0 to 32
Data columns (total 7 columns):
water_year        33 non-null object
rain_octsep       33 non-null int64
outflow_octsep    33 non-null int64
rain_decfeb       33 non-null int64
outflow_decfeb    33 non-null int64
rain_junaug       33 non-null int64
outflow_junaug    33 non-null int64
dtypes: int64(6), object(1)
memory usage: 1.9+ KB
None
</pre>
我们可以看到所有列的列名（列标签）都已经改变
改变之后有一个好处，我们可以通过.列标签的形式引用某一列
例如
<pre>
print(df.water_year)
</pre>
就可以直接以series的形式输出某一列

### 将某一列的内容作为索引、将索引恢复为列
读入csv文件后，默认的行索引是行号，我们可以通过set_index方法，将某一列的内容设置为行索引
例如```df.set_index(df.water_year)```可以将water_year这一列作为行索引，这样water_year这一列就不再属于数据内容了
注意，该方法并不会改变df本身，而是生成一个copy，改变了行索引后以返回值的形式给出
所以要想改变df，需要进行赋值```df=df.set_index(df.water_year)```
行索引也可以有多列，相当于一级索引，二级索引之类的，例如
```df=df.set_index['water_year','rain_octsep']```
在此基础上，如果我们再次设置剩下的列中的某一列作为新的行索引，那么water_year和rain_octsep这两列就彻底消失了，那么怎么将这两列恢复为数据列呢?pandas提供了reset_index方法
```df=df.reset_index(['rain_octsep','water_year'])```

### 数据过滤
直接上例子
```df.rain_octsep<1000``` 返回的是一个series，标签是行号，每一个元素为True或者False
```df[df.rain_octset<1000]``` 返回的是过滤后的满足条件的行，这些行的rain_octsep的值均小于1000

也可以通过复合条件表达式来进行过滤
<pre>
# Filtering by multiple conditionals
df[(df.rain_octsep < 1000) & (df.outflow_octsep < 4000)] # Can't use the keyword 'and'
</pre>

这条代码只会返回 rain_octsep 中小于 1000 的和 outflow_octsep 中小于 4000 的记录。注意重要的一点：这里不能用 and 关键字，因为会引发操作顺序的问题。必须用 & 和圆括号。

如果你的数据中字符串，好消息，你也可以使用字符串方法来进行过滤：
<pre>
# Filtering by string methods
df[df.water_year.str.startswith('199')]
</pre>

注意，你必须用 .str.[string method] ，而不能直接在字符串上调用字符方法。上面的代码返回所有 90 年代的记录

### 剩下还有一些内容不再单独学习，碰到了再说
http://codingpy.com/article/a-quick-intro-to-pandas/
