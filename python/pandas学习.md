##pandas
全称python data analysis library，是基于Numpy的一种工具，该工具是为了解决数据分析任务而创建的
pandas提供了大量能使我们方便快捷的进行数据分析的函数和方法
####数据结构
#####Series：
一维数组，与Numpy中的一维array类似。二者与Python基本的数据结构List也很相近，其区别是：List中的元素可以是不同的数据类型，而Array和Series中则只允许存储相同的数据类型，这样可以更有效的使用内存，提高运算效率。
我试了一下，Series中可以存储不同的数据类型？
series 是一种一维的数据类型，其中的**每个元素都有各自的标签**。你可以把它当作一个由带标签的元素组成的 numpy 数组。标签可以是数字或者字符。
#####DataFrame：
二维的表格型数据结构，可以将DataFrame理解为Series的容器。
dataframe 可以储存许多不同类型的数据，并且每个轴都有标签。你可以把它当作一个 series 的字典。
#####Panel:
三维的数组，可以理解为DataFrame的容器。
