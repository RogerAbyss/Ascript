# build

- [x] IOS自动构建项目(pod install/git pull/version&build increment/build)
- [x] 分类管理历史包备份
- [x] 分发Appstore与各个平台
- [x] 邮件通知
- [ ] Android支持

**仅仅执行一条‘build’**

## vs fastlane

build目前是基于fastlane的，相比于直接使用fastlane你有以下优点:

- [x] 定制化的lane模块,常用功能直接使用
- [x] 同时管理多个项目
- [x] 适合国内行情(email使用的QQ邮箱,三方平台是fir.im,pod install采用--no-repo-update)
- [x] 可通过fastlane官方文档和资源加上一点点shell与ruby知识自定义

![build-w500](info/hello.png)

[TOC]
## Useage

1. 执行``/pre/pre.sh`` 检查基本环境
通过命令行log检查自己缺少什么依赖

2. 将``/fastlane``放入你的每一个工程

3. 配置``/config/config.yml ``,与``/fastlane/actions/email.rb``

4. 在工程目录下执行``fastlane init``配置工程
详情参考[fastlane](https://docs.fastlane.tools/actions/)

5. 为工程添加appstore标准的版本号管理-agvtool
详情参考[官方文档](https://developer.apple.com/library/content/qa/qa1827/_index.html)

6. 一切配置完成,你只需要执行``/build_projects_start.rb``,
将 ```ruby /buld_projects_start.rb``` 写入 build.sh



赋予直接运行的权利
```
chmod +x  build.sh
```

制作一个替身
Now, Go enjoy your build!

## Dependencies

* ruby 
* rubygem 
* bundler

## Struct

```
build
├── pre                   # 检查环境
│   ├── pre.sh
│   ├── Podfile
│   ├── Gemfile.lock
│   └── Gemfile
├── info                  # email提示页
│   └── README.md
├── fastlane              # fastlane模块
│   ├── actions
│   │   ├── pod_update.rb
│   │   └── email.rb
│   └── Fastfile
├── config                # 配置
│   ├── private
│   │   └── config.yml
│   └── config.yml
├── build_projcts_start.rb
└── README.md
```