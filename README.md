通过Docker 创建 WSL 使用的镜像

使用Docker Image由官方创建

# 使用方式

[Github Relese](https://github.com/Gladtbam/WSL_Image/releases)下载需要的tar文件，在PowerShell下输入`wsl--import <Distro> <InstallLocation> <FileName>`

例：
```
下载的文件名为redhat.tar，放置WSL的路径为D:\WSL，WSL名为RedHat。则：  
wsl --import RedHat D:\WSL redhat.tar
```
