##pandas
全称python data analysis library，是基于Numpy的一种工具，该工具是为了解决数据分析任务而创建的
pandas提供了大量能使我们方便快捷的进行数据分析的函数和方法

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

