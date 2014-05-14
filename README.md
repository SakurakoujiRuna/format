format
======

用来解决在Mac OS X下下载的由UTF-8和GBK编码造成的文件的乱码问题。~~(基本就是本子)~~
从经验来看,下载的压缩文件文件名通常是带有%的乱码,解压缩之后的文件夹和其中的文件通常是带有反斜杠的乱码。解压缩出现的均为GBK编码,带%的可根据高位判断是GBK或者UTF-8编码。

### 使用方法

* 运行 `ruby format.rb s0 s1`。
* s0为处理的类型。s0=0处理带反斜杠的文件夹和其包含的所有文件,s0=1处理带有%的单个文件。
* s1为处理的文件/目录名。
* 例子 ` ruby format.rb 0 "/Users/apple/Downloads/\314\354\355\221\244\316\272\315\230\2672" `
