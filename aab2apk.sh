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
tmp_apks_file="$dir_path/tmp/aab2apk_tmp.apks"
output_file="$dir_path/output/$output_file_name.apk"

ks_file_path="$dir_path/$keystore_file_name"
ks_pass="pass:$storePassword"
alia="$keyAlias"
key_pass="pass:$keyPassword"

if [ -f "$tmp_apks_file" ]; then
    rm $tmp_apks_file
fi

echo "开始转换..."
java -jar $bundle_tool_path build-apks --bundle=$input_file --output=$tmp_apks_file --ks=$ks_file_path --ks-pass=$ks_pass --ks-key-alias=$alia --key-pass=$key_pass --mode=universal
unzip -p $tmp_apks_file universal.apk > $output_file
echo "转换完成!"