function executive () {
    echo "将部署$1"
        rm -rf `ls | grep -v "back"`
        cp  $1 ./
        unzip -o ./dist*.zip > /dev/null
        mv ./dist/*  ./
        mv ./dist*.zip ./back/
        rm -rf ./dist
    
}

cd /usr/local/nginx/html/fd
# 参数是否为空
if [ ! -n "$1" ] ;then
    file=`find /data/package/web-page/ -mmin -100000 -type f | sort -r | head -1`
    if [ ! -n "$file" ] ;then
        echo '未发现符合条件的文件'
    else 
        executive $file
    fi
# 参数指定的文件是否存在
elif [ ! -f "/data/package/web-page/$1" ] ;then 
    echo "$1 is not exist"
else 
    file="/data/package/web-page/$1"
    executive $file
fi
cd -