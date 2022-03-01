#!/bin/bash
source $(dirname $0)/config.sh

if [ "$#" -lt 1 ]; then
    echo "aab 文件不能为空"
    exit
fi
script_path=$0
dir_path=$(dirname $script_path)

bundle_tool_path="$dir_path/$bundle_tool_name"
input_file=$1
apks_file="$dir_path/output/$output_file_name.apks"

ks_file_path="$dir_path/$keystore_file_name"
ks_pass="pass:$storePassword"
alia="$keyAlias"
key_pass="pass:$keyPassword"
# spec_file="$dir_path/tmp/device-spec.json"

if [ -f "$apks_file" ]; then
	rm $apks_file
fi

if [ -f "$spec_file" ]; then
	rm $spec_file
fi

echo "开始转换..."
# java -jar $bundle_tool_path get-device-spec --output=$spec_file
# java -jar $bundle_tool_path build-apks build-apks --device-spec=$spec_file --bundle=$input_file --output=$apks_file --ks=$ks_file_path --ks-pass=$ks_pass --ks-key-alias=$alia --key-pass=$key_pass
java -jar $bundle_tool_path build-apks build-apks --bundle=$input_file --output=$apks_file --ks=$ks_file_path --ks-pass=$ks_pass --ks-key-alias=$alia --key-pass=$key_pass
echo "转换完成"
# echo "正在安装..."
# java -jar $bundle_tool_path install-apks --apks=$apks_file
# echo "安装完成"

