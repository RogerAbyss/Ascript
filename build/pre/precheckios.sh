# IOS自动编译环境检查
# 需要的环境:
# ruby, gem, git, fir, fastlane

echo ============================
echo 自动部署IOS环境检查 by Jenkins
echo ============================

echo 检查ruby环境...
ruby -v
echo 检查rubygem环境...
gem -v
echo 检查fir-cli环境...
fir version
echo 检查git环境...
git version

# fastlane需要UFT-8语言环境
export TERM=xterm-256color
export LANG=en_US.UTF-8
LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
LC_ALL=en_US.UTF-8
    
echo 检查fastlane环境...
# fastlane Env
fastlane env

echo '环境检查完毕'