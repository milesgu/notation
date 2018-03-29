##### 控制作图窗口

```%matlab inline```在交互式窗口内直接画图

```matlab qt```在新窗口内画图


##### 绘制点图实例

数据是两个相同大小的一维向量，希望绘制出来一个二维坐标系上一个一个的点（输入为横坐标，输出为纵坐标）


```plt.plot(X,y,'rx','MarkerSize',20)```

其中r指明标记颜色为红色，x指明标记符号为叉叉，MarkerSize指明接下来要指定标记大小参数，20指明标记大小


##### 将多个图绘制在一个figure中

```plt.hold(True)``` 


##### 控制图绘制在哪个figure中

```plt.figure(figure_number)```




#### 下面的几个作图涉及pandas
首先用pandas读入数据（csv格式，带表头）

<pre>
import pandas as pd
from pandas import Series,DataFrame
data_train=read_csv('train.csv')
</pre>

然后可以查看数据的一些信息（train.csv中的数据其实就是一个带有表头的表）


```data_train.info()``` 给出一共有多少行，每一列的表头，每一列有多少信息是非空的，每一列的数据类型
```data_train.describe()``` 给出所有数据类型为数值的列的平均值等统计信息

#### 将多个图放在一个figure内的两种方法

##### 方法一 plt.subplot2grid
常用参数有四个
```plt.subplot2grid((a,b),(c,d),rowspan=e,colspand=f)```
(a,b)表示将figure分成a行b列的格子（往下是行，往右是列，均从0开始数）
(c,d)表示该subplot画在figure的第c行，第d列开始的位置上
rowspan可以指定行宽，默认为1
colspan可以指定列宽，默认为1
然后调用plot函数即可
##### 方法二 ax=fig.add_subplot(abc)或者fig.add_subplot(a,b,c)
a,b表示将figure分成a行b列的格子
c表示该subplot画在从左往右，从上往下数的第c个格子上，从1开始数
然后调用plot函数即可
```ax.set_xticklabel([,……,])```可以按顺序设置横坐标的说明

##### pandas中获取每一列中不同取值的个数统计
```tmp=train_data.X.value_counts()```
tmp可以用sort函数，按照index或者value排序

##### 绘制统计结果的柱状图

<pre>
tmp.plot(kind='bar')
plt.title('')
plt.xlabel('')
plt.ylabel('')
</pre>

##### 二维散点图
<pre>
plt.scatter(data_train.A,data_train.B)
plt.grid(b=True/False,axis='x/y/both')
</pre>
其中grid函数可以打开/关闭横纵网格线，另外还有一个which参数不是很懂

##### 一个plot中画多个密度图
密度图只需要一个列表即可，它会自动帮你统计分布密度
例如data_train中有A和B两列，按照B列的取值不同画出B列的取值密度分布

<pre>
data_train.B[data_train.A==1].plot(kind='kde')
data_train.B[data_train.A==2].plot(kind='kde')
data_train.B[data_train.A==3].plot(kind='kde')
plt.legend([u'x',u'y',u'z'])
</pre>
这里legend中的第一个参数以列表的形式按顺序给出每条曲线的标注，还有loc参数可以指定标注的位置

##### 将两个柱状图叠在一起
需要提供两个二维Series
```df=pd.DataFrame({u'1':A,u'2':B})```
A和B的行与行是对应的
所以相当于将A和B进行列合并，'1'和'2'指明的是列的名称
df也可以进行转置，转置后横纵坐标就反过来了
```df.plot(kind='bar',stacked=True)```


