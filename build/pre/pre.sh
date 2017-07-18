echo 'AScript` build'
echo '懒人脚本,桌面一键完成配置编译发布测试'
echo '依赖于ruby和rubygem'
echo '检查环境...'

ruby -v && which ruby && gem -v && which gem && gem install bundler && bundle install

echo '环境检查完毕！'
echo '详细配置请参看https://git.oschina.net/abyssroger/script/build'