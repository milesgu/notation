### 认识/了解数据
#### 基本信息
```data_train=pd.read_csv("train.csv")```
读入数据
```print(data_train.info())``` 输出基本信息
```print(data_train.head())```输出前五条记录
共有890条记录，每条记录有12列域
包括
- PassengerId 乘客ID, 从0开始编号，乘客的唯一标识，int
- Survived 是否存活，1为存活，0为未存活, int
- Pclass 船舱的等级，分为1,2,3 三级，其中1等级最高, int
- Name 姓名, obj 
- Sex 性别, obj
- Age 年龄, float
- SibSp 兄弟姐妹的数量, int
- Parch 孩子父母的数量, int
- Ticket 船票编号, obj
- Fare 船票价格, float
- Cabin 房间号, obj
- Embarked 上船的港口,分为C,S,Q, obj
其中Age和Cabin的记录不完整，Age 714名乘客有记录，缺失较少，Cabin 204名乘客有记录，缺失较多。

以上，对数据的结构和内容有了基本的了解

#### 基础统计信息
```print(data_train.describe())```
<pre>
       PassengerId    Survived      Pclass         Age       SibSp  \
count   891.000000  891.000000  891.000000  714.000000  891.000000   
mean    446.000000    0.383838    2.308642   29.699118    0.523008   
std     257.353842    0.486592    0.836071   14.526497    1.102743   
min       1.000000    0.000000    1.000000    0.420000    0.000000   
25%     223.500000    0.000000    2.000000   20.125000    0.000000   
50%     446.000000    0.000000    3.000000   28.000000    0.000000   
75%     668.500000    1.000000    3.000000   38.000000    1.000000   
max     891.000000    1.000000    3.000000   80.000000    8.000000   

            Parch        Fare  
count  891.000000  891.000000  
mean     0.381594   32.204208  
std      0.806057   49.693429  
min      0.000000    0.000000  
25%      0.000000    7.910400  
50%      0.000000   14.454200  
75%      0.000000   31.000000  
max      6.000000  512.329200  
</pre>

可以看到，只有数值类型的域给出了这些统计信息
从中也可以获得一些有用的信息，例如
Survived的平均值就是存活率，约38.4%的乘客存活了下来。
Pclass的平均值为2.31，也就是说大部分的乘客位于3等舱

#### 通过作图获取对数据的直观理解
首先整体上思考一下可以作哪些图，加深对数据的理解
什么叫对数据的理解(insight)呢？对于每一种数据，我们要知道它对存活率是否有影响，如果有影响，是怎么影响的？这些insight可以和后续所建模型的结果进行比对。
- 各船舱的存活人数比例
- 不同兄弟姐妹人数的存活比例（存活人数：未存活人数）
- 不同孩子父母人数的存活比例
- 不同性别的存活比例
- 不同港口的存活比例
年龄、船票价格是连续值
姓名、房间号、船票编号暂时不考虑

另外，PassengerId是后来加上的乘客的编号，与泰坦尼克号事件本身没有关系，所以不属于影响因素；Survived是最终的标签。

##### 存活人数与未存活人数
只需要对data_train.Survived 进行value_count即可
<pre>
data=data_train.Survived.value_counts()
data.plot(kind='bar')
plt.xticks(np.arange(2),(u'未获救',u'获救'),rotation=0)
plt.title(u'获救情况')
plt.ylabel(u'人数',verticalalignment='top',horizontalalignment='left',rotation=0)
</pre>

##### 各船舱存活人数
理想中的图表应为：横坐标是船舱，直方图，每一个直方叠加得画了存活人数和未存活人数
```Survived_0=data_train[data_train.Survived == 0].Pclass.value_counts()```
这样求出的是各个舱中未存活人数的统计值
别人的代码是这么写的也行，但还是我的解释性高一点
```Survived_1=data_train.Pclass[data_train.Survived == 0].value_counts()```

```Survived_0``` 的输出如下
<pre>
Survived_0
Out[71]: 
3    372
2     97
1     80
Name: Pclass, dtype: int64

type(Survived_0)
Out[72]: pandas.core.series.Series
</pre>
可见它是一个Series，标签类型是Pclass（本质也是int），内容是int
