# WebPusher
线上版本发布shell脚本，可一次配置多个IP

### 简单的发布代码   
复制粘贴将原来的代码直接覆盖   
1. 该操作确保两台或者多台机器间已经建立了信任机制（免密登陆）   
2. SOURCEPATH 为本地项目的文件夹地址    
3. WEBLIST 为服务器的列表    
4. WEBPATH 为项目在各服务器放置的路径列表，与 WEBLIST 键值相同的为一组    

代码：  

    SOURCEPATH=/home/wwwroot/testpusher   
    WEBLIST[0]=192.168.147.133   
    WEBPATH[0]=/home/wwwroot/webpusher1/   
    original=${SOURCEPATH}   
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
            echo "文件未找到....."   
        fi   
        echo " ${ip} 上传成功. "   
        i=$[$i + 1]   
    done   
    echo "web pusher is ok....."     

