linux下产查看及修改文件时间

[https://www.cnblogs.com/chjbbs/p/6437879.html?utm_source=itdadao&utm_medium=referral](https://www.cnblogs.com/chjbbs/p/6437879.html?utm_source=itdadao&utm_medium=referral)

一、查看文件时间及相关命令

1、stat查看文件时间

[root@web10 ~]# stat install.log
  File: “install.log”
  Size: 33386           Blocks: 80         IO Block: 4096   一般文件
Device: fd00h/64768d    Inode: 7692962     Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2012-07-13 16:02:34.000000000 +0800
Modify: 2011-11-29 16:03:06.000000000 +0800
Change: 2011-11-29 16:03:08.000000000 +0800
说明：Access访问时间。Modify修改时间。Change状态改变时间。可以stat *查看这个目录所有文件的状态。

而我们想要查看某文件的三个时间中的具体某个时间，并以年月日时分秒的格式保存。我们可以使用下面的命令：

[root@web10 ~]# stat install.log|grep -i Modify | awk -F. '{print $1}' | awk '{print $2$3}'| awk -F- '{print $1$2$3}' | awk -F: '{print $1$2$3}'
20111129160306
2、ls查看文件时间

相应的通过ls 查看时也有三个时间：

* modification time（mtime，修改时间）：当该文件的“内容数据”更改时，就会更新这个时间。内容数据指的是文件的内容，而不是文件的属性。 
* status time（ctime，状态时间）：当该文件的”状态（status）”改变时，就会更新这个时间，举例来说，更改了权限与属性，就会更新这个时间。 
* access time（atime，存取时间）：当“取用文件内容”时，就会更新这个读取时间。举例来说，使用cat去读取 ~/.bashrc，就会更新atime了。

[root@web10 ~]# ls -l --time=ctime install.log
-rw-r--r-- 1 root root 33386 2011-11-29 install.log
[root@web10 ~]# ls -l --time=atime install.log
-rw-r--r-- 1 root root 33386 07-13 16:02 install.log
注意：ls参数里没有--mtime这个参数，因为我们默认通过ls -l查看到的时间就是mtime 。


qjg9QWAj1IbSVC@$#(d3