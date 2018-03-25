##numpy
NumPy系统是Python的一种开源的数组计算扩展。这种工具可用来存储和处理大型矩阵，比Python自身的嵌套列表（nested list structure)结构要高效的多（该结构也可以用来表示矩阵（matrix））。

### 创建矩阵
#### 利用列表创建一维数组
```data=np.array([1,2,3,4,5,6])```
#### 利用多维列表创建多维矩阵
```data=np.array([[1,2,3],[4,5,6]])```
#### 利用内置方法创建任意矩阵
```data=np.ones((1,2,3))``` 
```data=np.zeros((4,5,6))```
```data=np.eye(6)```
#### 矩阵维度转换
```data.arange(6).reshape((2,1,3))```
#### 查看矩阵维度
```data.shape```
#### 查看矩阵元素类型
```data.dtype```

