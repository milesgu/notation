##Command Line
CMD已经过时，所以不再专门学习，这里主要记录工作生活中需要用到的一些命令、批处理脚本实例

###git 自动同步

####知识点
##### 设置变量
```set var = 常数|"字符串"|其它变量和常量组成的表达式```
```set /p = 提示信息``` /p表示从命令行界面接受用户的输入（一行以内，回车表示提交），提示信息会显示在屏幕上，提醒用户输入信息
##### 使用变量
```echo %var%``` 可以显示将变量的值单独显示在一行上
```"%var%"``` 可以将变量转化为字符串
```"%var1% other_information %var2% ……"```可以将多个变量和其余的信息组成一个字符串，例如git commit -m参数就需要给出一个字符串，就可以用这种方法组成一个字符串作为参数
##### @echo off
echo off可以关闭所有命令的回显，前面加个@可以关闭echo off命令本身的回显

##### echo;
这条命令可以输出一个空行

##### echo any information
echo后面如果没有%%包含，就是写什么输出什么

#### 用户指定提交信息
##### 注释版
```
@echo off // 关闭命令的回显
echo pwd: %cd% // 输出当前路径
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ // 分隔线

echo git add start
git add -A .
echo git add done
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo;
echo git commit start
set /p declation=input commit information: // 将用户输入的信息保存在declation变量中
git commit -m "%declation%" // 将declation中的信息以字符串的形式的参数提供给-m
echo git commit done
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo;
echo git push start
git push git@github.com:unforgettable-heart/notation
echo git push done
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo;
echo all done!
echo;

pause
```
##### 未注释版
```
@echo off
echo pwd: %cd%
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo git add start
git add -A .
echo git add done
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo;
echo git commit start
set /p declation=input commit information:
git commit -m "%declation%"
echo git commit done
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo;
echo git push start
git push git@github.com:unforgettable-heart/notation
echo git push done
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo;
echo all done!
echo;

pause
```
#### 将时间作为提交信息
```
@echo off
echo pwd: %cd%
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo git add start
git add -A .
echo git add done
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo;
echo git commit start
git commit -m "%date% %time%"
echo git commit done
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo;
echo git push start
git push git@github.com:unforgettable-heart/notation
echo git push done
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo;
echo all done!
echo;

pause
```

#### git pull
```
@echo off
echo pwd: %cd%
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo git pull start
git pull git@github.com:unforgettable-heart/notation
echo git pull done
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo;
echo all done!
echo;

pause
```
