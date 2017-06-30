#!/bin/bash

#设置超时
export FASTLANE_XCODEBUILD_SETTINGS_TIMEOUT=120

SECONDS=0

Scheme="$1"
ProjectPath="$2"
Configuration="$3"
Export="$4"

OutputPath="/Users/abyss/Desktop/outputs/$(date +"%m_%d")"
TOKEN_FIR="e9bf520535dbb08e8aef052cf6aa5558"

now=$(date +"%m_%d_%H_%M")

WorkSpace="$ProjectPath/$Scheme.xcworkspace"
AchivePath="$OutputPath/${Scheme}_${now}.xcarchive"
IpaName="${Scheme}_${now}.ipa"
IpaPath="$OutputPath/${Scheme}_${now}.ipa"

echo "Input Path  :$ProjectPath"
echo "Output Path :$OutputPath"
echo "准备构建..."
fastlane gym --workspace ${WorkSpace} --scheme ${Scheme} --clean --configuration ${Configuration} --archive_path ${AchivePath} --export_method ${Export} --output_directory ${OutputPath} --output_name ${IpaName}

echo "打包完毕！"
echo "准备上传Fir.im"

fir publish ${IpaPath} -T "$TOKEN_FIR" -c "${commit_msg}"

echo "完成！"
echo "总共耗时:${SECONDS}秒"