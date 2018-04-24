#! /bin/bash

# 项目源代码地址 复制时会将该文件夹复制
SOURCEPATH=/home/wwwroot/testpusher

# WEBLIST IP地址信息
# WEBPATH 项目要存放到服务器的地址
# 复制到服务器的地址为 /home/wwwroot/webpusher1/testpusher
WEBLIST[0]=192.168.147.133
WEBPATH[0]=/home/wwwroot/webpusher1/

# 还可以添加第二个
# WEBLIST[1]=192.168.147.134
# WEBPATH[1]=/home/wwwroot/webpusher1/

original=${SOURCEPATH}

# 操作文件到服务器
path=''
count=${#WEBLIST[@]}
i=0
while [[ i -lt $count ]]; do
    ip=${WEBLIST[$i]}
    path=${WEBPATH[$i]}

    echo " ${ip} 服务器上传... "

    if [[ -e $original ]]; then
        scp -r $original root@$ip:$path
    else
        echo "文件打包失败....."
    fi

    echo " ${ip} 上传成功. "    
    i=$[$i + 1]
done

echo "web pusher is ok....."

