# AScript (Abyss`s Script)

一个很懒的程序员的脚本集。
A lazy programmer`s scripts.

[TOC]
## build

关于自动化构建的脚本(ruby+shell)。
主要基于fastlane实现，可以结合Docker+Kenkins自己部署整个软件从构建到测试的反复迭代过程。

### Function(功能)

它目前只支持IOS平台，尽快会支持Android.
它能帮你做什么？

1. 管理开发/测试/AppStore证书(缺少会帮你创建)
2. 自动编译
3. 自动配置环境,每次提交增加版本号
4. 测试服发送至fir.im等各个三方平台
5. 正式服发送至Appstore
6. 成功后发送email至测试组和负责人

你再也不需要做这些无聊的工作了！
你可以更多的休息或者专注于代码本身。

### Dependencies(依赖)

* fastlane
* ruby
* rubygem
* rubygem/Mail
* fir-cli

### Install & Useage (安装和使用)

1. 配置自己工程fastlane
    * 安装ruby/rubygem/fastlane 环境
    * 配置工程的fastlane
    ```
    fastlane init
    ```
    * 按流程输入各种信息,放心你输入的账号密码会以keychain的方式保存在你自己的电脑

2. 将我fastlane文件替换原有的fastlane文件
    * 包含fastfile
    * 包含一系列Actions

3. 在桌面创建一个build.sh
```
ruby path/build_projcts_start
```
并赋予它直接运行的能力
```
chmod path/build.sh 
```

path请根据自己的环境配置

4. 配置文件
其中包含一个配置文件config
修改其中的配置
包含一些隐私信息,我这里没有放出私有的config,大家自行处理

5. 运行
双击build.sh

