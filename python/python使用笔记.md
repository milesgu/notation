##### 显示当前目录

```pwd```

#####删除某个变量

```del  var_name```

##### 将函数封装成文件，并用import导入使用

【一种最简单我自己试探出来的方法】

将函数保存为```.py```文件，如下：

```readByLine.py```

```
def readByLine(fileName):
	f=open(fileName,'r')
	data=f.readlines()
	a=[]
	for line in data:
		tmp=line.split(',')
		tmp=list(map(int,tmp))
		a.append(tmp)
	return a
```

有两种使用方法

①

```
import readByLine as rBL
x=rBL.readByLine('a.txt')
```

②

```
import readByLine
x=readByLine('a.txt')
```

#####python的下标从0开始，不同于Matlab