#!/bin/bash

#scheme
project_scheme="testappdomain"
#指定要打包的配置名
configuration="AdHot"
#指定打包所使用的输出方式，目前支持app-store, package, ad-hoc, enterprise, development, 和developer-id，即xcodebuild的method参数
export_method='ad-hoc'


#执行位置
exc = "/Users/abyss/Desktop/script/build_projcts_exc.sh"

project_path="$1"
if [ ! -d "${1}/$project_scheme.xcworkspace" ];
	then project_path="$(pwd)"
fi

sh $exc $project_scheme $project_path $configuration $export_method
