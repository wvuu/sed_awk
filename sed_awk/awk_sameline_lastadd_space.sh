#!/bin/bash
#需求:连续重复第一个字段的行的最后一次所在的行末尾添加一行空行
##################################
原文
[root@braindeath2 tmp]# cat xx
    aaa 123 321
    aaa 223 321
    aaa 323 321
    aaa 323 321
    bbb 123 321
    bbb 223 321
    bbb 323 321
    bbb 323 321
    bbb 323 321
    bbb 323 321
    ccc 123 321
    ccc 223 321
    ccc 323 321
##################################
#目标
[root@braindeath2 tmp]# cat oo
    aaa 123 321
    aaa 223 321
    aaa 323 321
    aaa 323 321

    bbb 123 321
    bbb 223 321
    bbb 323 321
    bbb 323 321
    bbb 323 321
    bbb 323 321

    ccc 123 321
    ccc 223 321
    ccc 223 321
##################################   
#代码:
awk '$0!~a{$0="\n"$0}a=$1' file 
awk '$0=$0!~a?"\n"$0:$0;{a=$1}' file
awk '!a[$1]++&&NR>1{$0="\n"$0}1' file
