#!/bin/bash
source $(dirname $0)/config.sh

if [ "$#" -lt 1 ]; then
    echo "aab 文件不能为空"
    exit
fi

script_path=$0
dir_path=$(dirname $script_path)
bundle_tool_path="$dir_path/$bundle_tool_name"
apks_file=$1

echo "开始安装..."
java -jar $bundle_tool_path install-apks --apks=$apks_file
echo "安装完成！"