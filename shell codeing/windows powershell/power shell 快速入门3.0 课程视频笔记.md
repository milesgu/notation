power shell的命令采用verb-noun的形式
例如```set-location c:\```将当前目录定位到c盘
```get-childitem```可以获取当前目录的所有项目
```clear-host```可以清屏

为了更好的体验，power shell中还为很多命令设置了别名（linux、dos的命令）
```get-alias```可以获取所有的别名信息，它也有别名```gal```
可以用```help```和```man```获取帮助信息
powershell还支持cmd中对应用程序的调用（windows的原生命令）
例如可以用calc打开计算器，用notepad打开记事本，用ping来ping某个网站等
```gal gsv``` ```gsv```是```get-service```的别名,gal命令可以带参数，查询某个具体别名的信息，可以采用通配符的形式，搜索一类别名。
例如```gal g*```可以查找所有以g开头的别名
当然也可以用```gal -Definition get-process```获得get-process的别名

Power shell的命令很多，我们也记不住所有的命令。因此，Power shell的研发人员开发了一个很详细的帮助系统，我们需要学会如何使用这个帮助系统。
get-help help man + 命令名 就可以查询 该命令的帮助页面


