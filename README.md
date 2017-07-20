# AScript (Abyss`s Script)

一个很懒的程序员的脚本集。
A lazy IOS programmer`s scripts.


[TOC]
## build

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

![build-w500](build/info/hello.png)

## LICENSE

AScript is released under the MIT license. See LICENSE for details.
